/*!
 * utils.helpers v0.9
 *
 * http://joinmedia.de/
 *
 * Copyright (c) 2014 join.media GmbH & Co. KG
 *
 * Created by aotten77 on 22.08.2014.
 *
 * Released under the MIT license
 */
define(['jquery', '_config'], function($, _config){
	/*'jquery', 'spinner', 'transit', 'doTimeout', 'jquery.whenMutation', 'jquery.scrolltotop'*/
	// Globales Objekt
	window.jmHF = window.jmHF || {};
	window.jmGO = window.jmGO || {};

	jmHF.alert = function(p_data){
		if(window.debug){
			window.alert(p_data);
		}
	};

	jmHF.log = function(p_data){
		if(window.debug){
			window.console.log(p_data);
		}
	};

	jmHF.error = function(p_data){
		if(window.debug){
			window.console.trace('%cJM \n ->'+p_data+'', 'color: red; font-style: italic');
			$.doTimeout('jmHF.error', 200, function(){
				jmHF.alert('Fehler! siehe Console JM ->');
			});
		}
	};

	jmHF.warn = function(p_data){
		if(window.debug){
			window.console.trace('%cJM \n ->'+p_data+'', 'color: orange; font-style: italic');
			$.doTimeout('jmHF.warn', 200, function(){
				jmHF.alert('Warnung! siehe Console JM ->');
			});
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
					case 'raf':
					case 'blur':
					case 'focus':
					case 'hover':
						//alert('noregex');
						break;
					case ((_eventsArray[m].match(/keyup(.*)/))? _eventsArray[m] : undefined):
					case ((_eventsArray[m].match(/interval(.*)/))? _eventsArray[m] : undefined):
						if(_dataJmnameElemente.eq(i).attr('data-jmdominit') !== 'true'){
							console.group();
							console.log('%cJM -> Das Element ...', 'color: red; font-style: italic');
							console.log(_dataJmnameElemente.eq(i)[0]);
							console.log('%c ... benötigt ein data-jmdominit="true" Attribut!', 'color: red; font-style: italic');
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
			jmHF.bindPlugin({ '$element': $this, 'jmname': _jmname[i], 'plugin': jmHF.getJmPluginByJmName(_config, _jmname[i]), 'e': e, 'e_param': param });
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
		if($.type(Obj.plugin) === 'undefined'){
			return;
		}
		_pluginArray = Obj.plugin.split('|');
		for (var i = 0, leni = _pluginArray.length; i < leni; i++) {
		    // indexOf() ist ein method nur für StringObject nicht für ObjectArray, diese Funktioniert Ausnahmeweise unter neue Browser aber nicht unter Alte Browser wie IE8
		    //if (_pluginArray.indexOf(_pluginArray[i]) !== _pluginArray.lastIndexOf(_pluginArray[i])) { 
		    if (_pluginArray.join(' ').indexOf(_pluginArray[i]) !== _pluginArray.join(' ').lastIndexOf(_pluginArray[i])) {
				jmHF.error('Bei der mehrfachen Anwendung vom selben-Plugin im jmplugin-String sind diese mit ..._1|..._2 usw. zu benennen.');
			}
			jmHF.helperForBindPlugin(Obj, _pluginArray[i], i);
		}
	};

	jmHF.helperForBindPlugin = function(Obj, p_plugin, index){
		var _index = index || 0;
		var _requirePlugin = jmHF.returnRequireLoadPlugin(p_plugin);
		require([_requirePlugin], function(pluginObj){
			var _elem;
			// hier wird getestet, ob das Element schon eine Instanz des Plugins besitzt.
			if($.type(Obj.$element.data(p_plugin)) === 'undefined' || ($.type(Obj.$element.data(p_plugin)) !== 'undefined' && Obj.$element.hasClass('JSINIT-'+ Obj.jmname + '-EL-' + p_plugin)) || ($.type(Obj.$element.data(p_plugin+'-for-'+Obj.jmname)) !== 'undefined' && !Obj.$element.hasClass('JSINIT-'+ Obj.jmname + '-EL-' + p_plugin))){
				// Das Element hat noch keine Instanz von dem Plugin

				// Ist das Plugin noch nicht erstellt wird es mit dem name des jmplugins und dem Objekt des OrginalPlugins erstellt.
				// Dies ist der Fall, wenn z.B. mehrmals das gleiche Plugins auf das Element angewendet wird.
				// Das Plugin ist dann mit "pluginName"+"_1" und "pluginName"+"_2" der Fall,
				// oder wenn eine Plugin mit unterschiedlichen Namen (z.B. symbolische Name wie action.toggle -> navi wird) initialisiert werden kann.
				if($.type($.fn[p_plugin]) === 'undefined'){
					$.plugin(p_plugin, pluginObj);
				}
				// hier wird überprüft, ob es schon eine jQuery-Instanz gibt.
				if(!Obj.$element.hasClass('JSINIT-'+ Obj.jmname + '-EL-' + p_plugin)){
					// Das Plugin wird auf das Element angewendet. Es werden pluginName und pos als Options übergeben.
					Obj.$element[p_plugin]({ jmname: Obj.jmname, pluginName: p_plugin, pos: _index });
				}
				_elem = Obj.$element.data(p_plugin);
			}else{
				// Das Element hat schon mindestens Instanz von dem Plugin
				if($.type($.fn[p_plugin+'-for-'+Obj.jmname]) === 'undefined'){
					$.plugin(p_plugin+'-for-'+Obj.jmname, pluginObj);
				}
				// hier wird überprüft, ob es schon eine jQuery-Instanz gibt.
				if(!Obj.$element.hasClass('JSINIT-'+ Obj.jmname + '-EL-' + p_plugin)){
					// Das Plugin wird auf das Element angewendet. Es werden pluginName und pos als Options übergeben.
					Obj.$element[p_plugin+'-for-'+Obj.jmname]({ jmname: Obj.jmname, pluginName: p_plugin, pos: _index });
				}
				_elem = Obj.$element.data(p_plugin+'-for-'+Obj.jmname);
			}

			// if event !== undefined && event.type !== undefined && ist die Plugin-Methode !== undefined
			if(($.type(Obj.e) !== 'undefined') && ($.type(Obj.e.type) !== 'undefined') && $.type(_elem[Obj.e.type]) !== 'undefined'){
				_elem[Obj.e.type](Obj.e, Obj.e_param);
			}
		});
	};


	jmHF.helperForRequirementsForJmPlugins = function(_config, jmname){
		var _requirePlugin;
		var _jmpluginString = jmHF.getJmPluginByJmName(_config, jmname);
		if($.type(_jmpluginString) === 'undefined'){
			jmHF.error('Die Funktionalität beschrieben mit data-jmname="'+jmname+'" wurde nicht in der _config.js hinterlegt');
			return;
		}
		if(_jmpluginString.split('|').length > 1){
			$.each(_jmpluginString.split('|'), function(index, innerItem){
				_requirePlugin = jmHF.returnRequireLoadPlugin(innerItem);   //actions.toggle|actions.link
				require([_requirePlugin], function(){});
			});
		}else{
			_requirePlugin = jmHF.returnRequireLoadPlugin(_jmpluginString);
			require([_requirePlugin], function(){});
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
					$(item).trigger('jmtrigger');
				});
			}
		}
	};

	jmHF.getJmPluginByJmName = function(p_config, p_name){
		var i = 0;
		var _length = p_config.length;
		for(; i < _length; i++){
			if(p_config[i].jmname === p_name){
				return p_config[i].jmplugin;
			}
		}
	};

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

	jmHF.replaceSVGForOldBrowser = function(){
		if(!(!!document.createElementNS && !!document.createElementNS('http://www.w3.org/2000/svg', 'svg').createSVGRect)){
			var _svgImages = $('img[src*=".svg"]');
			for(var i = 0, leni = _svgImages.length; i < leni; i++){
				_svgImages.eq(i).attr('src', _svgImages.eq(i).attr('src').replace('.svg', '.png'));
			}
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

	// vim: et ts=2 sw=2

});