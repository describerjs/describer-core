/*!
 * actions.add
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
	var add = $.extend({}, _super, {
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
			//this._exec();
			//{ url:'/bla', data:'parameter', method:'post', destination:'data-jmconfig*=domselectro:exampleID', inject:'before/after/prepend/append/html(replace)' }
		},
		//{'event': 'click', datatype': 'class', 'relatedTo': '.manage', 'data': 'manage-open'}">
		options: {

		},

		_exec: function(e){
			this.$destination = (this.is('relatedTo') !== '') ? $(this.is('relatedTo')) : this.$elem;
			this.data = (this.is('data') !== '') ? this.is('data') : this._getOutcommendHtml();
			switch(this.is('datatype')){
				case 'class':
					window.requestAnimationFrame(this._addClass.bind(this));
					break;
				case 'style':
					window.requestAnimationFrame(this._addStyle.bind(this));
					break;
				case 'html':
					this.injectMethod = (this.is('inject') !== '') ? this.is('inject') : 'html';
					window.requestAnimationFrame(this._addHtml.bind(this));
					break;
				case 'attr':
					window.requestAnimationFrame(this._addAttr.bind(this));
					break;
				case 'prop':
					window.requestAnimationFrame(this._addProp.bind(this));
					break;
				case 'text':
					window.requestAnimationFrame(this._addText.bind(this));
					break;
			}
		},

		_getOutcommendHtml: function(){
			var i = 0;
			var length = this.$destination[0].childNodes.length;
			for(; i < length; i++) {
				// node type 8 is comment
				if(this.$destination[0].childNodes[i].nodeType === 8) {
					return (this.$destination[0].childNodes[i].textContent !== undefined) ? this.$destination[0].childNodes[i].textContent.replace('comment in by JS', '') : this.$destination[0].childNodes[i].data.replace('comment in by JS', '');
				}
			}
		},

		_getCssObj: function(){
			var _obj = {};
			var _arr;
			var _dataArray = this.data.split('|');
			for(var i = 0, leni = _dataArray.length; i < leni; i++){
				_arr = _dataArray[i].split(':');
				_obj[_arr[0]] = _arr[1];
			}
			return _obj;
		},

		_addClass: function(){
			this.$destination.addClass(this.data);
			console.log('finish');
			this._finishing();
		},

		_addStyle: function(){
			this.$destination.css(this._getCssObj());
			this._finishing();
		},

		_addAttr: function(){
			var data = this.data.split(':');
			this.$destination.attr(data[0], data[1]);
			this._finishing();
		},

		_addHtml: function(){
			var $data = $(this.data);
			this.$destination[this.injectMethod]($data);
			if(this.is('data') === ''){
				this._finishing($data);
			}else{
				this._finishing();
			}
		},

		_addText: function(){
			this.$destination.html(this.data);
			this._finishing();
		},

		_addProp: function(){
			var data = this.data.split(':');
			if(data[0] === 'checked'){
				data[1] = (data[1] === 'true');
			}
			this.$destination.prop(data[0], data[1]);
			this._finishing();
		}

	});

	$.plugin('actions.add', add);
	return add;
});
