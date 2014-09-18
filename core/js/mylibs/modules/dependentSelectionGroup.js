/*!
 * modules.dependentSelectionGroup v0.9
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
	var dependentSelectionGroup = $.extend({}, _super, {
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
			this.$opposition = $(this.is('opposition'));
			for(var i = 0, leni = this.$opposition.length; i < leni; i++){
			    if(this.$opposition.eq(i).prop('checked')){
				    this.$opposition.eq(i).prop('checked', false).trigger('jmtrigger');
			    }
			}
		}
	});

	$.plugin('modules.dependentSelectionGroup', dependentSelectionGroup);
	return dependentSelectionGroup;
});
