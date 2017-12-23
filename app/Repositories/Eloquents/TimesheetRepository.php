<?php

namespace App\Repositories\Eloquents;

use App\Repositories\Contracts\TimesheetRepositoryInterface;
use App\Repositories\Eloquents\EloquentRepository;
use App\Models\Timesheet;
use Carbon\Carbon;
use Config;

class TimesheetRepository extends EloquentRepository implements TimesheetRepositoryInterface
{
    /**
     * get model
     * @return string
     */
    public function getModel()
    {
        return Timesheet::class;
    }
    /**
     * check is registed timesheet today
     */
    public function checkTimesheetRegisted($userId)
    {
        $timesheet = Timesheet::where('user_id', $userId)
            ->where('created_at', '>=', Carbon::today())
            ->where('created_at', '<=', Carbon::tomorrow());
        return $timesheet ? $timesheet : null;
    }
    /**
     * get timesheets of user
     */
    public function getTimesheet($userId, $follow)
    {
        $timesheets = Timesheet::where('user_id', $userId);
        if ($follow == Config::get('constants.timesheetBy.week')) {
            $timesheets->where('created_at', '>=', Carbon::now()->startOfWeek())
                ->where('created_at', '<=', Carbon::now()->endOfWeek());
        }
        if ($follow == Config::get('constants.timesheetBy.month')) {
            $timesheets->where('created_at', '>=', Carbon::now()->startOfMonth())
                ->where('created_at', '<=', Carbon::now()->endOfMonth());
        }    
        $timesheets->orderBy('created_at');
        return $timesheets ? $timesheets : null;
    }
    /**
     * get timesheet member of project day
     */
    public function getTimesheetMemberDay($projectId, $year, $month, $day)
    {
        $timesheets = Timesheet::where('project_id', '=', $projectId)
            ->where('created_at', '>=', Carbon::create($year, $month, $day)->startOfDay())
            ->where('created_at', '<=', Carbon::create($year, $month, $day)->endOfDay());
        return $timesheets ? $timesheets : null;
    }
    /**
     * get timesheet member of project week
     */
    public function getTimesheetMemberWeek($projectId)
    {
        $timesheets = Timesheet::where('project_id', '=', $projectId)
            ->where('created_at', '>=', Carbon::now()->startOfWeek())
            ->where('created_at', '<=', Carbon::now()->endOfWeek());
        return $timesheets ? $timesheets : null;
    }
    /**
     * get detail timesheet
     */
    public function getDetailTimesheetOfUser($userId,  $year, $month, $day)
    {
        $tasks = Timesheet::leftJoin('tasks', 'tasks.timesheet_id', '=', 'timesheets.id')
            ->leftJoin('projects', 'timesheets.project_id', '=', 'projects.id')
            ->select(
                'tasks.*',
                'timesheets.duration as sum_duration',
                'projects.name as project_name'
            )
            ->where('timesheets.user_id', '=', $userId)
            ->where('timesheets.created_at', '>=', Carbon::create($year, $month, $day)->startOfDay())
            ->where('timesheets.created_at', '<=', Carbon::create($year, $month, $day)->endOfDay());
        return $tasks ? $tasks : null;
    }
    
}