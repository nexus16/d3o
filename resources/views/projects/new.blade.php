<form action="{{route('projects.create')}}" method="POST">
	{{csrf_field()}}
	name: <input type="text" name="name"><br>
	manager: <input type="text" name="manager_id"><br>
	customer: <input type="text" name="customer_id">
	member: <input type="checkbox" name="member[]" value="1"><input type="checkbox" name="member[]" value="2">
<button type="submit">gui</button>	
</form>