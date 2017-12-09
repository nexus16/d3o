<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Repositories\Contracts\CustomerRepositoryInterface;

class CustomerController extends Controller
{
  public $customerRepository;
  public function __construct(CustomerRepositoryInterface $customerRepository)
  {
  	$this->customerRepository = $customerRepository;
  }
  public function listCustomers()
  {
  	return $this->customerRepository->getAll();
  }
}
