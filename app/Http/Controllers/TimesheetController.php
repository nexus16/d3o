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
use Charts;
use Config;

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
  public function index($userId, Request $request)
  {
  	if (!(Auth::user()->isLeader())) {
  		$userTimeSheet = Auth::id();
  	} else {
  		$userTimeSheet = $userId;
  	}
  	//chart timesheet of user follow week or month
  	$labelsChart = [];
  	$valuesChart = [];
  	$week = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
  	$colorsChart = [];
  	if ($request->input('followBy'))
  		$followBy = $request->input('followBy');
		else
			$followBy = Config::get('constants.timesheetBy.week');
  	if ($followBy == Config::get('constants.timesheetBy.week')) {
  		$timesheets = $this->timesheetRepository->getTimesheet($userTimeSheet, Config::get('constants.timesheetBy.week'))->get();
  		foreach ($timesheets as $timesheet) {
	  		array_push($valuesChart, $timesheet->duration);
	  		if ($timesheet->duration <= 7) {
	  			array_push($colorsChart, '#00a65a');
	  		}	elseif ($timesheet->duration > 7 && $timesheet->duration < 9) {
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
	      ->labels($week)
	      ->values($valuesChart)
	      ->elementLabel('duration');
  	}
  	if ($followBy == Config::get('constants.timesheetBy.month')) {
  		$timesheets = $this->timesheetRepository->getTimesheet($userTimeSheet, Config::get('constants.timesheetBy.month'))->get();
  		foreach ($timesheets as $timesheet) {
	  		array_push($labelsChart, $timesheet->created_at->day);
	  		array_push($valuesChart, $timesheet->duration);
	  		if ($timesheet->duration <= 7) {
	  			array_push($colorsChart, '#00a65a');
	  		}	elseif ($timesheet->duration > 7 && $timesheet->duration < 9) {
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
  	}
  	//tasm in day of user
  	$day = Carbon::now();
    $tasks = $this->timesheetRepository->getDetailTimesheetOfUser(Auth::id(), $day->year, $day->month, $day->day)->get();
    if ($request->input('time')) {
      $year = substr($request->input('time'), 0, 4);
      $month = substr($request->input('time'), 5, 2);
      $day = substr($request->input('time'), 8, 2);
      $tasks = $this->timesheetRepository->getDetailTimesheetOfUser(Auth::id(), $year, $month, $day)->get();
    }
  	return view('timesheets.index', compact('chart', 'tasks'));
  }
  public function showFormCreate()
  {
  	if ($this->timesheetRepository->checkTimesheetRegisted(Auth::id())) {
  		return redirect()->route('home');
  	}
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
  		$duration = 0;
  		foreach ($request->all() as $rq) {
	  		if ($rq['project_id'] == $value) {
	  			$task['timesheet_id'] = $timesheet->id;
	  			$task['content'] = $rq['content'];
	  			$task['duration'] = $rq['duration'];
	  			$duration+=$task['duration'];
	  			$this->taskRepository->create($task);
	  		}
	  	}
	  	$this->timesheetRepository->update($timesheet->id, ['duration'=>$duration]);
  	}  		
  	$message['status'] =true;
  	return $message;
  }
}
