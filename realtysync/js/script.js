$(document).ready(function(){

	//Handle mouseenter for main navigation
	$("#first_level > li").mouseenter(function(){
		var me = $(this),
			mySiblings = me.siblings(),
			myChild = me.find(".sub_nav");

		setTimeout(function(){
			mySiblings.removeClass("active");
			me.addClass("active");
			myChild.show();
		},300);
		
	});

	//Handle mouseleave for main navigation
	$("#first_level > li").mouseleave(function(){
		var me = $(this),
			myChild = me.find(".sub_nav");

		setTimeout(function(){
			me.removeClass("active");
			myChild.hide();	
		},300);
	});

	$(".back_top").click(function(){
		$("html, body").animate({ scrollTop: 0 }, "slow");
  			return false;
	});


	//Handle showing of modal
	$(".show_modal").click(function(e){
		e.preventDefault();
		var modal = $("aside.modal"),
			shadow = $("aside.modal_shadow");
		shadow.fadeIn();
	    modal.transition({y:"-1000px"}).fadeIn(200).transition({y:"0"});
	});

	//Handle hiding of modal
	$("aside.modal .close, aside.modal_shadow").click(function(){
		var modal = $("aside.modal"),
			shadow = $("aside.modal_shadow");

		shadow.fadeOut();
	    modal.transition({y:"-1200px"}).fadeOut(200);
	});

	$("#tab_triggers li a").on("click",function(e){
		e.preventDefault();
		var me = $(this),
			parent = me.parent(),
			triggers = $("#tab_triggers li"),
			tabContents = $(".tab_content"),
			myId = me.data("tab"),
			myContent = $('.tab_content[data-tab=' + myId + ']');

		//console.log(myContent);
		tabContents.removeClass("active");
	    myContent.addClass("active");

		triggers.removeClass("active");
		parent.addClass("active");



	});

}); //End of Document Ready