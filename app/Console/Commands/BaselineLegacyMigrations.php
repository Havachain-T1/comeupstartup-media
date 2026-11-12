<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

/**
 * The CMS schema ships as a SQL dump (database/data.sql) with an empty `migrations` table,
 * so the stock Laravel migrations it already contains would fail on `migrate`.
 * This marks those pre-existing migrations as run so only new migrations execute.
 */
class BaselineLegacyMigrations extends Command
{
    protected $signature = 'migrate:baseline-legacy {--database= : The database connection to use}';

    protected $description = 'Mark legacy migrations already contained in the imported SQL schema as run';

    public const LEGACY_CUTOFF = '2024_01_01_000000';

    public function handle(): int
    {
        $connection = $this->option('database') ?: config('database.default');
        $schema = Schema::connection($connection);
        $db = DB::connection($connection);

        if (!$schema->hasTable('tl_users') || !$schema->hasTable('tl_blogs')) {
            $this->error('The imported CMS schema was not found; import database/data.sql first.');
            return self::FAILURE;
        }

        if (!$schema->hasTable('migrations')) {
            $this->call('migrate:install', ['--database' => $connection]);
        }

        $ran = $db->table('migrations')->pluck('migration')->all();
        $marked = 0;

        foreach (glob(database_path('migrations/*.php')) as $file) {
            $name = basename($file, '.php');
            if (strcmp($name, self::LEGACY_CUTOFF) >= 0 || in_array($name, $ran, true)) {
                continue;
            }
            $db->table('migrations')->insert(['migration' => $name, 'batch' => 0]);
            $marked++;
        }

        $this->info("Marked {$marked} legacy migration(s) as run.");

        return self::SUCCESS;
    }
}
