<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Attendance extends Model
{
    use HasFactory;

    protected $fillable = [
        'meeting_id',
        'mentee_id',
        'status',
        'notes',
    ];

    public function meeting()
    {
        return $this->belongsTo(Meeting::class);
    }

    public function mentee()
    {
        return $this->belongsTo(Mentee::class);
    }
}