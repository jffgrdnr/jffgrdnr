$(function(){
	var mainMenu = $('#mainMenu'),
		menuItems = $('#mainMenu ul');
	$("li").mouseenter(function(){
		var thisData = $(this).find('a').attr("data-nav"),
			thisNavMenu = $("menu ul").find("[data-nav='" + thisData + "']");
		menuItems.removeClass('active');
		console.log(thisNavMenu);
		thisNavMenu.addClass('active');
		mainMenu.addClass('active');
	}).mouseleave(function(){
		mainMenu.removeClass('active');
	});
}(jQuery));