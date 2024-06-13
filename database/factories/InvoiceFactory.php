<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Invoice>
 */
class InvoiceFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        $maxDigits = floor(log10(mt_getrandmax()));
        $nbDigits = min($maxDigits, 50);
        return [

            "invoice_number" => $this->faker->randomNumber($nbDigits,true),
            "invoice_date" => $this->faker->date(),
            "due_date" => $this->faker->date(),
            "user_id" => $this->faker->numberBetween(1, 11),
            "status" => $this->faker->randomElement(['pending', 'paid', 'overdue']),
            "total_amount" => $this->faker->randomFloat(2, 10, 1000),
            "balance" => $this->faker->randomFloat(2, 10, 1000),
            "paid" => $this->faker->randomFloat(2, 10, 1000)

        ];
    }
}
