$(document).ready(function(){
    
    $("#flip").click(function(){
        $("#tablej").slideToggle("slow");
    });

    $('form').submit(function(e){
    	e.preventDefault();
    	$('form > input[type="submit"]').val('Submitting...');
    	$('form > input[type="submit"]').attr('disabled', true);
    	$.ajax({
    		method: 'post',
    		url: '/urls',
    		data: $(this).serialize(),
    		dataType: 'json',
    		success: function(data){
    			$('form > input[type="submit"]').val('Submit');
    			$('form > input[type="submit"]').attr('disabled', false);
    			link = "<a href='/" + data.short_url + "'>" + data.short_url + '</a>';
    			$('#tablej').append('<tr><td>' + data.long_url + '</td><td>' + link + '</td></tr>');
    			$('p.center').html(data.message);
    		},
    		error: function(data){
    			$('form > input[type="submit"]').val('Submit');
    			$('form > input[type="submit"]').attr('disabled', false);
    			obj = JSON.parse(data.responseText);
    			$('p.center').html(obj.message);
    		}
    	});
    });
});