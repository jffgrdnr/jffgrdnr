(function(){

	var myArr = ['foo', 'bar', 'baz'];
	console.log(myArr);
	myArr.push('bin');
	console.log(myArr);
	
	var p = document.getElementById("one"),
		pInnards = p.innerHTML;

	console.warn(pInnards);

	document.addEventListener("DOMContentLoaded", function(event) {
	    console.log("DOM fully loaded and parsed");
	  });

})();