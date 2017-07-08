
// app/models/starship.js
// grab the mongoose module
var mongoose = require('mongoose');

// define our starship model
// module.exports allows us to pass this to other files when it is called
module.exports = mongoose.model('Starship', {
	name : {type: String, default: ''},
	model: {type: String, default: ''},
	manufacturer: {type: String, default: ''}
});