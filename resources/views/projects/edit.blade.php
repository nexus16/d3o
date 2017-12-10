<form action="{{route('projects.update', $project->id)}}" method="POST">
	{{csrf_field()}}
	name: <input type="text" name="name" value="{{$project->name}}"><br>
	manager: <input type="text" name="manager_id" value="{{$project->manager_id}}"><br>
	customer: <input type="text" name="customer_id" value="{{$project->customer_id}}">
<button type="submit">gui</button>	
</form>