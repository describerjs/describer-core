var __extends = (this && this.__extends) || function (d, b) {
    for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p];
    function __() { this.constructor = d; }
    d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
};
define(["require", "exports", 'prototype'], function (require, exports, prototype_1) {
    var Set = (function (_super) {
        __extends(Set, _super);
        function Set(elem, options, pluginName, pos, jmname) {
            _super.call(this, elem, options, pluginName, pos, jmname);
            this.elem = elem;
            this.options = options;
            this.pluginName = pluginName;
            this.pos = pos;
            this.jmname = jmname;
        }
        Set.prototype._exec = function (e, p_data) {
            this.$destination = this.getRelatedToElem();
            this.data = this.is('data');
            switch (this.is('datatype')) {
                case 'attr':
                    window.requestAnimationFrame(this._setAttr.bind(this));
                    break;
                case 'prop':
                    window.requestAnimationFrame(this._setProp.bind(this));
                    break;
                case 'style':
                    window.requestAnimationFrame(this._setStyle.bind(this));
                    break;
                case 'val':
                default:
                    window.requestAnimationFrame(this._setVal.bind(this));
                    break;
            }
        };
        Set.prototype._getCssObj = function () {
            var _obj = {};
            var _arr;
            var _dataArray = this.data.split('|');
            for (var i = 0, leni = _dataArray.length; i < leni; i++) {
                _arr = _dataArray[i].split(':');
                _obj[_arr[0]] = _arr[1];
            }
            return _obj;
        };
        Set.prototype._setVal = function () {
            this.$destination.val(this.data);
            this._finishing();
        };
        Set.prototype._setAttr = function () {
            var data = this.data.split(':');
            this.$destination.attr(data[0], data[1]);
            this._finishing();
        };
        Set.prototype._setStyle = function () {
            this.$destination.css(this._getCssObj());
            this._finishing();
        };
        Set.prototype._setProp = function () {
            var data = this.data.split(':');
            if (data[0] === 'checked') {
                data[1] = (data[1] === 'true');
            }
            this.$destination.prop(data[0], data[1]);
            this._finishing();
        };
        return Set;
    })(prototype_1.Prototype);
    Object.defineProperty(exports, "__esModule", { value: true });
    exports.default = Set;
});
//# sourceMappingURL=setts.js.map