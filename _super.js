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
			this.myJmNamePos = $.inArray(this.myJmName, this.$elem.data('jmname').split('|'));
			this.initExec();
			this.$elem.addClass('JSINIT-' +this.myJmName +'-EL-'+  this.name);
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
				if(window.debug){
					jmHF.warn('Es wird kein Event mitgegeben. Zum einen muss im jmconfig-Objekt als Value z.B. \'jmtrigger:click\' für \'event\' angegeben werden und der Event muss entsprechend via jmtrigger(\'click\') gefeuert werden.');
				}
				return;
			}
			if(this.includes('event', 'jmtrigger:'+e_param.event) && this.isCondition()) this._execWait(e);
		},

		// wird vom Body-Listener für 'dominit' aufgerufen
		dominit: function(e){
			var that = this;
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
				jmHF.error('es wurde kein Parameter übergeben');
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
					// return String or Dom-Element/e
					return (this.configObj[p_dataAttr].indexOf('this.') !== -1) ? eval(_returnString) : _returnString;
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
			this.configObj = this._getConfigObjArray(p_now);
			// gibt true zurück, wenn der hinterlegte Sting von p_dataAttr p_value enthält. Andernfalls wird false zurückgegeben.
			// return Bool
			return($.type(this.configObj[p_dataAttr]) !== 'undefined' && $.inArray(p_value, this.configObj[p_dataAttr].split('|')) !== -1);
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
					$.doTimeout('JSINIT-' +this.myJmName +'-el-'+  this.name, parseInt(this.getPartOf('event', 'keyup').split('delay-')[1], 10), this._execWait.bind(this, e));
				}else{
					this._execWait.bind(this, e)
				}
			}
		},

		_raf: function(){
			if(!window.dc.singleton){
				this._singelton();
			}

			// raf-100ms-one
			this.cAF = this.getPartOf('event', 'raf').indexOf('-one') !== -1;
			this.renderDelay = this._getRenderDelay();
			// Speicherung des condition-Strings auf der _config.js für das Kind-Modul (z.B. actions.ajax oder actions.sticky)
			this.conditionSource = this.isCondition('source');
			window.dc.execRafObj['func_' + window.dc.execRafObj.countProperties()] = this._render.bind(this);

		},

		_initByPerf: function(e){
			var _initByPerfCounter = 2;
			if(window.dc.perf === 0){
				return;
			}
			if(window.dc.perf === 1 || window.dc.perf === 4){
				this._execWaitAfterCondition();
				return;
			}

			if(!window.dc.win){
				this._createRAFObjects();
			}

			window.dc.onHoldArray = window.dc.onHoldArray || [];
			window.dc.onHoldArrayExecuted = window.dc.onHoldArrayExecuted || false;
			window.dc.onHoldArray.push({ 'obj':this, 'e':e, 'exec': false });
			for(var i = 0, leni = window.dc.onHoldArray.length; i < leni; i++){
				if(_initByPerfCounter > i){
					this._applyOnHoldPlugin(i);
				}
			}

			if($.type(window.intervalIDForOnHoldPlugins) === 'undefined'){
				window.intervalIDForOnHoldPlugins = setInterval(this._intervalForApplyOnHoldPlugins.bind(this), 1000);
				setTimeout(function(){
					clearInterval(window.intervalIDForOnHoldPlugins);
				}, 15000);
			}
		},

		_execWaitAfterCondition: function(e){
			if(this.isCondition()){
				this._execWait(e);
			}
		},

		_execWait: function(e){
			var that = this;
			if(this.is('wait') === ''){
				this._exec(e);
				return;
			}
			if(this.is('wait') === 'raf'){
				window.requestAnimationFrame(this._exec.bind(this, e));
				return;
			}
			if(this.is('wait') !== ''){
				setTimeout(function(){ that._exec(e); }, parseInt(this.is('wait'), 10));
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
			var _obj = window.dc.onHoldArray[index].obj;
			if(!_obj.exec){
				_obj.exec = true;
				_obj._execWaitAfterCondition();
			}
		},

		_intervalForApplyOnHoldPlugins: function(){
			var _obj;
			if(window.dc.onHoldArray && !window.dc.onHoldArrayExecuted && window.dc.win.avgrafs > 45){
				for(var i = 0, leni = window.dc.onHoldArray.length; i < leni; i++){
					_obj = window.dc.onHoldArray[i].obj;
					if(!_obj.exec){
						_obj.exec = true;
						_obj._execWaitAfterCondition();
						if(window.dc.debugview){
							$('#init-by-perf-counter').text(' init-fx: '+(i+1)+'/'+leni);
						}
						return;
					}else if((leni -1) === i){
						window.dc.onHoldArrayExecuted = true;
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
			if($.type(this.$elem.data('jmconfig')) === 'undefined'){
				// return Object
				return this.initConfigObj = this.staticObj || this._getStaticConfigObj();
			}
			// wenn es ein jmconfig-Attribut im Tag (DOM-Element) gibt überschreibt dieses die entsprechenden values im config-Objekt, wellches hierfür in der _config.js steht.
			// return Object
			return this.initConfigObj = $.extend({}, (this.staticObj || this._getStaticConfigObj()), this._getObjFromDom(p_now) );
		},

		// gibt ein Array aus dem jmconfig-Data-Attribut zurück
		_getObjFromDom: function(p_now){
			var that = this;
			var jmconfigJsonParse;
			var _configObjlength;
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
							if(window.debug){
								for(var i = 0, leni = _config.length; i < leni; i++){
									if(_config[i].jmname === that.myJmName){
										if($.type(_config[i].jmconfig) !== 'array'){
											_configObjlength = 1;
											break;
										}else{
											_configObjlength = _config[i].jmconfig.length;
											break;
										}
									}
								}
								if(_configObjlength > that.myPos+1){
									$.doTimeout('_getObjFromDom1', 200, function(){
										jmHF.warn('Die Anzahl der Objekt im Array-String für data-jmname="'+that.myJmName+'" weichen von der Anzahl der Objekte im entsprechenden jmconfig der _config.js ab!!! \n\n' +
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
							if(window.debug && $.type(value[that.myPos]) === 'undefined'){
								$.doTimeout('_getObjFromDom2', 200, function(){
									jmHF.warn('Die Anzahl der Objekt im Array-String für data-jmname="'+that.myJmName+'" weichen von der Anzahl der Objekte im entsprechenden jmconfig der _config.js ab!!! \n\n' +
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
					if(window.debug){
						for(var i = 0, leni = _config.length; i < leni; i++){
							if(_config[i].jmname === that.myJmName){
								if($.type(_config[i].jmconfig) !== 'array'){
									_configObjlength = 1;
									break;
								}else{
									_configObjlength = _config[i].jmconfig.length;
									break;
								}
							}
						}
						if(_configObjlength > that.myPos+1){
							if($.type(jmconfigJsonParse[this.myPos]) === 'undefined'){
								$.doTimeout('_getObjFromDom3', 200, function(){
									jmHF.warn('Für data-jmname="'+that.myJmName+'" ist nur ein Objekt angegeben. Dieses weichen von der Anzahl der Objekte im entsprechenden jmconfig der _config.js ab!!! \n\n' +
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
				if(window.debug && $.type(jmconfigJsonParse[this.myPos]) === 'undefined'){
					$.doTimeout('_getObjFromDom4', 200, function(){
						jmHF.warn('Die Anzahl der Objekt im Array-String für data-jmname="'+that.myJmName+'" weichen von der Anzahl der Objekte im entsprechenden jmconfig der _config.js ab!!! \n\n' +
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
			for(var i = 0, leni = _config.length; i < leni; i++){
				if(_config[i].jmname === this.myJmName){
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


// *********************************  ConfigObject-Functions End    *************************************************

//###################################################################################################################
//###################################################################################################################
//###################################################################################################################
//###################################################################################################################

// *********************************  Global-Singelton-Functions Begin  *********************************************

		_singelton: function(){
			window.dc.singleton = true;
			this._createRAFObjects();
			if(window.dc.debugview){
				this.thempCountedFrames = 0;
				this._applyRAFDeveloperView();
			}
			this._everyRAF();
		},

		_createRAFObjects: function(){
			window.dc.win = {
				pageYOffset: null,
				innerHeight: null,
				innerWidth: null,
				outerHeight: null,
				documentHeight: null,
				startTime: Date.now(),
				counter: 0,
				rafs: null,
				avgrafs: null
			};
			window.dc.execRafObj = {
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
				if(window.dc.win.counter < that.thempCountedFrames){
					this.thempCountedFrames = this.thempCountedFrames + 100000001;
				}
				window.dc.win.rafs = window.dc.win.counter - this.thempCountedFrames;
				window.dc.win.avgrafs = Math.round(window.dc.win.counter/((Date.now() - window.dc.win.startTime)/1000));

				this.$acount.text('avg: '+ window.dc.win.avgrafs+ ' fps | now: '+ window.dc.win.rafs+' fps');

				if(window.dc.onHoldArray && $.type(that.$initByPerfCounter) === 'undefined'){
					this.$acount.after('<span style="padding: 1rem; float: right; background-color: rgba(30,30,30,.8)" id="init-by-perf-counter"> init-fx: 2/?</span>');
					this.$initByPerfCounter = $('#init-by-perf-counter');
					if(window.dc.perf === 1) this.$initByPerfCounter.text(' init-fx: all ');
					if(window.dc.perf === 2) this.$initByPerfCounter.text(' init-fx: 2 ');
				}
				that.thempCountedFrames = window.dc.win.counter;
			}.bind(this), 1000);
		},

// *********************************  Global-Singelton-Functions End    *********************************************

//###################################################################################################################
//###################################################################################################################
//###################################################################################################################
//###################################################################################################################

// *********************************  raf-Functions HOT-CODE Begin  *************************************************

		_everyRAF: function(){
			var _oldDocumentHeight = window.dc.win.documentHeight || document.body.offsetHeight;

			window.dc.win.pageYOffset     = window.pageYOffset;
			window.dc.win.innerHeight     = (window.dc.orientation_old === window.dc.orientation) ? window.dc.win.innerHeight : window.innerHeight;
			window.dc.win.innerWidth      = window.innerWidth;
			window.dc.win.counter         = window.dc.win.counter+1;
			window.dc.win.documentHeight  = document.body.offsetHeight;

			if(window.dc.win.counter === 100000001){
				window.dc.win.counter = 1;
			}

			for(var property in window.dc.execRafObj){
				if(window.dc.execRafObj.hasOwnProperty(property) && ('countProperties' !== property)){
					window.dc.execRafObj[property]();
				}
			}
			window.dc.orientation_old = window.dc.orientation;
			window.dc.raf = window.requestAnimationFrame(this._everyRAF.bind(this));
			if(_oldDocumentHeight !== window.dc.win.documentHeight){
				$('body').trigger('dc-documentHeightChange');
			}
		},

		_render: function(){
			if((window.dc.win.counter % this.renderDelay) !== 0){
				return;
			}
			if(this.$elem.offsetHeight === 0){
				return;
			}
			if(eval(this.conditionSource) && !this.cAF){
				this._exec();
			}
		},

// *********************************  raf-Functions HOT-CODE End    *************************************************

//###################################################################################################################
//###################################################################################################################
//###################################################################################################################
//###################################################################################################################

// *********************************  Common-Functions use by actions Begin  ****************************************

		getRelatedToElem: function(){
			return (this.relatedTo) ? this.relatedTo : this.relatedTo = ((this.is('relatedTo') !== '') ? $(this.is('relatedTo')) : this.$elem);
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
			if(this.is('scrollTo')){
				$(this.is('scrollTo')).scrollToMe((this.is('scrollToOffset') !== '') ? parseInt(this.is('scrollToOffset'), 10) : 0);
			}
		},

		_callback: function(){
			if($.type(this.is('callback') !== 'undefined')) eval(this.is('callback'));
		}

// *********************************  Common-Functions use by actions End    ****************************************
	};
});

