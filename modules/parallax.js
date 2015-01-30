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
			if(navigator.platform.toLowerCase().indexOf('win') === 0 && navigator.userAgent.toLowerCase().indexOf('firefox') === -1 ){
				require(['jquery_mousewheel', 'jquery_smoothMousewheel'], function(){
					$.smoothMousewheel();
				});
			}
			//window.dc.onHoldArray = window.dc.onHoldArray || [];
			//window.dc.onHoldArray.push({});
		},

		options: {

		},

		_exec: function(e){
			if(window.dc.perf === 0){
				return;
			}
			//return;
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
							gyromouseY: true,
							actionOffsetTop: this.is('actionOffsetTop'),
							actionOffsetBottom: this.is('actionOffsetBottom'),
							animationRange: this.is('animationRange')
						});
					}else{
						this.guaranteeDCRAF();
						this.$elem.parallax({
							frictionY: 1,
							scrollY: true,
							actionOffsetTop: this.is('actionOffsetTop'),
							actionOffsetBottom: this.is('actionOffsetBottom'),
							animationRange: this.is('animationRange')
						});
					}
					break;
				case 'scrollY-fallback':
					// Fallback für <iOS8
					this.$elem.parallax({
						limitY: 40,
						gyromouseY: true,
						actionOffsetTop: this.is('actionOffsetTop'),
						actionOffsetBottom: this.is('actionOffsetBottom'),
						animationRange: this.is('animationRange')
					});
					break;
				case 'orientationX-scrollY':
					if(window.userOS === 'iOS' && Number(userOSver.charAt(0)) < 8){
						// Fallback für <iOS8
						this.$elem.parallax({
							limitY: 40,
							gyromouseX: true,
							gyromouseY: true,
							actionOffsetTop: this.is('actionOffsetTop'),
							actionOffsetBottom: this.is('actionOffsetBottom'),
							animationRange: this.is('animationRange')
						});
					}else{
						this.guaranteeDCRAF();
						this.$elem.parallax({
							gyromouseX: true,
							frictionY: 1,
							scrollY: true,
							actionOffsetTop: this.is('actionOffsetTop'),
							actionOffsetBottom: this.is('actionOffsetBottom'),
							animationRange: this.is('animationRange')
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
