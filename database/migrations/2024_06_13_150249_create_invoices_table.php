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
       if(!Schema::hasTable('invoices')){
           Schema::create('invoices', function (Blueprint $table) {
//
               $table->id();
               $table->string('invoice_number')->unique();
               $table->date('invoice_date');
               $table->decimal('total_amount', 10, 2);
               $table->decimal('balance', 10, 2);
               $table->decimal('paid',10,2);
               $table->unsignedBigInteger('user_id')->nullable();
               $table->enum('status', ['pending', 'paid', 'overdue'])->default('pending');
               $table->timestamp('due_date')->nullable();
               $table->timestamps();
           });
       }
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('invoices');
    }
};
