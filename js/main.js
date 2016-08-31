(function(){
	var drawer = $('.drawer'), 
		menu = $('i.menu'), 
		delights;
	menu.on('click', function(){
		drawer.toggleClass('open');
	});
})($);