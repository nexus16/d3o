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
            <td>{{$projectInfo->manager_name}}</td>
          </tr>
          <tr>
            <td>Customer</td>
            <td>{{$projectInfo->customer_name}}</td>
          </tr>
          <tr>
            <td>note</td>
            <td>{{$projectInfo->note}}</td>
          </tr>
          <tr>
            <td>Start</td>
            <td>{{$projectInfo->start}}</td>
          </tr>
          <tr>
            <td>Deadline</td>
            <td>{{$projectInfo->deadline}}</td>
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
          <table class="table">
            <tbody>
              @foreach($listUsers as $no => $user)
              <tr>
                <td>{{$no}}</td>
                <td>{{$user->name}}</td>
              </tr>
              @endforeach
            
          </tbody></table>
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