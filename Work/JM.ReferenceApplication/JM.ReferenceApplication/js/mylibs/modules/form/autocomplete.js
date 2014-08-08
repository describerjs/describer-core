define(['jquery', 'actions.ajax', 'jquery_autocomplete'], function ($, extendOjb){
	'use strict';
	var autocomplete = $.extend({}, extendOjb, {
		getZipCode: function(){
			return eval(this.is('zipcode'));
		},

		_exec: function(){
			var that = this;
			/*this.$elem.css({
				'background-color': 'transparent',
				'position'      : 'absolute',
				'z-index'       : '2'
			});*/
			this.$elem.after('<input type="text" class="autocomplete behind" data-jmalwaysdisabled="true" disabled autocomplete="off" /><input type="hidden" class="userinput" data-jmalwaysdisabled="true"  />');
			this.$elem.autocomplete(this.is('url'), {
				dataType: 'json',
				parse: function(data) {
					var rows = [];
					for (var i = 0; i < data.length; i++) {
						rows[i] = {
							data: data[i],
							value: data[i].Name,
							result: data[i].Name
						};
					}
					return rows;
				},
				delay: 40,
				width: this.$elem.outerWidth(),
				offsetLeft: 0,
				autofill: true,
				selectFirst: false,
				highlight: true,
				multiple: true,
				multipleSeparator: ";",
				cellSeparator: ",",
				maxItemsToShow: 5,
				jmhideByResult: (that.is('hideby') !== '') ? parseInt(that.is('hideby'), 10) : 0,
				jmzindex: 99,
				jmnextFocusNameAttr: that.is('nextFocusNameAttr'),
				//jmappendToClass: 'push',
				zipCodeBool: (this.is('zipcode') !== ''),
				minChars: 1,
				submitForm: true,
				extraParams: {
					maxCount: 5
				},
				onItemSelect: function() {
					that.$elem.trigger('change');
				}
			});
		}
	});

	$.plugin('modules.form.autocomplete', autocomplete);
	return autocomplete;
});
