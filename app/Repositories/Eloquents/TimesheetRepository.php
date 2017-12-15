<?php

namespace App\Repositories\Eloquents;

use App\Repositories\Contracts\TimesheetRepositoryInterface;
use App\Repositories\Eloquents\EloquentRepository;
use App\Models\Timesheet;
use Carbon\Carbon;

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
    public function checkTimesheetRegisted($userId)
    {
        $timesheet = Timesheet::where('user_id', $userId)
            ->where('created_at', '>=', Carbon::today())
            ->where('created_at', '<=', Carbon::tomorrow());
        return $timesheet ? $timesheet : null;
    }
    
}