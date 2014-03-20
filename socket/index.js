<<<<<<< HEAD
var express = require("express");
var app = express();
var port = 3700;
 
app.get("/", function(req, res){
    res.send("Wassup?");
});

=======

//setup express.js and "app" and port
var express = require("express");
var app = express();
var port = 3700;

//Setup views and where to find them
>>>>>>> d1ba9f60f1531d62f6d28778009cf8c0dd477d2f
app.set('views', __dirname + '/tpl');
app.set('view engine', "jade");
app.engine('jade', require('jade').__express);
app.get("/", function(req, res){
    res.render("page");
});
<<<<<<< HEAD

app.use(express.static(__dirname + '/public'));

 //app.listen(port);
var io = require('socket.io').listen(app.listen(port));
io.sockets.on('connection', function (socket) {
    socket.emit('message', { message: 'Welcome to Socket Chat' });
=======
app.use(express.static(__dirname + '/public'));
 
app.get("/", function(req, res){
    res.send("It works!");
});
 
//EVERY socket.io app begins with a "connection" event handler
//Require socket.io and set it up to listen on our "port"
var io = require('socket.io').listen(app.listen(port));
io.sockets.on('connection', function (socket) {
    socket.emit('message', { message: 'This is Chat.' });
>>>>>>> d1ba9f60f1531d62f6d28778009cf8c0dd477d2f
    socket.on('send', function (data) {
        io.sockets.emit('message', data);
    });
});


<<<<<<< HEAD
console.log("The Socket app is listening on port " + port);


=======

console.log("Listening on port " + port);
>>>>>>> d1ba9f60f1531d62f6d28778009cf8c0dd477d2f
