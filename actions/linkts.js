var __extends = (this && this.__extends) || function (d, b) {
    for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p];
    function __() { this.constructor = d; }
    d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
};
define(["require", "exports", 'prototype'], function (require, exports, prototype_1) {
    var Link = (function (_super) {
        __extends(Link, _super);
        function Link(elem, options, pluginName, pos, jmname) {
            _super.call(this, elem, options, pluginName, pos, jmname);
            this.elem = elem;
            this.options = options;
            this.pluginName = pluginName;
            this.pos = pos;
            this.jmname = jmname;
        }
        Link.prototype.onInitExec = function () {
            this.loader = this.is('loader');
            if (this.loader !== '') {
                switch (this.loader) {
                    case 'sticky':
                        this.$ani = $('<div class="loader-sticky">' +
                            '<div class="rect1"></div>' +
                            '<div class="rect2"></div>' +
                            '<div class="rect3"></div>' +
                            '<div class="rect4"></div>' +
                            '<div class="rect5"></div>' +
                            '</div> ');
                        break;
                    case 'spinner':
                        this.$ani = $('<div class="loading-container"><div class="loading"></div></div>');
                        break;
                    case 'none':
                        break;
                    default:
                        this.$ani = $('<div class="loader">' +
                            '<div class="rect1"></div>' +
                            '<div class="rect2"></div>' +
                            '<div class="rect3"></div>' +
                            '<div class="rect4"></div>' +
                            '<div class="rect5"></div>' +
                            '</div> ');
                        break;
                }
            }
        };
        Link.prototype._exec = function (e, p_data) {
            this.$elem.append(this.$ani);
            this.url = (this.$elem.attr('href').substring(0, 1) !== '#') ? this.$elem.attr('href') : this.is('prefix') + this.$elem.attr('href');
            (this.$elem.attr('target') === '_blank') ? window.open(this.url, '_blank') : window.location.href = this.url;
        };
        return Link;
    })(prototype_1.Prototype);
    Object.defineProperty(exports, "__esModule", { value: true });
    exports.default = Link;
});
//# sourceMappingURL=linkts.js.map