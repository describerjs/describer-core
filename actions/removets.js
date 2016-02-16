var __extends = (this && this.__extends) || function (d, b) {
    for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p];
    function __() { this.constructor = d; }
    d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
};
define(["require", "exports", 'prototype'], function (require, exports, prototype_1) {
    var Remove = (function (_super) {
        __extends(Remove, _super);
        function Remove(elem, options, pluginName, pos, jmname) {
            _super.call(this, elem, options, pluginName, pos, jmname);
            this.elem = elem;
            this.options = options;
            this.pluginName = pluginName;
            this.pos = pos;
            this.jmname = jmname;
        }
        Remove.prototype._exec = function (e, p_data) {
            this.$destination = this.getRelatedToElem();
            switch (this.is('datatype')) {
                case 'class':
                    window.requestAnimationFrame(this._removeClass.bind(this));
                    break;
                case 'html':
                    window.requestAnimationFrame(this._removeHtml.bind(this));
                    break;
                case 'attr':
                    window.requestAnimationFrame(this._removeAttr.bind(this));
                    break;
                case 'prop':
                    window.requestAnimationFrame(this._removeProp.bind(this));
                    break;
            }
        };
        Remove.prototype._removeClass = function () {
            this.$destination.removeClass(this.is('data'));
            this._finishing();
        };
        Remove.prototype._removeHtml = function () {
            this.$destination.remove();
            this._finishing();
        };
        Remove.prototype._removeAttr = function () {
            this.$destination.removeAttr(this.is('data'));
            this._finishing();
        };
        Remove.prototype._removeProp = function () {
            this.$destination.removeProp(this.is('data'));
            this._finishing();
        };
        return Remove;
    })(prototype_1.Prototype);
    Object.defineProperty(exports, "__esModule", { value: true });
    exports.default = Remove;
});
//# sourceMappingURL=removets.js.map