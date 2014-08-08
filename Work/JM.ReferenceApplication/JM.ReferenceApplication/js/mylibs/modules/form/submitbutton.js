define(['jquery', '_super', 'jquery_ba-dotimeout'], function ($, _super) {
	// <input type="submit" value="Weiter" class="hero-l" data-jmname="submitbutton" />
	'use strict';
	var submitbutton = $.extend({}, _super, {
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
			this.$formElem = this.$elem.closest('form');
			this._checkState();
		},

		options: {

		},
	/*var submitbutton = {
		init: function (options, elem) {
			this.options = $.extend({}, this.options, options);

			this.elem = elem;
			this.$elem = $(elem);
			this.$elem.addClass('jQueryAdded');
			// .jsFormScope funktionieren nicht...
			this.$formElem = this.$elem.closest('form').doesExist() ? this.$elem.closest('form') : this.$elem.closest('.jsFormScope');
			this.updateTargetDefined = this.$elem.data('jmupdatetargetselector') ? true : false;
			// Test mit options configuration
			this._addListener();
			this._addListenerForDisableEnableBtn();
			return this;
		},

		options: {

		},*/

		_exec: function(){
			jmHF.submit();
			// die Submit-Funkionalität wird vom FormValidate-Plugin im submitHandler übernommen, der bei Click eines Input-Fields vom Typ Submit getriggert wird.
			this.$elem.trigger('checkValidation', this.$elem);
		},

		_checkState: function () {
			if(this.is('state', 'disable without form changes')){
				this.formquery = this.$formElem.serialize();
				this._setBtnState(this.formquery);
				this._addListenerForDisableEnableState();
			}

		},

		_addListenerForDisableEnableState: function(){
			var that = this;
			this.$formElem.on('focus click keyup', function (e) {
				// Fix für doppelten Eventtrigger, der bei (Label > input[type="radio"]) besteht.
				// Hier wird zuerste der Event von Lable gefeuert und dann noch vom radio.
				if (!((e.target.nodeName.toLowerCase() === 'label') && ($(e.target).find('input[type="radio"]').doesExist() || $(e.target).find('input[type="checkbox"]').doesExist()))) {
					$.doTimeout('changeForm', 100, function () {
						that._setBtnState();
					});
				}
			});

		},

		_setBtnState: function () {
			if (this.formquery !== this.$formElem.serialize()) {
				this.$elem.removeAttr('disabled');
				this.$elem.removeClass('btn-inaktiv');
				this.$elem.addClass('btn');
				return;
			}
			this.$elem.attr('disabled', 'disabled');
			this.$elem.removeClass('btn');
			this.$elem.addClass('btn-inaktiv');
		}
	});


	$.plugin('modules.form.submitbutton', submitbutton);
	return submitbutton;
});