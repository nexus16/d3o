@extends('layouts.app')

@section('content')
<form method="GET">
  <div class="form-group">
    <div class="col-sm-2">
      <select class="form-control" name="followBy">
        <option value="1" @if(Request::get('followBy') == 1) selected @endif>Week</option>
        <option value="2" @if(Request::get('followBy') == 2) selected @endif>Month</option>
      </select>  
    </div>
    <button class="btn btn-primary">Submit</button>
  </div>
</form>
  {!! $chart->html() !!}
@endsection
@section('script')
  {!! Charts::scripts() !!}
  {!! $chart->script() !!}
@endsection