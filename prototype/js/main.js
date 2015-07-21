$(document).ready(function(){
	$(".guidanceBar").addClass("expanded");
	$("#stepOneModal").modal({
		width: "90%",
		hideCloseBtn: "true"
	});
	$("#addFather").click(function(){
		$("#addFatherModal").modal({
			width: "280px"
		});
	});
	$("#addMother").click(function(){
		$("#addMotherModal").modal({
			width: "280px"
		});
	});
	$(".form input").on("click", function(){
		var thisInput = $(this),
			thisLabel = thisInput.siblings("label");
		thisLabel.addClass("show");
	});
	$(".form input").keyup(function(){
		var thisInput = $(this),
			thisLabel = thisInput.siblings("label");
		thisLabel.addClass("show");
		if ($(thisInput).val().length > 3){
			$(thisInput).blur(function(){
				thisInput.parent(".ancCol").addClass("icon iconCheck", {duration:800});
			});
		};
		if ($(thisInput).val().length < 3){
			thisInput.parent(".ancCol").removeClass("icon iconCheck");
			$(thisInput).blur(function(){
				if ($(thisInput).val().length < 1){
					thisLabel.removeClass("show");
				};
			});
		};
	});
	$(".closeAdd").click(function(){
		$.modal.close();
	})
});