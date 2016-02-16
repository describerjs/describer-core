var __extends = (this && this.__extends) || function (d, b) {
    for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p];
    function __() { this.constructor = d; }
    d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
};
define(["require", "exports", 'prototype'], function (require, exports, prototype_1) {
    var Move = (function (_super) {
        __extends(Move, _super);
        function Move(elem, options, pluginName, pos, jmname) {
            _super.call(this, elem, options, pluginName, pos, jmname);
            this.elem = elem;
            this.options = options;
            this.pluginName = pluginName;
            this.pos = pos;
            this.jmname = jmname;
        }
        Move.prototype._exec = function (e, p_data) {
            this.$destination = this.getRelatedToElem();
            this.injectMethod = (this.is('inject') !== '') ? this.is('inject') : 'append';
            window.requestAnimationFrame(this._move.bind(this));
        };
        Move.prototype._move = function () {
            this.$destination[this.injectMethod](this.$elem);
            this._finishing();
        };
        return Move;
    })(prototype_1.Prototype);
    Object.defineProperty(exports, "__esModule", { value: true });
    exports.default = Move;
});
//# sourceMappingURL=movets.js.map