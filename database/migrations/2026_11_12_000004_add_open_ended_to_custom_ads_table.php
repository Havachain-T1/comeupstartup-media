<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

// Existing ads default to `false`, preserving their current (hidden-when-undated) behaviour.
return new class extends Migration
{
    public function up()
    {
        Schema::table('custom_ads', function (Blueprint $table) {
            $table->boolean('open_ended')->default(false)->after('end_date');
        });
    }

    public function down()
    {
        Schema::table('custom_ads', function (Blueprint $table) {
            $table->dropColumn('open_ended');
        });
    }
};
