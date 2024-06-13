<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
  if(!Schema::hasTable('transactions')){
      Schema::create('transactions', function (Blueprint $table) {
          $table->id();
          $table->unsignedBigInteger('user_id')->nullable();
          $table->unsignedBigInteger('invoice_id')->nullable();
          $table->string('transaction_id')->nullable();
          $table->decimal('amount')->default(0);
          $table->enum('status',['pending', 'success', 'cancelled','failed'])->default('pending');
          $table->date('date_paid')->nullable()->default(date(\Illuminate\Support\Facades\Date::now()));
//            payer name from daraja
          $table->string('payer_name')->nullable();
          $table->timestamps();
      });
  }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('transactions');

    }
};
