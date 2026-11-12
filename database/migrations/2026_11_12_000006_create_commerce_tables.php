<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

// Shared commerce foundation. Money is stored in minor units (kobo for NGN). Audit history uses the
// existing spatie `activity_log` table rather than a second activity_logs table.
return new class extends Migration
{
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->id();
            $table->string('code', 60)->unique();
            $table->string('name', 191);
            $table->text('description')->nullable();
            $table->boolean('is_active')->default(true);
            $table->timestamps();
        });

        Schema::create('product_packages', function (Blueprint $table) {
            $table->id();
            $table->foreignId('product_id')->constrained('products')->cascadeOnDelete();
            $table->string('code', 60);
            $table->string('name', 191);
            $table->text('description')->nullable();
            $table->json('features')->nullable();
            $table->unsignedBigInteger('price_minor');
            $table->string('currency', 3)->default('NGN');
            $table->boolean('is_active')->default(true);
            $table->unsignedInteger('sort_order')->default(0);
            $table->timestamps();
            $table->unique(['product_id', 'code']);
        });

        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->uuid('uuid')->unique();
            $table->string('number', 30)->unique();
            $table->foreignId('company_id')->nullable()->constrained('companies')->nullOnDelete();
            $table->integer('user_id')->nullable()->index();
            $table->string('status', 20)->default('pending')->index();
            $table->string('currency', 3);
            $table->unsignedBigInteger('subtotal_minor')->default(0);
            $table->unsignedBigInteger('total_minor')->default(0);
            $table->unsignedBigInteger('refunded_minor')->default(0);
            $table->nullableMorphs('orderable');
            $table->timestamp('paid_at')->nullable();
            $table->timestamps();
        });

        Schema::create('order_items', function (Blueprint $table) {
            $table->id();
            $table->foreignId('order_id')->constrained('orders')->cascadeOnDelete();
            $table->foreignId('product_package_id')->nullable()->constrained('product_packages')->nullOnDelete();
            $table->string('product_code', 60);
            $table->string('description', 255);
            $table->unsignedInteger('quantity')->default(1);
            $table->unsignedBigInteger('unit_price_minor');
            $table->unsignedBigInteger('total_minor');
            $table->timestamps();
        });

        Schema::create('payments', function (Blueprint $table) {
            $table->id();
            $table->foreignId('order_id')->constrained('orders')->cascadeOnDelete();
            $table->string('gateway', 30);
            $table->string('reference', 100)->unique();
            $table->string('gateway_reference', 191)->nullable();
            $table->string('status', 20)->default('initiated')->index();
            $table->unsignedBigInteger('amount_minor');
            $table->string('currency', 3);
            $table->string('channel', 50)->nullable();
            $table->json('meta')->nullable();
            $table->timestamp('verified_at')->nullable();
            $table->timestamps();
        });

        Schema::create('payment_events', function (Blueprint $table) {
            $table->id();
            $table->string('gateway', 30);
            $table->string('event_id', 191);
            $table->string('type', 100)->nullable();
            $table->string('reference', 100)->nullable()->index();
            $table->string('outcome', 30)->nullable();
            $table->json('payload')->nullable();
            $table->timestamp('processed_at')->nullable();
            $table->timestamps();
            $table->unique(['gateway', 'event_id']);
        });

        Schema::create('invoices', function (Blueprint $table) {
            $table->id();
            $table->foreignId('order_id')->unique()->constrained('orders')->cascadeOnDelete();
            $table->foreignId('company_id')->nullable()->constrained('companies')->nullOnDelete();
            $table->string('number', 30)->unique();
            $table->string('status', 20)->default('paid');
            $table->unsignedBigInteger('total_minor');
            $table->string('currency', 3);
            $table->json('billing_details')->nullable();
            $table->timestamp('issued_at');
            $table->timestamps();
        });

        Schema::create('refunds', function (Blueprint $table) {
            $table->id();
            $table->foreignId('order_id')->constrained('orders')->cascadeOnDelete();
            $table->foreignId('payment_id')->nullable()->constrained('payments')->nullOnDelete();
            $table->unsignedBigInteger('amount_minor');
            $table->string('currency', 3);
            $table->string('status', 20)->default('pending');
            $table->string('reason', 500)->nullable();
            $table->string('gateway_reference', 191)->nullable();
            $table->integer('requested_by')->nullable();
            $table->integer('processed_by')->nullable();
            $table->timestamp('processed_at')->nullable();
            $table->timestamps();
        });
    }

    public function down()
    {
        foreach (['refunds', 'invoices', 'payment_events', 'payments', 'order_items', 'orders', 'product_packages', 'products'] as $table) {
            Schema::dropIfExists($table);
        }
    }
};
