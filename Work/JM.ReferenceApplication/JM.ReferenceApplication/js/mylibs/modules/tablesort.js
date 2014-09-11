/*!
 * modules.tablesort v0.9
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
	var tablesort = $.extend({}, _super, {
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
			this._oldClass = this.$elem.val();
		},

		options: {

		},

		_exec: function(){
			this.$elem.closest('table').find('tbody').find('tr').add(this.$elem.closest('table').find('tfoot').find('tr')).switchColumnsViaClassName( this._oldClass, this.$elem.val(), this.num );
			this._oldClass = this.$elem.val();
		}
	});

	$.plugin('modules.tablesort', tablesort);
	return tablesort;
});