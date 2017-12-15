@extends('layouts.app')

@section('content')
{{-- <form action="{{route('projects.create')}}" method="POST">
	{{csrf_field()}}
	name: <input type="text" name="name"><br>
	manager: <input type="text" name="manager_id"><br>
	customer: <input type="text" name="customer_id">
	member: <input type="checkbox" name="member[]" value="1"><input type="checkbox" name="member[]" value="2">
<button type="submit">gui</button>	
</form> --}}


<form action="{{route('projects.store')}}" method="POST" class="form-horizontal">
	{{csrf_field()}}
  <div class="box-body">
    <div class="form-group">
      <label for="name" class="col-sm-2 control-label">Name</label>

      <div class="col-sm-10">
        <input type="text" class="form-control" id="name" placeholder="name" name="name">
      </div>
    </div>
    <div class="form-group">
      <label for="inputPassword3" class="col-sm-2 control-label">Manager</label>

      <div class="col-sm-10">
      	<div class="row">
      		@foreach($listUsers as $user)
      		<div class="col-sm-3">
      			<div class="checkbox">
		          <label>
		            <input type="radio" name="manager_id" value="{{$user->id}}">
		            {{$user->name}}
		          </label>
		        </div>
      		</div>
      		@endforeach
      	</div>
      </div>
    </div>
    <div class="form-group">
      <label for="inputPassword3" class="col-sm-2 control-label">Customer</label>

      <div class="col-sm-10">
      	<div class="row">
      		@foreach($listCustomers as $customer)
      		<div class="col-sm-3">
      			<div class="checkbox">
		          <label>
		            <input type="radio" name="customer_id" value="{{$customer->id}}">
		            {{$customer->name}}
		          </label>
		        </div>
      		</div>
      		@endforeach
      	</div>
      </div>
    </div>
		<div class="form-group">
      <label for="inputPassword3" class="col-sm-2 control-label">Member</label>

      <div class="col-sm-10">
      	<div class="row">
      		@foreach($listUsers as $user)
      		<div class="col-sm-3">
      			<div class="checkbox">
		          <label>
		            <input type="checkbox" name="member[]" value="{{$user->id}}">
		            {{$user->name}}
		          </label>
		        </div>
      		</div>
      		@endforeach
      	</div>
      </div>
    </div>
  </div>
  <!-- /.box-body -->
  <div class="box-footer">
    <button type="submit" class="btn btn-default">Save</button>
  </div>
  <!-- /.box-footer -->
</form>
@endsection
