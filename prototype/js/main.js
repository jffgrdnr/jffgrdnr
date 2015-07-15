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
	$(".form input").keyup(function(){
		var thisInput = $(this);
		if ($(thisInput).val().length > 3){
			thisInput.parent(".ancCol").addClass("icon iconCheck");
		};
		if ($(thisInput).val().length < 3){
			thisInput.parent(".ancCol").removeClass("icon iconCheck");
		};
	});
});