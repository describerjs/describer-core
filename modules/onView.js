/*!
 * modules.onView
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
	var onView = $.extend({}, _super, {
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
			this.setProperties();
			this.orientation = (window.innerHeight > window.innerWidth) ? 'p':'w';
			$(window).on('resize', this.checkOrientation.bind(this));
			$('body').on('dc-documentHeightChange', this.setProperties.bind(this));
		},

		options: {

		},

		checkOrientation: function(){
			if(this.orientation === 'w' && (window.innerHeight > window.innerWidth)){
				this.orientation = 'p';
				this.setProperties.bind(this);
			}else if(this.orientation === 'p' && (window.innerHeight < window.innerWidth)){
				this.orientation = 'w';
				this.setProperties.bind(this);
			}
		},

		setProperties: function(){
			this.eot = this.$elem.offset().top;
			this.offsetTop = (this.is('offsetTop') !== '') ? parseInt(this.is('offsetTop').replace('px', ''), 10) : 0;//window.innerHeight * 0.2;
			this.offsetBottom = (this.is('offsetBottom') !== '') ? parseInt(this.is('offsetBottom').replace('px', ''), 10) : 0;//window.innerHeight * 0.2;
			this.elemHeight = this.$elem[0].getBoundingClientRect().height;
			this.$destination = this.getRelatedToElem();
			this.onlyTopOfElem = (this.is('onlyTopOfElem') === 'true');
		},

		_exec: function(e){
			var _viewportTop = window.dc.win.pageYOffset;
			var _viewportBottom = _viewportTop + window.dc.win.innerHeight;
			if(jmHF.hasClass(this.$destination[0], 'show')){
				if(this.onlyTopOfElem){
					if(_viewportBottom < this.eot + this.offsetTop){
						this.$destination.removeClass('show');
						this._finishing();
					}
					/*if((!(_viewportBottom > this.eot + this.offsetTop)) && (_viewportTop < (this.eot + ((this.dynamic) ? this.$elem[0].getBoundingClientRect().height : this.elemHeight) + this.offsetBottom))){
						this.$destination.removeClass('show');
						this._finishing();
					}*/
				}else{
					if((_viewportBottom < this.eot + this.offsetTop) || (_viewportTop > (this.eot + this.elemHeight + this.offsetBottom))){
						this.$destination.removeClass('show');
						this._finishing();
					}
				}

			}else{
				if(this.onlyTopOfElem){
					if(_viewportBottom > this.eot + this.offsetTop){
						this.$destination.addClass('show');
						this._finishing();
					}
				}else{
					if((_viewportBottom > this.eot + this.offsetTop) && (_viewportTop < (this.eot + this.elemHeight + this.offsetBottom))){
						this.$destination.addClass('show');
						this._finishing();
					}
				}
			}
		}
	});

	$.plugin('modules.onView', onView);
	return onView;
});
