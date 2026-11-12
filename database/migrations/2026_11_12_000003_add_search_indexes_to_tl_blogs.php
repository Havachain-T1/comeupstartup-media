<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::table('tl_blogs', function ($table) {
            $table->index(['is_publish', 'publish_at'], 'tl_blogs_publish_state_index');
        });

        if (in_array(DB::connection()->getDriverName(), ['mysql', 'mariadb'], true)) {
            DB::statement('ALTER TABLE tl_blogs ADD FULLTEXT tl_blogs_ft_name (name)');
            DB::statement('ALTER TABLE tl_blogs ADD FULLTEXT tl_blogs_ft_body (name, short_description, content)');
        }
    }

    public function down()
    {
        Schema::table('tl_blogs', function ($table) {
            $table->dropIndex('tl_blogs_publish_state_index');
        });

        if (in_array(DB::connection()->getDriverName(), ['mysql', 'mariadb'], true)) {
            DB::statement('ALTER TABLE tl_blogs DROP INDEX tl_blogs_ft_name');
            DB::statement('ALTER TABLE tl_blogs DROP INDEX tl_blogs_ft_body');
        }
    }
};
