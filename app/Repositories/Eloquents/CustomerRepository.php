<?php

namespace App\Repositories\Eloquents;

use App\Repositories\Contracts\CustomerRepositoryInterface;
use App\Repositories\Eloquents\EloquentRepository;
use App\Models\Customer;

class CustomerRepository extends EloquentRepository implements CustomerRepositoryInterface
{
    /**
     * get model
     * @return string
     */
    public function getModel()
    {
        return Customer::class;
    }
}