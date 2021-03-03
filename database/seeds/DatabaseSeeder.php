<?php

use App\Models\Account;
use App\Models\Contact;
use App\Models\Organization;
use App\Models\User;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    public function run()
    {
        $this->call(\Database\Seeders\UserSeeder::class);

        if (app()->isLocal()) {
            $this->call(\Database\Seeders\CurrencySeeder::class);
        }
    }
}
