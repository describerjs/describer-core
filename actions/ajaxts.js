var __extends = (this && this.__extends) || function (d, b) {
    for (var p in b) if (b.hasOwnProperty(p)) d[p] = b[p];
    function __() { this.constructor = d; }
    d.prototype = b === null ? Object.create(b) : (__.prototype = b.prototype, new __());
};
define(["require", "exports", 'prototype'], function (require, exports, prototype_1) {
    "use strict";
    var Ajax = (function (_super) {
        __extends(Ajax, _super);
        function Ajax(elem, options, pluginName, pos, jmname) {
            _super.call(this, elem, options, pluginName, pos, jmname);
            this.elem = elem;
            this.options = options;
            this.pluginName = pluginName;
            this.pos = pos;
            this.jmname = jmname;
        }
        Ajax.prototype.onInitExec = function () {
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
            else {
                this.$ani = $('<div class="loading-container"><div class="loading"></div></div>');
            }
            if (this.is('loaderTo') !== '') {
                this.$additionalloader = $('<div class="loading-container"><div class="loading"></div></div>');
            }
        };
        Ajax.prototype._exec = function (e, p_data) {
            var that = this;
            if (this.is('loaderTo') !== '') {
                $(this.is('loaderTo')).append(this.$additionalloader);
            }
            this.$destination = this.subObj_$destination || this.getRelatedToElem();
            this.injection = this.is('inject');
            $.ajax({
                type: (that.is('type') !== '') ? ((that.is('type', 'post')) ? 'POST' : 'GET') : 'GET',
                url: that._getUrl(),
                data: that._getData(),
                beforeSend: function () {
                    that._beforeSend(that.$destination);
                }
            }).done(function (p_data) {
                that.data = ($.type(p_data) === 'string' && p_data.match(/<(.*)[^>]*>/)) ? $(p_data) : p_data;
                window.requestAnimationFrame(that._injectAfterFrame.bind(that));
            }).always(function () {
            }).fail(function () {
                that.$ani.remove();
                if (that.is('loaderTo') !== '') {
                    that.$additionalloader.remove();
                }
            });
        };
        Ajax.prototype._getData = function () {
            var _obj = {};
            if (this.is('data').indexOf('this.') !== -1) {
                return eval(this.is('data'));
            }
            if (this.is('data').match(/^\$\$(.*)/)) {
                window.dc[this.is('data')] = window.dc[this.is('data')] || {};
                if (this.$elem[0].tagName.toLowerCase() === 'select') {
                    window.dc[this.is('data')][this.$elem.attr('name')] = this.$elem.val();
                }
                return this._convertObjToQueryString(window.dc[this.is('data')]);
            }
            if (this.is('data') !== '') {
                return this.is('data');
            }
            if (this.is('data') === '' && this.$elem[0].tagName.toLowerCase() === 'select') {
                _obj[this.$elem.attr('name')] = this.$elem.val();
                return _obj;
            }
            return '';
        };
        Ajax.prototype._getUrl = function () {
            if (this.is('url') !== '') {
                return this.is('url');
            }
            if ($.type(this.$elem.attr('href')) !== 'undefined' && !this.$elem.attr('href').match(/^#(.*)/g)) {
                return this.$elem.attr('href');
            }
            window.dc.dev.warn('There is no valid url defined');
        };
        Ajax.prototype._convertObjToQueryString = function (p_Obj) {
            var q = '';
            $.each(p_Obj, function (key, value) {
                if (value !== '') {
                    q = q + ((q !== '') ? '&' : '') + key + '=' + value;
                }
            });
            return q;
        };
        Ajax.prototype._beforeSend = function (p_$target) {
            if ($.type(this.$ani) !== 'undefined') {
                this.$ani.css({
                    'top': window.dc.client.getHeight() / 2
                });
                if (this.injection !== '') {
                    p_$target[this.injection](this.$ani);
                }
            }
            if (this.is('scrollTo') !== '') {
                this._scrollTo();
            }
        };
        Ajax.prototype._injectAfterFrame = function () {
            var that = this;
            if ($.type(this.$ani) !== 'undefined') {
                this.$ani.remove();
            }
            if (this.is('loadertarget') !== '') {
                this.$loadertargetani.remove();
            }
            if (this.injection === 'html') {
                this.$destination.empty();
            }
            if (this.$destination.doesExist() && this.injection !== '') {
                this.$destination[this.injection](this.data);
            }
            if (this.data instanceof jQuery) {
                this._finishing(this.data);
            }
            else {
                this._finishing();
            }
            this.ajaxCompleteCallback();
        };
        Ajax.prototype.getResponse = function () {
            return this.data;
        };
        Ajax.prototype.ajaxCompleteCallback = function () {
        };
        return Ajax;
    }(prototype_1.Prototype));
    Object.defineProperty(exports, "__esModule", { value: true });
    exports.default = Ajax;
});
//# sourceMappingURL=ajaxts.js.map