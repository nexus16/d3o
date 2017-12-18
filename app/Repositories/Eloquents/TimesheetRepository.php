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
     * get timesheets 
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
    
}