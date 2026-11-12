<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;

// Organisation accounts layered on the existing tl_users authentication (no separate login).
return new class extends Migration
{
    public function up()
    {
        Schema::create('companies', function (Blueprint $table) {
            $table->id();
            $table->uuid('uuid')->unique();
            $table->string('name', 191);
            $table->string('slug', 191)->unique();
            $table->string('legal_name', 191)->nullable();
            $table->string('registration_number', 100)->nullable();
            $table->string('industry', 100)->nullable();
            $table->string('website', 255)->nullable();
            $table->string('email', 191)->nullable();
            $table->string('phone', 50)->nullable();
            $table->string('country', 2)->nullable();
            $table->text('description')->nullable();
            $table->string('status', 20)->default('active')->index();
            $table->string('verification_status', 20)->default('unverified')->index();
            $table->timestamp('verified_at')->nullable();
            $table->integer('created_by')->nullable();
            $table->timestamps();
            $table->softDeletes();
        });

        Schema::create('company_members', function (Blueprint $table) {
            $table->id();
            $table->foreignId('company_id')->constrained('companies')->cascadeOnDelete();
            $table->integer('user_id');
            $table->foreign('user_id')->references('id')->on('tl_users')->cascadeOnDelete();
            $table->string('role', 30);
            $table->integer('invited_by')->nullable();
            $table->timestamp('joined_at')->nullable();
            $table->timestamps();
            $table->unique(['company_id', 'user_id']);
            $table->index(['user_id', 'company_id']);
        });

        Schema::create('company_invitations', function (Blueprint $table) {
            $table->id();
            $table->foreignId('company_id')->constrained('companies')->cascadeOnDelete();
            $table->string('email', 191);
            $table->string('role', 30);
            $table->string('token_hash', 64)->unique();
            $table->integer('invited_by')->nullable();
            $table->timestamp('expires_at');
            $table->timestamp('accepted_at')->nullable();
            $table->timestamp('revoked_at')->nullable();
            $table->timestamps();
            $table->index(['company_id', 'email']);
        });

        Schema::create('company_verifications', function (Blueprint $table) {
            $table->id();
            $table->foreignId('company_id')->constrained('companies')->cascadeOnDelete();
            $table->string('status', 20)->default('pending')->index();
            $table->integer('submitted_by')->nullable();
            $table->integer('reviewed_by')->nullable();
            $table->text('notes')->nullable();
            $table->text('reviewer_notes')->nullable();
            $table->timestamp('submitted_at')->nullable();
            $table->timestamp('reviewed_at')->nullable();
            $table->timestamps();
        });

        Schema::create('company_documents', function (Blueprint $table) {
            $table->id();
            $table->foreignId('company_id')->constrained('companies')->cascadeOnDelete();
            $table->foreignId('company_verification_id')->nullable()->constrained('company_verifications')->nullOnDelete();
            $table->string('type', 40);
            $table->string('original_name', 255);
            $table->string('disk', 30)->default('local');
            $table->string('path', 255);
            $table->string('mime_type', 100)->nullable();
            $table->unsignedBigInteger('size')->default(0);
            $table->integer('uploaded_by')->nullable();
            $table->timestamps();
        });

        if (Schema::hasTable('permissions') && !DB::table('permissions')->where('name', 'Manage Companies')->exists()) {
            // The imported permission tables have no AUTO_INCREMENT on `id`.
            $moduleId = DB::table('permission_module')->where('module_name', 'Company')->value('id');
            if (!$moduleId) {
                $moduleId = (int) DB::table('permission_module')->max('id') + 1;
                DB::table('permission_module')->insert([
                    'id' => $moduleId, 'parent_module' => 'Companies', 'module_name' => 'Company',
                    'module_type' => 'base', 'order' => 6, 'created_at' => now(),
                ]);
            }
            DB::table('permissions')->insert([
                'id' => (int) DB::table('permissions')->max('id') + 1,
                'name' => 'Manage Companies',
                'module_id' => $moduleId,
                'guard_name' => 'web',
                'created_at' => now(),
                'updated_at' => now(),
            ]);
        }
    }

    public function down()
    {
        if (Schema::hasTable('permissions')) {
            DB::table('permissions')->where('name', 'Manage Companies')->delete();
            DB::table('permission_module')->where('module_name', 'Company')->where('parent_module', 'Companies')->delete();
        }
        Schema::dropIfExists('company_documents');
        Schema::dropIfExists('company_verifications');
        Schema::dropIfExists('company_invitations');
        Schema::dropIfExists('company_members');
        Schema::dropIfExists('companies');
    }
};
