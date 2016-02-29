/*!
 * actions.apply
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
	var apply = $.extend({}, _super, {
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
			var that = this;
			var options = {};
			if(that.is('options') !== ''){
				if(this.is('optionsParse') === 'true'){
					options = JSON.parse(this.is('options'));
				}else{
					options = that.is('options');
				}
			}
			this.$destination = this.getRelatedToElem();
			if(this.is('function') !== ''){
				require([this.is('require')], function(){
					that.$destination[that.is('function')](options);
				});
			}
			this._finishing();
		}
	});

	$.plugin('actions.apply', apply);
	return apply;
});
