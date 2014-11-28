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
			this.eot = this.$elem.offset().top;
			this.offset = 0;//window.innerHeight * 0.2;
			this.elemHeight = this.$elem[0].getBoundingClientRect().height;
			this.dynamic = (this.is('heigth') === 'dynamic');
			this.$destination = this.getRelatedToElem();
			this.onlyTopOfElem = (this.is('onlyTopOfElem') === 'true');
		},

		options: {

		},

		_exec: function(e){
			var _viewportTop = window.dcRAF.domObj.pageYOffset;
			var _viewportBottom = _viewportTop + window.dcRAF.domObj.innerHeight;
			if(jmHF.hasClass(this.$destination[0], 'show')){
				if((!(_viewportBottom > this.eot + this.offset)) && (_viewportTop < (this.eot + ((this.dynamic) ? this.$elem[0].getBoundingClientRect().height : this.elemHeight)))){
					this.$destination.removeClass('show');
					this._finishing();
				}
			}else{
				if(this.onlyTopOfElem){
					if(_viewportBottom > this.eot + this.offset){
						this.$destination.addClass('show');
						this._finishing();
					}
				}else{
					if((_viewportBottom > this.eot + this.offset) && (_viewportTop < (this.eot + ((this.dynamic) ? this.$elem[0].getBoundingClientRect().height : this.elemHeight)))){
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
