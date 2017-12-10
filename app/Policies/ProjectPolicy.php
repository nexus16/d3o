<?php

namespace App\Policies;

use App\Models\User;
use App\Models\Project;
use Illuminate\Auth\Access\HandlesAuthorization;
use App\Repositories\Contracts\ProjectMemberRepositoryInterface;

class ProjectPolicy
{
    use HandlesAuthorization;
    public $projectMemberRepo;
    public function __construct(ProjectMemberRepositoryInterface $projectMemberRepo)
    {
        $this->projectMemberRepo = $projectMemberRepo;
    }
    /**
     * all ability for leader
     */
    public function before($user, $ability)
    {
        if ($user->isLeader()) {
            return true;
        }
    }
    /**
     * Determine whether the user can view the project.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Project  $project
     * @return mixed
     */
    public function view(User $user, Project $project)
    {
        if ($this->projectMemberRepo->checkUserInProject($user->id, $project->id)) {
            return true;
        } else {
            abort(404);
        }
    }

    /**
     * Determine whether the user can create projects.
     *
     * @param  \App\Models\User  $user
     * @return mixed
     */
    public function create(User $user)
    {
        //
    }

    /**
     * Determine whether the user can update the project.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Project  $project
     * @return mixed
     */
    public function update(User $user, Project $project)
    {
        if ($user->id == $project->manager_id) {
            return true;
        } else {
            abort(404);
        }
    }

    /**
     * Determine whether the user can delete the project.
     *
     * @param  \App\Models\User  $user
     * @param  \App\Project  $project
     * @return mixed
     */
    public function delete(User $user, Project $project)
    {
        //
    }
}
