<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
User::create([
    'first_name' => 'Firstname',
    'last_name' => 'Lastname',
    'email' => 'user@example.com',
    'password' => Hash::make('secret'),
    'client_code' => 'DUM',
    'base_currency' => 'CHF'
]);
    }
}
