var io = require('socket.io').listen(9100);
io.sockets.on('connection', function (socket) {
  	socket.on('data', function (data) {
    	socket.broadcast.emit('news', data);
    	socket.emit('news', data);
  	});
});

