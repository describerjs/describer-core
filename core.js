define(['jquery', 'underscore', '_config'], function($, _, _config){

	var $body = $('body');

	(function(){
		window.dc = $.extend({}, {
			client: {},
			config: {},
			dev: {},
			domready: {},
			eventflow : {},
			form: {},
			helper: {},
			modulPreloader: {},
			perf: {},
			pointer: {},
			raf: {}
		}, window.dc);

		// polyfill for bind
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

		// polyfill for Object.create
		// Object.create support test, and fallback for browsers without it
		if(typeof Object.create !== "function"){
			Object.create = function(o){  // http://eloquentjavascript.net/ -> function clone(object) {...}
				function F(){
				}

				F.prototype = o;
				return new F();
			};
		}

		// polyfill for requestAnimationFrame

		// http://paulirish.com/2011/requestanimationframe-for-smart-animating/
		// http://my.opera.com/emoller/blog/2011/12/20/requestanimationframe-for-smart-er-animating

		// requestAnimationFrame polyfill by Erik Möller. fixes from Paul Irish and Tino Zijdel

		(function() {
			var lastTime = 0;
			var vendors = ['ms', 'moz', 'webkit', 'o'];
			for(var x = 0; x < vendors.length && !window.requestAnimationFrame; ++x) {
				window.requestAnimationFrame = window[vendors[x]+'RequestAnimationFrame'];
				window.cancelAnimationFrame = window[vendors[x]+'CancelAnimationFrame']
					|| window[vendors[x]+'CancelRequestAnimationFrame'];
			}

			if (!window.requestAnimationFrame)
				window.requestAnimationFrame = function(callback, element) {
					var currTime = new Date().getTime();
					var timeToCall = Math.max(0, 16 - (currTime - lastTime));
					var id = window.setTimeout(function() { callback(currTime + timeToCall); },
						timeToCall);
					lastTime = currTime + timeToCall;
					return id;
				};

			if (!window.cancelAnimationFrame)
				window.cancelAnimationFrame = function(id) {
					clearTimeout(id);
				};
		}());

		// polyfill for Object.keys
		// From https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/keys
		(function() {
			if (!Object.keys) {
				Object.keys = (function() {
					'use strict';
					var hasOwnProperty = Object.prototype.hasOwnProperty,
					    hasDontEnumBug = !({ toString: null }).propertyIsEnumerable('toString'),
					    dontEnums = [
						    'toString',
						    'toLocaleString',
						    'valueOf',
						    'hasOwnProperty',
						    'isPrototypeOf',
						    'propertyIsEnumerable',
						    'constructor'
					    ],
					    dontEnumsLength = dontEnums.length;

					return function(obj) {
						if (typeof obj !== 'object' && (typeof obj !== 'function' || obj === null)) {
							throw new TypeError('Object.keys called on non-object');
						}

						var result = [], prop, i;

						for (prop in obj) {
							if (hasOwnProperty.call(obj, prop)) {
								result.push(prop);
							}
						}

						if (hasDontEnumBug) {
							for (i = 0; i < dontEnumsLength; i++) {
								if (hasOwnProperty.call(obj, dontEnums[i])) {
									result.push(dontEnums[i]);
								}
							}
						}
						return result;
					};
				}());
			}
		}());
	})();



// client	*********************************************

	// gibt die Höhe des Browserfenster wieder
	dc.client.getHeight = function () {
		var $window = $(window);
		if($.type(dc.client._heightOrientationChangeListener) === 'undefined'){
			$window.one('orientationchange', function(e) {
				dc.client._height = undefined;
			});
			dc.client._heightOrientationChangeListener = true;
		}
		return dc.client._height = dc.client._height || window['innerHeight'] || document.documentElement['clientHeight'] || document.body['clientHeight'];
	};

	dc.client.setUserOS = (function(){
		window.ua = navigator.userAgent;

		// determine OS
		if ( ua.match(/iPad/i) || ua.match(/iPhone/i) ){
			window.dc.client.userOS = 'iOS';
			window.uaindex = ua.indexOf( 'OS ' );
		}else if ( ua.match(/Android/i) ){
			window.dc.client.userOS = 'Android';
			window.uaindex = ua.indexOf( 'Android ' );
		}else{
			window.dc.client.userOS = 'unknown';
		}

		// determine version
		if ( dc.client.userOS === 'iOS'  &&  uaindex > -1 ){
			window.dc.client.userOSver = ua.substr( uaindex + 3, 3 ).replace( '_', '.' );
		}else if ( dc.client.userOS === 'Android'  &&  uaindex > -1 ){
			window.dc.client.userOSver = ua.substr( uaindex + 8, 3 );
		}else{
			window.dc.client.userOSver = 'unknown';
		}
	})();

	dc.client.vendors = [null,['-webkit-','webkit'],['-moz-','Moz'],['-o-','O'],['-ms-','ms']];

	dc.client.orientation = (window.innerHeight > window.innerWidth) ? 'p':'w';

	// schreibt den aktuellen breakpoint in dc.client.deviceState
	dc.client.setDeviceState = function() {
		var index = parseInt(window.getComputedStyle(dc.client.indicator).getPropertyValue('z-index'), 10);

		var states = {
			2: 'bp-xs',
			3: 'bp-s',
			4: 'bp-m',
			5: 'bp-l',
			6: 'bp-xl',
			7: 'bp-xxl'
		};

		dc.client.deviceState = states[index] || 'small';
	};

	dc.client.touch = Modernizr.touch;


// dev     **********************************************

	dc.dev.alert = function(p_data){
		if(dc.config.debug){
			window.alert(p_data);
		}
	};

	dc.dev.log = function(p_data){
		if(dc.config.debug){
			window.console.log(p_data);
		}
	};

	dc.dev.error = function(p_data){
		if(dc.config.debug){
			window.console.trace('%cJM \n ->'+p_data+'', 'color: red; font-style: italic');
			$.doTimeout('dc.dev.error', 200, function(){
				dc.dev.alert('Fehler! siehe Console JM ->');
			});
		}
	};

	dc.dev.warn = function(p_data){
		if(dc.config.debug){
			window.console.trace('%cJM \n ->'+p_data+'', 'color: orange; font-style: italic');
			$.doTimeout('dc.dev.warn', 200, function(){
				dc.dev.alert('Warnung! siehe Console JM ->');
			});
		}
	};

	dc.dev.checkConfigJS = function(){
		for(var i = 0, leni = _config.length; i < leni; i++){
			var _jmpluginLength = _config[i].jmplugin.split('|').length;
			var _jmconfigObjCount = ($.type(_config[i].jmconfig) === 'object') ? 1 : _config[i].jmconfig.length;
			if(_jmpluginLength !== _jmconfigObjCount){
				window.console.trace('%cJM \n ->Die Anzahl der jmplugins "'+_config[i].jmplugin+'" im Konfigurationsmodul jmname="'+_config[i].jmname+'"  und die Anzahl der zugehörigen jmconfig-Objekte stimmen nicht überein.', 'color: orange; font-style: italic');
				$.doTimeout('dc.dev.warn', 200, function(){
					dc.dev.alert('Error! in describer.js -> siehe Console JM');
				});
			}
		}
	};

	dc.dev.checkEqualIDs = function(){
		var _id_selection = $('body').find('[id]');
		var _id_selectino_filtered = _id_selection.map(function() {
			if(!$(this).closest('.sf-toolbar-block').doesExist()){
				return this;
			}
		});
		for (var i = _id_selectino_filtered.length - 1; i >= 0; i--) {
			if(_id_selectino_filtered.filter('[id="'+ $(_id_selectino_filtered[i]).attr('id')+'"]').length > 1){
				dc.dev.warn('Es sind mehrere Element mit der gleiche ID ("'+ $(_id_selectino_filtered[i]).attr('id') +'") versehen!!!');
			};
			
		};
	};

	dc.dev.checkJmNameElementenOnNecessaryDominitAttribut = function(){
		var _configObj;
		var _dataJmnameElemente = $('[data-jmname]');
		for(var i = 0, leni = _dataJmnameElemente.length; i < leni; i++){
			// je DomElement
			var _events = '';
			var _jmnameElement = ((_dataJmnameElemente.eq(i).data('jmname')).indexOf(' ') !== -1) ? _dataJmnameElemente.eq(i).data('jmname').trim().split(' ') : _dataJmnameElemente.eq(i).data('jmname').trim().split('|');
			var _eventsArray;
			for(var j = 0, lenj = _jmnameElement.length; j < lenj; j++){
				// je jmnameSplit

				_configObj = _config.default[$.camelCase(_jmnameElement[j])];
				_.each(_configObj, function (value, prop) {
					_events += value.event + '|';
				});
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
							dc.dev.alert('Fehler: siehe Console! JM ->')
						}
						break;
					default:
						break;
				}
			}
		}
	};




// domready

	// hier wird ein div injected, welches als je nach mediaquery einen anderen z-index erhält
	dc.domready.addStateIndicator = function () {
		dc.client.indicator = document.createElement('div');
		dc.client.indicator.className = 'state-indicator';
		document.body.appendChild(dc.client.indicator);
	};

	dc.domready.checkUrl = function(){


		$(window).on('hashchange', function() {
			$body.trigger('dc-hashchange');
			//work with -> window.location.hash = '#joinmedi';
		});

		if(window.location.hash !== ''){
			$(window.location.hash).jmtrigger('hash');
		}

		if($.urlParam('debugview') !== null && $.urlParam('debugview') === 'true'){
			window.dc.dev.debugview = true;
		}

		if($.urlParam('showmodal') !== null && $.urlParam('showmodal') !== ''){
			$('body').append('<a data-jmname="modal-form-url" data-jmdominit="true" href="/sendebizdensin/wp-admin/admin-ajax.php?action=post_vote_data&post_id='+ $.urlParam('showmodal')+'"></a>').find('[data-jmname="modal-form-url"]').triggerSelfexecObj();
			setTimeout(function(){
				$('[data-jmname="modal-form-url"]').trigger('dc-openmodal');
			}, 500);
		}

		if($.urlParam('perf') !== null){
			window.dc.perf.level = parseInt($.urlParam('perf'), 10);
		}

		if($.urlParam('showua') !== null && $.urlParam('showua') === 'true'){
			alert(navigator.userAgent);
		}

		if($.urlParam('openacc') !== null){
			setTimeout(function(){
				var _$link = $('#'+$.urlParam('openacc'));
				if(!_$link.parent().hasClass('show')){
					_$link.trigger('click');
				}
			}, 500);
		}
	};



// eventflow  ***********************************************

	dc.eventflow.eventDelegationTrigger = function(e, param){
		var $this = $(this);
		dc.eventflow.eventDelegationHelper($this, e, param);
	};

	dc.eventflow.eventDelegationTriggerForDomInit = function(e, param){
		var $this = $(this);//$(e.target);//
		e.stopPropagation();
		e.preventDefault();
		dc.eventflow.eventDelegationHelper($this, e, param);
	};

	dc.eventflow.eventDelegationTriggerForATags = function(e){
		var $this = $(this);
		e.preventDefault();
		dc.eventflow.eventDelegationHelper($this, e);
	};

	dc.eventflow.eventDelegationTriggerForLabels = function(e){
		var $this = $(this);
		// Fix für doppelten Eventtrigger, der bei (Label > input[type="radio"]) besteht.
		// Hier wird zuerste der Click-Event von Lable gefeuert und dann nochmal vom radio.
		if(e.target.tagName.toLowerCase() === 'label'){
			dc.eventflow.eventDelegationHelper($this, e);
		}
	};

	dc.eventflow.eventDelegationTriggerForRadios = function(e){
		var $this = $(this);
		// dc.eventflow.triggerJmtriggerEventForAllOtherRadiosInGroup wird aufgerufen, damit jeder Radio-Butten angetriggert wird, wenn sich in der Gruppe die Selection ändert.
		dc.eventflow.triggerJmtriggerEventForAllOtherRadiosInGroup(e);
		dc.eventflow.eventDelegationHelper($this, e);
	};

	dc.eventflow.eventDelegationHelper = function($this, e, param){
		var _jmname = (($this.attr('data-jmname')).indexOf(' ') !== -1) ? $this.attr('data-jmname').trim().split(' ') : $this.attr('data-jmname').trim().split('|');
		if(e.type === 'dcpointer'){
			e.type = 'click';
		}
		for(var i = 0, leni = _jmname.length; i < leni; i++){
			dc.eventflow.bindPlugin({ '$element': $this, 'jmname': _jmname[i], 'configObj': dc.eventflow.getConfigObj(_jmname[i]), 'e': e, 'e_param': param });
		}
	};

	// gebt das complette Objekt für den übergebenen jmname aus der _config.js zurück ({jmname:...,jmplugin:...,jmconfig:...})
	dc.eventflow.getConfigObj = function(p_name){
        return _config.default[$.camelCase(p_name)]
	};

	// Die Funktion verleiht einem Dom-Element spezifische JS-Funktionalitäten (das Modul/Plugin wird auf das Element angewendet.), und ruft optional eine eigene Methode
	// auf wie z.B. click, change oder auch domInit
	// Enthält das Plugin ein |, so werden die hiermit getrennt aufgelisteten Module/Plugins nacheinander initialisiert. (via $.each)
	dc.eventflow.bindPlugin = function(Obj){
		var _objectKeyArray;
		if($.type(Obj.$element) === 'undefined'){
			return;
		}
		if($.type(Obj.configObj) === 'undefined'){
			return;
		}
        
        _objectKeyArray = Object.keys(Obj.configObj);
		for (var i = 0, leni = _objectKeyArray.length; i < leni; i++) {
			// event-Check for init plugin
			if(dc.eventflow.matchTriggerEventWithConfigEvents(i, Obj, (_objectKeyArray.length === 1) ? Obj.configObj[_objectKeyArray[0]] : Obj.configObj[_objectKeyArray[i]])){
				dc.eventflow.helperForBindPlugin(Obj, _objectKeyArray[i], i);
			}
		}
	};

	dc.eventflow.matchTriggerEventWithConfigEvents = function(p_index, p_Obj, p_pluginConfigOjb){
		//console.log(p_pluginConfigOjb);
		// Erstelle ein Array aus der event-Value-Angabe aus dem config-Obj
		var eventArray = p_pluginConfigOjb.event.split('|');
		var _retrun = false;
		var _eventType = p_Obj.e.type;
		var _attr_config;
		var _attr_counter;
		// Durchlaufe das Event-Array
		for(var i = 0, leni = eventArray.length; i < leni; i++){
			if(eventArray[i] === _eventType){
				// return true if p_eventType === click || change
				_retrun = true;
			}else if(eventArray[i].split(':')[0].replace('\'', '').replace('"', '') === _eventType){
				// return true if eventArray[i] contains jmtrigger
				_retrun = true;
			}else if('dominit' === _eventType){
				// zählt die data-dcconfig Attribute des Elements
				_attr_counter = dc.helper.attrPrefixCounter(p_Obj.e.target, 'data-dcconfig');
				if(_attr_counter === 1){
					_attr_config = dc.helper.attrPrefix(p_Obj.e.target, 'data-dcconfig');
					if(_attr_config.indexOf('event') !== -1){
						_retrun = dc.eventflow.isEventKeyInDomConfigObj(p_index, p_Obj, 0);
						if(!_retrun){
							_retrun = dc.eventflow.isDominitEvent(eventArray[i]);
						}
					}else{
						_retrun = dc.eventflow.isDominitEvent(eventArray[i]);
					}
				}else if(_attr_counter > 1){
					for(var j = 0, lenj = _attr_counter; j < lenj; j++){
						_attr_config = dc.helper.attrPrefix(p_Obj.e.target, 'data-dcconfig', j);
						if(_attr_config.indexOf('event') !== -1){
							_retrun = dc.eventflow.isEventKeyInDomConfigObj(p_index, p_Obj, j);
							if(!_retrun){
								_retrun = dc.eventflow.isDominitEvent(eventArray[i]);
							}
						}else{
							_retrun = dc.eventflow.isDominitEvent(eventArray[i]);
						}
					}
				}else{
					_retrun = dc.eventflow.isDominitEvent(eventArray[i]);
				}
			}
			if(_retrun) break;
		}
		return _retrun;
	};

	dc.eventflow.isDominitEvent = function(p_event){
		var _return = false;
		var _eventArray = p_event.split('|');
		for(var i = 0, leni = _eventArray.length; i < leni; i++){
			switch(_eventArray[i]){
				case 'dominit':
				case 'blur':
				case 'focus':
				case 'hover':
				case 'init-by-perf':
				case ((p_event.match(/^dc-(.*)/))? p_event : undefined):
				case ((p_event.match(/raf(.*)/))? p_event : undefined):
				case ((p_event.match(/keyup(.*)/))? p_event : undefined):
				case ((p_event.match(/interval(.*)/))? p_event : undefined):
					// return true if p_eventType === dominit && eventArray[i] gleich dominit || raf || blur || focus || hover || match /keyup(.*)/ || match /interval(.*)/
					_return = true;
					break;
				default:
					break;
			}
		}
		return _return;
	};

	dc.eventflow.helperForBindPlugin = function(Obj, p_plugin, index){
		var _index = index || 0;
		var _requirePlugin = dc.helper.returnRequireLoadPlugin(p_plugin);
		if(require.defined(_requirePlugin)){
			dc.eventflow.bindAndExecPlugin(Obj, p_plugin, _index, require.s.contexts._.defined[_requirePlugin]);
		}else{
			require([_requirePlugin], function(pluginObj){
				dc.eventflow.bindAndExecPlugin(Obj, p_plugin, _index, pluginObj);
			});
		}
	};

	dc.eventflow.bindAndExecPlugin = function(Obj, p_plugin, _index, pluginObj){
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
	};

	// Alle anderen Radio-Buttons feuern das jmtrigger-Event, wenn sich in der Gruppe die Selection ändert.
	dc.eventflow.triggerJmtriggerEventForAllOtherRadiosInGroup = function(e){
		var radiogroup, $that;
		if(e.target.tagName.toLowerCase() === 'input'){
			if($(e.target).attr('type') === 'radio'){
				$that = $(e.target);
				radiogroup = $('[name="' + $(e.target).attr('name') + '"]').filter(function(){
					return $(this)[0] !== $that[0];
				});
				radiogroup.each(function(index, item){
					$(item).jmtrigger('change')
				});
			}
		}
	};

	dc.eventflow.isEventKeyInDomConfigObj = function(p_index, p_Obj, p_indexAttr){
		var $elem =  $(p_Obj.e.target);
		var jmconfigJsonParse;
		var _return = false;
		var _multiObj = true;

		// die Daten (entweder Objekt oder bei mehreren Objekten, das Objekt aus dem Array der entsprechenden stelle) werden neu vom jmConfig-Attribut geholt
		jmconfigJsonParse = JSON.parse((dc.helper.attrPrefix($elem[0], 'data-dcconfig', p_indexAttr) || dc.helper.attrPrefix($elem[0], 'data-jmconfig')).replace(/'/g, "\""));

		if($.type(jmconfigJsonParse) === 'object'){
			$.each(jmconfigJsonParse, function(key, value){
				if($.type(value) !== 'object' && $.type(value) !== 'array'){
					_multiObj = false;
					return false;
				}
			});
			$.each(jmconfigJsonParse, function(key, value){
				if(_multiObj && key === p_Obj.jmname){
					if($.type(value) === 'object'){
						if(value.hasOwnProperty('event') && dc.eventflow.isDominitEvent(value.event)){
							_return = true;
							return false;
						}
					}else if($.type(value) === 'array'){
						$.each(value, function(key, array_obj){
							if(array_obj.hasOwnProperty('event') && dc.eventflow.isDominitEvent(array_obj.event)){
								_return = true;
								return false;
							}
						});
					}
					if(_return){
						return false;
					}
				}else if(!_multiObj && (key === 'event') && dc.eventflow.isDominitEvent(value)){
					_return = true;
					return false;
				}
			});
		}else if($.type(jmconfigJsonParse) === 'array'){
			$.each(jmconfigJsonParse, function(key, array_obj){
				if(key === p_index && array_obj.hasOwnProperty('event') && dc.eventflow.isDominitEvent(array_obj.event)){
					_return = true;
					return false;
				}
			});
		}

		return _return;
	};


// form      ************************************************

	// Funktion wird benötigt, um bei mehreren Selects eine Gruppen-Validierung zu ermöglichen.
	dc.form.serviceCheck = function(){
		var $dataRuleGeb = $('[data-rule-jmgeburtsdatumsservice]');
		var $dataRuleKartenGueltigkeit = $('[data-rule-jmkreditkartengueltigkeitsservice]');

		dc.form.submittable = true;

		if($.type($dataRuleGeb) !== 'undefined' && $.type($dataRuleGeb.eq(0).attr('disabled')) !== 'undefined'){
			dc.form.checkSiblingsforjmgeburtsdatumsservice = true; // obsolate nach anpassung von jmgeburtsdatumsservice
		}
		// TODO Andreas hier noch die Anpassungen/Optimierungen von jmgeburtsdatumsservice übernehmen
		if($.type($dataRuleKartenGueltigkeit) !== 'undefined' && $.type($dataRuleKartenGueltigkeit.eq(0).attr('disabled')) !== 'undefined'){
			dc.form.checkSiblingsforjmkreditkartengueltigkeitsservice = true;
		}
	};



// helper     *************************************************

	dc.helper.attrPrefixCounter = function(elem, prefix){
		var _atts = elem.attributes;
		var _attr;
		var _counter = 0;
		for(var i = 0, leni = _atts.length; i < leni; i++){
			_attr = _atts[i].name.match(new RegExp('^'+prefix+'(.*)'));
			if(_attr){
				_counter++;
			}
		}
		return _counter;
	};

	dc.helper.attrPrefix = function(elem, prefix, index){
		var _atts = elem.attributes;
		var _attr;
		var _attr_Array = [];
		var _index = index || 0;
		for(var i = 0, leni = _atts.length; i < leni; i++){
			_attr = _atts[i].name.match(new RegExp('^'+prefix+'(.*)'));
			if(_attr){
				if(_index === 0){
					return elem.getAttribute(_attr[0]);
				}
				_attr_Array.push(elem.getAttribute(_attr[0]));
			}
		}
		return _attr_Array[_index] || undefined;
	};
    
    // Matches dashed string for camelizing
	dc.helper.rmsPrefix = /^-ms-/;
	dc.helper.rdashAlpha = /-([\da-z])/gi;

	// Used by jQuery.camelCase as callback to replace()
	dc.helper.fcamelCase = function( all, letter ) {
		return letter.toUpperCase();
	};
    
    // Convert dashed to camelCase; used by the css and data modules
	// Microsoft forgot to hump their vendor prefix (#9572)
	dc.helper.camelCase = function( string ) {
		return string.replace( dc.helper.rmsPrefix, "ms-" ).replace( dc.helper.rdashAlpha, dc.helper.fcamelCase );
	};

	// Thank you to "Cowboy" Ben Alman. The following code (dc.helper.doTimeout._func) was partial reused form http://benalman.com/projects/jquery-dotimeout-plugin/
	dc.helper.doTimeout = {};
	dc.helper.doTimeout._func = function(jquery_data_key){
		var that = this,
		    elem,
		    data = {},

		    // Allows the plugin to call a string callback method.
		    method_base = jquery_data_key ? $.fn : $,

		    // Any additional arguments will be passed to the callback.
		    args = arguments,
		    slice_args = 4,

		    id        = args[1],
		    delay     = args[2],
		    callback  = args[3];

		if ( typeof id !== 'string' ) {
			slice_args--;

			id        = jquery_data_key = 0;
			delay     = args[1];
			callback  = args[2];
		}

		// If id is passed, store a data reference either as .data on the  first
		// element in a jQuery collection, or in the internal cache.
		if ( jquery_data_key ) { // Note: key is 'doTimeout' + id

			// Get id-object from the first element's data, otherwise initialize it to {}.
			elem = that.eq(0);
			elem.data( jquery_data_key, data = elem.data( jquery_data_key ) || {} );

		} else if ( id ) {
			// Get id-object from the cache, otherwise initialize it to {}.
			data = dc.helper.doTimeout._cache[ id ] || ( dc.helper.doTimeout._cache[ id ] = {} );
		}

		// Clear any existing timeout for this id.
		data.id && clearTimeout( data.id );
		delete data.id;

		// Clean up when necessary.
		function cleanup() {
			if ( jquery_data_key ) {
				elem.removeData( jquery_data_key );
			} else if ( id ) {
				delete dc.helper.doTimeout._cache[ id ];
			}
		}

		// Yes, there actually is a setTimeout call in here!
		function actually_setTimeout() {
			data.id = setTimeout( function(){ data.fn(); }, delay );
		}

		if ( callback ) {
			// A callback (and delay) were specified. Store the callback reference for
			// possible later use, and then setTimeout.
			data.fn = function( no_polling_loop ) {

				// If the callback value is a string, it is assumed to be the name of a
				// method on $ or $.fn depending on where doTimeout was executed.
				if ( typeof callback === 'string' ) {
					callback = method_base[ callback ];
				}

				callback.apply( that, dc.helper.doTimeout._aps.call( args, slice_args ) ) === true && !no_polling_loop

					// Since the callback returned true, and we're not specifically
					// canceling a polling loop, do it again!
					? actually_setTimeout()

					// Otherwise, clean up and quit.
					: cleanup();
			};

			// Set that timeout!
			actually_setTimeout();

		} else if ( data.fn ) {
			// No callback passed. If force_mode (delay) is true, execute the data.fn
			// callback immediately, continuing any callback return-true polling loop.
			// If force_mode is false, execute the data.fn callback immediately but do
			// NOT continue a callback return-true polling loop. If force_mode is
			// undefined, simply clean up. Since data.fn was still defined, whatever
			// was supposed to happen hadn't yet, so return true.
			delay === undefined ? cleanup() : data.fn( delay === false );
			return true;

		} else {
			// Since no callback was passed, and data.fn isn't defined, it looks like
			// whatever was supposed to happen already did. Clean up and quit!
			cleanup();
		}

	};
	dc.helper.doTimeout._cache = {};
	dc.helper.doTimeout._aps = Array.prototype.slice;

	dc.helper.getNextItemFromArray = function(p_item, p_array){
		var index = _.indexOf(p_array, p_item);
		var returnItem;
		if(index !== -1 && $.type(p_array[index+1]) !== 'undefined'){
			returnItem = p_array[index+1];
		}
		return returnItem;
	}

	dc.helper.setDevicePerfForParallax = function(){
		/*if(Modernizr.mq('only screen and (min-width : 60em)')){
			window.dc.perf = window.dc.perf || 3;
			return;
		}*/
		//alert(navigator.userAgent);
		if(window.dc.client.userOS === 'Android'){
			switch(true){
				case parseInt(dc.client.userOSver.charAt(0), 10) > 4:
				case /LG-D855/i.test(navigator.userAgent):      // LG G3
				case /Nexus 7/i.test(navigator.userAgent):      // Nexus 7
				case /GT-I9505/i.test(navigator.userAgent) && /Chrome\/4/i.test(navigator.userAgent):   // Samsung G 4 && Chrome >= 30
				case /GT-N7100/i.test(navigator.userAgent) && /Chrome\/4/i.test(navigator.userAgent):   // Samsung Galaxy Note 2 && Chrome >= 30
				case /Nexus Build/i.test(navigator.userAgent) && /Chrome\/4/i.test(navigator.userAgent):   // Samsung Galaxy Note 2 && Chrome >= 30
				case /GT-I9300/i.test(navigator.userAgent) && /Chrome\/4/i.test(navigator.userAgent):   // Samsung Galaxy S3 && Chrome >= 30
					window.dc.perf.level = ($.type(window.dc.perf.level) !== 'undefined') ? window.dc.perf.level : 1;
					break;
				default:
					window.dc.perf.level = ($.type(window.dc.perf.level) !== 'undefined') ? window.dc.perf.level : 0;
			}
		}else if(window.dc.client.userOS === 'iOS'){
			if(window.devicePixelRatio >= 2 || parseInt(window.dc.client.userOSver.split('.'), 10) < 8){
				window.dc.perf.level = ($.type(window.dc.perf.level) !== 'undefined') ? window.dc.perf.level : 3;
			}else{
				switch(true){
					case /iPhone/i.test(navigator.userAgent):
						window.dc.perf.level = ($.type(window.dc.perf.level) !== 'undefined') ? window.dc.perf.level : 0;
						break;
					default:
						window.dc.perf.level = ($.type(window.dc.perf.level) !== 'undefined') ? window.dc.perf.level : 1;
						break;
				}
			}
		}else{
			window.dc.perf.level = ($.type(window.dc.perf.level) !== 'undefined') ? window.dc.perf.level : 4;
		}
	};

	dc.helper.checkOrientationAndTriggerDcResize = function(){
		if(window.dc.client.orientation === 'w' && (window.innerHeight > window.innerWidth)){
			window.dc.client.orientation = 'p';
			$body.trigger('dc-orientationchange');
		}else if(window.dc.client.orientation === 'p' && (window.innerHeight < window.innerWidth)){
			window.dc.client.orientation = 'w';
			$body.trigger('dc-orientationchange');
		}
		if((window.dc.client.userOS !== 'iOS') && (window.dc.client.userOS !== 'Android')){
			$body.trigger('dc-resizeondesktop');
		}
		$body.trigger('dc-resize');
		//dc.client.setDeviceState();
	};

	dc.helper.createModal = function(html, isNotCloseable, autoOpen, removeAfterClose){
        var _notAutoOpen = (!autoOpen || undefined);
		var _modalControl = $('<div style="display: none" href="#'+ Math.round(Math.random()*1000000000000) +'" data-jmname="modal-create-by-function">'+ html +'</div>');
		var _attrValue = '';
        $body.append(_modalControl);
        if($.type(html) !== 'undefined'){
            _attrValue = "{ 'event': 'dominit'";
            if(_notAutoOpen){
                _attrValue = _attrValue + ", 'notAutoOpen': 'true'";   
            }
            if(isNotCloseable){
                _attrValue = _attrValue + ", 'notCloseable': true";    
            }
            if(removeAfterClose){
                _attrValue = _attrValue + ", 'removeAfterClose': true";
            }
            _attrValue = _attrValue + " }"
            _modalControl.attr('data-dcconfig--modal-create-by-function--modules.modal', _attrValue);
        }
		dc.eventflow.eventDelegationTriggerForDomInit.call(_modalControl[0], $.Event('dominit', { target: _modalControl[0]}));
		return _modalControl;
	};

	// wird nirgendwo verwendet

	//dc.helper.contains = function(a, obj){
	//	var i = a.length;
	//	while (i--) {
	//		if (a[i] === obj) {
	//			return true;
	//		}
	//	}
	//	return false;
	//};

	dc.helper.countProperties =  function(obj){
		var count = 0;
		for(var property in obj){
			if(obj.hasOwnProperty(property)){
				count += 1;
			}
		}
		return count;
	};

	// extend the ajax-function with the progressUpload and progress funktions
	dc.helper.addXhrProgressEvent = function() {
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

	// gibt das original-Plugin zurück. Funktion dient zur Modulidentifikation. Es  wird dann von requireJS geladen
	dc.helper.returnRequireLoadPlugin = function(p_plugin){
		if(p_plugin.indexOf('_') !== -1){
			p_plugin = p_plugin.split('_')[0];
		}
		return p_plugin;
	};

	// Auslesen der Scrollposition des Browsers
	dc.helper.getScrollPos = function(){
		return ($.type(window.pageYOffset) === "number") ? window.pageYOffset : document.documentElement.scrollTop;
	};

	dc.helper.hasClass = function(elem, selector){
		return (" " + elem.className + " ").replace(/[\t\r\n\f]/g, " ").indexOf(" " + selector + " ") >= 0
	};

	dc.helper.scrollToPosition = function(pos, speed){
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

	dc.helper._scrollToTopInProgress = false;

	// http://shebang.brandonmintern.com/foolproof-html-escaping-in-javascript/
	// Use the browser's built-in functionality to quickly and safely escape the
	// string
	dc.helper.escapeHtml = function (str) {
		var div = document.createElement('div');
		div.appendChild(document.createTextNode(str));
		return div.innerHTML;
	};

	dc.helper.transformSupport = function(value) {
		var element = document.createElement('div');
		var propertySupport = false;
		var propertyValue = null;
		var featureSupport = false;
		var cssProperty = null;
		var jsProperty = null;
		for (var i = 0, l = window.dc.client.vendors.length; i < l; i++) {
			if (window.dc.client.vendors[i] !== null) {
				cssProperty = window.dc.client.vendors[i][0] + 'transform';
				jsProperty = window.dc.client.vendors[i][1] + 'Transform';
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

	dc.helper.triggerRadioChangeOnAllRadiosInGroup = function(e){
		$('[name="' + $(e.target).attr('name') + '"]').each(function(index, item){
			$(item).jmtrigger('radiochange')
		});
	};
    
	dc.helper.uuID = function() {};

	/**
	 * The simplest function to get an UUID string.
	 * @returns {string} A version 4 UUID string.
	 */
	dc.helper.uuID.generate = function() {
		var rand = dc.helper.uuID._gri, hex = dc.helper.uuID._ha;
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
	dc.helper.uuID._gri = function(x) { // _getRandomInt
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
	dc.helper.uuID._ha = function(num, length) {  // _hexAligner
		var str = num.toString(16), i = length - str.length, z = "0";
		for (; i > 0; i >>>= 1, z += z) { if (i & 1) { str = z + str; } }
		return str;
	};




// modulPreloader  *****************************************

	dc.modulPreloader.helperForRequirementsForJmPlugins = function(jmname){
		var _configObj = dc.eventflow.getConfigObj(jmname);
		if($.type(_configObj) === 'undefined'){
			dc.dev.error('Die Funktionalität beschrieben mit data-jmname="'+jmname+'" wurde nicht in der describer.js hinterlegt');
			return;
		}
        _.each(_configObj, function (value, prop) {
            require([dc.helper.returnRequireLoadPlugin(prop)], function(){});
        });
	};

// pointer     ***********************************************

	// Thank you to the filamentgroup. The following code was partial reused form https://github.com/filamentgroup/tappy/
	dc.pointer._tapHandling = false;

	dc.pointer.scrollTolerance = 10;

	dc.pointer.start =  function(e){
		if( e.touches && e.touches.length > 1 || e.targetTouches && e.targetTouches.length > 1 ){
			return false;
		}

		var coords = dc.pointer.getCoords( e );
		window.dc.pointer._startX = coords[ 0 ];
		window.dc.pointer._startY = coords[ 1 ];
	};

	dc.pointer.getCoords = function(e){
		var ev = e.originalEvent || e,
		    touches = ev.touches || ev.targetTouches;

		if( touches ){
			return [ touches[ 0 ].pageX, touches[ 0 ].pageY ];
		}
		else {
			return null;
		}
	};

	// any touchscroll that results in > tolerance should cancel the tap
	dc.pointer.move = function(e){
		if( !window.dc.pointer.cancel ){
			var coords = dc.pointer.getCoords( e );
			if( coords && ( Math.abs( window.dc.pointer._startY - coords[ 1 ] ) > dc.pointer.scrollTolerance || Math.abs( window.dc.pointer._startX - coords[ 0 ] ) > dc.pointer.scrollTolerance ) ){
				window.dc.pointer.cancel = true;
			}
		}
	};
	//
	dc.pointer.end = function(e){
		clearTimeout( window.dc.pointer.resetTimer );
		window.dc.pointer.resetTimer = setTimeout( function(){
			dc.pointer._tapHandling = false;
			window.dc.pointer.cancel = false;
		}, 1000 );

		// make sure no modifiers are present. thx http://www.jacklmoore.com/notes/click-events/
		if( ( e.which && e.which > 1 ) || e.shiftKey || e.altKey || e.metaKey || e.ctrlKey ){
			return;
		}

		e.preventDefault();

		// this part prevents a double callback from touch and mouse on the same tap

		// if a scroll happened between touchstart and touchend
		if( window.dc.pointer.cancel || dc.pointer._tapHandling && dc.pointer._tapHandling !== e.type ){
			window.dc.pointer.cancel = false;
			return;
		}

		dc.pointer._tapHandling = e.type;
		$(this).trigger('dcpointer');
	};




	// ***************** jQuery-Helperplugins ****************************


	// Initialisierung des Plugins aus dem Objekt an das Element



	$.doTimeout = function() {
		return dc.helper.doTimeout._func.apply( window, [ 0 ].concat( dc.helper.doTimeout._aps.call( arguments ) ) );
	};

	$.plugin = function(name, object){
		$.fn[name] = function(options){
			return this.each(function(){ // für jedes Element in der Selection, an die der Funktionsaufruf angehangen wird.
				if(!$.data(this, name)){
					$.data(this, name, Object.create(object).init(options, this));
				}
			});
		};
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

	$.fn.doTimeout = function() {
		var args = dc.helper.doTimeout._aps.call( arguments ),
		    result = dc.helper.doTimeout._func.apply( this, [ 'doTimeout' + args[0] ].concat( args ) );

		return typeof args[0] === 'number' || typeof args[1] === 'number'
			? this
			: result;
	};

	// Überprüfung, ob ein Element existiert
	$.fn.doesExist = function(){
		return $(this).length > 0;
	};
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

	$.fn.removePlugins = function () {
		this.off('keyup', '**')
			.off('blur', '**')
			.off('focus', '**')
			.off('mouseover', '**')
			.removeClassRegExp(/^JSINIT-/)
			.removeData();
	};

	// sucht die benötigten AMD-Module für die nun im DOM existierenden Tags raus und läd sie schon mal vorab via require([_requirePlugin]).
	$.fn.requirementsForJmPlugins = function(){
		return this.each(function(){
			var $elem = $(this);
			$elem.find('[data-jmname]').addBack('[data-jmname]').each(function(index, item){
				var $item = $(item);
				var _jmname = (($item.data('jmname')).indexOf(' ') !== -1) ? $item.data('jmname').trim().split(' ') : $item.data('jmname').trim().split('|');
				for(var i = 0, leni = _jmname.length; i < leni; i++){
					dc.modulPreloader.helperForRequirementsForJmPlugins(_jmname[i]);
				}
			});
		});
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

	// Thank you to "madrobby" Thomas Fuchs. The following code ($.fn.scrollToTop) was partial reused form https://gist.github.com/madrobby/8507960
	$.fn.scrollToTop = function(position){
		var $this = this;
		var $body = $('body');
		var targetY = Math.round(position) || 0;
		var initialY = $this.scrollTop();
		var lastY = initialY;
		var delta = targetY - initialY;// duration in ms, make it a bit shorter for short distances
		// this is not scientific and you might want to adjust this for
		// your preferences
		var speed = Math.min(750, Math.min(1500, Math.abs(initialY - targetY)));// temp variables (t will be a position between 0 and 1, y is the calculated scrollTop)
		var start;
		var t;
		var y;
		// use requestAnimationFrame or polyfill
		var frame = window.requestAnimationFrame;
		var cancelScroll = function(){
			abort();
		};

		// abort if already in progress or nothing to scroll
		if(dc.helper._scrollToTopInProgress){
			return;
		}

		// quint ease-in-out smoothing, from
		// https://github.com/madrobby/scripty2/blob/master/src/effects/transitions/penner.js#L127-L136
		function smooth(pos){
			if((pos /= 0.5) < 1){
				return 0.5 * Math.pow(pos, 5);
			}
			return 0.5 * (Math.pow((pos - 2), 5) + 2);
		}

		function abort(){
			$this.off('touchstart', cancelScroll);
			dc.helper._scrollToTopInProgress = false;
			$body.trigger('dc-scrollEnd');
		}

		// when there's a touch detected while scrolling is in progress, abort
		// the scrolling (emulates native scrolling behavior)
		$this.on('touchstart', cancelScroll);
		dc.helper._scrollToTopInProgress = true;

		// start rendering away! note the function given to frame
		// is named "render" so we can reference it again further down
		frame(function render(now){
			if(!dc.helper._scrollToTopInProgress){
				return;
			}
			if(!start){
				start = now;
			}
			// calculate t, position of animation in [0..1]
			t = Math.min(1, Math.max((now - start) / speed, 0));
			// calculate the new scrollTop position (don't forget to smooth)
			y = Math.round(initialY + delta * smooth(t));
			// bracket scrollTop so we're never over-scrolling
			if(delta > 0 && y > targetY){
				y = targetY;
			}
			if(delta < 0 && y < targetY){
				y = targetY;
			}
			// only actually set scrollTop if there was a change fromt he last frame
			if(lastY != y){
				$this.scrollTop(y);
			}
			lastY = y;
			// if we're not done yet, queue up an other frame to render,
			// or clean up
			(y !== targetY) ? frame(render) : abort();
		})
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

});