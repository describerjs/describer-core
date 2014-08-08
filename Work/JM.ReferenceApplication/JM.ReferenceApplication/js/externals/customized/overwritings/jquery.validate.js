define(['jquery', 'jquery_validate'], function($){
	// http://docs.jquery.com/Plugins/Validation/validate
	$.extend($.fn, {
		// http://docs.jquery.com/Plugins/Validation/validate
		validate   : function(options){

			// if nothing is selected, return nothing; can't chain anyway
			if(!this.length){
				if(options && options.debug && window.console){
					console.warn("Nothing selected, can't validate, returning nothing.");
				}
				return;
			}

			// check if a validator for this form was already created
			var validator = $.data(this[0], "validator");
			if(validator){
				return validator;
			}

			// Add novalidate tag if HTML5.
			this.attr("novalidate", "novalidate");

			validator = new $.validator(options, this[0]);
			$.data(this[0], "validator", validator);

			if(validator.settings.onsubmit){

				this.validateDelegate(":submit", "click", function(event){
					if(validator.settings.submitHandler){
						validator.submitButton = event.target;
					}
					// allow suppressing validation by adding a cancel class to the submit button
					if($(event.target).hasClass("cancel")){
						validator.cancelSubmit = true;
					}

					// allow suppressing validation by adding the html5 formnovalidate attribute to the submit button
					if($(event.target).attr("formnovalidate") !== undefined){
						validator.cancelSubmit = true;
					}
				});

				// validate the form on submit
				this.submit(function(event){
					if(validator.settings.debug){
						// prevent form submit to be able to see console output
						event.preventDefault();
					}
					function handle(){
						var hidden;
						if(validator.settings.submitHandler){
							if(validator.submitButton){
								// insert a hidden input as a replacement for the missing submit button
								hidden = $("<input type='hidden'/>").attr("name", validator.submitButton.name).val($(validator.submitButton).val()).appendTo(validator.currentForm);
							}
							validator.settings.submitHandler.call(validator, validator.currentForm, event);
							if(validator.submitButton){
								// and clean up afterwards; thanks to no-block-scope, hidden can be referenced
								hidden.remove();
							}
							return false;
						}
						return true;
					}

					// prevent submit for invalid forms or custom submit handlers
					if(validator.cancelSubmit){
						validator.cancelSubmit = false;
						return handle();
					}
					if(validator.form(event)){
						if(validator.pendingRequest){
							validator.formSubmitted = true;
							return false;
						}
						return handle();
					}else{
						validator.focusInvalid();
						return false;
					}
				});
			}

			return validator;
		}
	});
	$.validator.messages.email = "Bitte gebe eine gültige E-Mail-Adresse an.";
	$.validator.messages.url = "Bitte gib eine gültige URL an.";
	$.validator.prototype.showLabel = function(element, message){
					var label = this.errorsFor(element);
					if(label.length){
						// refresh error/success class
						label.removeClass(this.settings.validClass).addClass(this.settings.errorClass);
						// replace message on existing label
						label.html(message);
					}else{
						// create label
						label = $("<" + this.settings.errorElement + ">").attr("for", this.idOrName(element)).addClass(this.settings.errorClass+' error-msg').html(message || "");
						if(this.settings.wrapper){
							// make sure the element is visible, even in IE
							// actually showing the wrapped element is handled elsewhere
							label = label.hide().show().wrap("<" + this.settings.wrapper + "/>").parent();
						}
						if(!this.labelContainer.append(label).length){
							if(this.settings.errorPlacement){
								this.settings.errorPlacement(label, $(element));
							}else{
								label.insertAfter(element);
							}
						}
					}
					if(!message && this.settings.success){
						label.text("");
						if(typeof this.settings.success === "string"){
							label.addClass(this.settings.success);
						}else{
							this.settings.success(label, element);
						}
					}
					this.toShow = this.toShow.add(label);
				};
	$.validator.prototype.init = function(){
		this.labelContainer = $(this.settings.errorLabelContainer);
		this.errorContext = this.labelContainer.length && this.labelContainer || $(this.currentForm);
		this.containers = $(this.settings.errorContainer).add(this.settings.errorLabelContainer);
		this.submitted = {};
		this.valueCache = {};
		this.pendingRequest = 0;
		this.pending = {};
		this.invalid = {};
		this.reset();

		var groups = (this.groups = {});
		$.each(this.settings.groups, function(key, value){
			if(typeof value === "string"){
				value = value.split(/\s/);
			}
			$.each(value, function(index, name){
				groups[name] = key;
			});
		});
		var rules = this.settings.rules;
		$.each(rules, function(key, value){
			rules[key] = $.validator.normalizeRule(value);
		});

		function delegate(event){
			var validator = $.data(this[0].form, "validator"), eventType = "on" + event.type.replace(/^validate/, "");
			if(validator.settings[eventType]){
				validator.settings[eventType].call(validator, this[0], event);
			}
		}

		$(this.currentForm).validateDelegate(":text, [type='password'], [type='file'], select, textarea, " + "[type='number'], [type='search'] ,[type='tel'], [type='url'], " + "[type='email'], [type='datetime'], [type='date'], [type='month'], " + "[type='week'], [type='time'], [type='datetime-local'], " + "[type='range'], [type='color'] ", "focusin focusout keyup", delegate)// '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
			// '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
			// '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
			// '''''''''''''''''''das Event change wurde von jm hinzugefügt.''''''''''''''''''''''''''''
			// '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
			// '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
			// '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
			.validateDelegate("[type='radio'], [type='checkbox'], select, option", "click change", delegate);
		// '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		// '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		// '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		// '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		// '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
		// '''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''

		if(this.settings.invalidHandler){
			$(this.currentForm).bind("invalid-form.validate", this.settings.invalidHandler);
		}
	};
	$.validator.prototype.elements = function(){
		var validator = this, rulesCache = {};

		// select all valid inputs inside the form (no submit or reset buttons)
		return $(this.currentForm).find("input, select, textarea").not(":submit, :reset, :image, [disabled]").not(this.settings.ignore).map(function(index, item){
				if($(item).parents('fieldset[disabled]').doesExist()){
					return null;
				}else{
					return item;
				}

			}).filter(function(){
				if(!this.name && validator.settings.debug && window.console){
					console.error("%o has no name assigned", this);
				}

				// select only the first element for each name, and only those with rules specified
				if(this.name in rulesCache || !validator.objectLength($(this).rules())){
					return false;
				}

				rulesCache[this.name] = true;
				return true;
			});
	};

	// http://docs.jquery.com/Plugins/Validation/Validator/form
	$.validator.prototype.form = function(event){
		this.checkForm(event);
		$.extend(this.submitted, this.errorMap);
		this.invalid = $.extend({}, this.errorMap);
		if(!this.valid()){
			$(this.currentForm).triggerHandler("invalid-form", [this]);
		}
		this.showErrors();
		return this.valid();
	};

	$.validator.prototype.checkForm = function(event){
		this.prepareForm();
		for(var i = 0, elements = (this.currentElements = this.elements()); elements[i]; i++){
			this.check(elements[i], event);
		}
		return this.valid();
	};

	// http://docs.jquery.com/Plugins/Validation/Validator/element
	$.validator.prototype.element = function(element, event){ // add event by jm
		element = this.validationTargetFor(this.clean(element));
		this.lastElement = element;
		this.prepareElement(element);
		this.currentElements = $(element);
		var result = this.check(element, event) !== false; // add event by jm
		if(result){
			delete this.invalid[element.name];
		}else{
			this.invalid[element.name] = true;
		}
		if(!this.numberOfInvalids()){
			// Hide error containers on last error
			this.toHide = this.toHide.add(this.containers);
		}
		this.showErrors();
		return result;
	};

	$.validator.prototype.check = function(element, event){  // add event by jm
		element = this.validationTargetFor(this.clean(element));

		var rules = $(element).rules();
		var dependencyMismatch = false;
		var val = this.elementValue(element);
		var result;

		for(var method in rules){
			var rule = { method: method, parameters: rules[method] };
			try{
				result = $.validator.methods[method].call(this, val, element, rule.parameters, event); // add event by jm

				// if a method indicates that the field is optional and therefore valid,
				// don't mark it as valid when there are no other rules
				if(result === "dependency-mismatch"){
					dependencyMismatch = true;
					continue;
				}
				dependencyMismatch = false;

				if(result === "pending"){
					this.toHide = this.toHide.not(this.errorsFor(element));
					return;
				}

				if(!result){
					this.formatAndAdd(element, rule);
					return false;
				}
			}catch(e){
				if(this.settings.debug && window.console){
					console.log("Exception occurred when checking element " + element.id + ", check the '" + rule.method + "' method.", e);
				}
				throw e;
			}
		}
		if(dependencyMismatch){
			return;
		}
		if(this.objectLength(rules)){
			this.successList.push(element);
		}
		return true;
	};

	$.validator.methods.remote = function(value, element, param){
		if(this.optional(element)){
			return "dependency-mismatch";
		}

		var previous = this.previousValue(element);
		if(!this.settings.messages[element.name]){
			this.settings.messages[element.name] = {};
		}
		previous.originalMessage = this.settings.messages[element.name].remote;
		this.settings.messages[element.name].remote = previous.message;

		param = typeof param === "string" && {url: param} || param;

		// jmGo.submit wurde hinzugefügt um ein Caching bei Gruppenvalidierung zu vermeiden (z.B. Geburtsdatum oder Gültigkeit der Kreditkarte)
		if(previous.old === value && jmGO.submit){
			return previous.valid;
		}
		// um ein Caching auf einem Input festzusetzen kann dies mit der Attribut data-jmcaching="true" realisiert werden
		if(previous.old === value && $.type($(element).data('jmcaching')) !== 'undefined'){
			return previous.valid;
		}

		previous.old = value;
		var validator = this;
		this.startRequest(element);
		var data = {};
		data[element.name] = value;

		$.ajax($.extend(true, {
			url     : param,
			mode    : "abort",
			port    : "validate" + element.name,
			dataType: "json",
			data    : data,
			success : function(response){
				validator.settings.messages[element.name].remote = previous.originalMessage;
				var valid = response === true || response === "true";
				if(valid){
					var submitted = validator.formSubmitted;
					validator.prepareElement(element);
					validator.formSubmitted = submitted;
					validator.successList.push(element);
					delete validator.invalid[element.name];
					validator.showErrors();
				}else{
					var errors = {};
					var message = response || validator.defaultMessage(element, "remote");
					errors[element.name] = previous.message = $.isFunction(message) ? message(value) : message;
					validator.invalid[element.name] = true;
					validator.showErrors(errors);
				}
				previous.valid = valid;
				validator.stopRequest(element, valid);
			}
		}, param));

		return "pending";
	};
});
