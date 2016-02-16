var __extends = (this && this.__extends) || function (d, b) {
    for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p];
    function __() { this.constructor = d; }
    d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
};
define(["require", "exports", 'prototype'], function (require, exports, prototype_1) {
    var Trigger = (function (_super) {
        __extends(Trigger, _super);
        function Trigger(elem, options, pluginName, pos, jmname) {
            _super.call(this, elem, options, pluginName, pos, jmname);
            this.elem = elem;
            this.options = options;
            this.pluginName = pluginName;
            this.pos = pos;
            this.jmname = jmname;
        }
        Trigger.prototype._exec = function (e, p_data) {
            this.$destination = this.getRelatedToElem();
            this.$destination.trigger(this.is('data'));
            this._finishing();
        };
        return Trigger;
    })(prototype_1.Prototype);
    Object.defineProperty(exports, "__esModule", { value: true });
    exports.default = Trigger;
});
//# sourceMappingURL=triggerts.js.map