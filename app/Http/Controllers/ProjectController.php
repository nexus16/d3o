<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Repositories\Contracts\ProjectRepositoryInterface;
use App\Repositories\Contracts\UserRepositoryInterface;
use App\Repositories\Contracts\CustomerRepositoryInterface;
use App\Repositories\Contracts\ProjectMemberRepositoryInterface;
use App\Http\Requests\CheckCreateProject;
use Gate;
use Auth;
use DB;
use App\Models\Project;

class ProjectController extends Controller
{
  public $projectRepository;
  public $userRepository;
  public $projectMemberRepository;
  public $customerRepository;

  public function __construct(
  	ProjectRepositoryInterface $projectRepository,
  	UserRepositoryInterface $userRepository,
  	ProjectMemberRepositoryInterface $projectMemberRepository,
    CustomerRepositoryInterface $customerRepository
  )
  {
  	$this->projectRepository = $projectRepository;
  	$this->userRepository = $userRepository;
  	$this->projectMemberRepository = $projectMemberRepository;
    $this->customerRepository = $customerRepository;
  }
  /**
   * show list project
   */
  public function index(Request $request)
  {
  	if (Auth::user()->isLeader())
  		$listProjects =  $this->projectRepository->getAll();
  	else 
  		$listProjects = $this->projectRepository->getParticipationProjects(Auth::id())->get();
    return view('projects.index', compact('listProjects'));

  }
  /**
   * view info project
   */
  public function view($id)
  {
  	$project = $this->projectRepository->find($id);
  	$this->authorize($project);
  	$listUsers = $this->userRepository->getListUserInProject($id)->get();
  	$projectInfo = $this->projectRepository->getInfo($id);
    return view('projects.show', compact('listUsers', 'projectInfo'));
  }
  /**
   * create new project
   */
  public function showFormCreate()
  {
    $listUsers = $this->userRepository->getAll();
    $listCustomers = $this->customerRepository->getAll();
  	if (Auth::user()->isLeader())
  		return view('projects.new', compact('listUsers', 'listCustomers'));
  	else 
  		abort(404);
  }
  /**
   * save new project
   */
  public function create(CheckCreateProject $request)
  {
  	$listMember = $request->input('member');
  	try {
      DB::beginTransaction();
        $project = $this->projectRepository->create($request->all());
        foreach ($listMember as $member) {
      		$this->projectMemberRepository->create(['project_id'=>$project->id, 'user_id'=>$member]);
      	}
      DB::commit();
    } catch (Exception $e) {
      DB::rollBack();
      return redirect()->back();
    }
    return redirect()->route('projects');
  }
  /**
   * show edit project
   */
  public function showFormEdit($id)
  {
  	$project = $this->projectRepository->find($id);
  	$this->authorize('update', $project);
  	return view('projects.edit', compact('project'));
  }
  /**
   * update project
   */
  public function update(CheckCreateProject $request, $projectId)
  {
  	$project = $this->projectRepository->find($projectId);
  	$this->authorize($project);
  	try {
        DB::beginTransaction();
           	$this->projectRepository->update($projectId, $request->all());
        DB::commit();
    } catch (Exception $e) {
        DB::rollBack();
        return redirect()->back();
    }
    return redirect()->route('projects');
  }
}
