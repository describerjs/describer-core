define(['_config', 'jquery', 'utils.helpers', 'scrolltotop'], function(_config){
	/*'jquery', 'spinner', 'transit', 'doTimeout', 'jquery.whenMutation', 'jquery.scrolltotop'*/

	// Object.create support test, and fallback for browsers without it
	if(typeof Object.create !== "function"){
		Object.create = function(o){  // http://eloquentjavascript.net/ -> function clone(object) {...}
			function F(){
			}

			F.prototype = o;
			return new F();
		};
	}

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
	$.fn.requirementsForJmElements = function(){
		return this.each(function(){
			var $elem = $(this);
			$elem.find('[data-jmname]').addBack('[data-jmname]').each(function(index, item){
				var $item = $(item);
				var _jmname = $item.data('jmname').split('|');
				for(var i = 0, leni = _jmname.length; i < leni; i++){
					jmHF.helperForRequirementsForJmElements(_config, _jmname[i]);
				}
			});
		});
	};

	// Wenn in den Selektion Element vorkommen, die umgehend Initialisiert werden sollen (ohne User-Events), werden die entsprechenden Funktionen angesprochen.
	$.fn.triggerSelfexecObj = function (p_callback) {
		this.each(function () {
			var $elem = $(this);
			$elem.find('[data-jmdominit="true"]').addBack('[data-jmdominit="true"]').each(function (index, item) {
				$(item).trigger('dominit');
			});
			$elem.find('[data-jmsetelementwithjs]').addBack('[data-jmsetelementwithjs]').each(function (index, item) {
				$(item).trigger('setelementwithjs');
			});
		});
		// TODO modenizr-Weiche integrieren
		/*if (navigator.appVersion.indexOf("MSIE 8.") != -1) {
			this.ie8BugfixForRadioAndCheckbox()
		}*/
		if ($.type(p_callback) !== 'undefined') {
			p_callback.call(this);
		}
		return this;
	};

	// TODO modenizr-Weiche integrieren
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


	$.fn.picturefill = function(){
		var _array = [];
		this.each(function(){
			var $elem = $(this);
			_array = $.merge(_array, $elem.find('picture').addBack('picture').toArray());
		});
		picturefill( {
			elements:_array
		} );
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

	$.fn.scrollToMe = function(p_delta_offset){
		var _delta_offset = 0;
		if ($.type(p_delta_offset) === 'number') {
			_delta_offset = p_delta_offset;
		}
		$('body').scrollToTop($(this).offset().top + _delta_offset);
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


	// Scroll zum mir
	/*$.fn.jmscrollToMe = function(p_delta_offset) {
		var that = this;
		setTimeout(function() {
			var _delta_offset = 0;
			if ($.type(p_delta_offset) === 'number') {
				_delta_offset = p_delta_offset;
			}
			$('body, html').animate({
				scrollTop: that.offset().top + _delta_offset
			}, 800);ollToTop(that.offset().top + _delta_offset); // $('body, html') html wird nicht supported vom ios
		}, 100);
			//$('body').scr

		return that;
	};*/

	/*$.fn.jmSoothReplace = function(p_data, p_callback) {
		var that = this;
		var $that = $(this);
		var totalHeight = $(this).outerHeight();
		window.requestAnimationFrame(function(){
			$that
				.css('height', totalHeight+'px')
				.empty()
				.html(p_data)
				.removeAttr('style');
				window.requestAnimationFrame(function(){
					if($.type(p_callback) !== 'undefined'){
						p_callback.call(that);
					}
				});
			//.html(p_data);
			*/
	/*window.requestAnimationFrame(function(){
					$that
						.removeAttr('style')
						.removeClass('hidden')
						.addClass('visible');
					if($.type(p_callback) !== 'undefined'){
						p_callback.call(that);
					}
				});*/
	/*

			});
			return this;
		};*/



	/*$.fn.changeAttrAndWaitForCallback = function(name, value, callback){
		this.whenMutation({
			'attrChange': true,
			'_attr':{
				key: name,
				value: value
			}
		}, function() {
			callback.call(this);
		});
		this.attr(name, value);
		return this;
	};*/

	/*$.fn.whenAddedClassInDom = function(value, callback){
		this.whenMutation({
			'classChange': true,
			'_class': value
		}, function() {
			callback.call(this);
		});
		return this;
	};*/

	/*$.fn.parseFB = function (callbackFB, randomString) {
		return this.each(function () {
			try {
				jmHF.initFB($(this)[0], callbackFB, randomString);
			} catch (ex) {

			}
		});
	};*/

	/*$.fn.parseSingleFBElement = function (callbackFB) {
		try {
			FB.XFBML.parse(this[0], function () {
				if ($.type(callbackFB) !== 'undefined') {
					callbackFB.call(this);
				}});
		} catch (ex) {

		}
		return this;
	};*/

	/*$.fn.clearForm = function () {
		return this.each(function () {
			$(this).find('input[type="text"], input[type="email"], input[type="hidden"], textarea').each(function () {
				$(this).val('');
			}).end().find('input[type="checkbox"]').prop('checked', false);
		});
	};*/

	// gibt die Value der URL-Variable zurück
	/*$.extend({
		getUrlVars: function() {
			var vars = [],
				hash;
			var hashes = window.location.href.slice(window.location.href.indexOf('?') + 1).split('&');
			for (var i = 0; i < hashes.length; i++) {
				hash = hashes[i].split('=');
				vars.push(hash[0]);
				vars[hash[0]] = hash[1];
			}
			return vars;
		},
		getUrlVar: function(name) {
			return $.getUrlVars()[name];
		}
	});*/

});