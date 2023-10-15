<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class School extends Model
{
    use HasFactory;

    protected $fillable = ['name'];

    // Define the relationship with Member
    public function members()
    {
        return $this->hasMany(Member::class);
    }
}
