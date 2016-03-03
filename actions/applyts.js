var __extends = (this && this.__extends) || function (d, b) {
    for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p];
    function __() { this.constructor = d; }
    d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
};
define(["require", "exports", 'prototype'], function (require, exports, prototype_1) {
    "use strict";
    var Apply = (function (_super) {
        __extends(Apply, _super);
        function Apply(elem, options, pluginName, pos, jmname) {
            _super.call(this, elem, options, pluginName, pos, jmname);
            this.elem = elem;
            this.options = options;
            this.pluginName = pluginName;
            this.pos = pos;
            this.jmname = jmname;
        }
        Apply.prototype._exec = function (e, p_data) {
            var that = this;
            var options = {};
            var _opt;
            if (that.is('options') !== '') {
                if (this.is('optionsParse') === 'true') {
                    _opt = this.is('options').replace('"', '\"');
                    options = JSON.parse(this.is('options'));
                }
                else {
                    options = that.is('options');
                }
            }
            this.$destination = this.getRelatedToElem();
            if (this.is('function') !== '') {
                require([this.is('require')], function () {
                    that.$destination[that.is('function')](options);
                });
            }
            this._finishing();
        };
        return Apply;
    }(prototype_1.Prototype));
    Object.defineProperty(exports, "__esModule", { value: true });
    exports.default = Apply;
});
//# sourceMappingURL=applyts.js.map