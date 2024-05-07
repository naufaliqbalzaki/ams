<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Document extends Model
{
  use HasFactory;

  protected $fillable = [
    'user_id',
    'instance_id',
    'doc_type',
    'type',
    'number',
    'date',
    'subject',
    'from',
    'to',
    'file',
    'phone',
    'next_action',
    'corrective_action',
    'description',
  ];

  public function user()
  {
    return $this->belongsTo(User::class);
  }

  public function instance()
  {
    return $this->belongsTo(Instance::class);
  }


}
