<?php

namespace App\Repositories\Eloquents;

use App\Repositories\Contracts\UserRepositoryInterface;
use App\Repositories\Eloquents\EloquentRepository;
use App\Models\User;

class UserRepository extends EloquentRepository implements UserRepositoryInterface
{
    /**
     * get model
     * @return string
     */
    public function getModel()
    {
        return User::class;
    }
    /**
     * get list user in project
     */
    public function getListUserInProject($projectId)
    {
    	return User::rightJoin('project_member', 'users.id', '=', 'project_member.user_id')
    		->leftJoin('projects', 'projects.id', '=', 'project_member.project_id')
    		->select('users.*')
    		->where('project_member.project_id', $projectId);
    }
}