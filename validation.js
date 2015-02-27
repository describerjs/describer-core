define(['jquery', 'i18n!language/nls/speak', 'jquery_validate'], function ($, speak){
	(function($, window, document, undefined){
		/*$.validator.addMethod('jmfilesize', function(value, element, param){
			// param = size (en bytes)
			// element = element to validate (<input>)
			// value = value of the element (file name)
			return this.optional(element) || (element.files[0].size <= param);
		}, 'Das Bild muss im Dateiformat JPG, GIF oder PNG und kleiner als 20 MB sein.');*/

		/*$.validator.addMethod("jmPlzCheck", function(value, element){
			return $.validator.methods.remote.call(this, value, element, {
				url : '//projekt1.base.de/validation/ValidatePLZ',
				type: "post",
				timeout   : 10000,
				data: {
					val : value,
					name: 'ZIP'
				}
			});
		}, 'Bitte geben Sie eine gültige Postleitzahl ein.');*/

		/*$.validator.addMethod("jmurlcheck", function(value, element){
			return $.validator.methods.remote.call(this, value, element, {
				url       : '_ValidateUrl?url=' + value,
				type      : "post",
				timeout   : 10000,
				dataFilter: function(p_data){
					return JSON.stringify(p_data);  // JSON.stringify supported browsers ab >ie7
				}
			});
		}, 'Fehler: Der Remoteserver hat einen Fehler zurückgegeben: (404) Nicht gefunden.');*/

		/*$.validator.addMethod("jmlandingpageurlcheck", function(value, element){
			return $.validator.methods.remote.call(this, value, element, {
				url       : '_ValidateLandingpageUrl?url=' + value + '&pid=' + $('input[name="PageID"]').val(),
				type      : "post",
				timeout   : 10000,
				dataFilter: function(p_data){
					return JSON.stringify(p_data);  // JSON.stringify supported browsers ab >ie7
				}
			});
		}, 'Fehler');*/

		// ist valid, wenn das jmRelatedTo-Element nicht leer ist
		$.validator.addMethod("jmrelatedelementCheckbyval", function(value, element){
			var relatedToElementVal = $(element).closest('form').find($(element).data('jmrelatedto')).val();
			if($(element).val() !== ''){

				if((relatedToElementVal === '') || (relatedToElementVal === '0')){
					return false;
				}else{
					return true;
				}
			}else{
				return true;
			}
		}, speak.jmrelatedelementCheckbyval);
		$.validator.addMethod("jmrequiredincl0", function(value, element, param){
			if($(element).val() === '0'){
				return false;
			}
			if(element.nodeName.toLowerCase() === "select"){
				// could be an array for select-multiple or a string, both are fine this way
				var val = $(element).val();
				return val && val.length > 0;
			}
			if(this.checkable(element)){
				return this.getLength(value, element) > 0;
			}
			return $.trim(value).length > 0;

		}, speak.jmrequiredincl0);
		$.validator.addMethod("jmrequired", function(value, element, param){
			if($.type($(element).attr('data-jmremovejmrequired')) !== 'undefined'){
				return '"true"';   // immer "true"' so schreiben, da im Android bei nur true kein success gefeuert wird!!!!!!!!!!!!!!!!
			}
			if(element.nodeName.toLowerCase() === "select"){
				// could be an array for select-multiple or a string, both are fine this way
				var val = $(element).val();
				return val && val.length > 0;
			}
			if(this.checkable(element)){
				return this.getLength(value, element) > 0;
			}
			return $.trim(value).length > 0;

		}, '{0}');
		/*$.validator.addMethod("jmrequiredwithspace", function(value, element, param){
			if(element.nodeName.toLowerCase() === "select"){
				// could be an array for select-multiple or a string, both are fine this way
				var val = $(element).val();
				return val && val.length > 0;
			}
			if(this.checkable(element)){
				return this.getLength(value, element) > 0;
			}
			return value.length > 0;

		}, '{0}');*/
		$.validator.addMethod("jmsurname", function(value, element, param){
			return this.optional(element) || /^[a-zA-Z- äÄüÜöÖßÀÁÂàáâÇçÈÉÊèéêĞğÌÍÎİìíîıÒÓÔòóôŞşÙÚÛùúû]{1,40}$/.test(value);
		}, '{0}');

		$.validator.addMethod("jmlastname", function(value, element, param){
			return this.optional(element) || /^[a-zA-Z- äÄüÜöÖßÀÁÂàáâÇçÈÉÊèéêĞğÌÍÎİìíîıÒÓÔòóôŞşÙÚÛùúû]{1,40}$/.test(value);
		}, '{0}');

		$.validator.addMethod("jmcompany", function(value, element, param){
			return this.optional(element) || /^\d*[a-z- äÄüÜöÖßÀÁÂàáâÇçÈÉÊèéêĞğÌÍÎİìíîıÒÓÔòóôŞşÙÚÛùúû][a-z -äÄüÜöÖßÀÁÂàáâÇçÈÉÊèéêĞğÌÍÎİìíîıÒÓÔòóôŞşÙÚÛùúû\d]*$/i.test(value);
		}, '{0}');

		$.validator.addMethod("jmcompanyAdditional", function(value, element, param){
			return this.optional(element) || /^\d*[a-z- äÄüÜöÖßÀÁÂàáâÇçÈÉÊèéêĞğÌÍÎİìíîıÒÓÔòóôŞşÙÚÛùúû][a-z -äÄüÜöÖßÀÁÂàáâÇçÈÉÊèéêĞğÌÍÎİìíîıÒÓÔòóôŞşÙÚÛùúû\d]*$/i.test(value);
		}, '{0}');
		
		$.validator.addMethod("jmlandlinefull", function(value, element, param){
			return this.optional(element) || /^((\+)|(0{1})([0-9]{2,5}))([/-]?)[0-9]+$/.test(value);
		}, '{0}');

		$.validator.addMethod("jmmsisdnrelaxed", function(value, element, param){
			return this.optional(element) || /^((\+\s?|0{1,2}\s?)(?=[1-9]))[\d ()-/\\]+\d$/.test(value);
		}, '{0}');

		$.validator.addMethod("jmemail", function(value, element, param){
			return this.optional(element) || /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/.test(value);
		}, '{0}');

		$.validator.addMethod("jmstreet", function(value, element, param){
			return this.optional(element) || /^[a-zA-Z0-9- äÄüÜöÖßÀÁÂàáâÇçÈÉÊèéêĞğÌÍÎİìíîıÒÓÔòóôŞşÙÚÛùúû.]{1,40}$/.test(value);
		}, '{0}');

		$.validator.addMethod("jmhousenumber", function(value, element, param){
			return this.optional(element) || /^[a-zA-Z0-9- äÄüÜöÖßÀÁÂàáâÇçÈÉÊèéêĞğÌÍÎİìíîıÒÓÔòóôŞşÙÚÛùúû]{1,10}$/.test(value);
		}, '{0}');

		$.validator.addMethod("jmkundenkennwort", function(value, element, param){  //Personmodel.cs
			return this.optional(element) || /^[^<>&]{6,15}$/.test(value);
		}, '{0}');

		$.validator.addMethod("jmplz", function(value, element, param){
			return $.validator.methods.remote.call(this, value, element, {
				url       : '/validation/ValidatePLZ',
				type      : "post",
				timeout   : 10000,
				data      : {
					val : value,
					name: 'ZIP'
				},
				dataFilter: function(p_data){
					var json = JSON.parse(p_data), _$elem, _$input, _$select;
					if(json.IsValid){
						if(json.Data.CityNames.length > 1){
							// z.B. 40472
							_$elem = $(element).closest('label').next('label').find('input, select');
							_$select = $('<select data-jmname="sync-val" data-jmdominit="true" id="' + _$elem.attr('id') + '" name="' + _$elem.attr('name') + '" class="input-selectbox" x-autocomplete="' + _$elem.attr('x-autocomplete') + '"></select>');
							_$select.html($.map(json.Data.CityNames, function(obj, index){
								return '<option value="' + obj + '">' + obj + '</option>';
							}).join(''));
							_$elem.last().after(_$select);
							_$select.requirementsForJmPlugins().triggerSelfexecObj();
							_$select.trigger('change');
							_$elem.remove();

						}else{
							_$elem = $(element).closest('label').next('label').find('input, select');
							_$input = $('<input type="text" data-jmname="sync-val" data-jmdominit="true" data-rule-jmcity="'+ speak.jmplzOrt +'" class="input-autocomplete" id="' + _$elem.attr('id') + '" name="' + _$elem.attr('name') + '" maxlength="40" x-autocomplete="' + _$elem.attr('x-autocomplete') + '" value="' + _$elem.val() + '" /><input id="' + _$elem.attr('id') + '" name="' + _$elem.attr('name') + '" type="hidden" value="' + json.Data.CityNames + '">');
							_$elem.last().after(_$input);

							//json.Data.CityNames = 'service';
							if(json.Data.CityNames[0] === 'Service not available'){
								if(_$input.eq(0).val() !== speak.wirdAutomatischAusgefuellt && _$input.eq(0).val() !== ''){
									_$input.eq(1).val(_$input.eq(0).val());
									_$input.eq(0).trigger('change');
									_$elem.remove();
									return '"true"';
								}
								_$input.eq(0).prop('disabled', false).addClass('input-text').removeClass('input-autocomplete').val('').attr('placeholder', speak.bitteAusfuellen);
								_$input.eq(1).prop('disabled', true).val('');
								_$input.eq(0).trigger('change');
								_$elem.remove();
								return '"true"';
							}
							_$input.eq(0).val(json.Data.CityNames[0]);
							_$input.requirementsForJmPlugins().triggerSelfexecObj();
							_$input.eq(0).trigger('change').prop('disabled', true);
							_$elem.remove();

						}
						return '"true"';
					}else{
						var _errorMassage = json.ErrorMessage;
						$(element).closest('label').next('label').find('input').val(speak.wirdAutomatischAusgefuellt);
						return JSON.stringify(_errorMassage);
					}
				}
			});
		}, '{0}');

		/*$.validator.addMethod("jmplzwithouterrortext", function(value, element, param){
			return $.validator.methods.remote.call(this, value, element, {
				url       : '/validation/ValidatePLZ',
				type      : "post",
				timeout   : 10000,
				data      : {
					val : value,
					name: 'ZIP'
				},
				dataFilter: function(p_data){
					var json = JSON.parse(p_data), _$elem, _$input, _$select;
					if(json.IsValid){
						if(json.Data.CityNames.length > 1){
							// z.B. 40472
							_$elem = $(element).closest('label').next('label').find('input, select');
							_$select = $('<select name="' + _$elem.attr('name') + '" class="packageservice-input input-autocomplete"></select>');
							_$select.html($.map(json.Data.CityNames, function(obj, index){
								return '<option value="' + obj + '">' + obj + '</option>';
							}).join(''));
							_$elem.last().after(_$select);
							_$elem.remove();

						}else{
							_$elem = $(element).closest('label').next('label').find('input, select');
							_$input = $('<input type="text" data-rule-jmcity="" class="packageservice-input input-autocomplete" name="' + _$elem.attr('name') + '" maxlength="40" value="' + json.Data.CityNames + '" disabled /><input name="' + _$elem.attr('name') + '" type="hidden" value="' + json.Data.CityNames + '" />');
							_$elem.last().after(_$input);
							_$elem.remove();

						}
						return '"true"';
					}else{
						var _errorMassage = json.ErrorMessage;
						$(element).closest('label').next('label').find('input').val(speak.wirdAutomatischAusgefuellt);
						return JSON.stringify(_errorMassage);
					}
				}
			});
		}, '{0}');*/

		$.validator.addMethod("jmcity", function(value, element, param){
			return this.optional(element) || /^[a-zA-Z- äÄüÜöÖßÀÁÂàáâÇçÈÉÊèéêĞğÌÍÎİìíîıÒÓÔòóôŞşÙÚÛùúû]{1,40}$/.test(value);
		}, '{0}');


		/*$.validator.addMethod("jmgeburtsminage", function(value, element, param){
			var now = new Date();
			return this.optional(element) || parseInt(value, 10) < now.getFullYear() - 14;
		}, '{0}');*/

		$.validator.addMethod("jmgeburtsdatumsservice", function(value, element, param, event){
			var _validator = this;
			var _combineValue;
			var $selects = $('[data-rule-jmgeburtsdatumsservice]');

			/*if(!($selects.eq(0).hasClass('valid') || $selects.eq(0).hasClass('error')) || !($selects.eq(1).hasClass('valid') || $selects.eq(1).hasClass('error')) || !($selects.eq(2).hasClass('valid') || $selects.eq(2).hasClass('error'))){
				return '"true"';// TODO Andreas CHECKEN ob nicht doch nur true
			}*/
			if($.type(event) !== 'undefined' && event.type !== 'jmvalidcheck'){
				$selects.each(function(index, item){
					if(item !== element){
						_validator.check(element, jQuery.Event('jmvalidcheck'));
					}
				});
			}
			if(($selects.eq(0).val() === '0') || ($selects.eq(1).val() === '0') || ($selects.eq(2).val() === '0')){
				return true;
			}

			_combineValue =  (($selects.eq(0).val().length < 2) ? '0' + $selects.eq(0).val() : $selects.eq(0).val()) + '|' + (($selects.eq(1).val().length < 2) ? '0' + $selects.eq(1).val() : $selects.eq(1).val()) + '|' + (($selects.eq(2).val().length < 2) ? '0' + $selects.eq(2).val() : $selects.eq(2).val());
			// hier weden noch die anderen beiden Selects getriggert, dass sie auch validier werden

			/*if(($selects.eq(0).val() === '0' && !$selects.eq(0).hasClass('valid')) || ($selects.eq(1).val() === '0' && !$selects.eq(1).hasClass('valid')) || ($selects.eq(2).val() === '0' && !$selects.eq(2).hasClass('valid'))){
				return '"true"';// TODO Andreas CHECKEN ob nicht doch nur true
			}*/
			return $.validator.methods.remote.call(this, _combineValue, element, {
				url       : '/validation/ValidateBirthdate',
				type      : "post",
				timeout   : 10000,
				data      : {
					val       : function(){
						return _combineValue;

					},
					hasPrepaid: function(){
						return $('body').find('input[type="hidden"][name="IsPrepaid"]').val();
					}
				},
				dataFilter: function(p_data){
					var json = JSON.parse(p_data);
					if(json.IsValid){
						//$(element).closest('fieldset').find('input[data-rule-jmkreditkartenanbieter]').val(json.Data.CreditCardProviderName);
						$selects.each(function(index, item){
							$(item).removeClass('error').addClass('valid');
							delete _validator.invalid[item.name];
						});
						return '"true"'; // immer "true"' so schreiben, da im Android bei nur true kein success gefeuert wird!!!!!!!!!!!!!!!!
					}else{
						var _errorMassage = json.ErrorMessage;
						return JSON.stringify(_errorMassage);
					}
				}
			});
		}, '{0}');

		$.validator.addMethod("jmrequiredforGeburtsdatumsserviceIncl0", function(value, element, param, event){
			var _validator = this;
			var $selects = $('[data-rule-jmrequiredforGeburtsdatumsserviceIncl0]');
/*			if(event.target.nodeName.toLowerCase() !== 'select'){

			}*/
			// wenn keine userinteraction mit allen Selects forgekommen ist und submitted wird
			if($.type(event) !== 'undefined' && event.type === 'submit' && (!$selects.eq(0).hasClass('userinteraction-js') || !$selects.eq(1).hasClass('userinteraction-js') || !$selects.eq(2).hasClass('userinteraction-js'))){
				return false;
			}
			// TODO wenn nicht mit allen Selects eine userinteraction durchgefürt wurde und das target, welches diese validierung ausgelöst hat ein select ist (muss noch spezielle sein mit z.B. data-Attr)
			if($.type(event) !== 'undefined' && $.type(event.target) !== 'undefined' && event.target.nodeName.toLowerCase() === 'select' && (!$selects.eq(0).hasClass('userinteraction-js') || !$selects.eq(1).hasClass('userinteraction-js') || !$selects.eq(2).hasClass('userinteraction-js'))){
				$selects.each(function(index, item){
					$(item).removeClass('error').addClass('valid');
					delete _validator.invalid[item.name];
				});
				return '"true"';
			}

			// TODO wenn nicht mit allen Selects eine userinteraction durchgefürt wurde und das target, welches diese validierung ausgelöst hat ein select ist (muss noch spezielle sein mit z.B. data-Attr)
			if($.type(event) !== 'undefined' && event.type === 'jmvalidcheck' && (!$selects.eq(0).hasClass('userinteraction-js') || !$selects.eq(1).hasClass('userinteraction-js') || !$selects.eq(2).hasClass('userinteraction-js'))){
				$selects.each(function(index, item){
					$(item).removeClass('error').addClass('valid');
					delete _validator.invalid[item.name];
				});
				return '"true"';
			}

			if(($selects.eq(0).val() !== '0') && ($selects.eq(1).val() !== '0') && ($selects.eq(2).val() !== '0')){
				$selects.each(function(index, item){
					$(item).removeClass('error').addClass('valid');
					delete _validator.invalid[item.name];
				});
				return '"true"';// TODO Andreas CHECKEN ob nicht doch nur true
			}
			return false;
			// die Validierung wird erst nach Auswahl aller drei Selects geprüft
			/*if(!($selects.eq(0).hasClass('valid') || $selects.eq(0).hasClass('error')) || !($selects.eq(1).hasClass('valid') || $selects.eq(1).hasClass('error')) || !($selects.eq(2).hasClass('valid') || $selects.eq(2).hasClass('error'))){
				return '"true"';// TODO Andreas CHECKEN ob nicht doch nur true
			}
			if(($selects.eq(0).val() !== '0') && ($selects.eq(1).val() !== '0') && ($selects.eq(2).val() !== '0')){
				return '"true"';// TODO Andreas CHECKEN ob nicht doch nur true
			}
			return false;*/
		}, '{0}');

		$.validator.addMethod("jmbankleitzahlregex", function(value, element, param){
			return this.optional(element) || /^\d{3,20}$/.test(value);
		}, '{0}');
		$.validator.addMethod("jmbankleitzahlservice", function(value, element, param){
			return $.validator.methods.remote.call(this, value, element, {
				url       : '/validation/ValidateBLZ',
				type      : "post",
				timeout   : 10000,
				data      : {
					val : value,
					name: 'BLZ'
				},
				dataFilter: function(p_data){
					var json = JSON.parse(p_data);
					var $bankfield;
					if(json.IsValid){
						$bankfield = $(element).closest('fieldset').find('input[data-rule-jmbankname]');
						//json.Data.bankName = 'service';
						if(json.Data.bankName === 'Service not available'){
							if(!$bankfield.prop('disabled') && $bankfield.val() !== ''){
								$bankfield.siblings('input').val($bankfield.val());
								return '"true"';
							}
							$bankfield.prop('disabled', false).addClass('input-text').removeClass('input-autocomplete').val('').attr('placeholder', speak.bitteAusfuellen);
							$bankfield.siblings('input').prop('disabled', true).val('');
							return '"true"';
						}


						$bankfield.val(json.Data.bankName);
						if($bankfield.siblings('input').doesExist()){
							$bankfield.siblings('input').val(json.Data.bankName);
							$bankfield.trigger('change');
						}else{
							$bankfield.after('<input id="Bank" name="Payment.BankName" data-jmname="sync-val" data-jmdominit="true" type="hidden" value="'+json.Data.bankName+'">');
							$bankfield.requirementsForJmPlugins().triggerSelfexecObj();
							$bankfield.trigger('change');
						}
						return '"true"';
					}else{
						var _errorMassage = json.ErrorMessage;
						return JSON.stringify(_errorMassage);
					}
				}
			});
		}, '{0}');
		$.validator.addMethod("jmkontonummerregex", function(value, element, param){
			return this.optional(element) || /^\d{3,20}$/.test(value);
		}, '{0}');

		$.validator.addMethod("jmkontonummerservice", function(value, element, param){
			return $.validator.methods.remote.call(this, value, element, {
				url       : '/validation/ValidateKontonummer',
				type      : "post",
				timeout   : 10000,
				data      : {
					val : value,
					name: 'Kontonummer',
					blz : $(element).closest('fieldset').find('input[data-rule-jmbankleitzahlservice]').val()
				},
				dataFilter: function(p_data){
					var json = JSON.parse(p_data);
					if(json.IsValid){
						return '"true"';
					}else{
						var _errorMassage = json.ErrorMessage;
						return JSON.stringify(_errorMassage);
					}
				}
			});
		}, '{0}');

		$.validator.addMethod("jmbankname", function(value, element, param){
			if(element.nodeName.toLowerCase() === "select"){
				// could be an array for select-multiple or a string, both are fine this way
				var val = $(element).val();
				return val && val.length > 0;
			}
			if(this.checkable(element)){
				return this.getLength(value, element) > 0;
			}
			return $.trim(value).length > 0;
		}, '{0}');

		$.validator.addMethod("jmkreditkartennummerservice", function(value, element, param){
			return $.validator.methods.remote.call(this, value, element, {
				url       : '/validation/ValidateCreditCardNumber',
				type      : "post",
				timeout   : 10000,
				data      : {
					val : value.replace(/ /g, ''),
					name: 'KartenNummer1'
				},
				dataFilter: function(p_data){
					var json = JSON.parse(p_data);
					var $bankfield;
					if(json.IsValid){
						$bankfield = $(element).closest('fieldset').find('input[data-rule-jmkreditkartenanbieter]');
						//json.Data.CreditCardProviderName = 'service';
						if(json.Data.CreditCardProviderName === 'Service not available'){
							if(!$bankfield.prop('disabled') && $bankfield.val() !== ''){
								$bankfield.siblings('input').val($bankfield.val());
								return '"true"';
							}
							$bankfield.prop('disabled', false).addClass('input-text').removeClass('input-autocomplete').val('').attr('placeholder', speak.bitteAusfuellen);
							$bankfield.siblings('input').prop('disabled', true).val('');
							return '"true"';
						}


						$bankfield.val(json.Data.CreditCardProviderName);
						if($bankfield.siblings('input').doesExist()){
							$bankfield.siblings('input').val(json.Data.CreditCardProviderName);
							$bankfield.trigger('change');
						}else{
							$bankfield.after('<input id="Bank" name="Payment.Contractor" data-jmname="sync-val" data-jmdominit="true" type="hidden" value="'+json.Data.CreditCardProviderName+'">');
							$bankfield.requirementsForJmPlugins().triggerSelfexecObj();
							$bankfield.trigger('change');
						}
						return '"true"';
					}else{
						var _errorMassage = json.ErrorMessage;
						return JSON.stringify(_errorMassage);
					}
				}
			});
		}, '{0}');

		$.validator.addMethod("jmkreditkartengueltigkeitsservice", function(value, element, param){
			// TODO hier noch die Anpassungen/Optimierungen von jmgeburtsdatumsservice übernehmen
			var $selects = $('[data-rule-jmkreditkartengueltigkeitsservice]');
			var _validator = this;
			$selects.each(function(index, item){
				if((item !== element) && ($(item).val() === '') && ($.type(jmGO.checkSiblingsforjmkreditkartengueltigkeitsservice) !== 'undefined')){
					$(item).valid();
				}
			});
			if($selects.eq(0).val() === '' || $selects.eq(1).val() === ''){
				return '"true"';
			}
			if(($selects.eq(0).val() === '0' && !$selects.eq(0).hasClass('valid')) || ($selects.eq(1).val() === '0' && !$selects.eq(1).hasClass('valid'))){
				return '"true"';
			}
			jmGO.checkSiblingsforjmkreditkartengueltigkeitsservice = true;

			return $.validator.methods.remote.call(this, value, element, {
				url       : '/validation/ValidateCreditCardExpiry',
				type      : "post",
				timeout   : 10000,
				data      : {
					kartengueltigkeitMonat: function(){
						return $selects.eq(0).val();
					},
					kartengueltigkeitJahr : function(){
						return $selects.eq(1).val();
					}
				},
				dataFilter: function(p_data){
					var json = JSON.parse(p_data);
					if(json.IsValid){
						$selects.each(function(index, item){
							$(item).removeClass('error');
							delete _validator.invalid[item.name];
						});
						return '"true"';  // immer "true"' so schreiben, da im Android bei nur true kein success gefeuert wird!!!!!!!!!!!!!!!!
					}else{
						var _errorMassage = json.ErrorMessage;
						return JSON.stringify(_errorMassage);
					}
				}
			});
		}, '{0}');

		$.validator.addMethod("jmkreditkartenpruefnummer", function(value, element, param){
			return this.optional(element) || /^\d{3,4}$/.test(value);
		}, '{0}');

/*		$.validator.addMethod("jmhotlinekennwort", function(value, element, param){
			return this.optional(element) || /^[^<>& ]{6,15}$/.test(value);
		}, '{0}');*/

		/*$.validator.addMethod("jmequalto", function(value, element, param){
			// bind to the blur event of the target in order to revalidate whenever the target field is updated
			// TODO find a way to bind the event just once, avoiding the unbind-rebind overhead
			var target = $(param);
			if(this.settings.onfocusout){
				target.unbind(".validate-equalTo").bind("blur.validate-equalTo", function(){
					$(element).valid();
				});
			}
			return value === target.val();
		}, 'Passwort und Passwortwiederholung stimmt nicht überein');*/

		$.validator.addMethod("jmibanregex", function(value, element, param){
			var $btn = $("[data-jmrelatedto='[data-jmdomselector=\"sepainputforspinner\"]']");
			if(!(this.optional(element) || /^DE\d{20}$/.test(value))){
				$btn.removeClass('btn').addClass('btn-inaktiv');
			}else{
				$btn.removeClass('btn-inaktiv').addClass('btn');
			}
			return this.optional(element) || /^DE\d{20}$/.test(value);
		}, '{0}');

		$.validator.addMethod("jmibanservice", function(value, element, param){
			return $.validator.methods.remote.call(this, value, element, {
				url       : '/validation/ValidateIban',
				type      : "post",
				timeout   : 10000,
				data      : {
					val: value
				},
				dataFilter: function(p_data){
					//alert('data: ' + p_data);
				}
			});
		}, '{0}');
		/*$.validator.addMethod("jmmsisdn", function(value, element, param){
			return this.optional(element) || /^((\+\s?|0{1,2}\s?)(?=[1-9]))[\d ()-/\\]+\d$/.test(value);
		}, '{0}');*/

		/*$.validator.addMethod("jmnameayyildiz", function(value, element, param){
			return this.optional(element) || /^[a-zA-Z0-9- äÄüÜöÖßÀÁÂàáâÇçÈÉÊèéêĞğÌÍÎİìíîıÒÓÔòóôŞşÙÚÛùúû]{1,40}$/.test(value);
		}, '{0}');
		$.validator.addMethod("jmcityayyildiz", function(value, element, param){
			return this.optional(element) || /^[a-zA-Z0-9- äÄüÜöÖßÀÁÂàáâÇçÈÉÊèéêĞğÌÍÎİìíîıÒÓÔòóôŞşÙÚÛùúû]{1,40}$/.test(value);
		}, '{0}');
		$.validator.addMethod("jmageayyildiz", function(value, element, param){
			if(value !== ''){
				return !isNaN(parseFloat(value)) && isFinite(value) && (parseFloat(value) > 0) && (parseFloat(value) < 200);
			}else{
				return '"true"';   // immer "true"' so schreiben, da im Android bei nur true kein success gefeuert wird!!!!!!!!!!!!!!!!
			}
		}, '{0}');*/

		/*$.validator.addMethod("jmyoutubeurlregex", function(value, element, param){
			if(!/^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*//*.test(value)){
				$(element).parent().siblings('.form-upload-canvas').find('[data-jmelement="utils.video.player"]').remove();
				$(element).parent().removeClass('badge-ok').addClass('badge-error');
			}
			return this.optional(element) || /^.*(youtu.be\/|v\/|u\/\w\/|embed\/|watch\?v=|\&v=)([^#\&\?]*).*//*.test(value);
		}, '{0}');*/
		/*$.validator.addMethod("jmyoutubeurlservice", function(value, element, param){
			return $.validator.methods.remote.call(this, value, element, {
				url       : '/Validation/ValidateYoutubeUrl',
				type      : "post",
				timeout   : 10000,
				data      : {
					url: value
				},
				dataFilter: function(p_data){
					var json = JSON.parse(p_data);
					if(json.IsValid){
						$(element).data('utils.inputs.youtubeUrl').valid(json);
						return '"true"';
					}else{

						$(element).data('utils.inputs.youtubeUrl').invalid(json);
						return JSON.stringify(json.ErrorMessage);
					}
				}
			});
		}, '{0}');*/

		$.validator.addMethod("jmsim", function(value, element, param){
			return $.validator.methods.remote.call(this, value, element, {
				url       : '/validation/ValidateSim',
				type      : "post",
				timeout   : 10000,
				data      : {
					sim : value
				},
				dataFilter: function(p_data){
					var json = JSON.parse(p_data);
					if(json.IsValid){
						return '"true"';
					}else{
						var _errorMassage = json.ErrorMessage;
						return JSON.stringify(_errorMassage);
					}
				}
			});
		}, '{0}');

		$.validator.addMethod("jmpuk", function(value, element, param){
			return $.validator.methods.remote.call(this, value, element, {
				url       : '/validation/ValidateSimAndPuk',
				type      : "post",
				timeout   : 10000,
				data      : {
					sim : $(element).closest('fieldset').find('input[data-rule-jmsim]').val(),
					puk : value
				},
				dataFilter: function(p_data){
					var json = JSON.parse(p_data);
					if(json.IsValid){
						return '"true"';
					}else{
						var _errorMassage = json.ErrorMessage;
						return JSON.stringify(_errorMassage);
					}
				}
			});
		}, '{0}');                      

	})(jQuery, window, document);
});