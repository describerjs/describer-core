/*!
 * modules.scrollControlFrames
 *
 * http://joinmedia.de/
 *
 * Copyright (c) 2014 join.media GmbH & Co. KG
 *
 * Created by aotten77 on 29.10.2014.
 *
 * Released under the MIT license
 */
define(['jquery', '_super'], function ($, _super){
	'use strict';
	var scrollControlFrames = $.extend({}, _super, {
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
			this.frames = this.$elem.children().length;
			this.$children = this.$elem.children();
			this.loop = parseInt(this.is('loop'), 10) || 1;
			this.actionOffsetTop = parseInt(this.is('actionOffsetTop'), 10) || 0;
			this.actionRangeScale = parseFloat(this.is('actionRangeScale')) || 0;
		},

		options: {

		},

		_exec: function(e){

			var eot = this.$elem.offset().top+this.actionOffsetTop;
			var wih = window.innerHeight;
			var wpo = window.pageYOffset;
			var first = wpo > eot - wih;
			var second = wpo + wih < eot + this.$elem[0].getBoundingClientRect().height + wih*this.actionRangeScale;
			var range = (wih + this.$elem[0].getBoundingClientRect().height)*this.actionRangeScale;
			if(first && second){
				this.iy = ((wpo + (wih*this.actionRangeScale) - eot) / range);
				this.iy = this.iy*this.loop - Math.floor(this.iy*this.loop);
			}
			if(first && ! second){
				this.iy = 1;
			}if(!first && second){
				this.iy = 0;
			}
			for(var i = 0, leni = this.$children.length; i < leni; i++){
				if(i === Math.round(this.iy*(this.frames-1))){
					this.$children.eq(i).addClass('show');

				}else{
					this.$children.eq(i).removeClass('show');
				}
			}
		}
	});

	$.plugin('modules.scrollControlFrames', scrollControlFrames);
	return scrollControlFrames;
});
