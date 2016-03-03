var __extends = (this && this.__extends) || function (d, b) {
    for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p];
    function __() { this.constructor = d; }
    d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
};
define(["require", "exports", 'prototype'], function (require, exports, prototype_1) {
    "use strict";
    var Toggle = (function (_super) {
        __extends(Toggle, _super);
        function Toggle(elem, options, pluginName, pos, jmname) {
            _super.call(this, elem, options, pluginName, pos, jmname);
            this.elem = elem;
            this.options = options;
            this.pluginName = pluginName;
            this.pos = pos;
            this.jmname = jmname;
        }
        Toggle.prototype.onInitExec = function () {
            if (this.includes('event', 'change') && this._isRadio()) {
                switch (this.$elem.attr('type')) {
                    case 'radio':
                        this.currentstate = this.$elem.prop('checked');
                        break;
                }
            }
        };
        Toggle.prototype._exec = function (e, p_data) {
            if (this.includes('event', 'change') && this._isRadio()) {
                this.newstate = this._getNewState();
                if (this.currentstate === this.newstate) {
                    return;
                }
                this.currentstate = this.newstate;
            }
            this.$destination = this.getRelatedToElem();
            switch (this.is('datatype')) {
                case 'class':
                    window.requestAnimationFrame(this._toggleClass.bind(this));
                    break;
                case 'attr':
                    window.requestAnimationFrame(this._toggleAttr.bind(this));
                    break;
                case 'prop':
                    window.requestAnimationFrame(this._toggleProp.bind(this));
                    break;
            }
        };
        Toggle.prototype._isRadio = function () {
            return (this.$elem[0].tagName.toLowerCase() === 'input' && this.$elem.attr('type') === 'radio');
        };
        Toggle.prototype._getNewState = function () {
            if (this.$elem[0].tagName.toLowerCase() === 'input') {
                switch (this.$elem.attr('type')) {
                    case 'radio':
                        return this.$elem.prop('checked');
                }
            }
        };
        Toggle.prototype._toggleClass = function () {
            this.$destination.toggleClass(this.is('data'));
            this._finishing();
        };
        Toggle.prototype._toggleAttr = function () {
            var data = this.is('data').split(':');
            if ($.type(this.$destination.attr(data[0])) !== 'undefined') {
                this.$destination.removeAttr(data[0]);
            }
            else {
                this.$destination.attr(data[0], data[1]);
            }
            this._finishing();
        };
        Toggle.prototype._toggleProp = function () {
            switch (this.is('data')) {
                case 'checked':
                    this.$destination.prop('checked', !this.$destination.prop('checked'));
            }
            this._finishing();
        };
        return Toggle;
    }(prototype_1.Prototype));
    Object.defineProperty(exports, "__esModule", { value: true });
    exports.default = Toggle;
});
//# sourceMappingURL=togglets.js.map