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
        for ($i=4; $i<8; $i++) {
          App\Models\Timesheet::insert([
            'user_id'=>$i,
            'user_name'=>'member1',
            'project_id'=>2,
            'content'=>'content',
            'duration'=>rand(8, 14),
            'created_at'=>Carbon\Carbon::now()
          ]);
        } 
      }
    }
}
