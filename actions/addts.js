var __extends = (this && this.__extends) || function (d, b) {
    for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p];
    function __() { this.constructor = d; }
    d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
};
define(["require", "exports", 'prototype'], function (require, exports, prototype_1) {
    "use strict";
    var Add = (function (_super) {
        __extends(Add, _super);
        function Add(elem, options, pluginName, pos, jmname) {
            _super.call(this, elem, options, pluginName, pos, jmname);
            this.elem = elem;
            this.options = options;
            this.pluginName = pluginName;
            this.pos = pos;
            this.jmname = jmname;
        }
        Add.prototype._exec = function (e, p_data) {
            this.$destination = this.getRelatedToElem();
            if ($.type(p_data) !== 'undefined') {
                this.data = (p_data.match(/<(.*)[^>]*>/)) ? $(p_data) : p_data;
            }
            else if (this.is('data') !== '') {
                this.data = this.is('data');
            }
            else {
                this.data = this._getOutcommendHtml();
            }
            switch (this.is('datatype')) {
                case 'class':
                    window.requestAnimationFrame(this._addClass.bind(this));
                    break;
                case 'style':
                    window.requestAnimationFrame(this._addStyle.bind(this));
                    break;
                case 'html':
                    this.injectMethod = (this.is('inject') !== '') ? this.is('inject') : 'html';
                    window.requestAnimationFrame(this._addHtml.bind(this));
                    break;
                case 'attr':
                    window.requestAnimationFrame(this._addAttr.bind(this));
                    break;
                case 'prop':
                    window.requestAnimationFrame(this._addProp.bind(this));
                    break;
                case 'text':
                    window.requestAnimationFrame(this._addText.bind(this));
                    break;
            }
        };
        Add.prototype._getOutcommendHtml = function () {
            var i = 0;
            var length = this.$destination[0].childNodes.length;
            for (; i < length; i++) {
                if (this.$destination[0].childNodes[i].nodeType === 8) {
                    this.$destination[0].childNodes[i].nodeValue;
                    return (this.$destination[0].childNodes[i].textContent !== undefined) ? this.$destination[0].childNodes[i].textContent.replace('comment in by JS', '') : this.$destination[0].childNodes[i].nodeValue.replace('comment in by JS', '');
                }
            }
            window.dc.dev.warn('data is not define or an empty string');
            return '';
        };
        Add.prototype._getCssObj = function () {
            var _obj = {};
            var _arr;
            var _dataArray = this.data.split('|');
            for (var i = 0, leni = _dataArray.length; i < leni; i++) {
                _arr = _dataArray[i].split(':');
                _obj[_arr[0]] = _arr[1];
            }
            return _obj;
        };
        Add.prototype._addClass = function () {
            this.$destination.addClass(this.data);
            this._finishing();
        };
        Add.prototype._addStyle = function () {
            this.$destination.css(this._getCssObj());
            this._finishing();
        };
        Add.prototype._addAttr = function () {
            var data = this.data.split(':');
            this.$destination.attr(data[0], data[1]);
            this._finishing();
        };
        Add.prototype._addHtml = function () {
            var $data = $(this.data);
            this.$destination[this.injectMethod]($data);
            if (this.is('data') === '') {
                this._finishing($data);
            }
            else {
                this._finishing();
            }
        };
        Add.prototype._addText = function () {
            this.$destination.text(this.data);
            this._finishing();
        };
        Add.prototype._addProp = function () {
            var data = this.data.split(':');
            if (data[0] === 'checked') {
                data[1] = (data[1] === 'true');
            }
            this.$destination.prop(data[0], data[1]);
            this._finishing();
        };
        return Add;
    }(prototype_1.Prototype));
    Object.defineProperty(exports, "__esModule", { value: true });
    exports.default = Add;
});
//# sourceMappingURL=addts.js.map