<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Invoice extends Model
{
    use HasFactory;
    protected $fillable = [
        'invoice_number',
        'invoice_date',
        'due_date',
        'user_id',
        'status',
        'total_amount',
        'balance',
        'paid',
        ];
    public function user()
    {
        return $this->belongsTo(User::class);
    }
    public function transactions()
    {
        return $this->hasMany(Transaction::class, 'invoice_id', 'id');
    }




}
