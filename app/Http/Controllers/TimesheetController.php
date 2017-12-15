<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Repositories\Contracts\ProjectRepositoryInterface;
use App\Repositories\Contracts\UserRepositoryInterface;
use App\Repositories\Contracts\ProjectMemberRepositoryInterface;
use App\Repositories\Contracts\TimesheetRepositoryInterface;
use App\Repositories\Contracts\TaskRepositoryInterface;

use Auth;
use Carbon\Carbon;
class TimesheetController extends Controller
{
	public $projectRepository;
  public $userRepository;
  public $projectMemberRepository;
  public $customerRepository;
  public $timesheetRepository;
  public $taskRepository;


  public function __construct(
  	ProjectRepositoryInterface $projectRepository,
  	UserRepositoryInterface $userRepository,
  	ProjectMemberRepositoryInterface $projectMemberRepository,
  	TimesheetRepositoryInterface $timesheetRepository,
  	TaskRepositoryInterface $taskRepository
  )
  {
  	$this->projectRepository = $projectRepository;
  	$this->userRepository = $userRepository;
  	$this->timesheetRepository = $timesheetRepository;
  	$this->projectMemberRepository = $projectMemberRepository;
  	$this->taskRepository = $taskRepository;
  }
  public function index()
  {
  	return $this->taskRepository->getAll();
  }
  public function showFormCreate()
  {
  	$projects = $this->projectRepository->getParticipationProjects(Auth::id())->get();
  	return view('timesheets.new', compact('projects'));
  }
  public function create(Request $request)
  {
  	$requestAll = $request->all();
  	// if ($this->timesheetRepository->checkTimesheetRegisted(Auth::id())) {
  	// 	$message['status'] =false;
  	// 	return $message;
  	// }
  	$listProjects = [];
  	array_push($listProjects, $requestAll[0]['project_id']);
  	foreach ($request->all() as $rq) {
  		if (!in_array($rq['project_id'], $listProjects))
  			array_push($listProjects, $rq['project_id']);
  	}
  	foreach ( $listProjects as $value) {
  		$data['user_id'] = Auth::id();
  		$data['user_name'] = Auth::user()->name;
  		$data['project_id'] = $value;
  		$data['content'] = "content";
  		$timesheet = $this->timesheetRepository->create($data);
  		foreach ($request->all() as $rq) {
	  		if ($rq['project_id'] == $value) {
	  			$task['timesheet_id'] = $timesheet->id;
	  			$task['content'] = $rq['content'];
	  			$task['duration'] = $rq['duration'];
	  			$this->taskRepository->create($task);
	  		}
	  	}
  	}  		
  	$message['status'] =true;
  	return $message;
  }
}
