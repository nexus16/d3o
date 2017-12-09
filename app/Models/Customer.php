<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Customer extends Model
{
  use SoftDeletes;
  protected $table = 'customers';
    protected $dates = ['deleted_at'];
    protected $fillable = [
        'name',
        'website',
        'note',
        'chanel_comunication'
    ]; 
}
