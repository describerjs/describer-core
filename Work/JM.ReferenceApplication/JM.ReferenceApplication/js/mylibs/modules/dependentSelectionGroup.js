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

		_exec: function(){
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
