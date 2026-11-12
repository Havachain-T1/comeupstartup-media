<?php

namespace App\Providers\Concerns;

use Illuminate\Database\QueryException;
use Illuminate\Support\Facades\Log;
use PDOException;

/**
 * The CMS reads its active theme/plugins from the database while providers boot.
 * For HTTP requests a database failure is rethrown (unchanged behaviour). For console
 * commands (composer package:discover, artisan, CI builds) the provider skips the
 * theme/plugin registration instead of aborting the whole command.
 */
trait QueriesCmsStateDuringBoot
{
    protected function queryCmsStateDuringBoot(callable $query, $fallback = null)
    {
        try {
            return $query();
        } catch (QueryException | PDOException $e) {
            if (! $this->app->runningInConsole() || $this->cachesBootState()) {
                throw $e;
            }

            $message = 'CMS theme/plugin registration skipped: database unavailable during console boot (' . static::class . ').';
            Log::warning($message, ['exception' => $e->getMessage()]);
            fwrite(STDERR, '[warning] ' . $message . PHP_EOL);

            return $fallback;
        }
    }

    /**
     * Cache-building commands must fail rather than persist routes/events without theme or plugin entries.
     */
    protected function cachesBootState(): bool
    {
        return in_array($_SERVER['argv'][1] ?? null, ['route:cache', 'event:cache', 'optimize'], true);
    }
}
