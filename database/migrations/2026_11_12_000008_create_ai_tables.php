<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up()
    {
        Schema::create('ai_prompts', function (Blueprint $table) {
            $table->id();
            $table->string('key', 100);
            $table->unsignedInteger('version');
            $table->text('system');
            $table->longText('template');
            $table->string('model', 100)->nullable();
            $table->unsignedInteger('max_tokens')->nullable();
            $table->boolean('is_active')->default(true);
            $table->string('notes', 500)->nullable();
            $table->timestamps();
            $table->unique(['key', 'version']);
        });

        // Usage and cost ledger. Prompt/response text is deliberately not stored; input_hash allows
        // duplicate detection without retaining content.
        Schema::create('ai_requests', function (Blueprint $table) {
            $table->id();
            $table->integer('user_id')->nullable();
            $table->foreignId('company_id')->nullable()->constrained('companies')->nullOnDelete();
            $table->string('agent', 60)->nullable();
            $table->string('prompt_key', 100);
            $table->unsignedInteger('prompt_version');
            $table->string('provider', 40);
            $table->string('model', 100);
            $table->string('status', 20);
            $table->unsignedInteger('input_tokens')->default(0);
            $table->unsignedInteger('output_tokens')->default(0);
            $table->unsignedBigInteger('cost_micros')->default(0);
            $table->unsignedInteger('latency_ms')->default(0);
            $table->char('input_hash', 64);
            $table->string('error', 500)->nullable();
            $table->timestamp('created_at')->nullable()->index();
            $table->index(['user_id', 'created_at']);
            $table->index(['company_id', 'created_at']);
        });

        if (Schema::hasTable('permissions') && !DB::table('permissions')->where('name', 'Use AI Agents')->exists()) {
            $moduleId = DB::table('permission_module')->where('module_name', 'Company')->value('id') ?? 0;
            DB::table('permissions')->insert([
                'id' => (int) DB::table('permissions')->max('id') + 1, 'name' => 'Use AI Agents',
                'module_id' => $moduleId, 'guard_name' => 'web', 'created_at' => now(), 'updated_at' => now(),
            ]);
        }
    }

    public function down()
    {
        if (Schema::hasTable('permissions')) {
            DB::table('permissions')->where('name', 'Use AI Agents')->delete();
        }
        Schema::dropIfExists('ai_requests');
        Schema::dropIfExists('ai_prompts');
    }
};
