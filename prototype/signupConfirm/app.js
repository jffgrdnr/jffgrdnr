$(function(){
	//TODO: Load the prototype
	
	var tempModal = $('<div>')
						.attr('id','signupProtoModal')
						.addClass('modal')
						.html('<p class="icon iconAcom">You are in the Signup Confirmation prototype.</p>');
	$('body').append(tempModal);
	$('#signupProtoModal').modal();
});