var flo = require('fb-flo'),
    fs = require('fs'),
	path = require('path'),
	exec = require('child_process').exec;

var resolver = function(filepath, callback){
	var shouldReload = filepath.indexOf('.js') > -1;
	callback({
		resourceURL: 'js/' + filepath,
		contents: fs.readFileSync('js/' + filepath),
		reload: shouldReload
	});
};

var server = flo('./js/', {
	port: 8888,
	dir: './js/',
	verbose: true,
	useFilePolling: true,
	pollingInterval: 100,
	glob: ['./js/*.js']
}, resolver);

server.once('ready', function(){
	console.log('Ready!');
});