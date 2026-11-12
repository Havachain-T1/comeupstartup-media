<?php

namespace App\Console\Commands;

use App\Services\BrandPress\BrandPressWorkflow;
use Illuminate\Console\Command;

class PublishScheduledPressReleases extends Command
{
    protected $signature = 'brand-press:publish-scheduled';

    protected $description = 'Publish approved Brand Press announcements whose scheduled time has passed';

    public function handle(BrandPressWorkflow $workflow)
    {
        $this->info($workflow->publishDue() . ' announcement(s) published.');

        return self::SUCCESS;
    }
}
