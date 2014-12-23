/*!
 * module.googlemap
 *
 * http://joinmedia.de/
 *
 * Copyright (c) 2014 join.media GmbH & Co. KG
 *
 * Created by aotten77 on 22.12.2014.
 *
 * Released under the MIT license
 */
define(['jquery', '_super', 'modules.onView'], function ($, _super, extendOjb){
	'use strict';
	var googlemap = $.extend({}, extendOjb, {
		_on: function(e){
			var that = this;
			this._removeRenderFunctionFromExecRafObj();
			require(['async!http://maps.googleapis.com/maps/api/js?key=AIzaSyB2oMRQW1_t9LYrErsj0G83xCvTtZiGoPI&sensor=false'], function(){
				require(['config.googlemap'], function(_confic_map){
					that.configMap = _confic_map.setup(google, that);
					that._renderGoogleMaps();
				});
			});
		},

		_off: function(){},

		_renderGoogleMaps: function() {
			this.map = new google.maps.Map(this.$elem[0], this.configMap.mapOptions);
			this.map.setOptions(this.configMap.mapStyles);
			this.infoWindow = new google.maps.InfoWindow(this.configMap.infoWindow);
			this.marker = new google.maps.Marker($.extend({}, this.configMap.marker, { map: this.map }));
			this.marker.setAnimation(this.configMap.setAnimation);
			google.maps.event.addListener(this.marker, 'click', this._markerClick.bind(this));
			this._finishing();
		},

		_markerClick: function(){
			this.infoWindow.open(this.map, this.marker);
		}

	});

	$.plugin('module.googlemap', googlemap);
	return googlemap;
});

