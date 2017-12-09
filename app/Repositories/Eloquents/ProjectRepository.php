<?php

namespace App\Repositories\Eloquents;

use App\Repositories\Contracts\ProjectRepositoryInterface;
use App\Repositories\Eloquents\EloquentRepository;
use App\Models\Project;

class ProjectRepository extends EloquentRepository implements ProjectRepositoryInterface
{
    /**
     * get model
     * @return string
     */
    public function getModel()
    {
        return Project::class;
    }
}