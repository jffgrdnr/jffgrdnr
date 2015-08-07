
jQuery(document).ready(function($) {
	$("#imageNav li").mouseenter(function() {
		var myData = $(this).data("id");
		console.log(myData);
		$("#mainNav li").removeClass("active");
		$("#mainNav li[data-id='" + myData + "']").addClass("active");
	});
	$("#imageNav li").mouseleave(function() {
		$("#mainNav li").removeClass("active");
	});
	$("#mobileNav li a").click(function(){
		$("#mobileNav li a").removeClass("active");
		$(this).addClass("active");
		$("#mobileNav ul").slideUp();
	});
	$("#mobileTrigger").on("click", function(){
		var mobileMenu = $("#mobileNav"),
			mobileList = $("#mobileNav ul");
		if(mobileMenu.hasClass("active")){
			mobileList.slideUp();
			mobileMenu.removeClass("active");
		} else {
			mobileList.slideDown();
			mobileMenu.addClass("active");
		}
		
	});
});


