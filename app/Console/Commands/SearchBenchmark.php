<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Contracts\Http\Kernel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

/**
 * Seeds synthetic articles (committed, because InnoDB full-text indexes ignore uncommitted rows),
 * measures the suggest API and results page through the HTTP kernel, then removes the synthetic rows.
 * Never run against a production database.
 */
class SearchBenchmark extends Command
{
    protected $signature = 'search:benchmark
        {--records=10000 : Synthetic articles to seed}
        {--iterations=300 : Requests per endpoint}
        {--keep : Keep the synthetic rows for external (HTTP) benchmarking}
        {--cleanup : Only delete previously seeded synthetic rows}';

    protected $description = 'Benchmark search API latency against a synthetic article dataset (development only)';

    private const PREFIX = 'bench-synthetic-';

    private const WORDS = ['startup', 'fintech', 'funding', 'lagos', 'nairobi', 'accra', 'cairo', 'kigali', 'venture', 'seed',
        'series', 'payments', 'logistics', 'health', 'climate', 'energy', 'ecommerce', 'crypto', 'regulation', 'accelerator',
        'founders', 'investors', 'policy', 'telecom', 'mobile', 'banking', 'insurance', 'agritech', 'edtech', 'proptech',
        'artificial', 'intelligence', 'data', 'cloud', 'security', 'growth', 'market', 'expansion', 'acquisition', 'merger',
        'talent', 'hiring', 'layoffs', 'unicorn', 'valuation', 'revenue', 'profit', 'export', 'manufacturing', 'solar',
        'battery', 'electric', 'transport', 'marketplace', 'lending', 'credit', 'wallet', 'remittance', 'blockchain', 'grant'];

    private const QUERIES = ['fin', 'fintech', 'startup funding', 'lagos', 'solar energy', 'venture capital', 'nairobi fintech',
        'climate', 'payments', 'series', 'acquisition', 'unicorn valuation', 'agri', 'edtech', 'mobile banking', 'credit',
        'blockchain', 'grant', 'health insurance', 'electric transport', 'ai', 'data cloud', 'xyzzy nothing', 'remit', 'founders'];

    public function handle(): int
    {
        if (app()->environment('production')) {
            $this->error('Refusing to run in production.');
            return self::FAILURE;
        }

        if ($this->option('cleanup')) {
            $this->cleanup();
            return self::SUCCESS;
        }

        $records = (int) $this->option('records');
        $iterations = (int) $this->option('iterations');

        $this->cleanup();
        $this->seed($records);

        config(['search.cache_ttl' => 0, 'search.rate_limit_per_minute' => 1000000]);
        $total = DB::table('tl_blogs')->count();
        $this->info("Searchable articles in tl_blogs: {$total} ({$records} synthetic). Cache disabled; {$iterations} requests per endpoint.");

        $rows = [];
        foreach (['/search-suggest?q=%s' => 'Suggest API (JSON)', '/search/%s' => 'Results page (HTML, paginated)'] as $pattern => $label) {
            $timings = $this->measure($pattern, $iterations);
            $rows[] = [$label, count($timings), ...array_map(fn ($p) => number_format($this->percentile($timings, $p), 1), [50, 95, 99]), number_format(max($timings), 1)];
        }
        $this->table(['Endpoint', 'Requests', 'p50 ms', 'p95 ms', 'p99 ms', 'max ms'], $rows);

        if ($this->option('keep')) {
            $this->warn('Synthetic rows kept. Remove them with: php artisan search:benchmark --cleanup');
        } else {
            $this->cleanup();
        }

        return self::SUCCESS;
    }

    private function seed(int $records): void
    {
        mt_srand(20261112);
        $userId = (int) DB::table('tl_users')->orderBy('id')->value('id');
        $now = now();
        $bar = $this->output->createProgressBar($records);

        for ($offset = 0; $offset < $records; $offset += 500) {
            $batch = [];
            for ($i = $offset; $i < min($records, $offset + 500); $i++) {
                $roll = mt_rand(1, 100);
                $title = ucfirst($this->words(mt_rand(5, 9)));
                $batch[] = [
                    'name' => $title,
                    'permalink' => self::PREFIX . $i,
                    'user_id' => $userId,
                    'short_description' => ucfirst($this->words(24)) . '.',
                    'content' => '<p>' . ucfirst($this->words(180)) . '.</p>',
                    'visibility' => $roll <= 10 ? 'private' : 'public',
                    'is_publish' => $roll > 10 && $roll <= 15 ? 2 : 1,
                    'publish_at' => $roll > 15 && $roll <= 20 ? $now->copy()->addDays(30) : $now->copy()->subMinutes(mt_rand(10, 500000)),
                    'created_at' => $now,
                    'updated_at' => $now,
                ];
            }
            DB::table('tl_blogs')->insert($batch);
            $bar->advance(count($batch));
        }
        $bar->finish();
        $this->newLine();
    }

    private function words(int $n): string
    {
        $out = [];
        for ($i = 0; $i < $n; $i++) {
            $out[] = self::WORDS[mt_rand(0, count(self::WORDS) - 1)];
        }

        return implode(' ', $out);
    }

    private function measure(string $pattern, int $iterations): array
    {
        $kernel = app(Kernel::class);
        $timings = [];

        // Warm-up (opcache, connection, query plan).
        foreach (array_slice(self::QUERIES, 0, 3) as $q) {
            $kernel->handle(Request::create(sprintf($pattern, rawurlencode($q))));
        }

        for ($i = 0; $i < $iterations; $i++) {
            $q = self::QUERIES[$i % count(self::QUERIES)];
            $request = Request::create(sprintf($pattern, rawurlencode($q)), 'GET', [], [], [], ['REMOTE_ADDR' => '10.0.0.' . ($i % 250)]);
            $start = hrtime(true);
            $response = $kernel->handle($request);
            $timings[] = (hrtime(true) - $start) / 1e6;
            $kernel->terminate($request, $response);
            if ($response->getStatusCode() !== 200) {
                $this->warn("{$request->getRequestUri()} returned {$response->getStatusCode()}");
            }
        }

        return $timings;
    }

    private function percentile(array $values, int $p): float
    {
        sort($values);
        $index = (int) ceil($p / 100 * count($values)) - 1;

        return $values[max(0, min($index, count($values) - 1))];
    }

    private function cleanup(): void
    {
        $deleted = DB::table('tl_blogs')->where('permalink', 'like', self::PREFIX . '%')->delete();
        if ($deleted) {
            $this->info("Removed {$deleted} synthetic article(s).");
        }
    }
}
