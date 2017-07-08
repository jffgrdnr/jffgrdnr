// routes.js


// grab the starship we just created
var Starship = require('./models/starship');
var Planet = require('./models/planet');

    module.exports = function(app) {

        // server routes ===========================================================
        // handle things like api calls
        // authentication routes

        // sample api route
        app.get('/api/starships', function(req, res) {
            // use mongoose to get all starships in the database
            Starship.find(function(err, starships) {

                // if there is an error retrieving, send the error. 
                // nothing after res.send(err) will execute
                if (err)
                    res.send(err);

                res.json(starships); // return all starships in JSON format
            });
        });

        // sample api route
        app.get('/api/planets', function(req, res) {
            // use mongoose to get all planets in the database
            Planet.find(function(err, planets) {

                // if there is an error retrieving, send the error. 
                // nothing after res.send(err) will execute
                if (err)
                    res.send(err);

                res.json(planets); // return all planets in JSON format
            });
        });

        // route to handle creating goes here (app.post)
        // route to handle delete goes here (app.delete)

        // frontend routes =========================================================
        // route to handle all angular requests
        app.get('*', function(req, res) {
            res.sendfile('./public/views/index.html'); // load our public/index.html file
        });

    };