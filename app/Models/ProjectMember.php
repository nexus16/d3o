<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class ProjectMember extends Model
{
  use SoftDeletes;
  protected $table = 'project_member';
  protected $dates = ['deleted_at'];
  protected $fillable = [
      'user_id',
      'project_id',
  ];
  
}
