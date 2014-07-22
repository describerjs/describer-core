define(function(){

	// !!!!!!!!!!!!!!!!!!!!!! **************** im HTML **************** !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	//
	//   Anwender der Module im HTML
	//  ____________________________
	//
	//   in MVC:
	//
	//   Hinzufügen des Attributs data_jmname
	//
	//   Bsp.: data_jmname="filterpanel"
	//
	//   in HTML:
	//
	//   Hinzufügen des Attributs data-jmname
	//
	//   Bsp.: data-jmname="filterpanel"
	//
	//
	//
	//
	//
	//    ** Überschreiben der Default-Konfiguration (Default-Konfiguration befindet sich in der _config.js) des Moduls
	//  __________________________________________________________________________________________________________________
	//
	//
	//    1 X data-jmname
	//
	//
	//    MVC
	// Bsp.: data_jmname="filterpanel", data_jmconfig="{ \"relatedTo\": \"[name='AystarOptionSelectionModel.OptionAyDeSmart']\" }"
	//
	//    HTML
	// Bsp.: data-jmname="filterpanel" data-jmconfig="{ 'condition': 'Modernizr.mq(\'only screen and (min-width : 46.8em)\')' }"
	//
	//
	//
	//
	//
	//   2.... X data-jmname
	//
	//   // TODO Andreas bitte testen evtl. falsche Angabe es müsste hier mit Komma getrennt und im Array definiert sein....
	//
	//    MVC
	// Bsp.: data_jmname="autocomplete-plz|sync-val", data_jmconfig="{ \"relatedTo\": \"[name='AystarOptionSelectionModel.OptionAyDeSmart']\" }|{ \"relatedTo\": \"[name='AystarOptionSelectionModel.OptionAyDeSmart']\" }"
	//
	//    HTML
	// Bsp.: data-jmname="autocomplete-plz|sync-val", data-jmconfig="{ 'condition': 'Modernizr.mq(\'only screen and (min-width : 46.8em)\')' }|{ 'condition': 'Modernizr.mq(\'only screen and (min-width : 46.8em)\')' }"
	//
	//
	//
	//
	//
	//
	//
	//   ** besteht das Modul aus mehreren Plugins (jmelement), dann werden die data-config-Objekte in einem Array gelistet.
	//  _______________________________________________________________________________________________________________________
	//
	//  //TODO Andreas Beispiele for MVC und HTML müssen noch richtig aufgeliste und getestet werde.
	//    MVC
	// Bsp.: data_jmname="flyout-link", data_jmconfig="[{ \"relatedTo\": \"[name='AystarOptionSelectionModel.OptionAyDeSmart']\" }|{ \"relatedTo\": \"[name='AystarOptionSelectionModel.OptionAyDeSmart']\" }"
	//
	//    HTML
	// Bsp.: data-jmname="autocomplete-plz", data-jmconfig="[{ 'condition': 'Modernizr.mq(\'only screen and (min-width : 46.8em)\')' }|{ 'condition': 'Modernizr.mq(\'only screen and (min-width : 46.8em)\')' }"
	//
	//  Richtig -> Bsp.: data-jmname="nav-link" data-jmconfig="[{'event':'click','datatype':'class','data':'show1'},{'event':'click','datatype':'class','data':'show','relatedTo':'this.$elem.next()[0]', 'condition': 'Modernizr.mq(\'only screen and (max-width : 50em)\')'}]"
	//
	//
	//
	// !!!!!!!!!!!!!!!!!!!!!! ************************++********* !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	// !!!!!!!!!!!!!!!!!!!!!! ************************** in _config.js  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	//
	//   1 X data-jmelement
	//
	//	    {
	//          jmname   : 'nav',
	//          jmelement: 'actions.toggle',
	//          jmconfig : {
	//              'event'    : 'click',
	//              'datatype' : 'class',
	//              'data'     : 'show-menu',
	//              'relatedTo': '#nav'
	//          }
	//	    }
	//
	//
	//   2... X data-jmelement
	//
	//      {
	//          jmname   : 'flyout-link',
    //          jmelement: 'actions.add|actions.link',
	//          jmconfig : [
	//              {
	//                  'event'    : 'click',
	//                  'datatype' : 'class',
	//                  'data'     : 'show',
	//                  'relatedTo': 'this.$elem.parent()[0]',
	//                  'condition': 'Modernizr.mq(\'only screen and (max-width : 50em)\')'
	//              },
	//              {
	//                  'event'    : 'click',
	//                  'condition': 'Modernizr.mq(\'only screen and (min-width : 50em)\') || this.$elem.parent().hasClass(\'show\')'
	//              }
	//          ]
	//       }
	//
	//
	// !!!!!!!!!!!!!!!!!!!!!! ************************++********* !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

	return [
		{
			jmname   : 'nav',
			jmelement: 'actions.toggle',
			jmconfig : {
				'event'    : 'click',
				'datatype' : 'class',
				'data'     : 'show-menu',
				'relatedTo': '#nav'
			}
		},
		{
			jmname   : 'nav-link',
			jmelement: 'actions.remove_1|actions.remove_2|actions.add|actions.link',
			jmconfig : [
				{
					'event'    : 'hover',
					'datatype' : 'class',
					'data'     : 'show',
					'relatedTo': '.flyout'
				},
				{
					'event'    : 'click',
					'datatype' : 'class',
					'data'     : 'show',
					'relatedTo': '.flyout'
				},
				{
					'event'    : 'click',
					'datatype' : 'class',
					'data'     : 'show',
					'relatedTo': 'this.$elem.next()[0]',
					'condition': 'Modernizr.mq(\'only screen and (max-width : 60em)\')'
				},
				{
					'event'    : 'click',
					'condition': 'Modernizr.mq(\'only screen and (min-width : 60em)\') || this.$elem.next().hasClass(\'show\')'
				}
			]
		},
		{
			jmname   : 'flyout-link',
			jmelement: 'actions.add|actions.link',
			jmconfig : [
				{
					'event'    : 'click',
					'datatype' : 'class',
					'data'     : 'show',
					'relatedTo': 'this.$elem.parent()[0]',
					'condition': 'Modernizr.mq(\'only screen and (max-width : 60em)\')'
				},
				{
					'event'    : 'click',
					'condition': 'Modernizr.mq(\'only screen and (min-width : 60em)\') || this.$elem.parent().hasClass(\'show\')'
				}
			]
		},
		{
			jmname   : 'menu-close',
			jmelement: 'actions.remove',
			jmconfig : {
				'event'    : 'click',
				'datatype' : 'class',
				'data'     : 'show',
				'relatedTo': 'this.$elem.parent()[0]'
			}
		},
		{
			jmname   : 'filterpanel',
			jmelement: 'actions.remove|actions.ajax',
			jmconfig : [
				{
					'event'    : 'change',
					'datatype' : 'html',
					'relatedTo': '[name="PaginatedDeviceListModel.CurrentPage"], [name="PaginatedDeviceListModel.LazyLoadPreviousPage"]'
				},
				{
					'wait'          : '50',
					'url'           : '/Handys-und-Smartphones/_Alle_Handys',
					'data'          : 'this.$elem.closest(\'form\').serialize()',
					'relatedTo'     : '[data-domselector="hardwareview"]',
					'method'        : 'post',
					'inject'        : 'html',
					'event'         : 'change',
					'scrollTo'      : '[data-domselector="hardwareview"]',
					'scrollToOffset': '-20'
				}
			]
		},
		{
			jmname   : 'lazyloadhandy',
			jmelement: 'actions.ajax',
			jmconfig : {
				'url'      : '/Handys-und-Smartphones/_Alle_Handys',
				'data'     : 'this.$elem.closest(\'form\').serialize()+ \'&PaginatedDeviceListModel.NextPage=\'+encodeURI(\'Nächste Seite\')',
				'relatedTo': '[data-domselector="hardwareview"]',
				'method'   : 'post',
				'inject'   : 'append',
				'event'    : 'raf',
				'afterexec': 'remove',
				'condition': '(this.$elem.find(\'[name="PaginatedDeviceListModel.NextPage"]\').doesExist() && (this.$elem.offset().top !== 0) && (jmHF.getScrollPos() > this.$elem.offset().top - (jmHF.getClientHeight() * 2)))'
			}
		},
		{
			jmname   : 'lazyloadhandynextpage',
			jmelement: 'actions.ajax',
			jmconfig : {
				'url'           : '/Handys-und-Smartphones/_Alle_Handys',
				'data'          : 'this.$elem.closest(\'form\').serialize()+ \'&PaginatedDeviceListModel.NextPage=\'+encodeURI(\'Nächste Seite\')',
				'relatedTo'     : '[data-domselector="hardwareview"]',
				'method'        : 'post',
				'inject'        : 'html',
				'event'         : 'click',
				'afterexec'     : 'remove',
				'condition'     : 'this.$elem.find(\'[name="PaginatedDeviceListModel.NextPage"]\').doesExist()',
				'scrollTo'      : '[data-domselector="hardwareview"]',
				'scrollToOffset': '-20'
			}
		},
		{
			jmname   : 'lazyloadhandypreviouspage',
			jmelement: 'actions.remove|actions.ajax',
			jmconfig : [
				{
					'event'    : 'click',
					'datatype' : 'html',
					'relatedTo': '[name="PaginatedDeviceListModel.CurrentPage"]'
				},
				{
					'wait'          : '50',
					'url'           : '/Handys-und-Smartphones/_Alle_Handys',
					'data'          : 'this.$elem.closest(\'form\').serialize()+\'&PaginatedDeviceListModel.CurrentPage=\'+$(\'[name="PaginatedDeviceListModel.LazyLoadPreviousPage"]\').val()',
					'relatedTo'     : '[data-domselector="hardwareview"]',
					'method'        : 'post',
					'inject'        : 'html',
					'event'         : 'click',
					'afterexec'     : 'remove',
					'scrollTo'      : '[data-domselector="hardwareview"]',
					'scrollToOffset': '-20'
				}
			]
		},
		{
			jmname   : 'show-html-comment',
			jmelement: 'actions.add',
			jmconfig : {
				'event'   : 'dominit',
				'datatype': 'html'
			}

		},
		{
			jmname   : 'show-html-comment-only-desktop',
			jmelement: 'actions.add',
			jmconfig : {
				'event'   : 'dominit',
				'datatype': 'html',
				'condition': 'Modernizr.mq(\'only screen and (min-width : 60em)\')'
			}

		},
		{
			jmname   : 'autocomplete-plz',
			jmelement: 'modules.formcomponents.autocomplete',
			jmconfig : {
				'event' : 'dominit',
				'url'   : '/Validation/AutoCompletePLZ',
				'hideby': '1',
				'nextFocusNameAttr': 'Personal.Street'
			}
		},
		{
			jmname   : 'autocomplete-street',
			jmelement: 'modules.formcomponents.autocomplete',
			jmconfig : {
				'event'  : 'dominit',
				'url'    : '/Validation/AutoCompleteStreet',
				'zipcode': 'this.$elem.closest(\'fieldset\').find(\'input[data-jmname*="autocomplete-plz"]\').val()',
				'hideby': '1',
				'nextFocusNameAttr': 'Personal.HouseNo'
			}
		},
		{
			jmname   : 'form',
			jmelement: 'modules.formcomponents.formvalidate',
			jmconfig : {
				'event'  : 'dominit',
				'ajax'  : 'false'
			}
		},
		{
			jmname   : 'submitbutton',
			jmelement: 'modules.formcomponents.submitbutton',
			jmconfig : {
				'event': 'click'/*,
				'state': 'disable without form changes'*/
			}
		},{
			jmname   : 'togglebox',
			jmelement: 'actions.toggle',
			jmconfig : {
				'event'    : 'click',
				'datatype' : 'class',
				'data'     : 'show',
				'relatedTo': 'this.$elem.parent()[0]'
			}
		},{
			jmname   : 'dependent-selection-group-ayde-flat',
			jmelement: 'modules.dependentSelectionGroup',
			jmconfig : {
				'event'    : 'change',
				'opposition': '[data-jmdomselector="AystarOptionSelectionModel.OptionAyDeSmart"]'
			}
		},{
			jmname   : 'dependent-selection-group-smart',
			jmelement: 'modules.dependentSelectionGroup',
			jmconfig : {
				'event'    : 'change',
				'opposition': '[data-jmdomselector="AystarOptionSelectionModel.OptionAyDeSmartFlat"], [data-jmdomselector="AystarOptionSelectionModel.OptionInternetFlat"]'
			}
		},{
			jmname   : 'dependent-selection-group-internet-flat',
			jmelement: 'modules.dependentSelectionGroup',
			jmconfig : {
				'event'    : 'change',
				'opposition': '[data-jmdomselector="AystarOptionSelectionModel.OptionAyDeSmart"]'
			}
		},/*{
			jmname   : 'togglepartner',
			jmelement: 'actions.toggle|actions.trigger',
			jmconfig : [
				{
					'event'    : 'change',
					'datatype' : 'prop',
					'data'     : 'checked',
					'condition': '$(this.is(\'relatedTo\')).is(\':checked\')'
				},
				{
					'event'    : 'change',
					'data'     : 'jmchange',
					'condition': '$(this.is(\'relatedTo\')).is(\':checked\')'
				}
			]
		},{
			jmname   : 'togglepartner-alt',
			jmelement: 'actions.toggle|actions.trigger',
			jmconfig : [
				{
					'event'    : 'change',
					'datatype' : 'prop',
					'data'     : 'checked',
					'condition': '$(this.is(\'relatedTo\')).prop(\'checked\') && ($(\'[data-jmdomselector="AystarOptionSelectionModel.SelectedAyDeSmart"]\').val() !== \'AyDeSmartFlat\')'
				},
				{
					'event'    : 'change',
					'data'     : 'jmchange',
					'condition': '$(this.is(\'relatedTo\')).prop(\'checked\') && ($(\'[data-jmdomselector="AystarOptionSelectionModel.SelectedAyDeSmart"]\').val() !== \'AyDeSmartFlat\')'
				}
			]
		},*/{
			jmname   : 'togglepartner-flat',
			jmelement: 'actions.toggle|actions.trigger',
			jmconfig : [
				{
					'event'    : 'change',
					'datatype' : 'prop',
					'data'     : 'checked',
					'relatedTo': 'this.$elem.closest(\'form\').find(\'[data-jmdomselector*="OptionInternetFlatUpgrade"]\').not(this.$elem)[0]',
					'condition': 'this.$elem.prop(\'checked\') && this.$elem.closest(\'form\').find(\'[data-jmdomselector*="OptionInternetFlatUpgrade"]\').not(this.$elem).prop(\'checked\')'
				},
				{
					'wait':'raf',
					'event'    : 'change',
					'data'     : 'jmchange',
					'relatedTo': 'this.$elem.closest(\'form\').find(\'[data-jmdomselector*="OptionInternetFlatUpgrade"]\').not(this.$elem)[0]',
					'condition': 'this.$elem.prop(\'checked\') && this.$elem.closest(\'form\').find(\'[data-jmdomselector*="OptionInternetFlatUpgrade"]\').not(this.$elem).prop(\'checked\')'
				}
			]
		},{
			jmname   : 'checkbox-lieferadresse',
			jmelement: 'actions.toggle_1|actions.toggle_2|actions.toggle_3|actions.toggle_4|actions.toggle_5|actions.toggle_6|actions.toggle_7',
			jmconfig : [
				{
					'event'    : 'change',
					'datatype' : 'class',
					'data'     : 'show',
					'relatedTo': 'this.$elem.siblings(\'.tb-content\')[0]'
				},
				{
					'event'    : 'dominit',
					'datatype' : 'attr',
					'data'     : 'disabled:disabled',
					'relatedTo': '$.makeArray(this.$elem.siblings(\'.tb-content\').find(\'input, select, textarea\').not(\'[data-jmalwaysdisabled="true"]\'))',
					'condition': '!this.$elem.siblings(\'.tb-content\').hasClass(\'show\')'
				},
				{
					'event'    : 'change',
					'datatype' : 'attr',
					'data'     : 'disabled:disabled',
					'relatedTo': '$.makeArray(this.$elem.siblings(\'.tb-content\').find(\'input, select, textarea\').not(\'[data-jmalwaysdisabled="true"]\'))'
				},
				{
					'event'    : 'dominit',
					'datatype' : 'class',
					'data'     : 'show',
					'relatedTo': '[data-domselector="Lieferadresse-Change"]',
					'condition': 'this.$elem.siblings(\'.tb-content\').hasClass(\'show\')'
				},
				{
					'event'    : 'change',
					'datatype' : 'class',
					'data'     : 'show',
					'relatedTo': '[data-domselector="Lieferadresse-Change"]'
				},
				{
					'event'    : 'dominit',
					'datatype' : 'class',
					'data'     : 'show',
					'relatedTo': '[data-domselector="Lieferadresse-NoChange"]',
					'condition': '!this.$elem.siblings(\'.tb-content\').hasClass(\'show\')'
				},
				{
					'event'    : 'change',
					'datatype' : 'class',
					'data'     : 'show',
					'relatedTo': '[data-domselector="Lieferadresse-NoChange"]'
				}
			]
		},{
			jmname   : 'radio-zahlungsart',
			/*jmelement: 'actions.add|actions.trigger',*/
			jmelement: 'actions.add_1|actions.add_2|actions.remove_1|actions.trigger|actions.toggle_1|actions.add_3|actions.remove_2|actions.toggle_2|actions.add_4|actions.remove_3',
			jmconfig : [
				{
					'event'    : 'dominit',
					'datatype' : 'attr',
					'data'     : 'disabled:disabled',
					'relatedTo': '$.makeArray(this.$elem.closest(\'fieldset\').find(\'input, select, textarea\').not(this.$elem))',
					'condition': '!this.$elem.prop(\'checked\')'
				},
				{
					'event'    : 'jmchange',
					'datatype' : 'attr',
					'data'     : 'disabled:disabled',
					'relatedTo': '$.makeArray(this.$elem.closest(\'fieldset\').find(\'input, select, textarea\').not(this.$elem).not(\'[data-jmname="autofillInput|sync-val"]\'))',
					'condition': '!this.$elem.prop(\'checked\')'
				},
				{
					'event'    : 'jmchange',
					'datatype' : 'attr',
					'data'     : 'disabled',
					'relatedTo': '$.makeArray(this.$elem.closest(\'fieldset\').find(\'input, select, textarea\').not(this.$elem).not(\'[data-jmname="autofillInput|sync-val"]\'))',
					'condition': 'this.$elem.prop(\'checked\')'
				},
				{
					'event'    : 'change',
					'relatedTo': '$.makeArray(this.$elem.closest(\'form\').find(\'input[name="\'+this.$elem.attr(\'name\')+\'"]\'))',
					'data'     : 'jmchange'
				},
				{
					'event'    : 'dominit',
					'datatype' : 'class',
					'data'     : 'show',
					'relatedTo': '$.makeArray($(\'[data-domselector="\'+this.$elem.attr(\'name\')+\'-\'+this.$elem.val()+\'"]\'))',
					'condition': 'this.$elem.prop(\'checked\')'
				},
				{
					'event'    : 'jmchange',
					'datatype' : 'class',
					'data'     : 'show',
					'relatedTo': '$.makeArray($(\'[data-domselector="\'+this.$elem.attr(\'name\')+\'-\'+this.$elem.val()+\'"]\'))',
					'condition': 'this.$elem.prop(\'checked\')'
				},
				{
					'event'    : 'jmchange',
					'datatype' : 'class',
					'data'     : 'show',
					'relatedTo': '$.makeArray($(\'[data-domselector="\'+this.$elem.attr(\'name\')+\'-\'+this.$elem.val()+\'"]\'))',
					'condition': '!this.$elem.prop(\'checked\')'
				},
				{
					'event'    : 'dominit',
					'datatype' : 'class',
					'data'     : 'selected',
					'relatedTo': 'this.$elem.closest(\'.fs-header\')[0]',
					'condition': 'this.$elem.prop(\'checked\')'
				},
				{
					'event'    : 'jmchange',
					'datatype' : 'class',
					'data'     : 'selected',
					'relatedTo': 'this.$elem.closest(\'.fs-header\')[0]',
					'condition': 'this.$elem.prop(\'checked\')'
				},
				{
					'event'    : 'jmchange',
					'datatype' : 'class',
					'data'     : 'selected',
					'relatedTo': 'this.$elem.closest(\'.fs-header\')[0]',
					'condition': '!this.$elem.prop(\'checked\')'
				}
			]
		},{
			jmname   : 'accordionbox',
			jmelement: 'actions.remove|actions.toggle',
			jmconfig : [
				{
					'event'    : 'click',
					'datatype' : 'class',
					'data'     : 'show',
					'relatedTo': '$.makeArray(this.$elem.parent().siblings().addBack())',
					'condition': '!this.$elem.parent().hasClass(\'show\')'
				},
				{
					'wait'      :'10',
					'event'    : 'click',
					'datatype' : 'class',
					'data'     : 'show',
					'relatedTo': 'this.$elem.parent()[0]'
				}
			]
		},{
			jmname   : 'back-to-top',
			jmelement: 'actions.scroll',
			jmconfig : {
				'event'    : 'click',
				'scrollTo' : 'body'
			}
		},{
			// Soll das Carousel wieder abgebaut werde, wenn die condition bei orientations-change nicht mehr greift?
			jmname   : 'carousel',
			jmelement: 'modules.carousel',
			jmconfig : {
				'event'    : 'dominit',
				'delay'    : '450',
				'condition': 'Modernizr.mq(\'only screen and (min-width : 46.8em)\')'
			}
		},{
			jmname   : 'flipcard',
			jmelement: 'modules.flipcard',
			jmconfig : {
				'event'    : 'click',
				'scrollTo' : 'this.$elem[0]'
			}
		},
		{
			jmname   : 'modal',
			jmelement: 'modules.modal',
			jmconfig : {
				'event'    : 'click|dominit',
				'method'	: 'post'
			}
		},
		{
			jmname   : 'progressiv-ajax-btn',
			jmelement: 'actions.ajax',
			jmconfig : {
				'event'    : 'click',
				'url'   : '/Validation/AutoCompletePLZ',
				'relatedTo'     : 'this.$elem.closest(\'.wrapper\')[0]',
				'method'        : 'post',
				'inject'        : 'append',
				'additionalloadertarget':'this.$elem[0]'
			}
		},
		{
			jmname   : 'progressiv-link-btn',
			jmelement: 'actions.link|actions.add',
			jmconfig : [
				{
					'event'    : 'click',
					'loader': 'spinner'
				},
				{
					'event'    : 'click',
					'datatype' : 'class',
					'data'     : 'is-loading',
					'relatedTo': 'this.$elem[0]'
				}
			]
		},
		{//<span data-jmname="reductioncounter" data-jmdominit="true">290,98</span>
			jmname   : 'reductioncounter',
			jmelement: 'actions.ajax',
			jmconfig : {
				'event'    : 'interval-60000',
				'url'      : '/Service/_GetReductionValue',
				'data'     : 'id=testor',
				'relatedTo': 'this.$elem[0]',
				'method'   : 'post',
				'inject'   : 'html',
				'loader'    : 'none',
				'initResponse' : 'false'
			}
		},
		{//<span data-jmname="reductioncountdown" data-jmdominit="true">290,98</span>
			jmname   : 'reductioncountdown',
			jmelement: 'modules.countdown',
			jmconfig : {
				'event'    : 'dominit',
				'url'      : '/Service/_GetReductionEndDate',
				'data'     : 'id=testor',
				'relatedTo': 'this.$elem[0]',
				'method'   : 'post',
				'inject'   : 'html',
				'loader'    : 'none',
				'initResponse' : 'false'
			}
		},
		{
			jmname   : 'autofillInput',
			jmelement: 'actions.add_1|actions.add_2|actions.add_3',
			jmconfig : [
				{
					'event'    : 'dominit',
					'datatype' : 'attr',
					'data'     : 'value:Wird automatisch ausgefüllt',
					'relatedTo': 'this.$elem[0]'
				},
				{
					'event'    : 'dominit',
					'datatype' : 'attr',
					'data'     : 'disabled:disabled',
					'relatedTo': 'this.$elem[0]'
				},
				{
					'event'    : 'dominit',
					'datatype' : 'attr',
					'data'     : 'tabindex:-1',
					'relatedTo': 'this.$elem[0]'
				}
			]
		},
		{
			jmname   : 'configuration-status-display',
			jmelement: 'ayyildiz.configurationStatusDisplay',
			jmconfig : {
				'event'    : 'dominit'
			}
		},
		{
			jmname   : 'configuration-status-display-aystar',
			jmelement: 'ayyildiz.configurationStatusDisplayAystar',
			jmconfig : {
				'event'    : 'dominit'
			}
		},
		{
			jmname   : 'sync-configuration-status-display',
			jmelement: 'ayyildiz.syncConfigurationStatusDisplay',
			jmconfig : {
				'event'    : 'dominit'
			}
		},
		{
			jmname   : 'imagecrop',
			jmelement: 'modules.imagecrop',
			jmconfig : {
				'event'    : 'dominit'
			}
		},
		{
			jmname   : 'masonry',
			jmelement: 'modules.masonry',
			jmconfig : {
				'wait'          : '5000',
				'event'    : 'dominit'
			}
		},
		{ // data_jmname="addOnSelectionPriceUpdate",  data_jmconfig="{ 'model': 'AystarOptionSelectionModel'}" }
			jmname   : 'addOnSelectionPriceUpdate',
			jmelement: 'ayyildiz.addOnSelectionPriceUpdate',
			jmconfig : {
				'event'    : 'change'
			}
		},{
			jmname   : 'removeInternetFlatOptionOnCondition',
			jmelement: 'actions.set',
			jmconfig : {
				'event'    : 'change',
				'datatype' : 'prop',
				'relatedTo': '[data-jmdomselector="AystarOptionSelectionModel.OptionInternetFlat"]',
				'data'     : 'checked:false',
				'condition': 'this.$elem.val() !== \'AyDeSmartFlat\' && $(\'[data-jmdomselector="AystarOptionSelectionModel.OptionInternetFlat"]\').prop(\'checked\') && $(\'[data-jmdomselector="AystarOptionSelectionModel.OptionAyDeSmart"]\').prop(\'checked\')'
			}
		},{
			jmname   : 'extract-selected-option-in-group',
			jmelement: 'modules.formcomponents.selectOptionExtractInGroup',
			jmconfig : {
				'event'    : 'dominit|change',
				'relatedTo': '[data-jmname*=\"extract-selected-option-in-group\"]'
			}
		},{
			jmname   : 'anchor',
			jmelement: 'actions.scroll',
			jmconfig : {
				'event'    : 'click',
				'scrollTo' : '$(this.$elem.attr(\'href\'))'
			}
		},{
			jmname   : 'scroll-to-me',
			jmelement: 'actions.scroll',
			jmconfig : {
				'event'    : 'click',
				'scrollTo' : 'this.$elem[0]'
			}
		},{
			jmname   : 'set-product-detail-config-to-this-height',
			jmelement: 'actions.add',
			jmconfig : {
				'event'    : 'dominit',
				'datatype'  : 'style',
				'relatedTo' : '.product-detail-config',
				'data'  : 'JSON.parse(JSON.stringify("min-height:"))+this.$elem.outerHeight()+JSON.parse(JSON.stringify("px"))',
				'condition': 'Modernizr.mq(\'only screen and (min-width : 46.8em)\')'
			}
		},/*{
			jmname   : 'mobil-tarif-select',
			jmelement: 'actions.set|actions.add',
			jmconfig : [
				{
					'event'    : 'dominit',
					'relatedTo': 'this.$elem[0]',
					'data':'this.$elem.closest(\'.tb-content\').children(\'input:checked\').val()'
				},{
					'event'    : 'change',
					'datatype'  : 'prop',
					'relatedTo': 'this.$elem.closest(\'.tb-content\').children(\'input[value="\'+this.$elem.val()+\'"]\')',
					'data'  : 'checked:true'
				}
			]
		},*/{
			jmname   : 'select-for-sync-and-set-area',
			jmelement: 'actions.set|actions.add|actions.trigger',
			jmconfig : [
				{
					'event'    : 'dominit',
					'datatype' : 'val',
					'relatedTo': 'this.$elem[0]',
					'data':'this.$elem.closest(\'.tb-content\').children(\'input:checked\').val()'
				},
				/*{
					'event'    : 'change',
					'relatedTo': '[data-jmname=\"select-for-sync-and-set-area\"]',
					'data'  : 'this.$elem.val()'
				},*/
				{
					'event'    : 'change',
					'datatype'  : 'prop',
					'relatedTo': 'this.$elem.closest(\'.tb-content\').children(\'input[value="\'+this.$elem.val()+\'"]\')[0]',
					'data'  : 'checked:true'
				},
				{
					'event'    : 'change',
					'relatedTo': 'this.$elem.closest(\'.tb-content\').children(\'input[value="\'+this.$elem.val()+\'"]\')[0]',
					'data'     : 'change'
				}/*,{
					'event'    : 'change',
					'datatype' : 'class',
					'data'     : 'show',
					'relatedTo': '.tb-content form'
				},{
					'wait'     : '0',
					'event'    : 'change',
					'datatype' : 'class',
					'data'     : 'show',
					'relatedTo': 'this.$elem.closest(\'body\').find(\'#\'+ this.$elem.val())'
				}*/
			]
		},{
			jmname   : 'trigger-blur-on-me-if-i-am-not-empty',
			jmelement: 'actions.trigger',
			jmconfig : {
					'wait': '500',
					'event'    : 'dominit',
					'relatedTo': 'this.$elem[0]',
					'data'     : 'blur',
					'condition': 'this.$elem.val() !== \'\''
			}
		},
		{
			jmname   : 'tarif-radio-for-set-select',
			jmelement: 'actions.set',
			jmconfig :{
					'event'    : 'change',
					'datatype' : 'val',
					'relatedTo': '$.makeArray(this.$elem.closest(\'.tb-content\').find(\'[data-jmname*="select-for-sync-and-set-area"]\'))',
					'data'     : 'this.$elem.val()'
			}

		},
		{
			jmname   : 'select-email-einstellung',
			jmelement: 'actions.remove|actions.add',
			jmconfig :[
				{
					'event'    : 'change',
					'datatype' : 'class',
					'data'     : 'show',
					'relatedTo': '$.makeArray(this.$elem.closest(\'.filter-panel\').siblings(\'table\').find(\'tr\'))'
				},
				{
					'event'    : 'change',
					'datatype' : 'class',
					'data'     : 'show',
					'relatedTo': '$.makeArray($(\'[data-jmdomselector="\'+this.$elem.val()+\'"]\'))'
				}
			]
		},
		{
			jmname   : 'sync-val',
			jmelement: 'actions.add',
			jmconfig :{
				'event'    : 'dominit|change|keyup-dotimeout-500',
				'datatype' : 'text',
				'relatedTo': '$.makeArray($(\'[data-jmdomselector="\'+this.$elem.attr(\'name\')+\'"]\'))',
				'data':'jmHF.escapeHtml(this.$elem.val())'
			}
		},
		{
			jmname   : 'sync-val-radio',
			jmelement: 'actions.add',
			jmconfig :{
				'event'    : 'dominit|change|keyup-dotimeout-500',
				'datatype' : 'text',
				'relatedTo': '$.makeArray($(\'[data-jmdomselector="\'+this.$elem.attr(\'name\')+\'"]\'))',
				'data':'jmHF.escapeHtml(this.$elem.val())',
				'condition': 'this.$elem.prop(\'checked\')'
			}
		},
		{
			jmname   : 'sync-val-select-text',
			jmelement: 'actions.add',
			jmconfig :{
				'event'    : 'dominit|change|keyup-dotimeout-500',
				'datatype' : 'text',
				'relatedTo': '$.makeArray($(\'[data-jmdomselector="\'+this.$elem.attr(\'name\')+\'"]\'))',
				'data':'jmHF.escapeHtml(this.$elem.children(":selected").text())+(((this.$elem.attr(\'name\') === \'Personal.DateOfBirthDay\') || (this.$elem.attr(\'name\') === \'Payment.ValidUntilMonth\')) ? \'.\' : \'\')'
			}
		},
		{
			jmname   : 'table-sortable',
			jmelement: 'modules.tablesort',
			jmconfig :{
				'event'    : 'change'
			}
		},{
			jmname   : 'equalheights-not-mobile',
			jmelement: 'modules.equalheights',
			jmconfig :{
				'event'    : 'dominit',
				'condition': 'Modernizr.mq(\'only screen and (min-width : 46.8em)\')'
			}
		},{
			jmname   : 'sticky',
			jmelement: 'actions.sticky',
			jmconfig :{
				'event':'dominit'
				/*'event'    : 'raf',
				'datatype' : 'class',
				'data'     : 'is-sticky',
				'relatedTo': 'this.$elem[0]',
				'condition': '$(window).scrollTop() > this.elempos'*/
			}
		},
		{
			jmname   : 'csd-toggle-btn',
			jmelement: 'actions.toggle',
			jmconfig : [
				{
					'event'    : 'click',
					'datatype' : 'prop',
					'data'     : 'checked',
					'relatedTo': 'this.$elem.prev()[0]',
					'condition': 'this.$elem.prev().prop(\'checked\')'
				}
			]
		},
		{
			jmname   : 'datencache-aktualisieren',
			jmelement: 'jmtools.datencacheAktualisieren',
			jmconfig : [
				{
					'event'    : 'click'
				}
			]
		},
		{
			jmname   : 'checkbox-label-color',
			jmelement: 'actions.remove_1|actions.add_1|actions.remove_2|actions.add_2',
			jmconfig : [
				{
					'event'    : 'change',
					'datatype' : 'class',
					'data'     : 'selected',
					'relatedTo': 'this.$elem.closest(\'.label-input-modal\')[0]',
					'condition': '!this.$elem.prop(\'checked\')'
				},{
					'event'    : 'change',
					'datatype' : 'class',
					'data'     : 'selected',
					'relatedTo': 'this.$elem.closest(\'.label-input-modal\')[0]',
					'condition': 'this.$elem.prop(\'checked\')'
				},
				{
					'event'    : 'jmchange',
					'datatype' : 'class',
					'data'     : 'selected',
					'relatedTo': 'this.$elem.closest(\'.label-input-modal\')[0]',
					'condition': '!this.$elem.prop(\'checked\')'
				},{
					'event'    : 'jmchange',
					'datatype' : 'class',
					'data'     : 'selected',
					'relatedTo': 'this.$elem.closest(\'.label-input-modal\')[0]',
					'condition': 'this.$elem.prop(\'checked\')'
				}
			]
		},
		{
			jmname   : 'remove-class-on-blur-or-not-empty',
			jmelement: 'actions.remove',
			jmconfig : {
				'event'    : 'dominit|blur',
				'datatype' : 'class',
				'data'     : 'hide-js',
				'relatedTo': '$.makeArray(this.$elem.closest(\'body\').find(\'[data-domselector="show-on-blur-of-customer-password"]\'))',
				'condition': 'this.$elem.val() !== \'\''
			}
		},
		{
		    jmname: 'anleitungs-video',
		    jmelement: 'modules.video',
		    jmconfig: {
		        'event' : 'dominit',
		        'poster': '/img/videoPlayer/ayyildiz_app_tutorial.png',
		        'src'   : '/videos/ayyildiz_app_tutorial',
		        'width' : '256',
                'height': '427'

		    }
		},
		{
			jmname   : 'geb-select',
			jmelement: 'actions.add',
			jmconfig : 	{
					'event'    : 'focus',
					'datatype' : 'class',
					'data'     : 'userinteraction-js',
					'relatedTo': 'this.$elem[0]'
			}
		}
		/*,
		{
			jmname   : 'datencache-aktualisieren',
			jmelement: 'modules.tablesort',
			jmconfig :{
				'event'    : 'change'
			}
		}*/



		/*{
			jmname   : 'modalclose',
			jmelement: 'actions.remove|actions.add',
			jmconfig : [{
				'event'    : 'click',
				'datatype' : 'class',
				'data'     : 'open',
				'relatedTo': 'this.$elem.closest(\'.mask\')[0]'
			},{
				'event'    : 'click',
				'datatype' : 'class',
				'data'     : 'close',
				'relatedTo': 'this.$elem.closest(\'.mask\')[0]'
			}]
		},*/
	];
});

