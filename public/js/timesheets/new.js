$(function(){
	var countList = 1;
	$('.list-group').on('click', '.add-timesheet', function(){
		countList++;
		var idProject = $(this).closest('.list-group').attr('data-id');
		$(this).closest('.list-group').append(
			'<a class="list-group-item">'+
		    '<div class="row">'+
		      '<div class="form-group col-sm-5">'+
		        '<input type="text" class="form-control" placeholder="Task content" name="content-'+idProject+'[]">'+
		      '</div>'+
		      '<div class="form-group col-sm-2">'+
		        '<input type="number" class="form-control" placeholder="Duration" name="duration-'+idProject+'[]">'+
		      '</div>'+
		      '<div class="col-sm-2 btn-action">'+
		        '<button class="btn btn-primary add-timesheet" type="button"><span class="glyphicon glyphicon-plus"></span></button> '+
		        '<button class="btn btn-danger minus-timesheet" type="button"><span class="glyphicon glyphicon-minus"></span></button>'+
		      '</div>'+
		    '</div>'+
		  '</a>'
			);
		$(this).parent().hide();
	});
	$('.list-group').on('click', '.minus-timesheet', function(){
		countList--;
		$(this).closest('.list-group-item').prev().find('.btn-action').show();
		$(this).closest('.list-group-item').remove();
	})
	var data = {};
	$('body').on('click', '.btn-confirm', function(){
		var count = 0;
		$('.list-group').each(function(){
			var id = $(this).attr('data-id');
			$(this).find('.list-group-item').each(function(){
				var i = 0;
				var dataItem = {};
				var content = $(this).find('input[name = "content-'+id+'[]"]').val();
				var duration = $(this).find('input[name = "duration-'+id+'[]"]').val();
				console.log(id);
				if ((content != null) && (content != '')) {
					$('#confirm-'+id).find('tbody').append(
						'<tr>'+
	            '<td>'+content+'</td>'+
	            '<td>'+duration+'</td>'+
	          '</tr>'
						);
				}
				dataItem['project_id'] = id;
				dataItem['content'] = content;
				dataItem['duration'] = duration;

			 	if ((dataItem['content'] != null) && (dataItem['content'] != '')) {
					console.log(JSON.stringify(dataItem), count);
					data[count++] = dataItem;
				}
			});
		});
		console.log(JSON.stringify(data));
	});
	$('body').on('click', '.submit', function(){
		var url = $('form').attr('data-url');
		$.ajaxSetup({
      headers: {
      'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
      }
    });
    $.ajax({
      url: url,
      type: 'post',
      data: data,
      dataType: 'json',
      success:function (result) {
        console.log(result);
        location.reload(); 
      }
    });
	});
});