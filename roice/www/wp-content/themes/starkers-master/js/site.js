jQuery(document).ready(function($) {
	var bodyClicked = false;
	/* Main Menu functionality */
	$(document).on('click', function (e) {
		//console.log(e.target.id);
		/* Listen for click event - close mobileNav if click outside */
		if (mobileList.hasClass('active') && (e.target.id) != '') {
			mobileList.toggleClass('active');
		}
	});
	var mainNav = $('#mainNav'),
		mainNavItems = $('#mainNav > ul li'),
		mainMenu = $('#mainMenu'),
		menuItems = $('#mainMenu ul');
	mainNav.on('mouseenter', 'li.main', function() {
		var thisData = $(this).find('a').attr("data-nav"),
			thisMainNavItem = $(this),
			thisNavMenu = $("#mainMenu ul[data-nav='" + thisData + "']");
		mainNavItems.removeClass('active');
		thisMainNavItem.addClass('active');
		mainMenu.addClass('active');
		menuItems.removeClass('active');
		//console.log(thisNavMenu);
		thisNavMenu.addClass('active');
	});
	mainMenu.on('mouseleave', function() {
		var allNavMenus = $("menu ul");
		mainMenu.removeClass('active');
		allNavMenus.removeClass('active');
		mainNavItems.removeClass('active');
	});
	/* Mobile menu functionality */
	var mobileTrigger = $('#mobileNav .drawer'),
		mobileList = $('#mobileNav ul'),
		mobileListItem = $('#mobileNav ul li');
	mobileTrigger.on('click', function() {
		mobileList.toggleClass('active');
	});
});

