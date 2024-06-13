<?php

namespace Database\Seeders;

use App\Models\Invoice;
use App\Models\Transaction;
use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Database\Factories\InvoiceFactory;
use Illuminate\Database\Seeder;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
         User::factory(10)->create();
         Invoice::factory(20)->create();
         Transaction::factory(20)->create();

    }
}
