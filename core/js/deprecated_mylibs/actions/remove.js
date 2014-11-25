/*!
 * actions.remove
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
	var remove = $.extend({}, _super, {
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
			switch(this.is('datatype')){
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
		},

		_removeClass: function(){
			this.$destination.removeClass(this.is('data'));
			this._finishing();
		},

		_removeHtml: function(){
			this.$destination.remove();
			this._finishing();
		},

		_removeAttr: function(){
			this.$destination.removeAttr(this.is('data'));
			this._finishing();
		},

		_removeProp: function(){
			this.$destination.removeProp(this.is('data'));
			this._finishing();
		}

	});

	$.plugin('action.remove', remove);
	return remove;
});
