define(['jquery', 'actions.ajax', 'jquery_countdown-de'], function ($, extendOjb){
	'use strict';
	var countdown = $.extend({}, extendOjb, {
		_injectAfterFrame: function(){
			this.$elem.hide();
			this._calc();
			extendOjb._injectAfterFrame.call(this);
		},

		_calc: function(){
			var that = this;
			//30.04.2014 20:00:00 -> 1 Stunde 36 Minuten
			var day = this.data.split(' ')[0].split('.')[0];
			var mth = this.data.split(' ')[0].split('.')[1];
			var year = this.data.split(' ')[0].split('.')[2];

			var hr = this.data.split(' ')[1].split(':')[0];
			var min = this.data.split(' ')[1].split(':')[1];
			var sec = this.data.split(' ')[1].split(':')[2];
			this.$elem.countdown({until: new Date(year, mth - 1, day, hr, min, sec), format: 'dHM', padZeroes: true, layout:'{dn} {dl} {hn} {hl} {mn} {ml}'});
			setTimeout(function(){
				that.$elem.show();
			}, 1000);
		}
	});

	$.plugin('modules.countdown', countdown);
	return countdown;
});


//<span data-jmname="reductioncountdown" data-jmdominit="true" class="JSINIT-modules.countdown is-countdown" style="display: inline;"><span class="countdown-row countdown-show3"><span class="countdown-section"><span class="countdown-amount">6</span><span class="countdown-period">Stunden</span></span><span class="countdown-section"><span class="countdown-amount">46</span><span class="countdown-period">Minuten</span></span><span class="countdown-section"><span class="countdown-amount">1</span><span class="countdown-period">Sekunde</span></span></span></span>
//<span data-jmname="reductioncountdown" data-jmdominit="true" class="JSINIT-modules.countdown is-countdown" style="display: inline;"><span class="countdown-row countdown-show3"><span class="countdown-section"><span class="countdown-amount">22</span><span class="countdown-period">Tage</span></span><span class="countdown-section"><span class="countdown-amount">09</span><span class="countdown-period">Stunden</span></span><span class="countdown-section"><span class="countdown-amount">00</span><span class="countdown-period">Minuten</span></span></span></span>