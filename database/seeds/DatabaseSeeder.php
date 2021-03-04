<?php

use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    public function run()
    {
        $this->call(\Database\Seeders\UserSeeder::class);

        if (app()->isLocal()) {
            //
        }
    }
}
