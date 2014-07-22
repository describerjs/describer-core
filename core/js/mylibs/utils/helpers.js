define(['jquery'], function($){
	/*'jquery', 'spinner', 'transit', 'doTimeout', 'jquery.whenMutation', 'jquery.scrolltotop'*/
	// Globales Objekt
	window.jmHF = window.jmHF || {};
	window.jmGO = window.jmGO || {};

	jmHF.log = function(p_data){
		if(window.IsDevServer){
			window.console.log(p_data);
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
		// TODO hier noch die Anpassungen/Optimierungen von jmgeburtsdatumsservice übernehmen
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
				console.warn('Bei der mehrfachen Anwendung vom selben-Plugin im jmelement-String sind diese mit ..._1|..._2 usw. zu benennen.');
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

				// Ist das Plugin noch nicht erstellt wird es mit dem name des jmelements und dem Objekt des OrginalPlugins erstellt.
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
				_elem[Obj.e.type](Obj.e);
			}
			// wird mit dem Objekt ein Callback übergeben, wird dieser ausgeführt.
			if($.type(Obj.callback) !== 'undefined'){
				Obj.callback.call(this);
			}
		});
	};


	jmHF.helperForRequirementsForJmElements = function(_config, jmname){
		var _requirePlugin;
		var jmelementString = jmHF.getJmElementByJmName(_config, jmname);
		if(jmelementString.split('|').length > 1){
			$.each(jmelementString.split('|'), function(index, innerItem){
				_requirePlugin = jmHF.returnRequireLoadPlugin(innerItem);   //actions.toggle|actions.link
				require([_requirePlugin], function(){});
			});
		}else{
			_requirePlugin = jmHF.returnRequireLoadPlugin(jmelementString);
			require([_requirePlugin], function(){});
		}
	};


	// Jeder Radio-Butten feuert das Change-Event, wenn sich in der Gruppe die Selection ändert.
	jmHF.triggerChangeEventForAllRadiosInGroup = function(e){
		var radiogroup, $that;
		if(e.target.tagName.toLowerCase() === 'input'){
			if($(e.target).attr('type') === 'radio'){
				$that = $(e.target);
				radiogroup = $('[name="' + $(e.target).attr('name') + '"]').filter(function(){
					return $(this) !== $that;
				});
				radiogroup.each(function(index, item){
					$(item).trigger('change');
				});
			}
		}
	};

	jmHF.getJmElementByJmName = function(p_config, p_name){
		var i = 0;
		var _length = p_config.length;
		for(; i < _length; i++){
			if(p_config[i].jmname === p_name){
				return p_config[i].jmelement;
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

	// UNSAFE with unsafe strings; only use on previously-escaped ones!
	/*jmHF.unescapeHtml = function (escapedStr) {
		var div = document.createElement('div');
		div.innerHTML = escapedStr;
		var child = div.childNodes[0];
		return child ? child.nodeValue : '';
	};*/



	// Kreiert einen Spinner auf dem übergebenen Target
	/*jmHF.addOnlySpinnerToTarget = function(p_$target) {
		p_$target.spin({
			lines: 7, // The number of lines to draw
			length: 0, // The length of each line
			width: 5, // The line thickness
			radius: 10, // The radius of the inner circle
			corners: 1, // Corner roundness (0..1)
			rotate: 2, // The rotation offset
			direction: 1, // 1: clockwise, -1: counterclockwise
			color: '#000', // #rgb or #rrggbb or array of colors
			speed: 1.5, // Rounds per second
			trail: 86, // Afterglow percentage
			shadow: false, // Whether to render a shadow
			hwaccel: false, // Whether to use hardware acceleration
			className: 'spinjsspinner', // The CSS class to assign to the spinner
			zIndex: 99, // The z-index (defaults to 2000000000)
			top: 'auto', // Top position relative to parent in px
			left: 'auto' // Left position relative to parent in px
		});
	};*/

	// Kreiert einen Spinner mit Layer auf dem übergebenen Target
	/*jmHF.addSpinnerToTarget = function(p_$target, p_id) {
		var $targetElem = p_$target;
		var spinnerDiv = $('<div data-jmspinnerid="' + p_id + '" class="spinnenrlayer" style="z-index:99; min-height: 22px; opacity: 0; position: absolute; background-color:#fff; left: ' + (parseInt($targetElem.offset().left, 10) + parseInt($targetElem.css('margin-left'), 10)) + 'px; top: ' + (parseInt($targetElem.offset().top, 10) + parseInt($targetElem.css('margin-top'), 10)) + 'px; height:' + $targetElem.outerHeight() + 'px; width: ' + $targetElem.outerWidth() + 'px;">').hide().fadeIn();
		$('body').append(spinnerDiv);
		spinnerDiv.transition({
			opacity: 0.7
		}, 300, 'ease');
		jmHF.addOnlySpinnerToTarget(spinnerDiv);
		if (spinnerDiv.height() > $(window).height()) {
			spinnerDiv.find('.spinjsspinner').eq(0).css('top', $(window).height() / 2);
		}
	};*/

	// Löscht einen Spinner mit Layer auf dem übergebenen Target
	/*jmHF.removeSpinnerFromTarget = function(p_$target, p_id, p_time) {
		var time = $.type(p_time !== 'undefined') ? p_time : 400;
		var $targetElem = p_$target;
		$('div.spinnenrlayer[data-jmspinnerid="' + p_id + '"]').transition({
			opacity: 0
		}, p_time, 'ease').doTimeout(p_time, function() {
			$(this).remove();
		});
	};*/

	// Kreiert einen Spinner mit Layer auf dem Body-Tag
	/*jmHF.addSpinnerToBody = function(p_removetime) {
		var spinnerDiv = $('<div data-jmelement="jmMask" id="linkspinner" style="display: block; z-index: 996; background-color: rgba(0, 0, 0, 0.5); width: 100%; height: 100%; position: fixed; left: 0px; top: 0px; opacity: 0"></div>');
		$('body').append(spinnerDiv);
		spinnerDiv.transition({
			opacity: 1
		}, 500, 'ease');
		spinnerDiv.spin({
			lines: 15, // The number of lines to draw
			length: 0, // The length of each line
			width: 10, // The line thickness
			radius: 60, // The radius of the inner circle
			corners: 1, // Corner roundness (0..1)
			rotate: 0, // The rotation offset
			direction: 1, // 1: clockwise, -1: counterclockwise
			color: '#000', // #rgb or #rrggbb or array of colors
			speed: 1, // Rounds per second
			trail: 72, // Afterglow percentage
			shadow: false, // Whether to render a shadow
			hwaccel: false, // Whether to use hardware acceleration
			className: 'spinner', // The CSS class to assign to the spinner
			zIndex: 2e9, // The z-index (defaults to 2000000000)
			top: 'auto', // Top position relative to parent in px
			left: 'auto' // Left position relative to parent in px
		});
		if (spinnerDiv.height() > $(window).height()) {
			spinnerDiv.find('.spinjsspinner').eq(0).css('top', $(window).height() / 2);
		}

		if($.type(p_removetime) !== 'undefined'){
			// FadeOut
			setTimeout(function(){
				spinnerDiv.transition({
					opacity: 0
				}, 500, 'ease');
			}, p_removetime);
			// Remove
			setTimeout(function(){
				spinnerDiv.remove();
			}, p_removetime + 500);
		}
		
	};*/

	// Kreiert einen Div-Element nach dem übergebenen Element, mit den Klassen 'switch' für die Schalter-Optik und 'needsclick' um FastClick.js auf diesem Element zu deakivieren (ist andernfalls Fehlerhaft). 
	/*jmHF.createSwitch = function($elem) {
		$('<div/>', {
			'class': 'switch needsclick'
		}).insertAfter($elem);
	};*/

	// Positioniert das übergebende Element mittig auf dem Display
	/*jmHF.centerElement = function(p_elem) {
		var _elemheight = p_elem.height();
		var _windowHeigth = $(window).height();
		var _elemWidth = p_elem.width();
		var _windowWidth = $(window).width();
		var _windowScrollTop = $(window).scrollTop();
		var _windowScrollLeft = $(window).scrollLeft();
		p_elem.css('top', (_windowHeigth - _elemheight) / 2 + _windowScrollTop + "px");
		p_elem.css('left', (_windowWidth - _elemWidth) / 2 + _windowScrollLeft + "px");
	};*/

	// Bugfix für jmHF.centerElement, da es auf dem Layer in Position-Left nicht korrekt funktioniert.
	/*jmHF.centerLayer = function(p_elem) {
		var _elemheight = p_elem.height();
		var _windowHeigth = $(window).height();
		var _elemWidth = p_elem.width();
		var _windowWidth = $(window).width();
		var _windowScrollTop = $(window).scrollTop();
		var _windowScrollLeft = $(window).scrollLeft();
		if (_elemheight > _windowHeigth) {
			p_elem.css('top', _windowScrollTop + "px");
		} else {
			p_elem.css('top', (_windowHeigth - _elemheight) / 2 + _windowScrollTop + "px");
		}
		p_elem.css('left', '5%');
	};*/

	// bindPlugin
	// Die Funktion verleiht einem Dom-Element spezifische JS-Funktionalitäten, und ruft optional eine eigene Methode
	// auf wie z.B. click, change oder auch domInit auf
	// Obj

	/*jmHF.delayRAF = function(p_func, p_delay){
		setTimeout(function(){
            window.requestAnimationFrame(p_func);
        }, p_delay);
	};*/

	// Es wird zum übergebene Element gescrollt. Optional kann ein offset übergeben werden
	/*jmHF.scrollToElement = function(p_$target, p_delta_offset) {
		var _delta_offset = 0;
		if ($.type(p_delta_offset) === 'number') {
			_delta_offset = p_delta_offset;
		}
		$('body').scrollToTop(p_$target.offset().top + _delta_offset); // $('body, html') html wird nicht supported vom ios
		*/
	/*$('html, body').animate({
				scrollTop: p_$target.offset().top + _delta_offset
			}, 800);*/
	/*
		};*/

	/*jmHF.isMobile = function() {
		return matchMedia('only screen and (max-width: 61.1875em)').matches;
	};*/

	/*jmHF.isTablet = function() {
		return matchMedia('only screen and (min-width: 48em) and (max-width: 61.1875em)').matches;
	};*/

	/*jmHF.initFB = function ($elem, callbackFB, randomString) {
		FB.XFBML.parse($elem, function () {
			$.doTimeout(randomString, 1000, function () {
				if ($.type(callbackFB) !== 'undefined') {
					callbackFB.call(this);
				}
			});
		});
	};*/

	// Anwendung der Get-Parameter, die in der URL hinterlegt wurden. // scrollToId, scrollToAreaEdit, scrollToTBopenId
	/*jmHF.applyUrlVars = function(p_key) {

		var $elem, _urlvar = $.getUrlVar(p_key),
			// sucht den Interaction-Link, der geklickt werden soll.
			_getInteractingElem = function($elem) {
				var $interactingElem;
				if ($elem.find('[data-jmelement="jmInteractionAjaxLink"]').eq(0).doesExist()) {
					$interactingElem = $elem.find('[data-jmelement="jmInteractionAjaxLink"]').eq(0);
				} else if ($elem.find('[data-jmelement="jmGetPartiaViewLink"]').eq(0).doesExist()) {
					$interactingElem = $elem.find('[data-jmelement="jmGetPartiaViewLink"]').eq(0);
				}
				return $interactingElem;
			};

		if ($.type(_urlvar) !== 'undefined') {
			$elem = $('#' + _urlvar);
			if ($elem.doesExist()) {
				switch (p_key) {
				case 'scrollToId':
					jmHF.scrollToElement($elem);
					break;
				case 'scrollToAreaEdit':
					$elem = _getInteractingElem($elem);
					if ($elem.doesExist()) {
						jmHF.bindPlugin({ '$element': $elem, 'plugin': $elem.attr('data-jmelement')});
						$.doTimeout('scrollToAreaEdit', 2000, function() {
							$elem.data($elem.attr('data-jmelement')).click();
						});
					}
					break;
				case 'scrollToTBopenId':
					jmHF.bindPlugin({ '$element': $elem, 'plugin': 'jmToggleboxElem'});
					$.doTimeout('scrollToTBopenId', 1000, function() {
						$elem.data('jmToggleboxElem').open();
					});
					break;
				}
			}
		}
	};*/

	/*jmHF.objLength = function(p_obj){
		return $.map(p_obj, function(n, i) { return i; }).length;
	};*/

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