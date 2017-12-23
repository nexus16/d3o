@extends('layouts.app')

@section('content')
<div class="row">
  <div class="col-md-4">
    <div class="box">
      <div class="box-header with-border">
        <h3 class="box-title">Project info</h3>
      </div>
      <!-- /.box-header -->
      <div class="box-body">
        <table class="table table-bordered">
          <tbody>
          <tr>
            <td style="width: 30%">Name</td>
            <td>{{$projectInfo->name}}</td>
          </tr>
          <tr>
            <td>PM</td>
            <td><a href="{{route('timesheets', $projectInfo->manager_id)}}">{{$projectInfo->manager_name}}</a></td>
          </tr>
          <tr>
            <td>Member</td>
            <td>
              @foreach($listUsers as $user)
                <a href="{{route('timesheets', $user->id)}}">{{$user->name}}</a><span>, </span>
              @endforeach
            </td>
          </tr>
          <tr>
            <td>Customer</td>
            <td>{{$projectInfo->customer_name}}</td>
          </tr>
          <tr>
            <td>Specification</td>
            <td>{{$projectInfo->note}}</td>
          </tr>
          <tr>
            <td>Note</td>
            <td>{{$projectInfo->specification}}</td>
          </tr>
          <tr>
            <td>Start</td>
            <td>{{substr($projectInfo->start_date, 0, 10)}}</td>
          </tr>
          <tr>
            <td>Deadline</td>
            <td>{{substr($projectInfo->deadline, 0, 10)}}</td>
          </tr>
        </tbody></table>
      </div>
      <!-- /.box-body -->
      <a href="{{route('projects.edit', $projectInfo->id)}}" class="btn btn-primary">Edit</a>
      <a href="{{route('projects')}}" class="btn btn-default">Back</a>

    </div>
    <!-- /.box -->
    <!-- /.box -->
  </div>
  <!-- /.col -->
  <div class="col-md-8">
    <div class="box">
      <div class="box-header">
        <h3 class="box-title">List member</h3>
      <!-- /.box-header -->
        <div class="box-body no-padding">
          {{-- <table class="table">
            <tbody>
              @foreach($listUsers as $no => $user)
              <tr>
                <td>{{$no}}</td>
                <td>{{$user->name}}</td>
              </tr>
              @endforeach
            
            </tbody>
          </table> --}}
          <form method="GET">
            <div class="row">
              <div class="col-md-3">
                <div class="input-group date">
                  <div class="input-group-addon">
                    <i class="fa fa-calendar"></i>
                  </div>
                  <input type="text" class="form-control pull-right datepicker" name="time" placeholder="choose day">
                </div>
              </div>
              <div class="col-md-2">
                <button class="btn btn-group">Search</button>
              </div>
            </div>
          </form>
          {!! $chart->html() !!}
        </div>
        <!-- /.box-body -->
      </div>
    <!-- /.box -->
    </div>
      <!-- /.box-body -->
  </div>
    <!-- /.box -->
  </div>
  <!-- /.col -->

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