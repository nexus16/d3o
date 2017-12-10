<?php

namespace App\Repositories\Eloquents;

use App\Repositories\Contracts\ProjectMemberRepositoryInterface;
use App\Repositories\Eloquents\EloquentRepository;
use App\Models\ProjectMember;

class ProjectMemberRepository extends EloquentRepository implements ProjectMemberRepositoryInterface
{
    /**
     * get model
     * @return string
     */
    public function getModel()
    {
        return ProjectMember::class;
    }
    /**
     * get list user in project
     */
    public function checkUserInProject($userId, $projectId)
    {
    	$check =  ProjectMember::where('user_id', $userId)
            ->where('project_id', $projectId)
            ->first();
        return $check ? $check : null;
    }
}