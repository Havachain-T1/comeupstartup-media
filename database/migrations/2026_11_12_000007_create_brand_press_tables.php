<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('press_releases', function (Blueprint $table) {
            $table->id();
            $table->uuid('uuid')->unique();
            $table->foreignId('company_id')->constrained('companies')->cascadeOnDelete();
            $table->integer('author_id')->nullable();
            $table->string('title', 225);
            $table->string('summary', 500)->nullable();
            $table->longText('body');
            $table->string('contact_name', 191)->nullable();
            $table->string('contact_email', 191)->nullable();
            $table->string('status', 30)->default('draft')->index();
            $table->foreignId('product_package_id')->nullable()->constrained('product_packages')->nullOnDelete();
            $table->foreignId('order_id')->nullable()->constrained('orders')->nullOnDelete();
            $table->integer('reviewer_id')->nullable();
            $table->timestamp('submitted_at')->nullable();
            $table->timestamp('scheduled_for')->nullable()->index();
            $table->timestamp('published_at')->nullable();
            $table->unsignedBigInteger('blog_id')->nullable()->index();
            $table->boolean('ai_assisted')->default(false);
            $table->timestamps();
            $table->index(['company_id', 'status']);
        });

        Schema::create('press_release_events', function (Blueprint $table) {
            $table->id();
            $table->foreignId('press_release_id')->constrained('press_releases')->cascadeOnDelete();
            $table->string('from_status', 30)->nullable();
            $table->string('to_status', 30);
            $table->integer('actor_id')->nullable();
            $table->text('note')->nullable();
            $table->boolean('is_internal')->default(false);
            $table->timestamp('created_at')->nullable();
        });

        if (Schema::hasTable('permissions') && !DB::table('permissions')->where('name', 'Manage Brand Press')->exists()) {
            $moduleId = DB::table('permission_module')->where('module_name', 'Company')->value('id') ?? 0;
            DB::table('permissions')->insert([
                'id' => (int) DB::table('permissions')->max('id') + 1, 'name' => 'Manage Brand Press',
                'module_id' => $moduleId, 'guard_name' => 'web', 'created_at' => now(), 'updated_at' => now(),
            ]);
        }
    }

    public function down()
    {
        if (Schema::hasTable('permissions')) {
            DB::table('permissions')->where('name', 'Manage Brand Press')->delete();
        }
        Schema::dropIfExists('press_release_events');
        Schema::dropIfExists('press_releases');
    }
};
