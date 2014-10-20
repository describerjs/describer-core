/*!
 * actions.set
 *
 * http://joinmedia.de/
 *
 * Copyright (c) 2014 join.media GmbH & Co. KG
 *
 * Created by aotten77 on 22.08.2014.
 *
 * Released under the MIT license
 */
define(['jquery', '_super'], function ($, _super){
	'use strict';
	var set = $.extend({}, _super, {
		init: function (options, elem) {
			this.options = $.extend({}, this.options, options);
			this.name = this.options.pluginName;
			this.pos = this.options.pos;
			this.jmname = this.options.jmname;
			this.$elem = $(elem);
			_super.config.call(this);

			this.onInitExec();
			return this;
		},

		onInitExec: function () {

		},

		options: {

		},

		_exec: function(e){
			this.$destination = (this.is('relatedTo') !== '') ? $(this.is('relatedTo')) : this.$elem;
			this.data = this.is('data');
			switch(this.is('datatype')){
				/*case 'class':
					window.requestAnimationFrame(this._setClass.bind(this));
					break;
				case 'html':
					this.injectMethod = (this.is('inject') !== '') ? this.is('inject') : 'html';
					window.requestAnimationFrame(this._setHtml.bind(this));
					break;*/
				case 'attr':
					window.requestAnimationFrame(this._setAttr.bind(this));
					break;
				case 'prop':
					window.requestAnimationFrame(this._setProp.bind(this));
					break;
				case 'val':
				default:
					window.requestAnimationFrame(this._setVal.bind(this));
					break;
			}

		},

		/*_getOutcommendHtml: function(){
			var i = 0;
			var length = this.$destination[0].childNodes.length;
			for(; i < length; i++) {
				// node type 8 is comment
				if(this.$destination[0].childNodes[i].nodeType === 8) {
					return (this.$destination[0].childNodes[i].textContent !== undefined) ? this.$destination[0].childNodes[i].textContent.replace('comment in by JS', '') : this.$destination[0].childNodes[i].data.replace('comment in by JS', '');
				}
			}
		},*/

		_setVal: function(){
			this.$destination.val(this.data);
			this._finishing();
		},

		_setAttr: function(){
			var data = this.data.split(':');
			this.$destination.attr(data[0], data[1]);
			this._finishing();
		},

		_setProp: function(){
			var data = this.data.split(':');
			if(data[0] === 'checked'){
				data[1] = (data[1] === 'true');
			}
			this.$destination.prop(data[0], data[1]);
			this._finishing();
		}/*,

		_setHtml: function(){
			this.$destination[this.injectMethod](this.data);
			if(this.is('scrollTo') !== ''){
				this._scrollTo();
			}
		},

		_setProp: function(){
			var data = this.data.split(':');
			this.$destination.prop(data[0], data[1]);
			if(this.is('scrollTo') !== ''){
				this._scrollTo();
			}
		}*/

	});

	$.plugin('actions.set', set);
	return set;
});
