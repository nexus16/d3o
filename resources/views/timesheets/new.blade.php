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
          <input type="text" class="form-control" placeholder="Task content" name="content-{{$project->id}}[]">
        </div>
        <div class="form-group col-sm-2">
          <input type="number" class="form-control" placeholder="Duration" name="duration-{{$project->id}}[]">
        </div>
        <div class="col-sm-2 btn-action">
          <button class="btn btn-primary add-timesheet" type="button"><span class="glyphicon glyphicon-plus"></span></button>
        </div>
      </div>
    </a>
  </div>
@endforeach
  <button class="btn btn-primary submit" type="button">Submit</button>

</form>
@endsection
@section('script')
<script type="text/javascript" src="{{asset('js/timesheets/new.js')}}"></script>
@endsection