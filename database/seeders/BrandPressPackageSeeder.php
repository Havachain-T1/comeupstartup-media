<?php

namespace Database\Seeders;

use App\Models\Commerce\Product;
use Illuminate\Database\Seeder;

/**
 * TEST CONFIGURATION ONLY. Prices are illustrative and live in the database, never in business
 * logic; edit them through product_packages before going live.
 */
class BrandPressPackageSeeder extends Seeder
{
    public function run()
    {
        $product = Product::updateOrCreate(['code' => config('brand_press.product_code')], [
            'name' => 'Brand Press',
            'description' => 'Paid company announcements, reviewed by the editorial team before publication.',
        ]);

        $packages = [
            ['code' => 'starter', 'name' => 'Starter', 'price_minor' => 5000000, 'sort_order' => 1, 'features' => ['Editorial review', 'Published in Brand Press', 'Share on X and LinkedIn']],
            ['code' => 'growth', 'name' => 'Growth', 'price_minor' => 10000000, 'sort_order' => 2, 'features' => ['Everything in Starter', 'Homepage placement for 48 hours', 'Newsletter mention']],
            ['code' => 'premium', 'name' => 'Premium', 'price_minor' => 17500000, 'sort_order' => 3, 'features' => ['Everything in Growth', 'Featured placement for 7 days', 'Performance report']],
        ];
        foreach ($packages as $package) {
            $product->packages()->updateOrCreate(['code' => $package['code']], $package + ['currency' => 'NGN']);
        }
    }
}
