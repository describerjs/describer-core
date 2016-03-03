var __extends = (this && this.__extends) || function (d, b) {
    for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p];
    function __() { this.constructor = d; }
    d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
};
define(["require", "exports", 'prototype'], function (require, exports, prototype_1) {
    "use strict";
    var Exec = (function (_super) {
        __extends(Exec, _super);
        function Exec(elem, options, pluginName, pos, jmname) {
            _super.call(this, elem, options, pluginName, pos, jmname);
            this.elem = elem;
            this.options = options;
            this.pluginName = pluginName;
            this.pos = pos;
            this.jmname = jmname;
        }
        Exec.prototype._exec = function (e, p_data) {
            try {
                eval(this.is('exec').replace(/\n/g, ''));
            }
            catch (e) {
                window.dc.dev.warn(e);
            }
            this._finishing();
        };
        return Exec;
    }(prototype_1.Prototype));
    Object.defineProperty(exports, "__esModule", { value: true });
    exports.default = Exec;
});
//# sourceMappingURL=exects.js.map