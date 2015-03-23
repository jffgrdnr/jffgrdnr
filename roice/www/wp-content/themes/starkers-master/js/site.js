
	jQuery(document).ready(function($) {
		//Main Menu functionality
		var mainMenu = $('#mainMenu'),
			menuItems = $('#mainMenu ul');
		$("#mainNav").on('mouseenter', 'li', function() {
			var thisData = $(this).find('a').attr("data-nav"),
				thisNavMenu = $("menu ul[data-nav='" + thisData + "']");
			menuItems.removeClass('active');
			console.log(thisNavMenu);
			thisNavMenu.addClass('active');
			mainMenu.addClass('active');
		});
		$("#mainNav").on('mouseleave', function() {
			var allNavMenus = $("menu ul");
			mainMenu.removeClass('active');
			allNavMenus.removeClass('active');
		});
	});

