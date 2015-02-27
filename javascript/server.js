var options = {
  host: '10.9.1.54',
  port: 80,
  path: '/cgi-bin/neighbors/GetPeopleOnSheet.pl?dbname=bah&imageid=baba'
};

http.get(options, function(res) {
  if (res.statusCode == 200) {
    console.log("success");
  }
}).on('error', function(e) {
  console.log("Got error: " + e.message);
});

function testPort(port, host, cb) {
  http.get({
    host: host, 
    port: port 
  }, function(res) {
    cb("success", res); 
  }).on("error", function(e) {
    cb("failure", e);
  });
}