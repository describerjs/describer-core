/*!
 * modules.form.selectOptionExtractInGroup
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
	var selectOptionExtractInGroup = $.extend({}, _super, {
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
			this.$filterSelects = $(this.is('relatedTo')).not(this.$elem);
			this.val = this.$elem.val();
		},

		options: {

		},

		_exec: function(e){
			this.nextVal = this.$elem.val();
			var tempOption;
			var tempSelectionen = $(this.is('relatedTo')).find('option:selected');
			// Durchschleifen der Options der Selects.
			for(var i = 0, leni = this.$filterSelects.length; i < leni; i++){
				tempOption = this.$filterSelects.eq(i).find('option');
				tempOption.prop('disabled', false).show();

				for(var j = 0, lenj = tempSelectionen.length; j < lenj; j++){
					this.$filterSelects.eq(i).find('option[value="'+tempSelectionen[j].value+'"]').not('option:selected').prop('disabled', true).hide();
				}
			}
			this._finishing();
		}

	});

	$.plugin('modules.form.selectOptionExtractInGroup', selectOptionExtractInGroup);
	return selectOptionExtractInGroup;
});
