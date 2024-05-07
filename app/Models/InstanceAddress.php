<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class InstanceAddress extends Model
{
  use HasFactory;

  protected $fillable = [
    'instance_id',
    'address',
    'district',
    'city',
    'province',
    'postal_code',
  ];

  public function instance()
  {
    return $this->belongsTo(Instance::class);
  }

  public function users()
  {
    return $this->hasMany(User::class);
  }

  public function documents()
  {
    return $this->hasMany(Document::class);
  }

  public function parent()
  {
    return $this->belongsTo(InstanceAddress::class, 'parent_id');
  }

  public function children()
  {
    return $this->hasMany(InstanceAddress::class, 'parent_id');
  }

  public function addresses()
  {
    return $this->hasMany(InstanceAddress::class);
  }
}
