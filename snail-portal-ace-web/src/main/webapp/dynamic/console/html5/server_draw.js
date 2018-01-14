var io = require('socket.io').listen(9010);
var os = require('os');
io.sockets.on('connection', function (socket) {
  socket.on('data', function (data) {
    socket.broadcast.emit('news', data);
    socket.broadcast.emit('news', JSON.stringify(os));
    socket.emit('news', data);
    console.log(data);
  });
	setInterval(function(){
		socket.emit('news', os.freemem());
	}, 1000);
});
