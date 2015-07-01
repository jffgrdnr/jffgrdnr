(function(){
	$("#mobileMenu .icon").on("click", function(){
		var mobileMenu = $("#mobileMenu"),
			mobileList = mobileMenu.find("ul");
			if (mobileMenu.hasClass("active")){
				mobileList.slideUp(400);
				mobileMenu.removeClass("active")
			} else {
				mobileList.slideDown(400);
				mobileMenu.addClass("active");	
			}
	})
	$(".fa-chevron-down").click(function(){
		$('html, body').animate({
        	scrollTop: $("#whyGrove").offset().top
    	}, 1000);
	})
})($);