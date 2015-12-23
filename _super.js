/*!
 * _super
 *
 * http://joinmedia.de/
 *
 * Copyright (c) 2014 join.media GmbH & Co. KG
 *
 * Created by aotten77 on 22.08.2014.
 *
 * Released under the MIT license
 */
define(['jquery', '_config', 'core'], function ($, _config) {
	'use strict';
	return {
		config : function(){
			//this.myPos = ($.type(this.$elem.data('jmname')) !== 'undefined') ? 0 : this.pos;
			this.myPos = this.pos;
			this.myJmName = this.jmname;
			this.namePostfix = (this.name.slice(-2).charAt(0) === '_') ? this.name.slice(-2) : '';
			//this.myJmNamePos = ((this.$elem.data('jmname')).indexOf(' ') !== -1) ? $.inArray(this.myJmName, this.$elem.data('jmname').trim().split(' ')) : $.inArray(this.myJmName, this.$elem.data('jmname').trim().split('|'));
			this.initExec();
			//this.$elem.addClass('JSINIT-' +this.myJmName +'-EL-'+  this.name);
		},

		initExec: function(){
			this.configObj = this._getConfigObjArray();
			if($.type(this.configObj['init']) !== 'undefined'){
				new Function('"use strict";'+ this.configObj['init']).call(this);
			}
		},

//###################################################################################################################
//###################################################################################################################
//###################################################################################################################
//###################################################################################################################

// *********************************  Event-Functions Begin  ********************************************************

		// wird vom Body-Listener für 'click' aufgerufen
		click: function(e){
			if(this.includes('event', 'click') && this.isCondition()) this._execWait(e);
		},

		// wird vom Body-Listener für 'change' aufgerufen
		change: function(e){
			if(this.includes('event', 'change') && this.isCondition()) this._execWait(e);
		},

		// wird vom Body-Listener für 'jmtrigger' aufgerufen
		jmtrigger: function(e, e_param){
			if($.type(e_param) === 'undefined'){
				if(dc.config.debug){
					dc.dev.warn('Es wird kein Event mitgegeben. Zum einen muss im jmconfig-Objekt als Value z.B. \'jmtrigger:click\' für \'event\' angegeben werden und der Event muss entsprechend via jmtrigger(\'click\') gefeuert werden.');
				}
				return;
			}
			if(this.includes('event', 'jmtrigger:'+e_param.event) && this.isCondition()) this._execWait(e, e_param.data);
		},

		// wird vom Body-Listener für 'dominit' aufgerufen
		dominit: function(e){
			if(this.includes('event', 'dominit') && this.isCondition()) this._execWait(e);

			//
			if(this.partOf('event', 'raf')) this._raf();
			if(this.partOf('event', 'interval')) this._interval(e);
			if(this.includes('event', 'init-by-perf')) this._initByPerf(e);

			// init Event-Listener auf this.$elem
			if(this.partOf('event', 'keyup')) this.$elem.on('keyup', this._keyup.bind(this));

			if(this.includes('event', 'blur')) this.$elem.on('blur', this._execWaitAfterCondition.bind(this));
			if(this.includes('event', 'focus')) this.$elem.on('focus', this._execWaitAfterCondition.bind(this));
			if(this.includes('event', 'hover')) this.$elem.on('mouseover', this._execWaitAfterCondition.bind(this));
			// dynamic dc-eventlistener on body
			if(this.startsWith('event', 'dc-')){
				for(var i = 0, leni = this.dcEvents.length; i < leni; i++){
					this.$elem.closest('body').on(this.dcEvents[i], this._execWaitAfterCondition.bind(this));
				}
			}
		},


// *********************************  Event-Functions End    ********************************************************

//###################################################################################################################
//###################################################################################################################
//###################################################################################################################
//###################################################################################################################

// *********************************  Helper-Functions for ConfigObject Begin  **************************************

		// gibt je nach parameter ein bool oder einen string zurück. Siehe unten.
		is : function(p_dataAttr, p_value, p_now){
			var _returnString;
			if($.type(p_dataAttr) === 'undefined'){
				dc.dev.error('es wurde kein Parameter übergeben');
				return;                                         // return void
			}
			// hier wird das configObj geholt.
			this.configObj = this._getConfigObjArray(p_now);

			if($.type(this.configObj[p_dataAttr]) === 'undefined'){
				return '';                                      // return String
			}
			// Wird eine value an die Funktion 'is' übergeben, gibt diese true zurück, wenn (p_dataAttr === p_value) ist, andernfalls wird false zurückgegeben.
			if($.type(p_value) !== 'undefined'){
				return this.configObj[p_dataAttr] === p_value;  // return Bool
			}

			// gibt die Value zurück, die für den key hinterlegt ist. Ist der Key nicht definiert wird ein lehrstring zurückgegeben.
			_returnString = this.configObj[p_dataAttr];
			switch(p_dataAttr){
				// bei folgenden p_dataAttr wird die Value-Angabe in den javascirpt-Kontext überführt, wenn sie ein 'this.' im String beinhaltet,
				// andernfalls wird nur der String zurückgegeben.
				case 'relatedTo':
				case 'scrollTo':
				case 'scrollToOffset':
				case 'data':
				case 'loaderTo':
				case 'event':
					// return String or Dom-Element/e
					return ((this.configObj[p_dataAttr].indexOf('this.') !== -1) || (this.configObj[p_dataAttr].indexOf('window.jmHF') !== -1)  || (this.configObj[p_dataAttr].indexOf('window.dc') !== -1)) ? eval(_returnString) : _returnString;
				default:
					// return String
					return _returnString;
			}
		},

		// gibt je nach parameter den aktuellen bool oder string für den Key zurück. Siehe is-funktion.
		isNow: function(p_dataAttr, p_value){
			// als 3. Parameter kann true oder irgent etwas anders sein. es muss nur define sein.
			this.is(p_dataAttr, p_value, true);
		},

		isCondition : function(p_value, p_now){
			this.configObj = this._getConfigObjArray(p_now);

			if($.type(p_value) !== 'undefined' && p_value === 'source'){
				// return String
				return ($.type(this.configObj['condition']) !== 'undefined') ? this.configObj['condition'] : true;
			}
			// wenn eine condition hinterlegt ist wird diese in den javascirpt-Kontext überführt andernfalls wird true zurückgegeben.
			// return Bool
			return ($.type(this.configObj['condition']) !== 'undefined') ? eval(this.configObj['condition']) : true;
		},

		includes: function(p_dataAttr, p_value, p_now){
			var _array_value;
			this.configObj = this._getConfigObjArray(p_now);
			// gibt true zurück, wenn der hinterlegte Sting von p_dataAttr p_value enthält. Andernfalls wird false zurückgegeben.
			// return Bool
			if($.type(this.configObj[p_dataAttr]) === 'undefined'){
				return;
			}

			if(this.configObj[p_dataAttr].indexOf('this.') === -1){
				return $.inArray(p_value, this.configObj[p_dataAttr].split('|')) !== -1;
			}

			_array_value = this.configObj[p_dataAttr].split('|');
			for(var i = 0, leni = _array_value.length; i < leni; i++){
			    if((_array_value[i].indexOf('this.') != -1) && (_array_value[i].indexOf('jmtrigger:') != -1)){
				    _array_value[i] = eval(_array_value[i]);
			    }
			}
			return $.inArray(p_value, _array_value) !== -1;
		},

		// gibt den aktuellen bool zurück. Siehe includes-funktion.
		startsWithNow: function(p_dataAttr, p_value){
			this.startsWith(p_dataAttr, p_value, true);
		},

		startsWith: function(p_dataAttr, p_value, p_now){
			var that = this;
			this.configObj = this._getConfigObjArray(p_now);
			// gibt true zurück, wenn (p_dataAttr === p_value) ist, andernfalls wird false zurückgegeben.
			// return Bool
			return($.type(this.configObj[p_dataAttr]) !== 'undefined' && ($.inArray(true, $.map(this.configObj[p_dataAttr].split('|'), function(s) {
				if(/^dc-/i.test(s)){
					that.dcEvents = that.dcEvents || [];
					if(that.dcEvents[s]) return true;
					that.dcEvents.push(s);
					return true;
				}
				return false;
			}))) !== -1);
		},

		// gibt den aktuellen bool zurück. Siehe includes-funktion.
		includesNow: function(p_dataAttr, p_value){
			this.contains(p_dataAttr, p_value, true);
		},

		partOf: function(p_dataAttr, p_value, p_now){
			this.configObj = this._getConfigObjArray(p_now);
			// gibt true zurück, wenn (p_dataAttr === p_value) ist, andernfalls wird false zurückgegeben.
			// return Bool
			return($.type(this.configObj[p_dataAttr]) !== 'undefined' && ($.inArray(true, $.map(this.configObj[p_dataAttr].split('|'), function(s) {
				return (s.indexOf(p_value) > -1);
			}))) !== -1);
		},

		partOfNow: function(p_dataAttr, p_value){
			this.partOf(p_dataAttr, p_value, true);
		},

		getPartOf: function(p_dataAttr, p_value, p_now){
			var _return;
			this.configObj = this._getConfigObjArray(p_now);
			if($.type(this.configObj[p_dataAttr]) === 'undefined'){
				return;
			}
			// return full part between the Pipes z.B. |keyup-delay-500| (p_value ist hier keyup) oder undefine
			_return = $.map(this.configObj[p_dataAttr].split('|'), function(s) {
				if (s.indexOf(p_value) > -1){
					return s;
				}
			})[0];
			// return Stirng
			return _return || '';
		},

// *********************************  Helper-Functions for ConfigObject End    **************************************

//###################################################################################################################
//###################################################################################################################
//###################################################################################################################
//###################################################################################################################

// *********************************  Eventhandler-Functions Begin  *************************************************

		_interval : function(e){
			var that = this;
			setInterval(function(){
				if(that.isCondition()) that._execWait(e);
				// Die Intervalzeit wird aus dem Stirng gewonnen, der als value in der _config.js für 'event' angegeben ist. z.B. interval-5000 -> 5000 ms
			}, parseInt(this.getPartOf('event', 'interval').split('interval-')[1], 10));
		},

		_keyup: function(e){
			if(this.isCondition()){
				if($.type (parseInt(this.getPartOf('event', 'keyup').split('delay-')[1], 10)) === 'number'){
					$.doTimeout(this.getUniqueId(), parseInt(this.getPartOf('event', 'keyup').split('delay-')[1], 10), this._execWait.bind(this, e));
				}else{
					this._execWait.bind(this, e)
				}
			}
		},

		_raf: function(){
			this.guaranteeDCRAF();
			// raf-100ms-one
			this.oneTimeExec = this.getPartOf('event', 'raf').indexOf('-one') !== -1;
			this.renderDelay = this._getRenderDelay();
			// Speicherung des condition-Strings auf der _config.js für das Kind-Modul (z.B. actions.ajax oder actions.sticky)
			this.conditionSource = this.isCondition('source');
			this._addRenderFunctionToRafExecIterationObj();

		},

		_initByPerf: function(e){
			var _initByPerfCounter = 2;
			if(window.dc.perf.level === 0){
				return;
			}
			if(window.dc.perf.level === 1 || window.dc.perf.level === 4){
				this._execWaitAfterCondition();
				return;
			}

			if(!window.dc.raf.win){
				this._createRAFObjects();
			}

			window.dc.perf.onHoldArray = window.dc.perf.onHoldArray || [];
			window.dc.perf.onHoldArrayExecuted = window.dc.perf.onHoldArrayExecuted || false;
			window.dc.perf.onHoldArray.push({ 'obj':this, 'e':e, 'exec': false });
			for(var i = 0, leni = window.dc.perf.onHoldArray.length; i < leni; i++){
				if(_initByPerfCounter > i){
					this._applyOnHoldPlugin(i);
				}
			}

			if($.type(window.dc.perf.intervalIDForOnHoldPlugins) === 'undefined'){
				window.dc.perf.intervalIDForOnHoldPlugins = setInterval(this._intervalForApplyOnHoldPlugins.bind(this), 1000);
				setTimeout(function(){
					clearInterval(window.dc.perf.intervalIDForOnHoldPlugins);
				}, 15000);
			}
		},

		_execWaitAfterCondition: function(e){
			if(this.isCondition()){
				this._execWait(e);
			}
		},

		_execWait: function(e, p_data){
			var that = this;
			if(this.is('wait') === ''){
				this._exec(e, p_data);
				return;
			}
			if(this.is('wait') === 'raf'){
				window.requestAnimationFrame(this._exec.bind(this, e, p_data));
				return;
			}
			if(this.is('wait') !== ''){
				setTimeout(function(){ that._exec(e, p_data); }, parseInt(this.is('wait'), 10));
			}
		},

// *********************************  Eventhandler-Functions End    *************************************************

//###################################################################################################################
//###################################################################################################################
//###################################################################################################################
//###################################################################################################################

// *********************************  Eventhandler-Helper-Functions Begin  ******************************************

		_getRenderDelay: function(){
			var _filteredRafString = this.getPartOf('event', 'raf').replace('raf-', '').replace('-one', '').replace('ms', '').replace('raf', '');
			return (_filteredRafString !== '') ? parseInt(_filteredRafString, 10) + Math.ceil(Math.random() * parseInt(_filteredRafString, 10)/4) : 1;
		},

		_applyOnHoldPlugin: function(index){
			var _obj = window.dc.perf.onHoldArray[index].obj;
			if(!_obj.exec){
				_obj.exec = true;
				_obj._execWaitAfterCondition();
			}
		},

		_intervalForApplyOnHoldPlugins: function(){
			var _obj;
			if(window.dc.perf.onHoldArray && !window.dc.perf.onHoldArrayExecuted && window.dc.raf.win._avgrafs > 45){
				for(var i = 0, leni = window.dc.perf.onHoldArray.length; i < leni; i++){
					_obj = window.dc.perf.onHoldArray[i].obj;
					if(!_obj.exec){
						_obj.exec = true;
						_obj._execWaitAfterCondition();
						if(window.dc.dev.debugview){
							$('#init-by-perf-counter').text(' init-fx: '+(i+1)+'/'+leni);
						}
						return;
					}else if((leni -1) === i){
						window.dc.perf.onHoldArrayExecuted = true;
					}
				}
			}
		},

// *********************************  Eventhandler-Helper-Functions End    ******************************************

//###################################################################################################################
//###################################################################################################################
//###################################################################################################################
//###################################################################################################################

// *********************************  ConfigObject-Functions Begin  *************************************************


		// gibt je nach parameter das aktuelle oder gespeicherte configObj zurück. Es wird hier aus Performancegründen ein ConfigObj gespeichert.
		_getConfigObjArray: function(p_now){
			// returnt das initConfigObj wenn es exsistiert und n_now gleich false ist
			if($.type(this.initConfigObj) !== 'undefined' && ($.type(p_now) === 'undefined')){
				// return Object
				return this.initConfigObj;
			}
			// wenn es kein jmconfig-Attribut für das Tag gibt. p_now ist hier nicht interessant, da die config-Daten in der _config.js nicht geändert werden können.
			if($.type(this._getAttrWithOrWithoutPostfix_1() || this.$elem.data('jmconfig')) === 'undefined'){
				// return Object
				return this.initConfigObj = this.staticObj || this._getStaticConfigObj();
			}

			// wenn es ein jmconfig-Attribut im Tag (DOM-Element) gibt überschreibt dieses die entsprechenden values im config-Objekt, wellches hierfür in der _config.js steht.
			// return Object
			return this.initConfigObj = $.extend({}, (this.staticObj || this._getStaticConfigObj()), this._getObjFromDom(p_now) );
		},

		_getAttrWithOrWithoutPostfix_1: function(){
			return this.staticAttrFromDom || (this.staticAttrFromDom = (this.namePostfix === '_1') ? (this.$elem.attr('data-dcconfig--'+this.myJmName+'--'+this.name) || this.$elem.attr('data-dcconfig--'+this.myJmName+'--'+this.name.split('_1')[0])) : (this.$elem.attr('data-dcconfig--'+this.myJmName+'--'+this.name) || this.$elem.attr('data-dcconfig--'+this.myJmName+'--'+this.name+'_1')));
		},

		_getObjFromDom: function(p_now){
			if(dc.config.debug){
				if(this.$elem.data('jmconfig') && dc.helper.attrPrefixCounter(this.$elem[0], 'data-dcconfig')){
					dc.dev.warn('data-jmconfig und data-dcconfig dürfen nicht zusammen als Attribut auf folgenden Tag verwendet. data-jmconfig ist depricated. Die Überschreibung der config-Objekte ist mit data-dcconfig--... durchzuführen.', this.$elem);
				}
			}
			if(this._getAttrWithOrWithoutPostfix_1()){
				return this._getObjFromDcConfigAttr(p_now);
			}else if(this.$elem.data('jmconfig')){
				if(dc.config.debug){
					dc.dev.warn('Die Angabe vom data-jmconfig Attribut ist deprecated und der "event"-key kann im via data-jmconfig-attr nicht überschrieben werden. Bitte als Attribut data-dcconfig--*--** (* steht für dcname und ** für das entsprechende jmplugin wie z.B. data-dcconfig--back-to-top--actions.scroll) verwenden!!!');
				}
				return this._getObjFromJmConfigAttr(p_now);
			}
			return {};
		},

		_getObjFromDcConfigAttr: function(p_now){
			// liegen die daten aus dem jmconfig-Data-Attribut vor und p_now ist gleich false wird das Array mit dem/den Objekt/en aus dem data-jmconfig zurückgegeben
			if($.type(p_now) === 'undefined' && $.type(this.staticObjFromDom) !== 'undefined'){
				// return Object
				return this.staticObjFromDom;
			}
			return this.staticObjFromDom = JSON.parse(this._getAttrWithOrWithoutPostfix_1().replace(/'/g, "\""));
		},

		_getObjFromJmConfigAttr: function(p_now){
			var that = this;
			var jmconfigJsonParse;
			var _configObjlength;
			var _jmnameArr;
			var _jmnamelength;
			var _jmconfigJsonContainsObjectOnlyOnFirstLevel = true;
			// liegen die daten aus dem jmconfig-Data-Attribut vor und p_now ist gleich false wird das Array mit dem/den Objekt/en aus dem data-jmconfig zurückgegeben
			if($.type(p_now) === 'undefined' && $.type(this.staticObjFromDom) !== 'undefined'){
				// return Object
				return this.staticObjFromDom;
			}
			// die Daten (entweder Objekt oder bei mehreren Objekten, das Objekt aus dem Array der entsprechenden stelle) werden neu vom jmConfig-Attribut geholt
			if($.type(this.$elem.data('jmconfig')) !== 'string'){
				jmconfigJsonParse = this.$elem.data('jmconfig');
			}else{
				jmconfigJsonParse = JSON.parse(this.$elem.data('jmconfig').replace(/'/g, "\""));
			}

			if($.type(jmconfigJsonParse) === 'object'){
				$.each(jmconfigJsonParse, function(key, value){
					if(key === that.myJmName){
						if($.type(value) === 'object'){
							if(dc.config.debug){
								for(var i = 0, leni = _config.length; i < leni; i++){
									_jmnameArr = _config[i].jmname.split(',');
									_jmnamelength = _jmnameArr.length;
									for(var j = 0, lenj = _jmnamelength; j < lenj; j++){
										if(_jmnameArr[j].trim() === that.myJmName){
											if($.type(_config[i].jmconfig) !== 'array'){
												_configObjlength = 1;
												break;
											}else{
												_configObjlength = _config[i].jmconfig.length;
												break;
											}
										}
									}
								}
								if(_configObjlength > that.myPos+1){
									$.doTimeout('_getObjFromDom1', 200, function(){
										dc.dev.warn('Die Anzahl der Objekt im Array-String für data-jmname="'+that.myJmName+'" weichen von der Anzahl der Objekte im entsprechenden jmconfig der describer.js ab!!! \n\n' +
											'-> Wenn Objekte in der _config.js nicht überschrieben werden sollen, sind an den entsprechenden Positionen im data-jmconfig-Attribut lehre Objekte "{}" anzugeben.');
										console.warn('%cELEMENT', 'color: orange; font-style: italic');
										console.log(that.$elem[0]);
									});
								}
							}
							_jmconfigJsonContainsObjectOnlyOnFirstLevel = false;
							that.staticObjFromDom = value;
							// to break ths $.each()
							return false;
						}
						if($.type(value) === 'array'){
							if(dc.config.debug && $.type(value[that.myPos]) === 'undefined'){
								$.doTimeout('_getObjFromDom2', 200, function(){
									dc.dev.warn('Die Anzahl der Objekt im Array-String für data-jmname="'+that.myJmName+'" weichen von der Anzahl der Objekte im entsprechenden jmconfig der describer.js ab!!! \n\n' +
										'-> Wenn Objekte in der _config.js nicht überschrieben werden sollen, sind an den entsprechenden Positionen im data-jmconfig-Attribut lehre Objekte "{}" anzugeben. \n\n ' +
										'-> Soll '+that.myJmName+' nicht überschrieben werden ist das entsprechende key-Value-Pair in data-jmconfig-Attribut zu entfernen.');
									console.warn('%cELEMENT', 'color: orange; font-style: italic');
									console.log(that.$elem[0]);
								});
							}
							_jmconfigJsonContainsObjectOnlyOnFirstLevel = false;
							that.staticObjFromDom = value[that.myPos];
							// to break ths $.each()
							return false;
						}
					}
				});

				if(_jmconfigJsonContainsObjectOnlyOnFirstLevel){
					if(dc.config.debug){
						for(var i = 0, leni = _config.length; i < leni; i++){
							_jmnameArr = _config[i].jmname.split(',');
							_jmnamelength = _jmnameArr.length;
							for(var j = 0, lenj = _jmnamelength; j < lenj; j++){
								if(_jmnameArr[j].trim() === that.myJmName){
									if($.type(_config[i].jmconfig) !== 'array'){
										_configObjlength = 1;
										break;
									}else{
										_configObjlength = _config[i].jmconfig.length;
										break;
									}
								}
							}
						}
						if(_configObjlength > that.myPos+1){
							if($.type(jmconfigJsonParse[this.myPos]) === 'undefined'){
								$.doTimeout('_getObjFromDom3', 200, function(){
									dc.dev.warn('Für data-jmname="'+that.myJmName+'" ist nur ein Objekt angegeben. Dieses weichen von der Anzahl der Objekte im entsprechenden jmconfig der describer.js ab!!! \n\n' +
										'-> Wrappen sie das Objekt bitte in ein Array und füllen sie das Array (für die nicht zu überschreibenden Objekte in der _config.js) mit leheren Objekten auf.');
									console.warn('%cELEMENT', 'color: orange; font-style: italic');
									console.log(that.$elem[0]);
								});
							}
						}
					}
					that.staticObjFromDom = jmconfigJsonParse;
				}
				return that.staticObjFromDom;
			}

			if($.type(jmconfigJsonParse) === 'array'){
				if(dc.config.debug && $.type(jmconfigJsonParse[this.myPos]) === 'undefined'){
					$.doTimeout('_getObjFromDom4', 200, function(){
						dc.dev.warn('Die Anzahl der Objekt im Array-String für data-jmname="'+that.myJmName+'" weichen von der Anzahl der Objekte im entsprechenden jmconfig der describer.js ab!!! \n\n' +
							'-> Wenn Objekte in der _config.js nicht überschrieben werden sollen, sind an den entsprechenden Positionen im data-jmconfig-Attribut lehre Objekte "{}" anzugeben.');
						console.warn('%cELEMENT', 'color: orange; font-style: italic');
						console.log(that.$elem[0]);
					});
				}
				return that.staticObjFromDom = jmconfigJsonParse[this.myPos];
			}

			return that.staticObjFromDom;
		},

		// gibt für das jmplugin das entsprechende Objekt aus der _config.js zurück.
		_getStaticConfigObj: function(){
            var _objForMyJmName = _config.default[$.camelCase(this.myJmName)];
            if(_objForMyJmName.hasOwnProperty(event)){
                return this.staticObj = _objForMyJmName;
            }
            return this.staticObj = _objForMyJmName[this.name];
		},


// *********************************  ConfigObject-Functions End    *************************************************

//###################################################################################################################
//###################################################################################################################
//###################################################################################################################
//###################################################################################################################

// *********************************  Global-Singelton-Functions Begin  *********************************************

		guaranteeDCRAF: function(){
			if(window.dc.raf.iterationSingleton){
				return;
			}
			window.dc.raf.iterationSingleton = true;
			this._createRAFObjects();
			if(window.dc.dev.debugview){
				this.thempCountedFrames = 0;
				this._applyRAFDeveloperView();
			}
			this._everyRAF();
		},

		_createRAFObjects: function(){
			window.dc.raf.win = {
				pageYOffset: null,
				innerHeight: null,
				innerWidth: null,
				outerHeight: null,
				documentHeight: null,
				_startTime: Date.now(),
				_counter: 0,
				_rafs: null,
				_avgrafs: null
			};
			window.dc.raf.execIterationObj = {
				countProperties: function(){
					var count = 0;
					for(var property in this){
						if(this.hasOwnProperty(property) && this.property !== null){
							count += 1;
						}
					}
					return count;
				}
			};
		},

		_applyRAFDeveloperView: function(){
			var that = this;

			$('body').append('<div style="position: fixed; color:#eee; font-weight: bold; bottom: 0; left: 0; background-color:rgba(0,0,0,.2); padding-top: 1rem; padding-left: 1rem; padding-right: 1rem; padding-bottom: 2rem; width: 100%; z-index: 9999"><span style="padding: 1rem; float: left; background-color: rgba(30,30,30,.8)" id="fps-counter" >avg: --- fps | now: --- fps</span></div>');
			this.$acount = $('#fps-counter');

			setInterval(function(){
				if(window.dc.raf.win._counter < that.thempCountedFrames){
					this.thempCountedFrames = this.thempCountedFrames + 100000001;
				}
				window.dc.raf.win._rafs = window.dc.raf.win._counter - this.thempCountedFrames;
				window.dc.raf.win._avgrafs = Math.round(window.dc.raf.win._counter/((Date.now() - window.dc.raf.win._startTime)/1000));

				this.$acount.text('avg: '+ window.dc.raf.win._avgrafs+ ' fps | now: '+ window.dc.raf.win._rafs+' fps');

				if(window.dc.perf.onHoldArray && $.type(that.$initByPerfCounter) === 'undefined'){
					this.$acount.after('<span style="padding: 1rem; float: right; background-color: rgba(30,30,30,.8)" id="init-by-perf-counter"> init-fx: 2/?</span>');
					this.$initByPerfCounter = $('#init-by-perf-counter');
					if(window.dc.perf.level === 1) this.$initByPerfCounter.text(' init-fx: all ');
					if(window.dc.perf.level === 2) this.$initByPerfCounter.text(' init-fx: 2 ');
				}
				that.thempCountedFrames = window.dc.raf.win._counter;
			}.bind(this), 1000);
		},

// *********************************  Global-Singelton-Functions End    *********************************************

//###################################################################################################################
//###################################################################################################################
//###################################################################################################################
//###################################################################################################################

// *********************************  raf-Functions HOT-CODE Begin  *************************************************

		_everyRAF: function(){
			var _oldDocumentHeight = window.dc.raf.win.documentHeight || document.body.offsetHeight;

			window.dc.raf.win.pageYOffset     = window.pageYOffset;
			window.dc.raf.win.innerHeight     = (window.dc.client._orientation_old === window.dc.client.orientation) ? window.dc.raf.win.innerHeight : window.innerHeight;
			window.dc.raf.win.innerWidth      = window.innerWidth;
			window.dc.raf.win._counter        = window.dc.raf.win._counter+1;
			window.dc.raf.win.documentHeight  = document.body.offsetHeight;

			if(window.dc.raf.win._counter === 100000001){
				window.dc.raf.win._counter = 1;
			}

			for(var property in window.dc.raf.execIterationObj){
				if(window.dc.raf.execIterationObj.hasOwnProperty(property) && ('countProperties' !== property)){
					window.dc.raf.execIterationObj[property]();
				}
			}
			window.dc.client._orientation_old = window.dc.client.orientation;
			window.requestAnimationFrame(this._everyRAF.bind(this));
			if(_oldDocumentHeight !== window.dc.raf.win.documentHeight){
				$('body').trigger('dc-documentHeightChange');
			}
		},

		_render: function(){
			if((window.dc.raf.win._counter % this.renderDelay) !== 0){
				return;
			}
			if(this.$elem[0].offsetHeight === 0){
				return;
			}
			if(!this.oneTimeExec && eval(this.conditionSource)){
				this._exec();
				return;
			}
			if(this.oneTimeExec && eval(this.conditionSource)){
				this._exec();
				this._removeRenderFunctionFromRafExecIterationObj();
			}
		},

// *********************************  raf-Functions HOT-CODE End    *************************************************

//###################################################################################################################
//###################################################################################################################
//###################################################################################################################
//###################################################################################################################

// *********************************  add/remove renderFunctions Begin  *********************************************

		_addRenderFunctionToRafExecIterationObj: function(){
			this.renderFunctionIndex = window.dc.raf.execIterationObj.countProperties();
			window.dc.raf.execIterationObj['renderFunction_' + this.renderFunctionIndex] = this._render.bind(this);
		},

		_removeRenderFunctionFromRafExecIterationObj: function(){
			window.dc.raf.execIterationObj['renderFunction_' + this.renderFunctionIndex] = null;
			delete window.dc.raf.execIterationObj['renderFunction_' + this.renderFunctionIndex];
		},

// *********************************  add/remove renderFunctions End  ***********************************************

//###################################################################################################################
//###################################################################################################################
//###################################################################################################################
//###################################################################################################################

// *********************************  Common-Functions use by actions Begin  ****************************************

		getRelatedToElem: function(){
			return (this.relatedTo) ? this.relatedTo : this.relatedTo = ((this.is('relatedTo') !== '') ? $(this.is('relatedTo')) : this.$elem);
		},

		getUniqueId: function(){
			if(this.uniqueId){
				return this.uniqueId;
			}
			return this.uniqueId = window.dc.helper.uuID.generate();
		},

		_finishing: function(p_$data){
			var that = this;
			this._scrollTo();
			if($.type(p_$data) !== 'undefined'){
				setTimeout(function(){
					p_$data
						.requirementsForJmPlugins()
						.triggerSelfexecObj()
						.picturefill();
					that._callback();
				}, 200);
				return;
			}
			this._callback();
		},

		_scrollTo: function(){
			if(this.is('scrollTo') === ''){
				return;
			}
			if($.type(this.is('scrollTo')) === 'number'){
				dc.helper.scrollToPosition(this.is('scrollTo'), (this.is('speed') !== '') ? parseInt(this.is('speed'), 10) : undefined);
				return;
			}
			if($.type(this.is('scrollTo')) === 'string'){
				try{
					if($.type($(this.is('scrollTo'))) === 'object'){
						$(this.is('scrollTo')).scrollToMe((this.is('scrollToOffset') !== '') ? parseInt(this.is('scrollToOffset'), 10) : 0, (this.is('speed') !== '') ? parseInt(this.is('speed'), 10) : undefined);
						return;
					}
					dc.dev.warn('falsche angabe für scrollTo');
				}catch(e){
					dc.dev.error('falsche angabe für scrollTo');
					console.error(e.message);
				}
			}

		},

		_callback: function(){
			if($.type(this.is('callback') !== 'undefined')) eval(this.is('callback'));
		}

// *********************************  Common-Functions use by actions End    ****************************************
	};
});

