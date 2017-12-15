<?php

namespace App\Repositories\Eloquents;

use App\Repositories\Contracts\TaskRepositoryInterface;
use App\Repositories\Eloquents\EloquentRepository;
use App\Models\Task;
use Carbon\Carbon;

class TaskRepository extends EloquentRepository implements TaskRepositoryInterface
{
    /**
     * get model
     * @return string
     */
    public function getModel()
    {
        return Task::class;
    }
}