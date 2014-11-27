/*!
 * modules.form.formvalidate
 *
 * http://joinmedia.de/
 *
 * Copyright (c) 2014 join.media GmbH & Co. KG
 *
 * Created by aotten77 on 22.08.2014.
 *
 * Released under the MIT license
 */
define(['jquery', '_super', 'jquery_validate', 'overwritings.jquery_validate', 'modules.form.formvalidate-addon'], function ($, _super){
	'use strict';
	var formvalidate = $.extend({}, _super, {
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
			var that = this;
			return this.$elem.validate({
				onchange: function(element, event) {
					this.element(element, event); // add event by jm
				},
				groups: that._getGroups(),
				errorPlacement: function($error, $element) {
					var elementName = $element.attr("name");
					var lastInGroup = $.map(this.groups, function(fields, name) {
						var fieldsArr;
						if (fields.indexOf(elementName) >= 0) {
							fieldsArr = fields.split(" ");
							return fieldsArr[fieldsArr.length - 1];
						} else {
							return null;
						}
					})[0];
					if (lastInGroup) {
						if ($element.is("[data-jmerrorplacement='parent']")) {
							$error.insertAfter($("select[name='" + lastInGroup + "']").parent());
						} else {
							$error.insertAfter($("select[name='" + lastInGroup + "']"));
						}
					} else if ($element.is("[data-jmerrorplacement='parent']")) {
						$error.insertAfter($element.parent());
					}else{
						$error.insertAfter($element);
					}
				},
				ignore: ['input[type:hidden]'],
				onfocusout         : function(element, event){
					if(!this.checkable(element) && (element.name in this.submitted || !this.optional(element))){
						this.element(element, event);
					}
				},
				onkeyup: function(element, event) {
					// added $(element).attr('data-rule-jmlandingpageurlcheck') || $(element).attr('data-rule-jmurlcheck'))
					// um das triggern der Validierung auf den entsprechenden inputs zu untertrücken.
					if ((event.which === 9 && this.elementValue(element) === "") || $(element).attr('data-rule-jmlandingpageurlcheck') || $(element).attr('data-rule-jmurlcheck')) {
						return;
					}
					if (element.name in this.submitted || element === this.lastElement) {
						this.element(element, event);
					}
				},
				onclick            : function(element, event){
					// click on selects, radiobuttons and checkboxes
					if(element.name in this.submitted){
						this.element(element, event);
					}
					// or option elements, check parent select in that case
					else if(element.parentNode.name in this.submitted){
						this.element(element.parentNode, event);
					}
				},
				errorElement: 'span',
				submitHandler: function(form) {
					$.doTimeout('submitTimer', 200, function () {
						if (that.is('submit', 'true')) {
							if (that.$elem.attr('action').indexOf('_') !== -1) {
								that.$elem.attr('action', that.$elem.attr('action').replace('_', ''));
							}
							form.submit();
							return;
						}
						$.ajax({
							type: 'POST',
							url: that._getUrl(),
							beforeSend: function (xhr) {
								//that.addSpinner(target);
							},
							data: that.$elem.serialize()
						}).done(function (p_data) {
							that.$elem.trigger({
								type: 'jm.done',
								response: p_data,
								validateTriggerTarget: that.targetElement
							});
						}).always(function () {
						}).fail(function () {

						});
					});
				},
				invalidHandler: function(event, validator) {
					jmGO.submit = false;
				}
			});
			this._finishing();
		},

		checkValidation: function(e) {
			this.targetElement = e.target;
		},

		_getUrl: function() {
			if ($.type(this.$elem.attr('action') !== 'undefined')) {
				return this.$elem.attr('action');
			} else if ($.type(this.$elem.data('jmaction') !== 'undefined')) {
				return this.$elem.data('jmaction');
			} else {
				return this.options.contentUrl;
			}
		},

		_getGroups: function() {
			var result = {};
			this.$elem.find('.js-validate-group').each(function(i) {
				$(this).find('input:not(:hidden), select, textarea').each(function() {
					if ($.type(result['groupname' + i]) !== 'undefined') {
						result['groupname' + i] = result['groupname' + i] + ' ' + $(this).attr('name');
					} else {
						result['groupname' + i] = $(this).attr('name');
					}
				});
			});
			return result;
		},

		_saveInputValues: function() {
			var that = this;
			if (this.warning) {
				this.valueObj = this.$elem.serialize();
				this.$elem.on('keyup click', function() {
					if (that.valueObj === that.$elem.serialize()) {
						window.AnyFormChanges = {
							bool: false,
							target: that.$elem
						};
					} else {
						window.AnyFormChanges = {
							bool: true,
							target: that.$elem
						};
					}
				});
			}
		},

		isValidat: function() {
			return this.$elem.valid();
		}
	});

	$.plugin('modules.form.formvalidate', formvalidate);
	return formvalidate;
});