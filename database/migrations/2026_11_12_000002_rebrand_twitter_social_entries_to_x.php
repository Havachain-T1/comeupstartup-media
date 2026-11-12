<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

// Relabels stored Twitter social/share entries as X. The share network key stays
// `twitter` so existing share-URL generation and saved links keep working.
return new class extends Migration
{
    public function up()
    {
        $this->rebrand('Twitter', 'X', 'fa-x-twitter');
    }

    public function down()
    {
        $this->rebrand('X', 'Twitter', 'fa-twitter');
    }

    private function rebrand(string $fromTitle, string $toTitle, string $toIcon): void
    {
        if (Schema::hasTable('blog_share_options')) {
            DB::table('blog_share_options')->where('network', 'twitter')->update([
                'network_name' => $toTitle,
                'icon' => '<i class="fa ' . $toIcon . '"></i>',
            ]);
        }

        if (!Schema::hasTable('tl_theme_option_settings')) {
            return;
        }

        DB::table('tl_theme_option_settings')->where('field_name', 'social_field')->orderBy('id')
            ->each(function ($row) use ($fromTitle, $toTitle, $toIcon) {
                $items = json_decode($row->field_value, true);
                if (!is_array($items)) {
                    return;
                }
                $changed = false;
                foreach ($items as &$item) {
                    $icon = $item['social_icon'] ?? '';
                    if (($item['social_icon_title'] ?? '') === $fromTitle || in_array($icon, ['fa-twitter', 'fa-twitter-square', 'fa-x-twitter'], true)) {
                        if (($item['social_icon_title'] ?? '') === $fromTitle) {
                            $item['social_icon_title'] = $toTitle;
                        }
                        $item['social_icon'] = $toIcon;
                        $changed = true;
                    }
                }
                if ($changed) {
                    DB::table('tl_theme_option_settings')->where('id', $row->id)
                        ->update(['field_value' => json_encode($items)]);
                }
            });
    }
};
