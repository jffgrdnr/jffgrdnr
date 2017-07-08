
// app/models/planet.js
// grab the mongoose module
var mongoose = require('mongoose');

// define our planet model
// module.exports allows us to pass this to other files when it is called
module.exports = mongoose.model('Planet', {
	name : {type: String, default: ''},
	climate: {type: String, default: ''},
	terrain: {type: String, default: ''}
});