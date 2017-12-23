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

  <table class="table">
    <tbody>
      <tr>
        <td>Name</td>
        <td><input type="text" class="form-control" id="name" placeholder="name" name="name"></td>
      </tr>
      <tr>
        <td>Manager</td>
        <td>
          <div class="row">
            @foreach($listUsers as $user)
            <div class="col-sm-3">
              <div class="">
                <label>
                  <input type="radio" name="manager_id" value="{{$user->id}}">
                  {{$user->name}}
                </label>
              </div>
            </div>
            @endforeach
          </div>
        </td>
      </tr>
      <tr>
        <td>Member</td>
        <td>
          <div class="row">
            @foreach($listUsers as $user)
            <div class="col-sm-3">
              <div class="">
                <label>
                  <input type="checkbox" name="member[]" value="{{$user->id}}">
                  {{$user->name}}
                </label>
              </div>
            </div>
            @endforeach
          </div>
        </td>
      </tr>
      <tr>
        <td>Customer</td>
        <td>
          <div class="row">
            @foreach($listCustomers as $customer)
            <div class="col-sm-3">
              <div class="">
                <label>
                  <input type="radio" name="customer_id" value="{{$customer->id}}">
                  {{$customer->name}}
                </label>
              </div>
            </div>
            @endforeach
          </div>
        </td>
      </tr>
      <tr>
        <td>Start date</td>
        <td>
          <div class="row">
            <div class="col-sm-3">
              <div class="input-group date">
                <div class="input-group-addon">
                  <i class="fa fa-calendar"></i>
                </div>
                <input type="text" class="form-control pull-right datepicker" name="start_date" placeholder="choose day">
              </div>
            </div>
          </div>
        </td>
      </tr>
      <tr>
        <td>Deadline</td>
        <td>
          <div class="row">
            <div class="col-sm-3">
              <div class="input-group date">
                <div class="input-group-addon">
                  <i class="fa fa-calendar"></i>
                </div>
                <input type="text" class="form-control pull-right datepicker" name="deadline" placeholder="choose day">
              </div>
            </div>
          </div>
        </td>
      </tr>
      <tr>
        <td>Specification</td>
        <td>
          <input type="text" class="form-control" id="name" placeholder="name" name="specification">
        </td>
      </tr>
      <tr>
        <td>Note</td>
        <td>
          <input type="text" class="form-control" id="name" placeholder="name" name="note">
        </td>
      </tr>
      <tr>
        <td>
          <button type="submit" class="btn btn-default">Save</button>
        </td>
        <td></td>
      </tr>
    </tbody>
  </table>
</form>
@endsection
@section('script')
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