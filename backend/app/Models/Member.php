<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Member extends Model
{
    use HasFactory;

    protected $fillable = ['name', 'email'];

    // Define the relationship with School
    public function school()
    {
        return $this->belongsTo(School::class);
    }
}
