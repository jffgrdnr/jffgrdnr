// server.js

// modules ====================================================

var express			= require('express');
var app				= express();
var bodyParser		= require('body-parser');
var Starship		= require('./app/models/starship');
var Planet			= require('./app/models/planet');
var methodOverride 	= require('method-override');
var mongoose 		= require('mongoose');

// configuration ===============================================


// config files
var db = require('./config/db');

// set the port
var port = process.env.PORT || 8070;

// connect to our mongoDB database
// config/db
mongoose.connect(db.url);

// get all data/stuff of the body (POST) parameters
// parse application/json
app.use(bodyParser.json());

// parse application/vnd.api+json as json
app.use(bodyParser.json({ type: 'application/vnd.api+json' }));

// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: true }));

// override with the X-HTTP-Method-Override header in the request. Simulate DELETE/PUT
app.use(methodOverride('X-HTTP-Method-Override'));

// set the static files location /public/img will be /img for users
app.use(express.static(__dirname + '/public'));


// routes =======================================================

require('./app/routes')(app);  					// configure our routes


// ROUTES FOR OUR API
//-------------------------------------------------------------
var router = express.Router();					// get an instance of the express router

// middleware to use for all requests
router.use(function(req, res, next) {
	// do logging
	console.log('Something is happening.');
	next(); // make sure we go to the next routes and don't stop here
})

var request = require('request');
request('http://swapi.co/api/starships', function (error, response, body) {
  console.log('error:', error); // Print the error if one occurred
  console.log('statusCode:', response && response.statusCode); // Print the response status code if a response was received
  console.log('body:', body); // Print the HTML for the SWAPI homepage.
});


// routes that end in /starships
//-------------------------------------------------------------

router.route('starships/')

	// get all the starships (accessed at GET https://swapi.co/api/starships)
	.get(function(req, res) {
		Starship.find(function(err, starships) {
			if (err)
				res.send(err);
			res.json(starships);
		});
	});

// routes that end in /starships/:starship_id
//-------------------------------------------------------------

router.route('starships/:starship_id')

	// get the starship with that ID (accessed at GET https://swapi.co/api/starships/:starship_id)
	.get(function(req, res) {
		Starship.findById(req.params.starship_id, function(err, starship) {
			if (err)
				res.send(err);
			res.json(starship);
		});
	})



// test route to make sure everthing is working (accessed at GET https://swapi.co/api/starships)
router.get('/', function(req, res) {
	res.json({ message: 'Hooray! Welcome to our Star Wars API!'});
});


// REGISTER OUR ROUTES ------------------------
// all of our routes will be prefixed with /api
app.use('/api', router);



// start app ====================================================
// startup our app at http://localhost:8070
app.listen(port);

// shoutout to the user
console.log('Starships landing on port ' + port);

// expose app
exports = module.exports = app;
