(function () {
	$("#b").on("click", function () {
		
		ramjet.transform( b, testModal, { 
			duration: 300,
			done: function () {
				$("#testModal").modal({
					width:"500px"
				});
			}
		});
	});
	$("#testModal").on("click", function () {
		ramjet.transform( testModal, b, {
  			duration: 1500
		});
		$.modal.close();
	});
})($);
