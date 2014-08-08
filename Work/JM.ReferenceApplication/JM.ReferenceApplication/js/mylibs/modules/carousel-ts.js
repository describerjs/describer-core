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
