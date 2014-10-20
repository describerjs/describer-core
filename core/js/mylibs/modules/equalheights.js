/*!
 * modules.equalheights v0.9
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
	var equalheights = $.extend({}, _super, {
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

		_exec: function(e){
			var vals = this.$elem.find('[data-jmselector="equal-heights-children"]');
			vals.innerHeight();
			//if (isMobile) return;
			var heightsArray = vals.map(function(){
				return $(this).height();
			});
			var max = Math.max.apply(null, heightsArray);
			vals.height(max);
			this._finishing();
		}
	});

	$.plugin('modules.equalheights', equalheights);
	return equalheights;
});
// TODO Andreas trigger neu, wenn das Device die Orientierung gewechselt hat.