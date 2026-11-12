<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

// `user_keys` stored ThemeLooks purchase keys for the removed vendor licence client.
return new class extends Migration
{
    public function up()
    {
        Schema::dropIfExists('user_keys');
    }

    public function down()
    {
        Schema::create('user_keys', function (Blueprint $table) {
            $table->id();
            $table->text('license_key')->nullable();
            $table->string('item')->nullable();
            $table->integer('item_is')->nullable();
            $table->timestamps();
        });
    }
};
