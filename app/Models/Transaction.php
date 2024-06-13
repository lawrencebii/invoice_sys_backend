<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Transaction extends Model
{
    use HasFactory;

    protected $fillable = [
        'user_id',
        'transaction_id',
        'invoice_id',
        'amount',
        'status',
        'date_paid',
        'payer_name',];
    public function user()
    {
        return $this->belongsTo(User::class);
    }

}
