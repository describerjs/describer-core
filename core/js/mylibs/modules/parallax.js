/*!
 * modules.parallax
 *
 * http://joinmedia.de/
 *
 * Copyright (c) 2014 join.media GmbH & Co. KG
 *
 * Created by aotten77 on 21.10.2014.
 *
 * Released under the MIT license
 */
define(['jquery', '_super', 'jquery_parallax', 'rAF'], function ($, _super){
	'use strict';
	var parallax = $.extend({}, _super, {
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
			switch(this.is('data')){
				case 'orientationSupport':
					this.$elem.parallax({
						invertX: false,
						limitY: 40
					});
					break;
				case 'mouseSupport':
					this.$elem.parallax();
					break;
				case 'scroll':
					this.$elem.parallax({
						frictionX: 1,
						frictionY: 1,
						gyrosscopeparallax: false
					});
					break;
				case 'scroll-fallback':
					this.$elem.parallax({
						limitX: 0,
						invertX: false,
						limitY: 40
					});
					break;
				default:
					break;
			}
		}
	});

	$.plugin('modules.parallax', parallax);
	return parallax;
});
