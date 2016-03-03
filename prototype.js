define(["require", "exports", "jquery", "underscore", '_config', "core"], function (require, exports, $, _, _config) {
    "use strict";
    var Prototype = (function () {
        function Prototype(elem, options, pluginName, pos, jmname) {
            this.elem = elem;
            this.options = options;
            this.pluginName = pluginName;
            this.pos = pos;
            this.jmname = jmname;
            this.dcEvents = [];
            this.$elem = $(this.elem);
            this.myPos = pos;
            this.myJmName = jmname;
            this.name = pluginName;
            this.namePostfix = (this.name.slice(-2).charAt(0) === '_') ? this.name.slice(-2) : '';
            this.initExec();
        }
        Prototype.prototype._exec = function (e, p_data) { };
        ;
        Prototype.prototype.initExec = function () {
            this.configObj = this._getConfigObjArray();
            if ($.type(this.configObj['init']) !== 'undefined') {
                new Function('"use strict";' + this.configObj['init']).call(this);
            }
        };
        Prototype.prototype.onInitExec = function () {
        };
        Prototype.prototype.click = function (e) {
            if (this.includes('event', 'click') && this.isCondition())
                this._execWait(e);
        };
        Prototype.prototype.change = function (e) {
            if (this.includes('event', 'change') && this.isCondition())
                this._execWait(e);
        };
        Prototype.prototype.jmtrigger = function (e, e_param) {
            if ($.type(e_param) === 'undefined') {
                if (window.dc.config.debug) {
                    window.dc.dev.warn('Es wird kein Event mitgegeben. Zum einen muss im jmconfig-Objekt als Value z.B. \'jmtrigger:click\' für \'event\' angegeben werden und der Event muss entsprechend via jmtrigger(\'click\') gefeuert werden.');
                }
                return;
            }
            if (this.includes('event', 'jmtrigger:' + e_param.event) && this.isCondition())
                this._execWait(e, e_param.data);
        };
        Prototype.prototype.dominit = function (e) {
            if (this.includes('event', 'dominit') && this.isCondition())
                this._execWait(e);
            if (this.partOf('event', 'raf'))
                this._raf(e);
            if (this.partOf('event', 'interval'))
                this._interval(e);
            if (this.includes('event', 'init-by-perf'))
                this._initByPerf(e);
            if (this.partOf('event', 'keyup'))
                this._keyup(e);
            if (this.includes('event', 'blur'))
                this.$elem.on('blur', this._execWaitAfterCondition.bind(this));
            if (this.includes('event', 'focus'))
                this.$elem.on('focus', this._execWaitAfterCondition.bind(this));
            if (this.includes('event', 'hover'))
                this.$elem.on('mouseover', this._execWaitAfterCondition.bind(this));
            if (this.startsWith('event', 'dc-')) {
                for (var i = 0, leni = this.dcEvents.length; i < leni; i++) {
                    this.$elem.closest('body').on(this.dcEvents[i], this._execWaitAfterCondition.bind(this));
                }
            }
        };
        Prototype.prototype.is = function (p_dataAttr, p_value, p_now) {
            var _returnString;
            if ($.type(p_dataAttr) === 'undefined') {
                window.dc.dev.error('es wurde kein Parameter übergeben');
                return;
            }
            this.configObj = this._getConfigObjArray(p_now);
            if ($.type(this.configObj[p_dataAttr]) === 'undefined') {
                return '';
            }
            if ($.type(p_value) !== 'undefined') {
                return this.configObj[p_dataAttr] === p_value;
            }
            _returnString = this.configObj[p_dataAttr];
            switch (p_dataAttr) {
                case 'relatedTo':
                case 'scrollTo':
                case 'scrollToOffset':
                case 'data':
                case 'loaderTo':
                case 'event':
                    return ((this.configObj[p_dataAttr].indexOf('this.') !== -1) || (this.configObj[p_dataAttr].indexOf('window.jmHF') !== -1) || (this.configObj[p_dataAttr].indexOf('window.dc') !== -1)) ? eval(_returnString) : _returnString;
                default:
                    return _returnString;
            }
        };
        Prototype.prototype.isNow = function (p_dataAttr, p_value) {
            this.is(p_dataAttr, p_value, true);
        };
        Prototype.prototype.isCondition = function (p_value, p_now) {
            if (p_value === void 0) { p_value = 'not defined'; }
            if (p_now === void 0) { p_now = false; }
            this.configObj = this._getConfigObjArray(p_now);
            if (p_value === 'source') {
                return ($.type(this.configObj['condition']) !== 'undefined') ? this.configObj['condition'] : true;
            }
            return ($.type(this.configObj['condition']) !== 'undefined') ? eval(this.configObj['condition']) : true;
        };
        Prototype.prototype.includes = function (p_dataAttr, p_value, p_now) {
            if (p_now === void 0) { p_now = false; }
            var _array_value;
            this.configObj = this._getConfigObjArray(p_now);
            if ($.type(this.configObj[p_dataAttr]) === 'undefined') {
                return;
            }
            if (this.configObj[p_dataAttr].indexOf('this.') === -1) {
                return $.inArray(p_value, this.configObj[p_dataAttr].split('|')) !== -1;
            }
            _array_value = this.configObj[p_dataAttr].split('|');
            for (var i = 0, leni = _array_value.length; i < leni; i++) {
                if ((_array_value[i].indexOf('this.') != -1) && (_array_value[i].indexOf('jmtrigger:') != -1)) {
                    _array_value[i] = eval(_array_value[i]);
                }
            }
            return $.inArray(p_value, _array_value) !== -1;
        };
        Prototype.prototype.startsWithNow = function (p_dataAttr, p_value) {
            this.startsWith(p_dataAttr, p_value, true);
        };
        Prototype.prototype.startsWith = function (p_dataAttr, p_value, p_now) {
            if (p_now === void 0) { p_now = false; }
            var that = this;
            this.configObj = this._getConfigObjArray(p_now);
            return ($.type(this.configObj[p_dataAttr]) !== 'undefined' && ($.inArray(true, $.map(this.configObj[p_dataAttr].split('|'), function (s) {
                if (/^dc-/i.test(s)) {
                    that.dcEvents = that.dcEvents || [];
                    if (that.dcEvents[s])
                        return true;
                    that.dcEvents.push(s);
                    return true;
                }
                return false;
            }))) !== -1);
        };
        Prototype.prototype.includesNow = function (p_dataAttr, p_value) {
            this.includes(p_dataAttr, p_value, true);
        };
        Prototype.prototype.partOf = function (p_dataAttr, p_value, p_now) {
            if (p_now === void 0) { p_now = false; }
            this.configObj = this._getConfigObjArray(p_now);
            return ($.type(this.configObj[p_dataAttr]) !== 'undefined' && ($.inArray(true, $.map(this.configObj[p_dataAttr].split('|'), function (s) {
                return (s.indexOf(p_value) > -1);
            }))) !== -1);
        };
        Prototype.prototype.partOfNow = function (p_dataAttr, p_value) {
            this.partOf(p_dataAttr, p_value, true);
        };
        Prototype.prototype.getPartOf = function (p_dataAttr, p_value, p_now) {
            var _return;
            this.configObj = this._getConfigObjArray(p_now);
            if ($.type(this.configObj[p_dataAttr]) === 'undefined') {
                return;
            }
            _return = $.map(this.configObj[p_dataAttr].split('|'), function (s) {
                if (s.indexOf(p_value) > -1) {
                    return s;
                }
            })[0];
            return _return || '';
        };
        Prototype.prototype._interval = function (e) {
            var that = this;
            setInterval(function () {
                if (that.isCondition())
                    that._execWait(e);
            }, parseInt(this.getPartOf('event', 'interval').split('interval-')[1], 10));
        };
        Prototype.prototype._keyup = function (e) {
            var _delay;
            if ($.type(parseInt(this.getPartOf('event', 'keyup').split('delay-')[1], 10)) === 'number') {
                _delay = parseInt(this.getPartOf('event', 'keyup').split('delay-')[1], 10);
            }
            this.$elem.on('keyup', _.debounce(this._execWaitAfterCondition.bind(this, e), _delay));
        };
        Prototype.prototype._raf = function (e) {
            this.guaranteeDCRAF();
            this.oneTimeExec = this.getPartOf('event', 'raf').indexOf('-one') !== -1;
            this.renderDelay = this._getRenderDelay();
            this.conditionSource = this.isCondition('source');
            this._addRenderFunctionToRafExecIterationObj(e);
        };
        Prototype.prototype._initByPerf = function (e) {
            var _initByPerfCounter = 2;
            if (window.dc.perf.level === 0) {
                return;
            }
            if (window.dc.perf.level === 1 || window.dc.perf.level === 4) {
                this._execWaitAfterCondition(e);
                return;
            }
            if (!window.dc.raf.win) {
                this._createRAFObjects();
            }
            window.dc.perf.onHoldArray = window.dc.perf.onHoldArray || [];
            window.dc.perf.onHoldArrayExecuted = window.dc.perf.onHoldArrayExecuted || false;
            window.dc.perf.onHoldArray.push({ 'obj': this, 'e': e, 'exec': false });
            for (var i = 0, leni = window.dc.perf.onHoldArray.length; i < leni; i++) {
                if (_initByPerfCounter > i) {
                    this._applyOnHoldPlugin(i);
                }
            }
            if ($.type(window.dc.perf.intervalIDForOnHoldPlugins) === 'undefined') {
                window.dc.perf.intervalIDForOnHoldPlugins = setInterval(this._intervalForApplyOnHoldPlugins.bind(this), 1000);
                setTimeout(function () {
                    clearInterval(window.dc.perf.intervalIDForOnHoldPlugins);
                }, 15000);
            }
        };
        Prototype.prototype._execWaitAfterCondition = function (e) {
            if (this.isCondition()) {
                this._execWait(e);
            }
        };
        Prototype.prototype._execWait = function (e, p_data) {
            if (p_data === void 0) { p_data = undefined; }
            var that = this;
            if (this.is('wait') === '') {
                this._exec(e, p_data);
                return;
            }
            if (this.is('wait') === 'raf') {
                window.requestAnimationFrame(this._exec.bind(this, e, p_data));
                return;
            }
            if (this.is('wait') !== '') {
                setTimeout(function () { that._exec(e, p_data); }, parseInt(this.is('wait'), 10));
            }
        };
        Prototype.prototype._getRenderDelay = function () {
            var _filteredRafString = this.getPartOf('event', 'raf').replace('raf-', '').replace('-one', '').replace('ms', '').replace('raf', '');
            return (_filteredRafString !== '') ? parseInt(_filteredRafString, 10) + Math.ceil(Math.random() * parseInt(_filteredRafString, 10) / 4) : 1;
        };
        Prototype.prototype._applyOnHoldPlugin = function (index) {
            var _obj = window.dc.perf.onHoldArray[index].obj;
            if (!window.dc.perf.onHoldArray[index].exec) {
                window.dc.perf.onHoldArray[index].exec = true;
                _obj._execWaitAfterCondition();
            }
        };
        Prototype.prototype._intervalForApplyOnHoldPlugins = function () {
            var _obj;
            if (window.dc.perf.onHoldArray && !window.dc.perf.onHoldArrayExecuted && window.dc.raf.win._avgrafs > 45) {
                for (var i = 0, leni = window.dc.perf.onHoldArray.length; i < leni; i++) {
                    _obj = window.dc.perf.onHoldArray[i].obj;
                    if (!_obj.exec) {
                        _obj.exec = true;
                        _obj._execWaitAfterCondition();
                        if (window.dc.dev.debugview) {
                            $('#init-by-perf-counter').text(' init-fx: ' + (i + 1) + '/' + leni);
                        }
                        return;
                    }
                    else if ((leni - 1) === i) {
                        window.dc.perf.onHoldArrayExecuted = true;
                    }
                }
            }
        };
        Prototype.prototype._getConfigObjArray = function (p_now) {
            if (p_now === void 0) { p_now = false; }
            if (p_now && Object.keys(this.initConfigObj).length > 0) {
                return this.initConfigObj;
            }
            if ($.type(this._getAttrWithOrWithoutPostfix_1() || this.$elem.data('jmconfig')) === 'undefined') {
                return this.initConfigObj = this.staticObj || this._getStaticConfigObj();
            }
            return this.initConfigObj = $.extend({}, (this.staticObj || this._getStaticConfigObj()), this._getObjFromDom(p_now));
        };
        Prototype.prototype._getAttrWithOrWithoutPostfix_1 = function () {
            return this.staticAttrFromDom || (this.staticAttrFromDom = (this.namePostfix === '_1') ? (this.$elem.attr('data-dcconfig--' + this.myJmName + '--' + this.name) || this.$elem.attr('data-dcconfig--' + this.myJmName + '--' + this.name.split('_1')[0])) : (this.$elem.attr('data-dcconfig--' + this.myJmName + '--' + this.name) || this.$elem.attr('data-dcconfig--' + this.myJmName + '--' + this.name + '_1')));
        };
        Prototype.prototype._getObjFromDom = function (p_now) {
            if (window.dc.config.debug) {
                if (this.$elem.data('jmconfig') && window.dc.helper.attrPrefixCounter(this.$elem[0], 'data-dcconfig')) {
                    window.dc.dev.warn('data-jmconfig und data-dcconfig dürfen nicht zusammen als Attribut auf folgenden Tag verwendet. data-jmconfig ist depricated. Die Überschreibung der config-Objekte ist mit data-dcconfig--... durchzuführen.');
                }
            }
            if (this._getAttrWithOrWithoutPostfix_1()) {
                return this._getObjFromDcConfigAttr(p_now);
            }
            return {};
        };
        Prototype.prototype._getObjFromDcConfigAttr = function (p_now) {
            if ($.type(p_now) === 'undefined' && $.type(this.staticObjFromDom) !== 'undefined') {
                return this.staticObjFromDom;
            }
            return this.staticObjFromDom = JSON.parse(this._getAttrWithOrWithoutPostfix_1().replace(/'/g, "\""));
        };
        Prototype.prototype._getStaticConfigObj = function () {
            var _objForMyJmName = _config.default[window.dc.helper.camelCase(this.myJmName)];
            if (_objForMyJmName.hasOwnProperty('event')) {
                return this.staticObj = _objForMyJmName;
            }
            return this.staticObj = _objForMyJmName[this.name];
        };
        Prototype.prototype.guaranteeDCRAF = function () {
            if (window.dc.raf.iterationSingleton) {
                return;
            }
            window.dc.raf.iterationSingleton = true;
            this._createRAFObjects();
            if (window.dc.dev.debugview) {
                this.thempCountedFrames = 0;
                this._applyRAFDeveloperView();
            }
            this._everyRAF();
        };
        Prototype.prototype._createRAFObjects = function () {
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
                countProperties: function () {
                    var count = 0;
                    for (var property in this) {
                        if (this.hasOwnProperty(property) && this.property !== null) {
                            count += 1;
                        }
                    }
                    return count;
                }
            };
        };
        Prototype.prototype._applyRAFDeveloperView = function () {
            var that = this;
            $('body').append('<div style="position: fixed; color:#eee; font-weight: bold; bottom: 0; left: 0; background-color:rgba(0,0,0,.2); padding-top: 1rem; padding-left: 1rem; padding-right: 1rem; padding-bottom: 2rem; width: 100%; z-index: 9999"><span style="padding: 1rem; float: left; background-color: rgba(30,30,30,.8)" id="fps-counter" >avg: --- fps | now: --- fps</span></div>');
            this.$acount = $('#fps-counter');
            setInterval(function () {
                if (window.dc.raf.win._counter < that.thempCountedFrames) {
                    this.thempCountedFrames = this.thempCountedFrames + 100000001;
                }
                window.dc.raf.win._rafs = window.dc.raf.win._counter - this.thempCountedFrames;
                window.dc.raf.win._avgrafs = Math.round(window.dc.raf.win._counter / ((Date.now() - window.dc.raf.win._startTime) / 1000));
                this.$acount.text('avg: ' + window.dc.raf.win._avgrafs + ' fps | now: ' + window.dc.raf.win._rafs + ' fps');
                if (window.dc.perf.onHoldArray && $.type(that.$initByPerfCounter) === 'undefined') {
                    this.$acount.after('<span style="padding: 1rem; float: right; background-color: rgba(30,30,30,.8)" id="init-by-perf-counter"> init-fx: 2/?</span>');
                    this.$initByPerfCounter = $('#init-by-perf-counter');
                    if (window.dc.perf.level === 1)
                        this.$initByPerfCounter.text(' init-fx: all ');
                    if (window.dc.perf.level === 2)
                        this.$initByPerfCounter.text(' init-fx: 2 ');
                }
                that.thempCountedFrames = window.dc.raf.win._counter;
            }.bind(this), 1000);
        };
        Prototype.prototype._everyRAF = function () {
            var _oldDocumentHeight = window.dc.raf.win.documentHeight || document.body.offsetHeight;
            window.dc.raf.win.pageYOffset = window.pageYOffset;
            window.dc.raf.win.innerHeight = (window.dc.client._orientation_old === window.dc.client.orientation) ? window.dc.raf.win.innerHeight : window.innerHeight;
            window.dc.raf.win.innerWidth = window.innerWidth;
            window.dc.raf.win._counter = window.dc.raf.win._counter + 1;
            window.dc.raf.win.documentHeight = document.body.offsetHeight;
            if (window.dc.raf.win._counter === 100000001) {
                window.dc.raf.win._counter = 1;
            }
            for (var property in window.dc.raf.execIterationObj) {
                if (window.dc.raf.execIterationObj.hasOwnProperty(property) && ('countProperties' !== property)) {
                    window.dc.raf.execIterationObj[property]();
                }
            }
            window.dc.client._orientation_old = window.dc.client.orientation;
            window.requestAnimationFrame(this._everyRAF.bind(this));
            if (_oldDocumentHeight !== window.dc.raf.win.documentHeight) {
                $('body').trigger('dc-documentHeightChange');
            }
        };
        Prototype.prototype._render = function (e) {
            if ((window.dc.raf.win._counter % this.renderDelay) !== 0) {
                return;
            }
            if (this.$elem[0].offsetHeight === 0) {
                return;
            }
            if (!this.oneTimeExec && eval(this.conditionSource)) {
                this._exec(e);
                return;
            }
            if (this.oneTimeExec && eval(this.conditionSource)) {
                this._exec(e);
                this._removeRenderFunctionFromRafExecIterationObj();
            }
        };
        Prototype.prototype._addRenderFunctionToRafExecIterationObj = function (e) {
            this.renderFunctionIndex = window.dc.raf.execIterationObj.countProperties();
            window.dc.raf.execIterationObj['renderFunction_' + this.renderFunctionIndex] = this._render.bind(this, e);
        };
        Prototype.prototype._removeRenderFunctionFromRafExecIterationObj = function () {
            window.dc.raf.execIterationObj['renderFunction_' + this.renderFunctionIndex] = null;
            delete window.dc.raf.execIterationObj['renderFunction_' + this.renderFunctionIndex];
        };
        Prototype.prototype.getRelatedToElem = function () {
            return (this.relatedTo) ? this.relatedTo : this.relatedTo = ((this.is('relatedTo') !== '') ? $(this.is('relatedTo')) : this.$elem);
        };
        Prototype.prototype.getUniqueId = function () {
            if (this.uniqueId) {
                return this.uniqueId;
            }
            return this.uniqueId = window.dc.helper.uuID.generate();
        };
        Prototype.prototype._finishing = function (p_$data) {
            var that = this;
            this._scrollTo();
            if ($.type(p_$data) !== 'undefined') {
                setTimeout(function () {
                    p_$data
                        .requirementsForJmPlugins()
                        .triggerSelfexecObj()
                        .picturefill();
                    that._callback();
                }, 200);
                return;
            }
            this._callback();
        };
        Prototype.prototype._scrollTo = function () {
            if (this.is('scrollTo') === '') {
                return;
            }
            if ($.type(this.is('scrollTo')) === 'number') {
                window.dc.helper.scrollToPosition(this.is('scrollTo'), (this.is('speed') !== '') ? parseInt(this.is('speed'), 10) : undefined);
                return;
            }
            if ($.type(this.is('scrollTo')) === 'string') {
                try {
                    if ($.type($(this.is('scrollTo'))) === 'object') {
                        $(this.is('scrollTo')).scrollToMe((this.is('scrollToOffset') !== '') ? parseInt(this.is('scrollToOffset'), 10) : 0, (this.is('speed') !== '') ? parseInt(this.is('speed'), 10) : undefined);
                        return;
                    }
                    window.dc.dev.warn('falsche angabe für scrollTo');
                }
                catch (e) {
                    window.dc.dev.error('falsche angabe für scrollTo');
                    console.error(e.message);
                }
            }
        };
        Prototype.prototype._callback = function () {
            if ($.type(this.is('callback') !== 'undefined'))
                eval(this.is('callback').replace(/\n/g, ''));
        };
        return Prototype;
    }());
    exports.Prototype = Prototype;
});
//# sourceMappingURL=prototype.js.map