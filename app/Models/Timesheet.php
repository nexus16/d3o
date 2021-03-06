<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Timesheet extends Model
{
  use SoftDeletes;
  protected $table = 'timesheets';
    protected $dates = ['deleted_at'];
    protected $fillable = [
    	'user_id',
    	'user_name',
      'project_id',
      'content',
      'duration',
      'is_OT'
    ]; 
}
