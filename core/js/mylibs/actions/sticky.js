/*!
 * actions.sticky v0.9
 *
 * http://joinmedia.de/
 *
 * Copyright (c) 2014 join.media GmbH & Co. KG
 *
 * Created by aotten77 on 22.08.2014.
 *
 * Released under the MIT license
 */
define(['jquery', '_super', 'fixedsticky'], function ($, _super){
	'use strict';
	var sticky = $.extend({}, _super, {
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
/*			this.elempos_original = this.$elem.offset().top;
			this.elempos = this.$elem.offset().top;
			this.$destination = (this.is('relatedTo') !== '') ? $(this.is('relatedTo')) : this.$elem;
			this.data = this.is('data');*/
		},

		options: {

		},

		_exec: function(){
			this.$elem.fixedsticky();
		}

		/*render: function(){
			// !!!!! this.$elem.offset().top === 0 after remove/delet this element !!!!!
			if(eval(this.conditionSource)){
				this._addClass();
			}else{
				this._removeClass();
			}
			this.rAFRender = window.requestAnimationFrame(this.render.bind(this));
		},

		_getMeasurePos: function(){
			if(false){
				return this.elpos_original + $(this.$elem.data('jmrelatedto')).outerHeight();
			}else{
				return this.elpos_original;
			}
		},

		_addClass: function(){
			if(this.$destination.hasClass(this.data)){
				return;
			}
			this.$destination.addClass(this.data);
			if(this.is('scrollTo') !== ''){
				this._scrollTo();
			}
		},

		_removeClass: function(){
			if(!this.$destination.hasClass(this.data)){
				return;
			}
			this.$destination.removeClass(this.data);
			if(this.is('scrollTo') !== ''){
				this._scrollTo();
			}
		}*/
	});

	$.plugin('actions.sticky', sticky);
	return sticky;
});
