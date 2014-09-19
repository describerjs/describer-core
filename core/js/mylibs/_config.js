/*!
 * _config v0.9
 *
 * http://joinmedia.de/
 *
 * Copyright (c) 2014 join.media GmbH & Co. KG
 *
 * Created by aotten77 on 22.08.2014.
 *
 * Released under the MIT license
 */
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
	//   ** besteht das Modul aus mehreren Plugins (jmplugin), dann werden die data-config-Objekte in einem Array gelistet.
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
	//   1 X data-jmplugin
	//
	//	    {
	//          jmname   : 'nav',
	//          jmplugin: 'actions.toggle',
	//          jmconfig : {
	//              'event'    : 'click',
	//              'datatype' : 'class',
	//              'data'     : 'show-menu',
	//              'relatedTo': '#nav'
	//          }
	//	    }
	//
	//
	//   2... X data-jmplugin
	//
	//      {
	//          jmname   : 'flyout-link',
    //          jmplugin: 'actions.add|actions.link',
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
			jmplugin: 'actions.toggle',
			jmconfig : {
				'event'    : 'click',
				'datatype' : 'class',
				'data'     : 'show-menu',
				'relatedTo': '#nav'
			}
		},{
			jmname   : 'nav-link',
			jmplugin: 'actions.remove_1|actions.remove_2|actions.add|actions.link',
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
		},{
			jmname   : 'menu-close',
			jmplugin: 'actions.remove',
			jmconfig : {
				'event'    : 'click',
				'datatype' : 'class',
				'data'     : 'show',
				'relatedTo': 'this.$elem.parent()[0]'
			}
		},{
			jmname   : 'flyout-link',
			jmplugin: 'actions.add|actions.link',
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
		},{
			jmname   : 'show-html-comment-only-desktop',
			jmplugin: 'actions.add',
			jmconfig : {
				'event'   : 'dominit',
				'datatype': 'html',
				'condition': 'Modernizr.mq(\'only screen and (min-width : 60em)\')'
			}

		},{
			jmname   : 'modal',
			jmplugin: 'modules.modal',
			jmconfig : {
				'event'    : 'click|dominit',
				'method'	: 'post'
			}
		},{
			jmname   : 'togglepartner-flat',
			jmplugin: 'actions.toggle|actions.trigger',
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
					'data'     : 'jmtrigger',
					'relatedTo': 'this.$elem.closest(\'form\').find(\'[data-jmdomselector*="OptionInternetFlatUpgrade"]\').not(this.$elem)[0]',
					'condition': 'this.$elem.prop(\'checked\') && this.$elem.closest(\'form\').find(\'[data-jmdomselector*="OptionInternetFlatUpgrade"]\').not(this.$elem).prop(\'checked\')'
				}
			]
		},{
			// Soll das Carousel wieder abgebaut werde, wenn die condition bei orientations-change nicht mehr greift?
			jmname   : 'carousel',
			jmplugin: 'modules.carousel',
			jmconfig : {
				'event'    : 'dominit',
				'delay'    : '450',
				'condition': 'Modernizr.mq(\'only screen and (min-width : 46.8em)\')'
			}
		},{
			jmname   : 'checkbox-label-color',
			jmplugin: 'actions.remove_1|actions.add_1|actions.remove_2|actions.add_2',
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
		},{
			jmname   : 'select-for-sync-and-set-area',
			jmplugin: 'actions.set|actions.add|actions.trigger',
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
			jmname   : 'tarif-radio-for-set-select',
			jmplugin: 'actions.set',
			jmconfig :{
				'event'    : 'change',
				'datatype' : 'val',
				'relatedTo': '$.makeArray(this.$elem.closest(\'.tb-content\').find(\'[data-jmname*="select-for-sync-and-set-area"]\'))',
				'data'     : 'this.$elem.val()'
			}

		},{
			jmname   : 'togglebox',
			jmplugin: 'actions.toggle',
			jmconfig : {
				'event'    : 'click|jmtrigger:click',
				'datatype' : 'class',
				'data'     : 'show',
				'relatedTo': 'this.$elem.parent()[0]'
			}
		},
		{
			jmname   : 'accordionbox',
			jmplugin: 'actions.remove|actions.toggle',
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
			jmname   : 'testlable',
			jmplugin: 'actions.toggle',
			jmconfig : {
				'event'    : 'click',
				'datatype' : 'class',
				'data'     : 'show',
				'relatedTo': 'this.$elem.parent()[0]'
			}
		},
		{
			jmname   : 'sync-val',
			jmplugin: 'actions.add',
			jmconfig :{
				'event'    : 'dominit|change|keyup-delay-500',
				'datatype' : 'text',
				'relatedTo': '$.makeArray($(\'[data-jmdomselector="\'+this.$elem.attr(\'name\')+\'"]\'))',
				'data':'jmHF.escapeHtml(this.$elem.val())'
			}
		},
		{
			jmname   : 'test1',
			jmplugin: 'actions.add_1|actions.add_2|actions.add_3|actions.add_4',
			jmconfig : [
				{
					'event'    : 'click',
					'datatype' : 'class',
					'data'     : 'show1',
					'relatedTo': '.a'
				},
				{
					'event'    : 'click',
					'datatype' : 'class',
					'data'     : 'show1',
					'relatedTo': '.b'
				},
				{
					'event'    : 'click',
					'datatype' : 'class',
					'data'     : 'show1',
					'relatedTo': '.c'
				},
				{
					'event'    : 'click',
					'datatype' : 'class',
					'data'     : 'show1',
					'relatedTo': '.d'
				}
			]
		},
		{
			jmname   : 'test2',
			jmplugin: 'actions.add_1|actions.add_2|actions.add_3|actions.add_4',
			jmconfig : [
				{
					'event'    : 'click',
					'datatype' : 'class',
					'data'     : 'show2',
					'relatedTo': '.a'
				},
				{
					'event'    : 'click',
					'datatype' : 'class',
					'data'     : 'show2',
					'relatedTo': '.b'
				},
				{
					'event'    : 'click',
					'datatype' : 'class',
					'data'     : 'show2',
					'relatedTo': '.c'
				},
				{
					'event'    : 'click',
					'datatype' : 'class',
					'data'     : 'show2',
					'relatedTo': '.d'
				}
			]
		}
	];
});

