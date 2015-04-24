define(['jquery', '_config', 'scrolltotop'], function($, _config){
	/*'jquery', 'spinner', 'transit', 'doTimeout', 'jquery.whenMutation', 'jquery.scrolltotop'*/
	var $body = $('body');

	// Globales Objekt
	//alert(navigator.userAgent);
	window.jmHF = window.jmHF || {};
	window.jmGO = window.jmGO || {};
	window.dc = window.dc || {};

	$(window).on('hashchange', function() {
		$body.trigger('dc-hashchange');
		//work with -> window.location.hash = '#joinmedi';
	});

	jmHF.alert = function(p_data){
		if(dc.debug){
			window.alert(p_data);
		}
	};

	jmHF.log = function(p_data){
		if(dc.debug){
			window.console.log(p_data);
		}
	};

	jmHF.error = function(p_data){
		if(dc.debug){
			window.console.trace('%cJM \n ->'+p_data+'', 'color: red; font-style: italic');
			$.doTimeout('jmHF.error', 200, function(){
				jmHF.alert('Fehler! siehe Console JM ->');
			});
		}
	};

	jmHF.warn = function(p_data){
		if(dc.debug){
			window.console.trace('%cJM \n ->'+p_data+'', 'color: orange; font-style: italic');
			$.doTimeout('jmHF.warn', 200, function(){
				jmHF.alert('Warnung! siehe Console JM ->');
			});
		}
	};

	jmHF.setDevicePerfForParallax = function(){
		/*if(Modernizr.mq('only screen and (min-width : 60em)')){
			window.dc.perf = window.dc.perf || 3;
			return;
		}*/
		//alert(navigator.userAgent);
		if(window.userOS === 'Android'){
			switch(true){
				case /LG-D855/i.test(navigator.userAgent):      // LG G3
				case /Nexus 7/i.test(navigator.userAgent):      // Nexus 7
				case /GT-I9505/i.test(navigator.userAgent) && /Chrome\/3/i.test(navigator.userAgent):   // Samsung G 4 && Chrome >= 30
				case /GT-N7100/i.test(navigator.userAgent) && /Chrome\/3/i.test(navigator.userAgent):   // Samsung Galaxy Note 2 && Chrome >= 30
				case /Nexus Build/i.test(navigator.userAgent) && /Chrome\/3/i.test(navigator.userAgent):   // Samsung Galaxy Note 2 && Chrome >= 30
				case /GT-I9300/i.test(navigator.userAgent) && /Chrome\/3/i.test(navigator.userAgent):   // Samsung Galaxy S3 && Chrome >= 30
					window.dc.perf = ($.type(window.dc.perf) !== 'undefined') ? window.dc.perf : 1;
					break;
				default:
					window.dc.perf = ($.type(window.dc.perf) !== 'undefined') ? window.dc.perf : 0;
			}
		}else if(window.userOS === 'iOS'){
			if(window.devicePixelRatio >= 2 || parseInt(window.userOSver.split('.'), 10) < 8){
				window.dc.perf = ($.type(window.dc.perf) !== 'undefined') ? window.dc.perf : 3;
			}else{
				switch(true){
					case /iPhone/i.test(navigator.userAgent):
						window.dc.perf = ($.type(window.dc.perf) !== 'undefined') ? window.dc.perf : 0;
						break;
					default:
						window.dc.perf = ($.type(window.dc.perf) !== 'undefined') ? window.dc.perf : 1;
						break;
				}
			}
		}else{
			window.dc.perf = ($.type(window.dc.perf) !== 'undefined') ? window.dc.perf : 4;
		}
	};

	jmHF.checkOrientation = function(){
		if(window.dc.orientation === 'w' && (window.innerHeight > window.innerWidth)){
			window.dc.orientation = 'p';
			$body.trigger('dc-orientationchange');
		}else if(window.dc.orientation === 'p' && (window.innerHeight < window.innerWidth)){
			window.dc.orientation = 'w';
			$body.trigger('dc-orientationchange');
		}
	};

	jmHF.checkConfigJS = function(){
		for(var i = 0, leni = _config.length; i < leni; i++){
			var _jmpluginLength = _config[i].jmplugin.split('|').length;
			var _jmconfigObjCount = ($.type(_config[i].jmconfig) === 'object') ? 1 : _config[i].jmconfig.length;
			if(_jmpluginLength !== _jmconfigObjCount){
				window.console.trace('%cJM \n ->Die Anzahl der jmplugins "'+_config[i].jmplugin+'" im Konfigurationsmodul jmname="'+_config[i].jmname+'"  und die Anzahl der zugehörigen jmconfig-Objekte stimmen nicht überein.', 'color: orange; font-style: italic');
				$.doTimeout('jmHF.warn', 200, function(){
					jmHF.alert('Error! in _config.js -> siehe Console JM');
				});
			}
		}
	};

	jmHF.contains = function(a, obj){
		var i = a.length;
		while (i--) {
			if (a[i] === obj) {
				return true;
			}
		}
		return false;
	};

	// extend the ajax-function with the progressUpload and progress funktions
	jmHF.addXhrProgressEvent = function() {
		var originalXhr = $.ajaxSettings.xhr;
		$.ajaxSetup({
			progress: function() { /*console.log("standard progress callback");*/ },
			progressUpload: function() { /*console.log("standard upload progress callback");*/ },
			xhr: function() {
				var req = originalXhr(), that = this;
				if (req.upload) {
					if (typeof req.upload.addEventListener == "function") {
						req.upload.addEventListener("progress", function(evt) {
							that.progressUpload(evt);
						},false);
					}
				}
				return req;
			}
		});
	};

	jmHF.checkJmNameElementenOnNecessaryDominitAttribut = function(){
		var _dataJmnameElemente = $('[data-jmname]');
		for(var i = 0, leni = _dataJmnameElemente.length; i < leni; i++){
			// je DomElement
			var _events = '';
			var _jmnameElement = _dataJmnameElemente.eq(i).data('jmname').split('|');
			var _eventsArray;
			for(var j = 0, lenj = _jmnameElement.length; j < lenj; j++){
				// je jmnameSplit
				for(var k = 0, lenk = _config.length; k < lenk; k++){
					// je _configOjb
					if(_config[k].jmname === _jmnameElement[j]){
						// ist der Inhalt des jmconfig-Keys kein Array (es wird nur ein jmelemnte-Plugin für jmname verwendent) wird das Obj direckt in das staticObj geschrieben.
						if($.type(_config[k].jmconfig) !== 'array'){
							_events += _config[k].jmconfig.event + '|';
						}else{
							for(var l = 0, lenl = _config[k].jmconfig.length; l < lenl; l++){
								// je jmconfigObj in jmconfigArray
								_events += _config[k].jmconfig[l].event + '|';
							}
						}
					}
				}
			}
			_eventsArray = _events.split('|');
			for(var m = 0, lenm = _eventsArray.length; m < lenm; m++){
				switch(_eventsArray[m]){
					case 'dominit':
					case 'blur':
					case 'focus':
					case 'hover':
					case 'init-by-perf':
					case ((_eventsArray[m].match(/^dc-(.*)/))? _eventsArray[m] : undefined):
					case ((_eventsArray[m].match(/raf(.*)/))? _eventsArray[m] : undefined):
					case ((_eventsArray[m].match(/keyup(.*)/))? _eventsArray[m] : undefined):
					case ((_eventsArray[m].match(/interval(.*)/))? _eventsArray[m] : undefined):
						if(_dataJmnameElemente.eq(i).attr('data-jmdominit') !== 'true'){
							console.group();
							console.log('%cJM -> Das Element ...', 'color: red; font-style: italic');
							console.log(_dataJmnameElemente.eq(i)[0]);
							console.log('%c ... benötigt ein data-jmdominit="true" Attribut, da das event "'+_eventsArray[m]+'" im jmconfig-Obj angegeben wurde!', 'color: red; font-style: italic');
							console.groupEnd();
							jmHF.alert('Fehler: siehe Console! JM ->')
						}
						break;
					default:
						break;
				}
			}
		}
	};

	// Funktion wird benötigt, um bei mehreren Selects eine Gruppen-Validierung zu ermöglichen.
	jmHF.submit = function(){
		var $dataRuleGeb = $('[data-rule-jmgeburtsdatumsservice]');
		var $dataRuleKartenGueltigkeit = $('[data-rule-jmkreditkartengueltigkeitsservice]');

		jmGO.submit = true;

		if($.type($dataRuleGeb) !== 'undefined' && $.type($dataRuleGeb.eq(0).attr('disabled')) !== 'undefined'){
			jmGO.checkSiblingsforjmgeburtsdatumsservice = true; // obsolate nach anpassung von jmgeburtsdatumsservice
		}
		// TODO Andreas hier noch die Anpassungen/Optimierungen von jmgeburtsdatumsservice übernehmen
		if($.type($dataRuleKartenGueltigkeit) !== 'undefined' && $.type($dataRuleKartenGueltigkeit.eq(0).attr('disabled')) !== 'undefined'){
			jmGO.checkSiblingsforjmkreditkartengueltigkeitsservice = true;
		}
	};

	// gibt das original-Plugin zurück. Funktion dient zur Modulidentifikation. Es  wird dann von requireJS geladen
	jmHF.returnRequireLoadPlugin = function(p_plugin){
		if(p_plugin.indexOf('_') !== -1){
			p_plugin = p_plugin.split('_')[0];
		}
		return p_plugin;
	};

	jmHF.eventDelegationTrigger = function(e, param){
		var $this = $(this);
		jmHF.eventDelegationHepler($this, e, param);
	};

	jmHF.eventDelegationTriggerForDomInit = function(e, param){
		var $this = $(this);//$(e.target);//
		e.stopPropagation();
		e.preventDefault();
		jmHF.eventDelegationHepler($this, e, param);
	};

	jmHF.eventDelegationTriggerForATags = function(e){
		var $this = $(this);
		e.preventDefault();
		jmHF.eventDelegationHepler($this, e);
	};

	jmHF.eventDelegationTriggerForLabels = function(e){
		var $this = $(this);
		// Fix für doppelten Eventtrigger, der bei (Label > input[type="radio"]) besteht.
		// Hier wird zuerste der Click-Event von Lable gefeuert und dann nochmal vom radio.
		if(e.target.tagName.toLowerCase() === 'label'){
			jmHF.eventDelegationHepler($this, e);
		}
	};

	jmHF.eventDelegationTriggerForRadios = function(e){
		var $this = $(this);
		// jmHF.triggerJmtriggerEventForAllOtherRadiosInGroup wird aufgerufen, damit jeder Radio-Butten angetriggert wird, wenn sich in der Gruppe die Selection ändert.
		jmHF.triggerJmtriggerEventForAllOtherRadiosInGroup(e);
		jmHF.eventDelegationHepler($this, e);
	};

	jmHF.eventDelegationHepler = function($this, e, param){
		var _jmname = $this.attr('data-jmname').split('|');
		for(var i = 0, leni = _jmname.length; i < leni; i++){
			jmHF.bindPlugin({ '$element': $this, 'jmname': _jmname[i], 'configObj': jmHF.getConfigObj(_jmname[i]), 'e': e, 'e_param': param });
		}
	};

	// gebt das complette Objekt für den übergebenen jmname aus der _config.js zurück ({jmname:...,jmplugin:...,jmconfig:...})
	jmHF.getConfigObj = function(p_name){
		var i = 0;
		var _length = _config.length;
		for(; i < _length; i++){
			if(_config[i].jmname === p_name){
				return _config[i];
			}
		}
	};


	// Die Funktion verleiht einem Dom-Element spezifische JS-Funktionalitäten (das Modul/Plugin wird auf das Element angewendet.), und ruft optional eine eigene Methode
	// auf wie z.B. click, change oder auch domInit
	// Enthält das Plugin ein |, so werden die hiermit getrennt aufgelisteten Module/Plugins nacheinander initialisiert. (via $.each)
	jmHF.bindPlugin = function(Obj){
		var _requirePlugin;
		var _pluginArray;
		if($.type(Obj.$element) === 'undefined'){
			return;
		}
		if($.type(Obj.configObj) === 'undefined'){
			return;
		}
		_pluginArray = Obj.configObj.jmplugin.split('|');
		for (var i = 0, leni = _pluginArray.length; i < leni; i++) {
		    // indexOf() ist ein method nur für StringObject nicht für ObjectArray, diese Funktioniert Ausnahmeweise unter neue Browser aber nicht unter Alte Browser wie IE8
		    //if (_pluginArray.indexOf(_pluginArray[i]) !== _pluginArray.lastIndexOf(_pluginArray[i])) { 
		    if (_pluginArray.join(' ').indexOf(_pluginArray[i]) !== _pluginArray.join(' ').lastIndexOf(_pluginArray[i])) {
				jmHF.error('Bei der mehrfachen Anwendung vom selben-Plugin im jmplugin-String sind diese mit ..._1|..._2 usw. zu benennen.');
			}
			// event-Check for init plugin
			if(jmHF.matchTriggerEventWithConfigEvents(Obj.e.type, (_pluginArray.length === 1) ? Obj.configObj.jmconfig : Obj.configObj.jmconfig[i])){
				jmHF.helperForBindPlugin(Obj, _pluginArray[i], i);
			}
		}
	};

	jmHF.matchTriggerEventWithConfigEvents = function(p_eventType, p_pluginConfigOjb){
		//console.log(p_pluginConfigOjb);
		// Erstelle ein Array aus der event-Value-Angabe aus dem config-Obj
		var eventArray = p_pluginConfigOjb.event.split('|');
		var _retrun = false;
		// Durchlaufe das Event-Array
		for(var i = 0, leni = eventArray.length; i < leni; i++){
			if(eventArray[i] === p_eventType){
				// return true if p_eventType === click || change
				_retrun = true;
			}else if(eventArray[i].split(':')[0].replace('\'', '').replace('"', '') === p_eventType){
				// return true if eventArray[i] contains jmtrigger
				_retrun = true;
			}else if('dominit' === p_eventType){
				switch(eventArray[i]){
					case 'dominit':
					case 'blur':
					case 'focus':
					case 'hover':
					case 'init-by-perf':
					case ((eventArray[i].match(/^dc-(.*)/))? eventArray[i] : undefined):
					case ((eventArray[i].match(/raf(.*)/))? eventArray[i] : undefined):
					case ((eventArray[i].match(/keyup(.*)/))? eventArray[i] : undefined):
					case ((eventArray[i].match(/interval(.*)/))? eventArray[i] : undefined):
						// return true if p_eventType === dominit && eventArray[i] gleich dominit || raf || blur || focus || hover || match /keyup(.*)/ || match /interval(.*)/
						_retrun = true;
						break;
					default:
						break;
				}
			}
		}
		return _retrun;
	};

	jmHF.helperForBindPlugin = function(Obj, p_plugin, index){
		var _index = index || 0;
		var _requirePlugin = jmHF.returnRequireLoadPlugin(p_plugin);
		if(require.defined(_requirePlugin)){
			jmHF.bindAndExecPlugin(Obj, p_plugin, _index, require.s.contexts._.defined[_requirePlugin]);
		}else{
			require([_requirePlugin], function(pluginObj){
				jmHF.bindAndExecPlugin(Obj, p_plugin, _index, pluginObj);
			});
		}
	};

	jmHF.bindAndExecPlugin = function(Obj, p_plugin, index, pluginObj){
		var $plugin;
		// für pluginName können folgende varationen entstehen.
		// z.B. actions.add (wenn auf dem element kein weiteres actions.add im jmname-Modul angewendet wird)
		// z.B. actions.add_1 (wenn auf dem element weitere actions.add im jmname-Modul angewendet werden)
		// z.B. actions.add-for-[jmname] (wenn auf dem element schon ein actions.add Plugin angewendet wurde aus einem anderen jmname-Modul)

		// ist das Plugin z.B. actions.add noch nicht auf dem Element angewendet, oder das Obj.jmname === Obj.$element.data(p_plugin).jmname bleibt pluginName = p_plugin (z.B. acitons.add oder actions.add_1).
		// Andernfalls wird p_plugin mit dem jmname erweitert. (actions.add-for-[jmname])
		var pluginName = ($.type(Obj.$element.data(p_plugin)) === 'undefined' || Obj.jmname === Obj.$element.data(p_plugin).jmname) ? p_plugin : p_plugin+'-for-'+Obj.jmname;

		// ist das pluginName - Plugin noch nicht als jQuery-Plugin definiert, wird dieses durchgeführt.
		if($.type($.fn[pluginName]) === 'undefined'){
			$.plugin(pluginName, pluginObj);
		}

		if($.type(Obj.$element.data(p_plugin)) === 'undefined'){
			// Fall 1: Das Plugin wird auf das Element angewendet. Es werden jmname, pluginName und pos als Options übergeben. Das angewendete Plugin wird in $plugin gespeichert.
			Obj.$element[p_plugin]({ jmname: Obj.jmname, pluginName: p_plugin, pos: _index });
			$plugin = Obj.$element.data(p_plugin);
		}else if(Obj.jmname === Obj.$element.data(p_plugin).jmname){
			// Fall 2: Das Plugin ist schon auf das Element angewendet. Das angewendete Plugin wird in $plugin gespeichert.
			$plugin = Obj.$element.data(p_plugin);
		}else if($.type(Obj.$element.data(p_plugin+'-for-'+Obj.jmname)) === 'undefined'){
			// Fall 3: Das Plugin (erweiterte Benennung mit jmname) wird auf das Element angewendet. Dies ist der Fall, wenn Obj.jmname !== Obj.$element.data(p_plugin).jmname ist.
			// Es werden jmname, pluginName und pos als Options übergeben. Das angewendete Plugin wird in $plugin gespeichert.
			Obj.$element[p_plugin+'-for-'+Obj.jmname]({ jmname: Obj.jmname, pluginName: p_plugin, pos: _index });
			$plugin = Obj.$element.data(p_plugin+'-for-'+Obj.jmname);
		}else{
			// Fall 4: Das Plugin (erweiterte Benennung mit jmname) ist schon auf das Element angewendet. Das angewendete Plugin wird in $plugin gespeichert.
			$plugin = Obj.$element.data(p_plugin+'-for-'+Obj.jmname);
		}

		// if event !== undefined && event.type !== undefined && ist die Plugin-Methode !== undefined
		if(($.type(Obj.e) !== 'undefined') && ($.type(Obj.e.type) !== 'undefined') && $.type($plugin[Obj.e.type]) !== 'undefined'){
			$plugin[Obj.e.type](Obj.e, Obj.e_param);
		}
	});

	jmHF.helperForRequirementsForJmPlugins = function(_config, jmname){
		var _requirePlugin;
		var _configObj = jmHF.getConfigObj(jmname);
		var _jmpluginString;
		if($.type(_configObj) === 'undefined'){
			jmHF.error('Die Funktionalität beschrieben mit data-jmname="'+jmname+'" wurde nicht in der _config.js hinterlegt');
			return;
		}
		_jmpluginString = _configObj.jmplugin;
		if(_jmpluginString.split('|').length > 1){
			$.each(_jmpluginString.split('|'), function(index, innerItem){
				_requirePlugin = jmHF.returnRequireLoadPlugin(innerItem);   //actions.toggle|actions.link
				jmHF.requirePluginAndDependencies(_requirePlugin, _configObj, index);
			});
		}else{
			_requirePlugin = jmHF.returnRequireLoadPlugin(_jmpluginString);
			jmHF.requirePluginAndDependencies(_requirePlugin, _configObj);
		}
	};

	jmHF.requirePluginAndDependencies = function(fileref, _configObj, index){
		require([fileref], function(){});
		if(fileref === 'actions.apply'){
			($.type(index) !== 'undefined') ? require([_configObj.jmconfig[index].require], function(){}) : require([_configObj.jmconfig.require], function(){});
		}
	};


	// Alle anderen Radio-Buttons feuern das jmtrigger-Event, wenn sich in der Gruppe die Selection ändert.
	jmHF.triggerJmtriggerEventForAllOtherRadiosInGroup = function(e){
		var radiogroup, $that;
		if(e.target.tagName.toLowerCase() === 'input'){
			if($(e.target).attr('type') === 'radio'){
				$that = $(e.target);
				radiogroup = $('[name="' + $(e.target).attr('name') + '"]').filter(function(){
					return $(this)[0] !== $that[0];
				});
				radiogroup.each(function(index, item){
					jmHF.alert("bitte ändern in $(item).jmtrigger('change')");
					$(item).trigger('jmtrigger');
				});
			}
		}
	};

	/*jmHF.getJmPluginByJmName = function(p_config, p_name){
		var i = 0;
		var _length = p_config.length;
		for(; i < _length; i++){
			if(p_config[i].jmname === p_name){
				return p_config[i].jmplugin;
			}
		}
	};*/

	// gibt die Höhe des Browserfenster wieder
	jmHF.getClientHeight = function () {
		var $window = $(window);
		if($.type(jmGO.clientHeightOrientationChangeListener) === 'undefined'){
			$window.one('orientationchange', function(e) {
				jmGO.clientHeight = undefined;
			});
			jmGO.clientHeightOrientationChangeListener = true;
		}
		return jmGO.clientHeight = jmGO.clientHeight || window['innerHeight'] || document.documentElement['clientHeight'] || document.body['clientHeight'];
	};

	// Auslesen der Scrollposition des Browsers
	jmHF.getScrollPos = function(){
		return ($.type(window.pageYOffset) === "number") ? window.pageYOffset : document.documentElement.scrollTop;
	};

	jmHF.hasClass = function(elem, selector){
		return (" " + elem.className + " ").replace(/[\t\r\n\f]/g, " ").indexOf(" " + selector + " ") >= 0
	};

	jmHF.replaceSVGForOldBrowser = function(){
		if(!(!!document.createElementNS && !!document.createElementNS('http://www.w3.org/2000/svg', 'svg').createSVGRect)){
			var _svgImages = $('img[src*=".svg"]');
			for(var i = 0, leni = _svgImages.length; i < leni; i++){
				_svgImages.eq(i).attr('src', _svgImages.eq(i).attr('src').replace('.svg', '.png'));
			}
		}
	};

	jmHF.scrollToPosition = function(pos, speed){
		var $body = (navigator.userAgent.indexOf('AppleWebKit') !== -1) ? $('body') : $('html');
		if($.type(speed) !== 'undefined'){
			$body.animate({
				scrollTop: pos
			},{
				duration: speed,
				always: function(){
					$body.off('scroll mousedown DOMMouseScroll mousewheel keyup');
				}
			});
			// Stop the animation if the user scrolls. Defaults on .stop() should be fine
			$body.on("scroll mousedown DOMMouseScroll mousewheel keyup touchstart", function(e){
				if( e.which > 0 || e.type === "mousedown" || e.type === "mousewheel" || e.type === 'touchstart'){
					$body.stop(); // This identifies the scroll as a user action, stops the animation
				}
			});
		}else{
			$body.scrollToTop(pos);
		}
	};

	// http://shebang.brandonmintern.com/foolproof-html-escaping-in-javascript/
	// Use the browser's built-in functionality to quickly and safely escape the
	// string
	jmHF.escapeHtml = function (str) {
		var div = document.createElement('div');
		div.appendChild(document.createTextNode(str));
		return div.innerHTML;
	};

	jmHF.transformSupport = function(value) {
		var element = document.createElement('div');
		var propertySupport = false;
		var propertyValue = null;
		var featureSupport = false;
		var cssProperty = null;
		var jsProperty = null;
		for (var i = 0, l = window.jmGO.vendors.length; i < l; i++) {
			if (window.jmGO.vendors[i] !== null) {
				cssProperty = window.jmGO.vendors[i][0] + 'transform';
				jsProperty = window.jmGO.vendors[i][1] + 'Transform';
			} else {
				cssProperty = 'transform';
				jsProperty = 'transform';
			}
			if (element.style[jsProperty] !== undefined) {
				propertySupport = true;
				break;
			}
		}
		switch(value) {
			case '2D':
				featureSupport = propertySupport;
				break;
			case '3D':
				if (propertySupport) {
					var body = document.body || document.createElement('body');
					var documentElement = document.documentElement;
					var documentOverflow = documentElement.style.overflow;
					if (!document.body) {
						documentElement.style.overflow = 'hidden';
						documentElement.appendChild(body);
						body.style.overflow = 'hidden';
						body.style.background = '';
					}
					body.appendChild(element);
					element.style[jsProperty] = 'translate3d(1px,1px,1px)';
					propertyValue = window.getComputedStyle(element).getPropertyValue(cssProperty);
					featureSupport = propertyValue !== undefined && propertyValue.length > 0 && propertyValue !== "none";
					documentElement.style.overflow = documentOverflow;
					body.removeChild(element);
				}
				break;
		}
		return featureSupport;
	};

	if (!Function.prototype.bind) {
		Function.prototype.bind = function (oThis) {
			if (typeof this !== "function") {
				// closest thing possible to the ECMAScript 5 internal IsCallable function
				throw new TypeError("Function.prototype.bind - what is trying to be bound is not callable");
			}

			var aArgs = Array.prototype.slice.call(arguments, 1),
			    fToBind = this,
			    fNOP = function () {},
			    fBound = function () {
				    return fToBind.apply(this instanceof fNOP && oThis
						    ? this
						    : oThis,
					    aArgs.concat(Array.prototype.slice.call(arguments)));
			    };

			fNOP.prototype = this.prototype;
			fBound.prototype = new fNOP();

			return fBound;
		};
	}

	window.jmGO.vendors = [null,['-webkit-','webkit'],['-moz-','Moz'],['-o-','O'],['-ms-','ms']];

	window.jmGO.uuID = function() {};

	/**
	 * The simplest function to get an UUID string.
	 * @returns {string} A version 4 UUID string.
	 */
	window.jmGO.uuID.generate = function() {
		var rand = jmGO.uuID._gri, hex = jmGO.uuID._ha;
		return  hex(rand(32), 8)          // time_low
			+ "-"
			+ hex(rand(16), 4)          // time_mid
			+ "-"
			+ hex(0x4000 | rand(12), 4) // time_hi_and_version
			+ "-"
			+ hex(0x8000 | rand(14), 4) // clock_seq_hi_and_reserved clock_seq_low
			+ "-"
			+ hex(rand(48), 12);        // node
	};

	/**
	 * Returns an unsigned x-bit random integer.
	 * @param {int} x A positive integer ranging from 0 to 53, inclusive.
	 * @returns {int} An unsigned x-bit random integer (0 <= f(x) < 2^x).
	 */
	window.jmGO.uuID._gri = function(x) { // _getRandomInt
		if (x <   0) return NaN;
		if (x <= 30) return (0 | Math.random() * (1 <<      x));
		if (x <= 53) return (0 | Math.random() * (1 <<     30))
			+ (0 | Math.random() * (1 << x - 30)) * (1 << 30);
		return NaN;
	};

	/**
	 * Converts an integer to a zero-filled hexadecimal string.
	 * @param {int} num
	 * @param {int} length
	 * @returns {string}
	 */
	window.jmGO.uuID._ha = function(num, length) {  // _hexAligner
		var str = num.toString(16), i = length - str.length, z = "0";
		for (; i > 0; i >>>= 1, z += z) { if (i & 1) { str = z + str; } }
		return str;
	};

	window.setGlobalOSVars = (function(){
		window.ua = navigator.userAgent;

		// determine OS
		if ( ua.match(/iPad/i) || ua.match(/iPhone/i) ){
			window.userOS = 'iOS';
			window.uaindex = ua.indexOf( 'OS ' );
		}else if ( ua.match(/Android/i) ){
			window.userOS = 'Android';
			window.uaindex = ua.indexOf( 'Android ' );
		}else{
			window.userOS = 'unknown';
		}

		// determine version
		if ( userOS === 'iOS'  &&  uaindex > -1 ){
			window.userOSver = ua.substr( uaindex + 3, 3 ).replace( '_', '.' );
		}else if ( userOS === 'Android'  &&  uaindex > -1 ){
			window.userOSver = ua.substr( uaindex + 8, 3 );
		}else{
			window.userOSver = 'unknown';
		}
	})();


	// Object.create support test, and fallback for browsers without it
	if(typeof Object.create !== "function"){
		Object.create = function(o){  // http://eloquentjavascript.net/ -> function clone(object) {...}
			function F(){
			}

			F.prototype = o;
			return new F();
		};
	}


	// ***************** jQuery-Helperplugins ****************************





	// Initialisierung des Plugins aus dem Objekt an das Element
	$.plugin = function(name, object){
		$.fn[name] = function(options){
			return this.each(function(){ // für jedes Element in der Selection, an die der Funktionsaufruf angehangen wird.
				if(!$.data(this, name)){
					$.data(this, name, Object.create(object).init(options, this));
				}
			});
		};
	};

	// sucht die benötigten AMD-Module für die nun im DOM existierenden Tags raus und läd sie schon mal vorab via require([_requirePlugin]).
	$.fn.requirementsForJmPlugins = function(){
		return this.each(function(){
			var $elem = $(this);
			$elem.find('[data-jmname]').addBack('[data-jmname]').each(function(index, item){
				var $item = $(item);
				var _jmname = $item.data('jmname').split('|');
				for(var i = 0, leni = _jmname.length; i < leni; i++){
					jmHF.helperForRequirementsForJmPlugins(_config, _jmname[i]);
				}
			});
		});
	};

	// Wenn in den Selektion Element vorkommen, die umgehend Initialisiert werden sollen (ohne User-Events), werden die entsprechenden Funktionen angesprochen.
	$.fn.triggerSelfexecObj = function () {
		this.each(function () {
			var $elem = $(this);
			$elem.find('[data-jmdominit="true"]').addBack('[data-jmdominit="true"]').each(function (index, item) {
				$(item).trigger('dominit');
			});
			// TODO Andreas wird das noch gebraucht?
			$elem.find('[data-jmsetelementwithjs]').addBack('[data-jmsetelementwithjs]').each(function (index, item) {
				$(item).trigger('setelementwithjs');
			});
		});
		// TODO Andreas modenizr-Weiche integrieren
		/*if (navigator.appVersion.indexOf("MSIE 8.") != -1) {
			this.ie8BugfixForRadioAndCheckbox()
		}*/
		return this;
	};

	// TODO Andreas modenizr-Weiche integrieren
	/*if(navigator.appVersion.indexOf("MSIE 8.") != -1){
		(function () {
			$.fn.ie8BugfixForRadioAndCheckbox = function () {
				this.each(function () {
					var $elem = $(this);
					$elem.find('input[type="radio"], input[type="checkbox"]').addBack('input[type="radio"], input[type="checkbox"]').each(function (e) {
						if ($(this).is(':checked')) {
							$(this).addClass('option-checked');
						} else {
							$(this).removeClass('option-checked');
						}
					});
				});
			}
		})()
	}*/

	// Funktionswrapper um ein jmtrigger-Event mit event-type zu triggern.
	$.fn.jmtrigger = function(p_event, p_data){
		return this.each(function(){
			$(this).trigger('jmtrigger', { 'event': p_event, 'data': p_data });
		});
	};

	$.fn.picturefill = function(){
		var _array = [];
		this.each(function(){
			var $elem = $(this);
			_array = $.merge(_array, $elem.find('picture').addBack('picture').toArray());
		});
		try{
			picturefill({
				elements: _array
			});
		}catch(e){}
	};

	// tauschen von Tabellenspalten
	$.fn.switchColumns = function ( col1, col2 ) {
		var $this = this,
		    $tr = $this.find('tr');

		$tr.each(function(i, ele){
			var $ele = $(ele),
			    $td = $ele.find('td'),
			    $tdt;

			$tdt = $td.eq( col1 ).clone();
			$td.eq( col1 ).html( $td.eq( col2 ).html() );
			$td.eq( col2 ).html( $tdt.html() );
		});
	};

	// tauschen von Tabellenspalten
	$.fn.switchColumnsViaClassName = function ( class1, class2 ) {
		this.each(function(i, ele){
			var $ele = $(ele),
			    $td = $ele.find('td'),
			    $tdt;
			if($td.filter('.'+class1).doesExist() && $td.filter('.'+class2).doesExist()){
				$tdt = $td.filter('.'+class1 ).clone();
				$td.filter('.'+class1 ).replaceWith($td.filter('.'+class2 ));
				$ele.children('td').last().after($tdt);
			}
		});
	};

	// Überprüfung, ob ein Element existiert
	$.fn.doesExist = function(){
		return $(this).length > 0;
	};

	$.urlParam = function(name){
		var results = new RegExp('[\?&]' + name + '=([^&#]*)').exec(window.location.href);
		if (results==null){
			return null;
		}
		else{
			return results[1] || 0;
		}
	};

	$.fn.scrollToMe = function(p_delta_offset, speed){
		var _delta_offset = 0;
		var $body = (navigator.userAgent.indexOf('AppleWebKit') !== -1) ? $('body') : $('html');
		if ($.type(p_delta_offset) === 'number') {
			_delta_offset = p_delta_offset;
		}
		if($.type(speed) !== 'undefined'){
			$body.animate({
				scrollTop: $(this).offset().top + _delta_offset
			},{
				duration: speed
			});
		}else{
			$body.scrollToTop($(this).offset().top + _delta_offset);
		}
	};

	$.fn.removeDotNetFallbackHiddenFields = function(){
		return $(this).each(function(){
			var $form = $(this);
			var $elemens = $form.find('[name]');
			var nameArray = [];
			$elemens.each(function(index, item){
				var $item = $(item);
				if($.type($item.attr('type')) !== 'undefined' && ($item.attr('type') !== 'hidden') && $.type($item.attr('name')) !== 'undefined'){
					nameArray.push($item.attr('name'));
				}
			});
			$elemens.each(function(index, item){
				var $item = $(item);
				if($.type($item.attr('type')) !== 'undefined' && ($item.attr('type') === 'hidden') && $.type($item.attr('name')) !== 'undefined' && $.inArray($item.attr('name'), nameArray) !== -1){
					$item.remove();
				}
			});
		});
	};

	$.fn.removeClassRegExp = function (regexp) {
		if(regexp && (typeof regexp==='string' || typeof regexp==='object')) {
			regexp = typeof regexp === 'string' ? regexp = new RegExp(regexp) : regexp;
			$(this).each(function () {
				$(this).removeClass(function(i,c) {
					var classes = [];
					$.each(c.split(' '), function(i,c) {
						if(regexp.test(c)) { classes.push(c); }
					});
					return classes.join(' ');
				});
			});
		}
		return this;
	};

	$.fn.removePlugins = function () {
		this.off('keyup', '**')
			.off('blur', '**')
			.off('focus', '**')
			.off('mouseover', '**')
			.removeClassRegExp(/^JSINIT-/)
			.removeData();
	};

	window.dc.orientation = (window.innerHeight > window.innerWidth) ? 'p':'w';

	if(window.location.href.indexOf('debugview=true') !== -1){
		window.dc.debugview = true;
	}
	if($.urlParam('perf') !== null){
		window.dc.perf = parseInt($.urlParam('perf'), 10);
	}
	if($.urlParam('showua') !== null && $.urlParam('showua') === 'true'){
		alert(navigator.userAgent);
	}
	jmHF.setDevicePerfForParallax();
});