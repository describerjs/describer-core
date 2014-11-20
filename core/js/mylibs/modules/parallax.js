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
				require(['jquery_mousewheel', 'jquery_smoothwheel'], function(){
					$.smoothwheel();
				});
			}
			/*var that = this;
			this.$body = $('body');
			this.lastY = this.$body.scrollTop();
			this.initialY = this.$body.scrollTop();
			window.requestAnimationFrame(this.maraf.bind(this));
			require(['jquery_mousewheel'], function(){
				$(window).on('mousewheel', function(event) {
					event.preventDefault();
					that.targetY = window.pageYOffset - (event.deltaY*event.deltaFactor);
					that.delta = that.targetY - that.initialY;
					*//*
					$body.trigger('jmstop');
					event.preventDefault();
					$body.scrollToTop(window.pageYOffset - (event.deltaY*event.deltaFactor), 500);*//*
					*//*$('html, body').stop().animate({
						scrollTop: window.pageYOffset - (event.deltaY*event.deltaFactor)
					}, 300);*//*
					//console.log(event.deltaX, event.deltaY, event.deltaFactor);
				});
			});*/
		},

		/*maraf: function(){
			if(!this.start){
				this.start = this.now;
			}
			var t = Math.min(1, Math.max((this.now - this.start) / 500, 0));
			// calculate the new scrollTop position (don't forget to smooth)
			var y = Math.round(this.$body.scrollTop() + this.delta * this.smooth(t));
			// bracket scrollTop so we're never over-scrolling
			if(this.delta > 0 && y > this.targetY){
				y = this.targetY;
			}
			if(this.delta < 0 && y < this.targetY){
				y = this.targetY;;
			}
			// only actually set scrollTop if there was a change fromt he last frame
			if(this.lastY != y){
				this.$body.scrollTop(y);
			}
			this.lastY = y;

			this.maraf();
		},

		smooth: function(pos){
			return (-.5 * (Math.cos(Math.PI*pos) -1));
		},*/

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
