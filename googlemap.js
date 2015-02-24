
define(function(){
	return {
		setup: function(google, that){
			switch(that.is('configMapName')){
				case 'joinmedia':
				default:
					return {
						mapOptions: {
							center: new google.maps.LatLng(51.4156, 6.867623),
							zoom: 16,
							disableDefaultUI: false,
							scrollwheel: false,
							draggable: true, // Disable on mobile
							mapTypeId: google.maps.MapTypeId.ROADMAP
						},
						mapStyles: {
							styles: [
								{
									"featureType": "water",
									"elementType": "All",
									"stylers"    : [
										{ "visibility": "on" },
										{ "color": "#a0a0a0" }
									]
								},
								{
									"featureType": "landscape",
									"elementType": "All",
									"stylers"    : [
										{ "color": "#f2f2f2" }
									]
								},
								{
									"featureType": "road",
									"elementType": "All",
									"stylers"    : [
										{ "saturation": -100 },
										{ "lightness": 45 }
									]
								},
								{
									"featureType": "road.highway",
									"elementType": "All",
									"stylers"    : [
										{ "visibility": "simplified" }
									]
								},
								{
									"featureType": "road.arterial",
									"elementType": "labels.icon",
									"stylers"    : [
										{ "visibility": "off" }
									]
								},
								{
									"featureType": "administrative",
									"elementType": "labels.text.fill",
									"stylers"    : [
										{ "color": "#444444" }
									]
								},
								{
									"featureType": "transit",
									"elementType": "All",
									"stylers"    : [
										{ "visibility": "off" }
									]
								},
								{
									"featureType": "poi",
									"elementType": "All",
									"stylers"    : [
										{ "visibility": "off" }
									]
								}
							]
						},
						infoWindow: {
							content: '<div class="maps-infowindow">' +
								'<h4 class="maps-iw-head">join.media GmbH &amp; Co. KG</h4>' +
								'<p class="maps-iw-main">Düsseldorfer Straße 269<br />45481 Mülheim an der Ruhr<br />Deutschland</p>' +
								'</div>'
						},
						marker : {
							position: new google.maps.LatLng(51.4156, 6.867623),
							title: "join.media",
							icon: "/img/marker.png"
						},
						setAnimation: google.maps.Animation.DROP
					};
				break;
			}

		}
	};
});