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
				case 'orientation':
					this.$elem.parallax({
						limitY: 40,
						gyromouseX: true,
						gyromouseY: true
					});
					break;
				case 'scrollY':
					if(window.userOS === 'iOS' && Number(userOSver.charAt(0)) < 8){
						// Fallback für <iOS8
						this.$elem.parallax({
							limitY: 40,
							gyromouseY: true
						});
					}else{
						this.$elem.parallax({
							frictionY: 1,
							scrollY: true
						});
					}
					break;
				case 'scrollY-fallback':
					// Fallback für <iOS8
					this.$elem.parallax({
						limitY: 40,
						gyromouseY: true
					});
					break;
				case 'orientationX-scrollY':
					if(window.userOS === 'iOS' && Number(userOSver.charAt(0)) < 8){
						// Fallback für <iOS8
						this.$elem.parallax({
							limitY: 40,
							gyromouseX: true,
							gyromouseY: true
						});
					}else{
						this.$elem.parallax({
							gyromouseX: true,
							frictionY: 1,
							scrollY: true
						});
					}
					break;
				default:
					break;
			}
		}
	});

	$.plugin('modules.parallax', parallax);
	return parallax;
});
