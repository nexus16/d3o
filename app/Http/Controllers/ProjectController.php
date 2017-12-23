<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Repositories\Contracts\ProjectRepositoryInterface;
use App\Repositories\Contracts\UserRepositoryInterface;
use App\Repositories\Contracts\CustomerRepositoryInterface;
use App\Repositories\Contracts\ProjectMemberRepositoryInterface;
use App\Repositories\Contracts\TimesheetRepositoryInterface;
use App\Http\Requests\CheckCreateProject;
use App\Models\Project;
use Gate;
use Auth;
use DB;
use Charts;
use Carbon\Carbon;

class ProjectController extends Controller
{
  public $projectRepository;
  public $userRepository;
  public $projectMemberRepository;
  public $customerRepository;
  public $timesheetRepository;

  public function __construct(
  	ProjectRepositoryInterface $projectRepository,
  	UserRepositoryInterface $userRepository,
  	ProjectMemberRepositoryInterface $projectMemberRepository,
    CustomerRepositoryInterface $customerRepository,
    TimesheetRepositoryInterface $timesheetRepository
  )
  {
  	$this->projectRepository = $projectRepository;
  	$this->userRepository = $userRepository;
  	$this->projectMemberRepository = $projectMemberRepository;
    $this->timesheetRepository = $timesheetRepository;
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
  public function view(Request $request, $id)
  {
    $day = Carbon::now();
    $timesheets = $this->timesheetRepository->getTimesheetMemberDay($id, $day->year, $day->month, $day->day)->get();
    if ($request->input('time')) {
      $year = substr($request->input('time'), 0, 4);
      $month = substr($request->input('time'), 5, 2);
      $day = substr($request->input('time'), 8, 2);
      $timesheets = $this->timesheetRepository->getTimesheetMemberDay($id, $year, $month, $day)->get();
    }
    $colorsChart = [];
    $labelsChart = [];
    $valuesChart = [];
    $listUsers = $this->userRepository->getListUserInProject($id)->get();
    foreach ($timesheets as $timesheet) {
      array_push($valuesChart, $timesheet->duration);
      array_push($labelsChart, $timesheet->user_name);
      if ($timesheet->duration <= 7) {
        array_push($colorsChart, '#00a65a');
      } elseif ($timesheet->duration > 7 && $timesheet->duration < 9) {
        array_push($colorsChart, '#319df3');
      } elseif ($timesheet->duration >= 9 && $timesheet->duration < 11 ) {
        array_push($colorsChart, '#f39c12');
      } elseif ($timesheet->duration >= 11 ) {
        array_push($colorsChart, '#dd4b39');
      }
    }
    $chart = Charts::create('bar', 'highcharts')
        ->title("Timesheets")
        ->dimensions(0, 400) // Width x Height
        ->colors($colorsChart)
        ->labels($labelsChart)
        ->values($valuesChart)
        ->elementLabel('duration');
  	$project = $this->projectRepository->find($id);
  	$this->authorize($project);
  	$projectInfo = $this->projectRepository->getInfo($id);
    return view('projects.show', compact('listUsers', 'projectInfo', 'chart'));
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
      dd($e);
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
  /**
   * show timesheet member
   */
  public function showTimesheet(Request $request, $projectId)
  {
    $day = $request->input('day');
    $timesheets = $this->getTimesheetMember($projectId, $day);
    dd($timesheets);
  }
}
