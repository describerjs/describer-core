/*!
 * modules.scrollControlTransition
 *
 * http://joinmedia.de/
 *
 * Copyright (c) 2014 join.media GmbH & Co. KG
 *
 * Created by aotten77 on 31.10.2014.
 *
 * Released under the MIT license
 */
define(['jquery', '_super', 'utils.helpers'], function ($, _super){
	'use strict';
	var scrollControlTransform = $.extend({}, _super, {
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
			this.execElemOffset = parseInt(this.is('execElemOffset'), 10) || 0;
			this.execWindowScale = parseFloat(this.is('execWindowScale')) || 0;
			this.transform2DSupport = jmHF.transformSupport('2D');
			this.transform3DSupport = jmHF.transformSupport('3D');
			this.propertyCache = {};
			this.containerWitdh = this.$elem.offsetParent().width();
			$(window).on('resize', this._newContainerWidth.bind(this));
			//this.eot = this.$elem.offset().top;
			//this.offset = window.innerHeight * 0.8;
		},

		options: {

		},

		_exec: function(e){
			var eot = this.$elem.offset().top+this.execElemOffset;
			var wih = window.innerHeight;
			var wpo = window.pageYOffset;
			var first = wpo > eot - wih;
			var second = wpo + wih < eot + this.$elem[0].getBoundingClientRect().height + wih*this.execWindowScale;
			var range = (wih + this.$elem[0].getBoundingClientRect().height)*this.execWindowScale;
			var y_factor;
			if(first && second){
				y_factor = ((wpo + (wih*this.execWindowScale) - eot) / range);
				y_factor = y_factor*this.loop - Math.floor(y_factor*this.loop);
			}
			if(first && ! second){
				y_factor = 1;
			}if(!first && second){
				y_factor = 0;
			}
			//console.log(y_factor);
			switch(this.is('cssProperty')){
				case 'translate':
					this._setPosition(y_factor*this.containerWitdh, 0);
					break;
				case 'scale':
					this._setScale(1-(y_factor/2), 1-(y_factor/2));
					break;
			}

			//this.$elem[0].style.left = (y_factor*100)+'%';
		},

		_css: function(property, value) {
			var jsProperty = this.propertyCache[property];
			if (!jsProperty) {
				for (var i = 0, l = window.jmGO.vendors.length; i < l; i++) {
					if (window.jmGO.vendors[i] !== null) {
						jsProperty = this._camelCase(window.jmGO.vendors[i][1] + '-' + property);
					} else {
						jsProperty = property;
					}
					if (this.$elem[0].style[jsProperty] !== undefined) {
						this.propertyCache[property] = jsProperty;
						break;
					}
				}
			}
			this.$elem[0].style[jsProperty] = value;
		},

		_camelCase: function(value) {
			return value.replace(/-+(.)?/g, function(match, character){
				return character ? character.toUpperCase() : '';
			});
		},

		_setPosition: function(x, y) {
			x += 'px';
			y += 'px';
			if (this.transform3DSupport) {
				this._css('transform', 'translate3d('+x+','+y+',0)');
			} else if (this.transform2DSupport) {
				this._css('transform', 'translate('+x+','+y+')');
			} else {
				this.$elem[0].style.left = x+'';
				this.$elem[0].style.top = y+'';
			}
		},

		_setScale: function(x, y) {
			if (this.transform3DSupport) {
				this._css('transform', 'scale3d('+x+','+y+',1)');
			} else if (this.transform2DSupport) {
				this._css('transform', 'scale('+x+','+y+')');
			} else {
				this.$elem[0].style.width = (x*100)+'%';
				this.$elem[0].style.heigth = (y*100)+'%';
			}
		},

		_newContainerWidth: function(){
			this.containerWitdh = this.$elem.offsetParent().width();
		}

	});

	$.plugin('modules.scrollControlTransform', scrollControlTransform);
	return scrollControlTransform;
});

