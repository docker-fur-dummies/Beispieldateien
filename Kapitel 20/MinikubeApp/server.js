var http = require('http');

var handleRequest = function(request, response) {
    console.log('Die URL ' + request.url + ' wurde angefragt.');
    response.writeHead(200);
    response.end('Hallo Wal!');
};
var www = http.createServer(handleRequest);
www.listen(8080);
