<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Instance extends Model
{
  use HasFactory;

  protected $fillable = [
    'parent_id',
    'name',
    'is_active',
    'kepsek',
    'website',
    'email',
    'image',
  ];

  public function parent()
  {
    return $this->belongsTo(Instance::class);
  }

  public function children()
  {
    return $this->hasMany(Instance::class);
  }

  public function addresses()
  {
    return $this->hasMany(InstanceAddress::class);
  }

  public function users()
  {
    return $this->hasMany(User::class);
  }

  public function documents()
  {
    return $this->hasMany(Document::class);
  }

  public function address()
  {
    return $this->hasOne(InstanceAddress::class);
  }

  public function instance()
  {
    return $this->belongsTo(Instance::class);
  }

  public function instances()
  {
    return $this->hasMany(Instance::class);
  }
}
