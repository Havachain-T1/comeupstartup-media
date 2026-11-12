<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

/** Expert Network foundation (Marketplace). Schema only + matching service; no public UI yet. */
return new class extends Migration
{
    public function up()
    {
        Schema::create('expertise_categories', function (Blueprint $table) {
            $table->id();
            $table->foreignId('parent_id')->nullable()->constrained('expertise_categories')->nullOnDelete();
            $table->string('name', 120);
            $table->string('slug', 140)->unique();
            $table->timestamps();
        });

        Schema::create('expert_profiles', function (Blueprint $table) {
            $table->id();
            $table->integer('user_id')->unique();
            $table->string('headline', 191);
            $table->text('bio')->nullable();
            $table->string('country', 2)->nullable();
            $table->unsignedSmallInteger('years_experience')->default(0);
            $table->unsignedBigInteger('hourly_rate_minor')->nullable();
            $table->char('currency', 3)->default('NGN');
            $table->string('verification_status', 20)->default('unverified')->index();
            $table->boolean('is_available')->default(true);
            $table->timestamps();
            $table->softDeletes();
        });

        Schema::create('expert_profile_category', function (Blueprint $table) {
            $table->foreignId('expert_profile_id')->constrained()->cascadeOnDelete();
            $table->foreignId('expertise_category_id')->constrained()->cascadeOnDelete();
            $table->unsignedTinyInteger('level')->default(3);
            $table->primary(['expert_profile_id', 'expertise_category_id'], 'expert_category_primary');
        });

        Schema::create('expert_verifications', function (Blueprint $table) {
            $table->id();
            $table->foreignId('expert_profile_id')->constrained()->cascadeOnDelete();
            $table->string('status', 20)->default('pending');
            $table->json('evidence')->nullable();
            $table->integer('reviewed_by')->nullable();
            $table->timestamp('reviewed_at')->nullable();
            $table->text('notes')->nullable();
            $table->timestamps();
        });

        Schema::create('expert_engagements', function (Blueprint $table) {
            $table->id();
            $table->uuid('uuid')->unique();
            $table->foreignId('company_id')->constrained()->cascadeOnDelete();
            $table->foreignId('expert_profile_id')->constrained()->cascadeOnDelete();
            $table->foreignId('order_id')->nullable()->constrained('orders')->nullOnDelete();
            $table->string('title', 191);
            $table->text('scope')->nullable();
            $table->string('status', 20)->default('proposed')->index();
            $table->timestamps();
        });

        Schema::create('expert_sessions', function (Blueprint $table) {
            $table->id();
            $table->foreignId('expert_engagement_id')->constrained()->cascadeOnDelete();
            $table->timestamp('scheduled_at');
            $table->unsignedSmallInteger('duration_minutes')->default(60);
            $table->string('status', 20)->default('scheduled');
            $table->text('summary')->nullable();
            $table->timestamps();
        });

        Schema::create('assessment_rubrics', function (Blueprint $table) {
            $table->id();
            $table->string('key', 100);
            $table->unsignedInteger('version');
            $table->string('name', 191);
            $table->json('criteria');
            $table->timestamps();
            $table->unique(['key', 'version']);
        });

        Schema::create('assessments', function (Blueprint $table) {
            $table->id();
            $table->foreignId('expert_engagement_id')->constrained()->cascadeOnDelete();
            $table->foreignId('assessment_rubric_id')->constrained()->restrictOnDelete();
            $table->json('scores')->nullable();
            $table->decimal('overall_score', 5, 2)->nullable();
            $table->string('status', 20)->default('draft');
            $table->timestamp('submitted_at')->nullable();
            $table->timestamps();
        });

        Schema::create('assessment_findings', function (Blueprint $table) {
            $table->id();
            $table->foreignId('assessment_id')->constrained()->cascadeOnDelete();
            $table->string('severity', 10)->default('medium');
            $table->string('title', 191);
            $table->text('detail')->nullable();
            $table->text('recommendation')->nullable();
            $table->string('status', 20)->default('open');
            $table->timestamps();
        });

        Schema::create('company_knowledge_records', function (Blueprint $table) {
            $table->id();
            $table->foreignId('company_id')->constrained()->cascadeOnDelete();
            $table->nullableMorphs('source');
            $table->string('title', 191);
            $table->longText('body')->nullable();
            $table->string('visibility', 20)->default('company');
            $table->integer('created_by')->nullable();
            $table->timestamps();
            $table->index(['company_id', 'visibility']);
        });
    }

    public function down()
    {
        foreach (['company_knowledge_records', 'assessment_findings', 'assessments', 'assessment_rubrics', 'expert_sessions', 'expert_engagements', 'expert_verifications', 'expert_profile_category', 'expert_profiles', 'expertise_categories'] as $table) {
            Schema::dropIfExists($table);
        }
    }
};
