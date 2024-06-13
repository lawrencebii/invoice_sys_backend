<?php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Transaction>
 */
class TransactionFactory extends Factory
{
    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    { $maxDigits = floor(log10(mt_getrandmax()));
        $nbDigits = min($maxDigits, 9);
        return [
            'user_id' => $this->faker->numberBetween(0, 12),
            'transaction_id' =>  $this->faker->regexify('[A-Za-z0-9]{10}'),
            'invoice_id' =>  $this->faker->numberBetween(1,20),
            'amount' =>  $this->faker->numberBetween(100,20000),
            'status' =>  $this->faker->randomElement( ['pending', 'success', 'failed','cancelled'] ),
            'date_paid' => $this->faker->date(),
            'payer_name' =>  $this->faker->name(),

        ];
    }
}
