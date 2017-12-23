@extends('layouts.app')

@section('content')
<div class="row">
@foreach($listProjects as $project)
  <!-- ./col -->
  <div class="col-lg-3 col-xs-6">
    <!-- small box -->
    <div class="small-box bg-green">
      <div class="inner">
        <h4>Name: {{$project->name}}</h4>
        <p>PM: {{$project->manager_name}}</p>
        <p>Customer: {{$project->customer_name}}</p>
        <p>Start: {{substr($project->start_date, 0, 10)}}</p>
        <p>Deadline: {{substr($project->deadline, 0, 10)}}</p>
      </div>
      <a href="{{route('projects.view', $project->id)}}" class="small-box-footer">
        More info <i class="fa fa-arrow-circle-right"></i>
      </a>
    </div>
  </div>
@endforeach
  <!-- ./col -->
</div>
      <a href="{{route('projects.create')}}" class="btn btn-primary">Create new</a>

@endsection









