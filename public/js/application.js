$(document).ready(function() {

	// TODO: fix this for delete links!
	$('.delete-link').on("click", function(e) {
		e.preventDefault();
		$.ajax({ type: "delete", url: $(this).attr('href') })
		.done(function(response) {
			console.log("deleted!"); // or update the DOM as appropriate
		});
	});

	$('#tags').on('submit', function(e){
		e.preventDefault();
		$.ajax({
			type: 'get',
			url: '/tags',
			data: $(this).serialize()
		}).done(function(data) {
			$('#results').html(data);
		});
	});

	$('#blogs').on('submit', function(e){
		e.preventDefault();
		$.ajax({
			type: 'get',
			url: '/post',
			data: $(this).serialize()
		}).done(function(data){
			$('#results').html(data)
		});
	});

	$(document).on('click','.remove',function(e){
		alert("Are you sure?");
	});

		$(document).on('click','.edit',function(e){
			e.preventDefault();
			$.ajax({
				type: 'get',
				url: $(this).find("a").attr("href"),
				data: $(this).serialize()
			}).done(function(data){
				$("#edit").html(data)
			});
		});

		$(document).on('click','.send_edit',function(e){
			e.preventDefault();
			$.ajax({
				type: 'post',
				url: "/edit_post/" + $('#post').val(),
				data: $('form#newblog').serialize()
			}).done(function(data){
			});
		});
	});



// $(document).ready(function(){
// 	$('input').eq(1).css('overflow', 'hidden').autogrow()
// })

// 

		// var routeToRequest = $(this).attr('action');

		//on the submit function do this function on the event of submit

				//prevent the default request from  happening
//on this form get the attribute of the action in html
		// var loadPostsRequest = $.get(routeToloadPostsRequest, $(this).serialize());
		
		//get the response data loaded and sent from /tags and erb and ..
		// routeToloadPostsRequest.done(function(posts) {
			//when your done do this function with the loadeddata and ...
			// $('#results').html(posts);
			///change the html div id#results and change it to posts
