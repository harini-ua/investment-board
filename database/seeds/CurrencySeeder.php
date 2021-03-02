<?php

namespace Database\Seeders;

use Carbon\Carbon;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class CurrencySeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('currency')
            ->insert([
                ['currency' => 'EUR', 'category' => 'Cach', 'aum' => 1306924, 'created_at' => Carbon::now()],
                ['currency' => 'EUR', 'category' => 'Investments', 'aum' => 220456, 'created_at' => Carbon::now()],
                ['currency' => 'EUR', 'category' => 'FX Forwards', 'aum' => 2094413, 'created_at' => Carbon::now()],
                ['currency' => 'USD', 'category' => 'Cach', 'aum' => 1306924, 'created_at' => Carbon::now()],
                ['currency' => 'USD', 'category' => 'Investments', 'aum' => 220456, 'created_at' => Carbon::now()],
                ['currency' => 'USD', 'category' => 'FX Forwards', 'aum' => 2094413, 'created_at' => Carbon::now()],
                ['currency' => 'CHF', 'category' => 'Cach', 'aum' => 1306924, 'created_at' => Carbon::now()],
                ['currency' => 'CHF', 'category' => 'Investments', 'aum' => 220456, 'created_at' => Carbon::now()],
                ['currency' => 'CHF', 'category' => 'FX Forwards', 'aum' => 2094413, 'created_at' => Carbon::now()],
            ]);
    }
}
