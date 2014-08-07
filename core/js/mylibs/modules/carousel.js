define(['jquery', '_super', 'modules.carousel-ts'], function ($, _super, ts){
	'use strict';
	var carousel = $.extend({}, _super, {
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

		_exec: function(){
			var that = this;
			require(['owl_carousel', 'overwritings.owl_carousel'], function(param1, param2){
				that.indexCount = 0;
				that.$elem.owlCarousel(that.getConfig());
			});
		},

		getConfig: function(){
			var that = this;
			return {
				navigation     : true, // Show next and prev buttons
				slideSpeed     : 300,
				paginationSpeed: 500,
				rewindSpeed    : 1000,
				singleItem     : true,
				autoPlay       : true,
				stopOnHover    : true,
				jmDelayTime    : (that.is('delay') !== '') ? parseInt(that.is('delay'), 10) : 2000,
				afterInit: function(){
					that._setAllTeaserToVisible();
					that._setCommentToPaginierung();
				},
				afterMove: function(){
					var $plugin = that.$elem.data('owlCarousel');
					$plugin.$owlItems.children().removeClass('visible').removeClass('leaving');
					$plugin.$owlItems.children().eq($plugin.currentItem).addClass('visible');
				}
			}
		},

		_setAllTeaserToVisible: function(){
			this.$elem.find('.stage-teaser').removeClass('hide-large').removeClass('hide-med');
		},

		_setCommentToPaginierung: function(){
			var that = this;
			this._setCommentArray();
			this.$elem.find('.owl-page').each(function(index, item){
				$(item).html(that.commentArray[index]);
			});
		},

		_setCommentArray: function(){
			var i = 0;
			var length = this.$elem[0].childNodes.length;
			this.commentArray = [];
			for(; i < length; i++) {
				// node type 8 is comment
				if(this.$elem[0].childNodes[i].nodeType === 8) {
					this.commentArray.push(this.$elem[0].childNodes[i].textContent.replace('comment in by JS', ''));
				}
			}
		}
	}, ts);

	$.plugin('modules.carousel', carousel);
	return carousel;
});
