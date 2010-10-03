$(document).ready(function(){

	var dupes = {}; 
	$('ul.recent-list').empty();

	function ajax_request(data)
	{

		$.ajax({
			url: '/json',
			dataType: 'json',
			error: function(data) {
				console.log("Failed to load json datasource");
				return 0;
			},
			success: function(data)	{
				$.each(data.results, function(i, result){
					if(dupes['id' + result.id] == undefined)
					{
						$('ul.recent-list').prepend('<li><a href="/pastes/' + result.id + '/view">' 
							+ result.name + '</a></li>').hide();
						$('ul.recent-list:first').fadeIn('fast');
						dupes['id' + result.id] = 1;
						
						if($('ul.recent-list').children().length > 5) $('ul.recent-list').children().last().remove();
					}
				});

				setTimeout(function() { ajax_request(); }, 15000); 
			}
			
		});
	}
	 // 15 seconds: 15000
	ajax_request();
})

