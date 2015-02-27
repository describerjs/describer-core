define(['config.languageTextObj'], function (speak){
	var obj = {};
	for (var prop in speak) {
		if(speak.hasOwnProperty(prop)) {
			obj[prop] = speak[prop][1];
		}
	}
	return obj;
});