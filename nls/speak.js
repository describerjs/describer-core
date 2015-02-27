define(['config.languageTextObj'], function (speak){
	var obj = {};
	for (var prop in speak) {
		if(speak.hasOwnProperty(prop)) {
			obj[prop] = speak[prop][0];
		}
	}
	return {
		'root' : obj,
		'en' : true
	}
});