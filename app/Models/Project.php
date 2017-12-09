<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Project extends Model
{
  use SoftDeletes;
  protected $table = 'projects';
  protected $dates = ['deleted_at'];
  protected $fillable = [
      'manager_id',
      'customer_id',
      'start_date',
      'deadline',
      'specification',
      'note',
      'valid_state',
      'start_date',
  ];
}
