@extends('layouts.app')

@section('content')
<style type="text/css">
  .form-group{
    margin-bottom: 0;
  }
</style>

<form data-url="{{route('timesheets.create')}}">
	{{csrf_field()}}
  @foreach($projects as $project)
    <div class="list-group" data-id = {{$project->id}}>
      <a href="#" class="list-group-item active">
        {{$project->name}}
      </a>
      <a class="list-group-item">
        <div class="row">
          <div class="form-group col-sm-5">
            <input type="text" class="form-control" placeholder="Task content" name="content-{{$project->id}}[]" required>
          </div>
          <div class="form-group col-sm-2">
            <input type="number" class="form-control" placeholder="Duration" name="duration-{{$project->id}}[]" required>
          </div>
          <div class="col-sm-2 btn-action">
            <button class="btn btn-primary add-timesheet" type="button"><span class="glyphicon glyphicon-plus"></span></button>
          </div>
        </div>
      </a>
    </div>
    @endforeach
 
</form>
<button type="button" class="btn btn-info btn-confirm" data-toggle="modal" data-target="#myModal">Submit</button>
<!-- Modal -->
<div id="myModal" class="modal fade" role="dialog">
  <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title" style="color: red">You are sure to submit this timesheets</h4>
      </div>
      <div class="modal-body">
        @foreach($projects as $project)
        <div class="list-group">
          <a href="#" class="list-group-item active">
            {{$project->name}}
          </a>
          <a class="list-group-item">

          <table class="table" id="confirm-{{$project->id}}">
            <thead>
              <tr>
                <th width="80%">Task</th>
                <th>Duration</th>
              </tr>
            </thead>
            <tbody>
              
            </tbody>
          </table>
        </a>
        </div>
        @endforeach
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button class="btn btn-primary submit" type="button">OK</button>
      </div>
    </div>
  </div>
</div>
@endsection
@section('script')
<script type="text/javascript" src="{{asset('js/timesheets/new.js')}}"></script>
@endsection