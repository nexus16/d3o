@extends('layouts.app')

@section('content')
<div class="row">
  <div class="col-md-4">
    <form method="GET">
      <div class="row">
        <div class="col-md-6">
          <div class="input-group date">
            <div class="input-group-addon">
              <i class="fa fa-calendar"></i>
            </div>
            <input type="text" class="form-control pull-right datepicker" name="time" placeholder="choose day">
          </div>
        </div>
        <div class="col-md-2">
          <button class="btn btn-primary">Search</button>
        </div>
      </div>
    </form>
    <table class="table">
      <thead>
        <tr>
          <th>#</th>
          <th>Task</th>
          <th>Duration</th>
        </tr>
      </thead>
      <tbody>
        @foreach($tasks as $no => $task)
          <tr>
            <td>{{$no}}</td>
            <td>{{$task->content}}</td>
            <td>{{$task->duration}}</td>
          </tr>
        @endforeach
      </tbody>
    </table>
  </div>
  <div class="col-md-8">
    <form method="GET">
      <div class="form-group">
        <div class="col-sm-4">
          <select class="form-control" name="followBy">
            <option>Timesheets follow by</option>
            <option value="1" @if(Request::get('followBy') == 1) selected @endif>Week</option>
            <option value="2" @if(Request::get('followBy') == 2) selected @endif>Month</option>
          </select>  
        </div>
        <button class="btn btn-primary">Submit</button>
      </div>
    </form>
    {!! $chart->html() !!}
  </div>
</div>
@endsection
@section('script')
  {!! Charts::scripts() !!}
  {!! $chart->script() !!}
  <script src="{{asset('js/bootstrap-datepicker.min.js')}}"></script>
  <script src="{{asset('js/bootstrap-timepicker.min.js')}}"></script>
  <script type="text/javascript">
    $(function(){
      $('.datepicker').datepicker({
        autoclose: true,
        format: 'yyyy-mm-dd'
      });
      //Timepicker
      $('.timepicker').timepicker({
          showInputs: true,
          defaultTime: '00:00',
          showMeridian: false,    
          maxHours: 24,
          minuteStep: 5
      });
    })
  </script>
@endsection
