$(function() {
	$('#autocompleteExample1').autocomplete({
		'source': 'http://placepfx.ancestry.com/s/?callback=?&maxCount=6&cultureId=en',
		'key': 'HName',
		'queryParameter': 'prefix'
	});
	$('#modalExample1').click(function(e) {
		$('#modalExampleContents1').modal();
	});
});
