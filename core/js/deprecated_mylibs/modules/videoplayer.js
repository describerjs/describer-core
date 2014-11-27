/**
 * Created by aotten77 on 17.11.2014.
 */

define(['jquery', '_super', 'video_4_10_2', 'css!require-css.video'], function($, _super){
	'use strict';

	var videoplayer = $.extend({}, _super, {
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
			this.ID = window.jmGO.uuID.generate();
			if((this.is('url').indexOf('youtube.com') !== -1) || (this.is('url').indexOf('youtu.be') !== -1)){
				this.addHtmlForYoutube();
			}else{
				this.addHtml();
			}
		},

		options: {

		},

		_exec: function(e){


		},

		addHtml: function(){
			var randomVal = '';
			var scalefactor = 1;
			if(window.location.href.indexOf('/JMTools/') !== -1){
				randomVal = '?random='+Math.random();
			}
			if(this.$elem.closest('[data-depth]').doesExist()){
				scalefactor = Math.abs(parseFloat(this.$elem.closest('[data-depth]').data('depth')));
			}
			/*this.$elem.prepend('<video class="video-js vjs-default-skin" controls preload="auto" poster="'+this.is('url')+'.jpg'+randomVal+'">'+
				'<source src="'+this.is('url')+'.mp4" type="video/mp4" />'+
				'<source src="'+this.is('url')+'.webm" type="video/webm" />'+
				'<source src="'+this.is('url')+'.ogv" type="video/ogg" />'+
				'</video>');*/
			this.$elem.prepend('<video class="video-js vjs-default-skin" width="'+ (this.is('width') * scalefactor)+'px" height="'+(this.is('height') * scalefactor) +'px" '+ this.is('loop') + ' ' + this.is('controls')+' ' + this.is('autoplay') +' preload="'+this.is('preload')+'" poster="'+this.is('url')+'.jpg'+randomVal+'">'+
				'<source src="'+this.is('url')+'.mp4" type="video/mp4" />'+
				'<source src="'+this.is('url')+'.webm" type="video/webm" />'+
				'<source src="'+this.is('url')+'.ogv" type="video/ogg" />'+
				'</video>');
			window.videojs(this.$elem.find('video').eq(0)[0], {}, function(){
				// Player (this) is initialized and ready.
			});
		},

		addHtmlForYoutube: function(){
			var that = this;
			var scalefactor = 1;
			if(this.$elem.closest('[data-depth]').doesExist()){
				scalefactor = Math.abs(parseFloat(this.$elem.closest('[data-depth]').data('depth')));
			}
			require(['videojs-youtube'], function () {
				// If your video tag is empty (no space or new line before the closing tag), it will create a glitch with Safari. Instead of writing <video ...></video>, you should write <video ...> </video>.
				that.$elem.prepend('<video src="" id="'+ that.ID +'" class="video-js vjs-default-skin" width="'+ (that.is('width') * scalefactor)+'px" height="'+(that.is('height') * scalefactor) +'px" '+ that.is('loop') + ' ' + that.is('controls')+' ' + this.is('autoplay') +' preload="'+that.is('preload')+'"></video>');
				//that.$elem.prepend('<video src="" id="'+ that.ID +'" class="video-js vjs-default-skin" style="width: 100%; height:100%; position:absolute" controls preload="none"></video>');
				window.videojs(that.ID, { 'techOrder': ['youtube'], 'src': that.is('url') }).ready(function() {
					if(that.is('controls') !== 'controls'){
						that.$elem.children().append('<div style="height: 100%; width: 100%; position: absolute; opacity: 0;"></div>');
					}
					// Cue a video using ended event
					// this.one('ended', function() {
					//   this.src('http://www.youtube.com/watch?v=jofNR_WkoCE');https://s.ytimg.com/yts/jsbin/www-widgetapi-vflgGL-5Q.js
					// });
				});
			});
		}
	});

	$.plugin('modules.videoplayer', videoplayer);
	return videoplayer;
});
