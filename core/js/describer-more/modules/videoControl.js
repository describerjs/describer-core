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
	var videocontrol = $.extend({}, _super, {
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

		getElementHeight: function(){
			return (this.eh) ? this.eh : this.eh = this.$elem[0].getBoundingClientRect().height;
		},

		getElemOffsetTop: function(){
			return (this.eot) ? this.eot : this.eot = this.$elem.offset().top;
		},

		elemDoesExist: function(){
			return (this.elemExist) ? this.elemExist : this.elemExist = this.$elem.find('video, iframe').eq(0).doesExist();
		},

		play: function(){
			window.videojs(this.getElementID()).play();
		},

		pause: function(){
			window.videojs(this.getElementID()).pause();
		},

		getElementID: function(){
			return (this.ID) ? this.ID : this.ID = this.$elem.find('video').eq(0).attr('id') || this.$elem.find('iframe').parent().attr('id');
		},

		havePriority: function(){
			var i = 1;
			var mi = 0;
			var _return = false;
			window._arr = [];
			for(var player in window.videojs.players){
				_arr.push(Math.abs((window.videojs.players[player].el_.getBoundingClientRect().top + (window.videojs.players[player].el_.getBoundingClientRect().height / 2)) - (window.innerHeight / 2)));
			}

			while (i < _arr.length) {
				if (!(_arr[i] > _arr[mi]))
					mi = i;
				i += 1;
			}

			if((Math.abs((this.$elem[0].getBoundingClientRect().top + (this.$elem[0].getBoundingClientRect().height / 2)) - (window.innerHeight / 2)) === _arr[mi])){
				_return = true;
			}
			return _return;
		},

		_exec: function(e){
			// TODO Andreas add muted
			var pageYOffset;
			if(this.elemDoesExist()){
				if(this.$elem.children().hasClass('vjs-playing')){ // this.$elem.children().hasClass('vjs-playing') //!window.videojs(this.getElementID()).paused()
					pageYOffset = window.pageYOffset;
					if(!this.havePriority() || ((pageYOffset > (this.getElemOffsetTop())) || (pageYOffset + window.innerHeight) < this.getElemOffsetTop() + this.getElementHeight())){
						this.$elem.removeClass('show');
						this.pause();
						console.log('pause');
					}
				}else if(!this.$elem.hasClass('show')){
					pageYOffset = window.pageYOffset;
					if(pageYOffset < (this.getElemOffsetTop())){
						if(this.havePriority() && ((pageYOffset + window.innerHeight) > this.getElemOffsetTop() + this.getElementHeight())){
							this.$elem.addClass('show');
							this.play();
							console.log('play');
						}
					}
				}
			}
		}
	});

	$.plugin('modules.videocontrol', videocontrol);
	return videocontrol;
});
