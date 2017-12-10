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
    /**
     * get list project participation
     */
    public function getParticipationProjects($userId)
    {
    	return Project::rightJoin('project_member', 'projects.id', '=', 'project_member.project_id')
    		->select('projects.*')
    		->where('project_member.user_id', $userId);
    }
    /**
     * get info project
     */
    public function getInfo($projectId)
    {
    	return Project::leftJoin('users', 'users.id', '=', 'projects.manager_id')
    		->leftJoin('customers', 'customers.id', '=', 'projects.customer_id')
    		->select(
    			'projects.*',
    			'users.id as manager_id',
    			'users.name as manager_name',
    			'customers.id as customer_id',
    			'customers.name as customer_name'
    		)
    		->where('projects.id', $projectId)
    		->get();
    }

}