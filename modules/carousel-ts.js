/*!
 * modules.carousel-ts
 *
 * http://joinmedia.de/
 *
 * Copyright (c) 2014 join.media GmbH & Co. KG
 *
 * Created by aotten77 on 22.08.2014.
 *
 * Released under the MIT license
 */
define(['jquery'], function ($){
	return {
		getConfig: function(){
			var that = this;
			return {
				touchDrag      : true,
				mouseDrag      : true,
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
		}
	};
});
