<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Repositories\Contracts\UserRepositoryInterface;

class UserController extends Controller
{
  public $userRepository;
  public function __construct(UserRepositoryInterface $userRepository)
  {
  	$this->userRepository = $userRepository;
  }
  public function listUsers()
  {
  	return $this->userRepository->getAll();
  }
}
