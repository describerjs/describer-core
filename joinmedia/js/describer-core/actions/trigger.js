/*!
 * actions.trigger
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
	var trigger = $.extend({}, _super, {
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
			this.$destination = this.getRelatedToElem();
			switch(this.is('datatype')){
				case 'function':
					this.$destination[this.is('datatype')]();
					break;
				case 'jmevent':
					this.$destination.jmtrigger(this.is('data'));
					break;
				default:
					this.$destination.trigger(this.is('data'));
					break;
			}
			this._finishing();
		}

	});

	$.plugin('actions.trigger', trigger);
	return trigger;
});
