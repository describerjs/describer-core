define(['jquery', '_config', 'jquery.helpers', 'helpers'], function ($, _config) {
    'use strict';
	return {
        config : function(){
            //this.myPos = ($.type(this.$elem.data('jmname')) !== 'undefined') ? 0 : this.pos;
	        this.myPos = this.pos;
	        this.myJmName = this.jmname;
	        this.myJmNamePos = $.inArray(this.myJmName, this.$elem.data('jmname').split('|'));
	        this.waited = false;
	        this.$elem.addClass('JSINIT-' +this.myJmName +'-EL-'+  this.name);
        },

		click: function(){
			if(this.includes('event', 'click') && this.is('condition')){
				this._exec();
			}
		},

		change: function(){
			if(this.includes('event', 'change') && this.is('condition')){
				this._exec();
			}
		},

		submit: function(){
			if(this.includes('event', 'submit') && this.is('condition')){
				this._exec();
			}
		},

		dominit: function(){
			var that = this;
			if(this.includes('event', 'dominit') && this.is('condition')){
				this._exec();
			}
			if(this.includes('event', 'raf')){
				this.conditionSource = this.is('condition', 'source');
				this.rAFRender = window.requestAnimationFrame(this._render.bind(this));
			}
			if(this.partOf('event', 'interval')){
				setInterval(function(){
					if(that.is('condition')){
						that._exec();
					}
				}, parseInt(this.getPartOf('event', 'interval').split('interval-')[1], 10));
			}
			this._initListeners();
		},

		_initListeners: function(){
			if(this.includes('event', 'blur')){
				this.$elem.on('blur', this._blur.bind(this));
			}
			if(this.includes('event', 'focus')){
				this.$elem.on('focus', this._focus.bind(this));
			}
			if(this.includes('event', 'hover')){
				this.$elem.on('mouseover', this._hover.bind(this));
			}
			if(this.partOf('event', 'keyup')){
				this.$elem.on('keyup', this._keyup.bind(this));
			}
			if(this.includes('event', 'jmchange')){
				this.$elem.on('jmchange', this._jmchange.bind(this));
			}
		},

		// gibt je nach parameter ein bool oder einen string zurück. Siehe unten.
        is : function(p_dataAttr, p_value, p_now){
	        var _now = ($.type(p_now) !== 'undefined' && p_now === true);
	        var _return;
            this.configObj = this._getConfigObjArray(_now);
            if($.type(p_dataAttr) !== 'undefined'){
                if($.type(p_value) !== 'undefined'){
	                // wenn bei p_dataAttr condition übergeben wird unbd als p_value 'source', wird der string zurückgegeben.
	                if(p_dataAttr === 'condition' && p_value === 'source'){
		                _return = $.type(this.configObj[p_dataAttr]) !== 'undefined' && this.configObj[p_dataAttr];
	                }else{
		                // gibt true zurück, wenn (p_dataAttr === p_value) ist, andernfalls wird false zurückgegeben.
		                _return = ($.type(this.configObj[p_dataAttr]) !== 'undefined' && this.configObj[p_dataAttr] === p_value);
	                }
                }else{
	                // gibt die value zurück, die für den key hinterlegt ist. Ist der Key nicht definiert wird ein lehrstring zurückgegeben.
	                _return = ($.type(this.configObj[p_dataAttr]) !== 'undefined') ? this.configObj[p_dataAttr] : '';
                    // wenn eine condition hinterlegt ist wird diese in den javascirpt-Kontext überführt andernfalls wird true zurückgegeben.
	                if(p_dataAttr === 'condition'){
	                    _return = (_return !== '') ? eval(_return) : true;
                    }
	                if((p_dataAttr === 'relatedTo') && (_return !== '')){
		                _return = (this.configObj['relatedTo'].indexOf('this.') !== -1) ? eval(_return) : _return;
	                }
	                if((p_dataAttr === 'scrollTo') && (_return !== '')){
		                _return = (this.configObj['scrollTo'].indexOf('this.') !== -1) ? eval(_return) : _return;
	                }
	                if((p_dataAttr === 'data') && (_return !== '')){
		                _return = (this.configObj['data'].indexOf('this.') !== -1) ? eval(_return) : _return;
	                }
	                if((p_dataAttr === 'additionalloadertarget') && (_return !== '')){
		                _return = (this.configObj['additionalloadertarget'].indexOf('this.') !== -1) ? eval(_return) : _return;
	                }
                }
            }

	        //($.type(p_dataAttr) === 'relatedTo') ? return eval(_return): true;
	        return _return;
        },

		// gibt je nach parameter den aktuellen bool oder string für den Key zurück. Siehe is-funktion.
		isNow: function(p_dataAttr, p_value){
			this.is(p_dataAttr, p_value, true);
		},

		// gibt ein bool zurück
		includes: function(p_dataAttr, p_value, p_now){
			var _now = ($.type(p_now) !== 'undefined' && p_now === true);
			this.configObj = this._getConfigObjArray(_now);
			// gibt true zurück, wenn der hinterlegte Sting von p_dataAttr p_value enthält. Andernfalls wird false zurückgegeben.
			return($.type(this.configObj[p_dataAttr]) !== 'undefined' && $.inArray(p_value, this.configObj[p_dataAttr].split('|')) !== -1);
		},

		// gibt den aktuellen bool zurück. Siehe includes-funktion.
		includesNow: function(p_dataAttr, p_value){
			this.contains(p_dataAttr, p_value, true);
		},

		partOf: function(p_dataAttr, p_value, p_now){
			var _now = ($.type(p_now) !== 'undefined' && p_now === true);
			this.configObj = this._getConfigObjArray(_now);
			// gibt true zurück, wenn (p_dataAttr === p_value) ist, andernfalls wird false zurückgegeben.
			return($.type(this.configObj[p_dataAttr]) !== 'undefined' && ($.inArray(true, $.map(this.configObj[p_dataAttr].split('|'), function(s) {
				return (s.indexOf(p_value) > -1);
			}))) !== -1);
		},

		partOfNow: function(p_dataAttr, p_value){
			this.partOf(p_dataAttr, p_value, true);
		},

		getPartOf: function(p_dataAttr, p_value, p_now){
			var _now = ($.type(p_now) !== 'undefined' && p_now === true);
			var _return;
			this.configObj = this._getConfigObjArray(_now);
			// gibt true zurück, wenn (p_dataAttr === p_value) ist, andernfalls wird false zurückgegeben.
			if($.type(this.configObj[p_dataAttr]) !== 'undefined'){
				_return = $.map(this.configObj[p_dataAttr].split('|'), function(s) {
					if (s.indexOf(p_value) > -1){
						return s;
					}
				})[0];
			}
			return _return || '';
		},

		// gibt je nach parameter das aktuelle oder gespeicherte configObj zurück. Es wird hier aus Performancegründen ein ConfigObj gespeichert.
        _getConfigObjArray: function(p_now){
	        // returnt das initConfigObj wenn es exsistiert und n_now gleich false ist
	        if($.type(this.initConfigObj) !== 'undefined' && !p_now){
		        return this.initConfigObj;
	        }
			// wenn jmname als data-Attribut definiert ist
	        if($.type(this.$elem.data('jmname')) !== 'undefined'){
		        // wenn es kein jmconfig-Attribut für das Tag gibt. p_now ist hier nicht interessant, da die config-Daten in der _config.js nicht geändert werden können.
		        if($.type(this.$elem.data('jmconfig')) === 'undefined'){
			        this.initConfigObj = this.staticObj || this._getStaticConfigObj();
			        return this.initConfigObj;
		        }
		        // wenn es ein jmconfig-Attribut für das Tag gibt überschreibt dieses die entsprechenden values im config-Objekt, wellches hierfür in der _config.js steht.
		        return this.initConfigObj = $.extend({}, (this.staticObj || this._getStaticConfigObj()), this._getObjFromDom(p_now) );
	        }
	        // ist kein jmname-Data-Attribut vorhanden, aber ein jmconfig-Data-Attribut, werden die config-Daten geholt.
	        if ($.type(this.$elem.data('jmconfig')) !== 'undefined') {
		        return this.initConfigObj = this._getObjFromDom(p_now);
	        }
	        // liegen keine config-Daten vor, wird ein Array mit einem lehren Obj zurückgegeben.
	        return this.initConfigObj = {};
        },

		// gibt ein Array aus dem jmconfig-Data-Attribut zurück
		_getObjFromDom: function(p_now){
			var jmconfigJsonParse;
			// liegen die daten aus dem jmconfig-Data-Attribut vor und p_now ist gleich false wird das Array mit dem/den Objekt/en aus dem data-jmconfig zurückgegeben
			if(!p_now && $.type(this.staticObjFromDom) !== 'undefined'){
				return this.staticObjFromDom;
			}
			// die daten (entweder Objekt oder bei mehreren Objekten, das Objekt aus dem Array der entsprechenden stelle) werden neu vom jmConfig-Attribut geholt
			if($.type(this.$elem.data('jmconfig')) !== 'string'){

				// !!!!!!!!!!!!!!!!!!!!!! ************************** !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				//
				//    MVC
				// Bsp.: data_jmconfig="{ \"relatedTo\": \"[name='AystarOptionSelectionModel.OptionAyDeSmart']\" }"
				//
				//    HTML
				// Bsp.: data-jmconfig="{ 'condition': 'Modernizr.mq(\'only screen and (min-width : 46.8em)\')' }"
				//
				// !!!!!!!!!!!!!!!!!!!!!! ************************** !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				jmconfigJsonParse = this.$elem.data('jmconfig');
			}else{
				// !!!!!!!!!!!!!!!!!!!!!! ************************** !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				//
				//    MVC
				// Bsp.: data_jmname = "togglepartner|checkbox-label-color", data_jmdominit = "true", data_jmdomselector="AystarOptionSelectionModel.OptionAyDeSmart", data_jmconfig = "[{ \"relatedTo\": \"[data-jmdomselector='AystarOptionSelectionModel.OptionInternetFlat\']\" },{}]"
				//
				// !!!!!!!!!!!!!!!!!!!!!! ************************** !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
				jmconfigJsonParse = JSON.parse(this.$elem.data('jmconfig').replace(/'/g, "\""));
			}
			if($.type(jmconfigJsonParse) === 'object'){
				return this.staticObjFromDom = jmconfigJsonParse;
			}else if($.type(jmconfigJsonParse[this.myJmNamePos]) ===  'object'){
				return this.staticObjFromDom = jmconfigJsonParse[this.myJmNamePos];
			}else{
				if(jmconfigJsonParse.length < this.myJmNamePos + 1){
					console.log('die Anzahl ('+jmconfigJsonParse.length+') der data-jmconfig-Arrays sind nicht identisch mit der Anzahl der im data-jmname (data-jmname="'+this.$elem.data("jmname")+'") angegebenen jmnamen. Die könnte zu problemen führen.');
					return this.staticObjFromDom = undefined;
				}
				return this.staticObjFromDom = jmconfigJsonParse[this.myJmNamePos][this.myPos];
			}
		},

		_reverse: function(str) {
			var arr = [];
			for (var i = 0, len = str.length; i <= len; i++) {
				arr.push(str.charAt(len - i));
			}
			return arr.join('');
		},

		// gibt für das jmelement-Plugin das entsprechende Objekt aus der _config.js zurück.
		_getStaticConfigObj: function(){
			var _name = this.myJmName;
			for(var i = 0, leni = _config.length; i < leni; i++){
				if(_config[i].jmname === _name){
					// ist der Inhalt des jmconfig-Keys kein Array (es wird nur ein jmelemnte-Plugin für jmname verwendent) wird das Obj direckt in das staticObj geschrieben.
					if($.type(_config[i].jmconfig) !== 'array'){
						this.staticObj = _config[i].jmconfig;
						break;
					}else{
						// hier wird das config-Obj aus der entsprechenden Position im Array in das staticObj geschrieben.
						this.staticObj = _config[i].jmconfig[this.myPos];
						break;
					}
				}
			}
			return this.staticObj;
		},

		_wait: function(){
			return function(){
				return;
			};
		},

		_jmchange: function(){
			if(this.is('condition')){
				this._exec();
			}
		},

		_hover: function(){
			if(this.is('condition')){
				this._exec();
			}
		},

		_blur: function(){
			if(this.is('condition')){
				this._exec();
			}
		},

		_focus: function(){
			if(this.is('condition')){
				this._exec();
			}
		},

		_keyup: function(){
			// TODO Andreas checken auf performance
			if(this.is('condition')){
				$.doTimeout('JSINIT-' +this.myJmName +'-el-'+  this.name, parseInt(this.getPartOf('event', 'dotimeout').split('dotimeout-')[1], 10), this._exec.bind(this));
			}
		},

		// ************** allgemein benutzbare Funktionen **************
		_scrollTo: function(){
			$(this.is('scrollTo')).scrollToMe((this.is('scrollToOffset') !== '') ? parseInt(this.is('scrollToOffset'), 10) : 0);
		}
    };
});

