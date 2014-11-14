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
			this.transformArray = this.transform3DSupport
			$(window).on('resize', this._newContainerWidth.bind(this));
			//this.eot = this.$elem.offset().top;
			//this.offset = window.innerHeight * 0.8;
		},

		options: {

		},

		_exec: function(e){
			var eot = this.$elem.offset().top+this.execElemOffset;
			var wih = window.innerHeight || document.documentElement.clientHeight;
			var wpo = window.pageYOffset || document.body.scrollTop; // ie8 Fallback
			var first = wpo > eot - wih;
			var second = wpo + wih < eot + this.$elem[0].getBoundingClientRect().height + wih*this.execWindowScale;
			var range = (wih + this.$elem[0].getBoundingClientRect().height)*this.execWindowScale;
			var y_factor;
			if(first && second){
				y_factor = ((wpo + (wih*this.execWindowScale) - eot) / range);
				y_factor = y_factor*this.loop - Math.floor(y_factor*this.loop);
			}
			if(first && !second){
				y_factor = 1;
			}if(!first && second){
				y_factor = 0;
			}
			this._setProperty(y_factor);
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

		_getTransformPropertys: function(){
			var _cssPropertyArray = this.is('cssProperty').split('|');
			var _transformString = '';
			for(var i = 0, leni = _cssPropertyArray.length; i < leni; i++){
				if(this.transform3DSupport){
					_transformString = _transformString + _cssPropertyArray[i] + '3d' + '(##x-'+_cssPropertyArray[i]+'##, ##y-'+_cssPropertyArray[i]+'##, ##z-'+_cssPropertyArray[i]+'##) ';
				}
				else if(this.transform2DSupport){
					_transformString = _transformString +_cssPropertyArray[i] + '(##x-'+_cssPropertyArray[i]+'##, ##y-'+_cssPropertyArray[i]+'##) ';
				}
				else{
					_transformString = _transformString +_cssPropertyArray[i];
				}
			}
			return _transformString;
		},

		_setProperty: function(y_factor) {
			var _transformString = this._getTransformPropertys();
			var _x_translate = (y_factor*this.containerWitdh).toString();
			var _y_translate = '0';
			var _z_translate = '0';
			var _x_scale = (0.5 + (y_factor)).toString();
			var _y_scale = (0.5 + (y_factor)).toString();
			var _z_scale = '1';
			var _x_rotate = (1-(y_factor/2)).toString();
			var _y_rotate = '0';
			var _z_rotate = '0';
			_transformString = _transformString
				.replace(/##x-translate##/g, _x_translate+'px')
				.replace(/##y-translate##/g, _y_translate+'px')
				.replace(/##z-translate##/g, _z_translate+'px')
				.replace(/##x-scale##/g, _x_scale)
				.replace(/##y-scale##/g, _y_scale)
				.replace(/##z-scale##/g, _z_scale)
				.replace(/##x-rotate##/g, _x_rotate)
				.replace(/##y-rotate##/g, _y_rotate)
				.replace(/##z-rotate##/g, _z_rotate);

			if (this.transform3DSupport || this.transform2DSupport) {
				this._css('transform', _transformString);
			} else {
				this.$elem[0].style.left = _x_translate+'px';
				this.$elem[0].style.top = _y_translate+'px';
				this.$elem[0].style.width = _x_scale+'%';
				this.$elem[0].style.heigth = _y_scale+'%';
			}
		},

		_newContainerWidth: function(){
			this.containerWitdh = this.$elem.offsetParent().width();
		}

	});

	$.plugin('modules.scrollControlTransform', scrollControlTransform);
	return scrollControlTransform;
});

