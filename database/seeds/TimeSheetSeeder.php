<?php

use Illuminate\Database\Seeder;

class TimeSheetSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
      for ($j=2; $j<10; $j++) {
        for ($i=1; $i<30; $i++) {
          App\Models\Timesheet::insert([
            'user_id'=>$j,
            'user_name'=>'member1',
            'project_id'=>1,
            'content'=>'content',
            'duration'=>rand(8, 10),
            'created_at'=>Carbon\Carbon::createFromDate(2017, 12, 1)->addDay($i)
          ]);
        }  
      }
    }
}
