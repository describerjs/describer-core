/*!
 * _config
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
			jmplugin: 'actions.ajax|actions.toggle',
			jmconfig : [
				{
					'event'    : 'jmtrigger:open',
					'inject'   : 'html',
					'relatedTo': 'this.$elem.siblings(\'.tb-content\')[0]',
					'condition': '($.trim(this.$elem.siblings(\'.tb-content\').html()).length) === 0'
				},{
					'event'    : 'click|jmtrigger:click',
					'datatype' : 'class',
					'data'     : 'show',
					'relatedTo': 'this.$elem.parent()[0]',
					'callback' : 'if(this.$elem.parent().hasClass(\'show\')) this.$elem.jmtrigger(\'open\')'
				}
			]
		},{
			//  remove show auf allen Elemente, wenn das geklickte Elternelement nicht die Klasse show hat (noch zugeklapp ist). toggel um das geöffnete Element auch wieder schliessen zu können.
			jmname   : 'accordionbox',
			jmplugin: 'actions.ajax|actions.remove|actions.toggle',
			jmconfig : [
				{
					'event'    : 'jmtrigger:makeajax',
					'inject'   : 'html',
					'relatedTo': 'this.$elem.siblings(\'.acc-panel\')[0]',
					'condition': '$.type(this.configObj.url) !== \'undefined\''
				},
				{
					'event'    : 'click',
					'datatype' : 'class',
					'data'     : 'show',
					'relatedTo': '$.makeArray(this.$elem.parent().siblings().addBack())',
					'condition': '!this.$elem.parent().hasClass(\'show\')'
				},
				{
					'event'    : 'click',
					'datatype' : 'class',
					'data'     : 'show',
					'relatedTo': 'this.$elem.parent()[0]',
					'callback' : 'if(this.$elem.parent().hasClass(\'show\') && (($.trim(this.$elem.siblings(\'.acc-panel\').html()).length) === 0)) this.$elem.jmtrigger(\'makeajax\')'
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
			jmname: 'equalheights-not-mobile',
			jmplugin: 'modules.equalheights',
			jmconfig: {
				'event': 'dominit',
				// TODO Andreas & Daniel lösung finden für Modernizr.mq
				'condition': 'Modernizr.mq(\'only screen and (min-width : 46.8em)\')'
			}
		},{
			jmname: 'add-remove-show-on-view',
			jmplugin: 'actions.add|actions.remove',
			jmconfig: [{
				'event': 'dominit|raf-nc',
				'datatype' : 'class',
				'data'     : 'show',
				'relatedTo': 'this.$elem[0]',
				'localScope': 'this.eot = this.$elem.offset().top; this.offset = window.innerHeight * 0.4',
				'condition': '((window.pageYOffset + window.innerHeight) > this.eot + this.offset)'
			},
			{
				'event': 'dominit|raf-nc',
				'datatype' : 'class',
				'data'     : 'show',
				'relatedTo': 'this.$elem[0]',
				'localScope': 'this.eot = this.$elem.offset().top; this.offset = window.innerHeight * 0.4',
				'condition': '(!((window.pageYOffset + window.innerHeight) > this.eot + this.offset)) && (window.pageYOffset < (this.eot + this.$elem[0].getBoundingClientRect().height))'
			}]
		},{
			jmname: 'animation-start-on-view',
			jmplugin: 'actions.add|actions.remove',
			jmconfig: [{
				'event': 'dominit|raf-nc',
				'datatype' : 'class',
				'data'     : 'show',
				'relatedTo': 'this.$elem[0]',
				'localScope': 'this.eot = this.$elem.offset().top; this.offset = 0; this.animateTransformTag = $(this.$elem[0].contentDocument.getElementsByTagName(\'svg\')[0]).find(\'animateTransform, animate, animateMotion\')[0]',
				'condition': '((window.pageYOffset + window.innerHeight) > this.eot + this.offset) && !this.$elem.hasClass(\'show\')',
				'callback': 'this.animateTransformTag.beginElement()'
			},{
				'event': 'dominit|raf-nc',
				'datatype' : 'class',
				'data'     : 'show',
				'relatedTo': 'this.$elem[0]',
				'localScope': 'this.eot = this.$elem.offset().top; this.offset = 0; this.animateTransformTag = $(this.$elem[0].contentDocument.getElementsByTagName(\'svg\')[0]).find(\'animateTransform, animate, animateMotion\')[0]',
				'condition': '(!((window.pageYOffset + window.innerHeight) > this.eot + this.offset)) && (window.pageYOffset < (this.eot + this.$elem[0].getBoundingClientRect().height)) && this.$elem.hasClass(\'show\')',
				'callback': 'this.animateTransformTag.endElement()'
			}]
		},{
			jmname: 'frame-ani-by-scrolling',
			jmplugin: 'modules.scrollControlFrames',
			jmconfig: {
				'event': 'dominit|raf-nc',
				'loop': '20',
				'execElemOffset':'0',
				'execWindowScale': '1'
			}
		},{
			jmname: 'scrollControlTransition',
			jmplugin: 'modules.scrollControlTransform',
			jmconfig: {
				'event': 'dominit|raf-nc',
				'cssProperty':'translate|scale',
				'execElemOffsetX':'-200',
				'execWindowScale': '1'
			}
		},
		{
			jmname   : 'back-to-top',
			jmplugin: 'actions.scroll',
			jmconfig : {
				'event'    : 'click',
				'scrollTo' : '.page'
			}
		},
		{
			jmname: 'parallax-content-orientation',
			jmplugin: 'modules.parallax',
			jmconfig: {
				'event': 'dominit',
				'data' : 'orientation'
			}
		},
		{
			jmname: 'parallax-content-scrollY',
			jmplugin: 'modules.parallax',
			jmconfig: {
				'event': 'dominit',
				'data' : 'scrollY'
			}
		},
		{
			jmname: 'parallax-content-scrollY-fallback',
			jmplugin: 'modules.parallax',
			jmconfig: {
				'event': 'dominit',
				'data' : 'scrollY-fallback'
			}
		},
		{
			jmname: 'parallax-content-orientationX-scrollY',
			jmplugin: 'modules.parallax',
			jmconfig: {
				'event': 'dominit',
				'data' : 'orientationX-scrollY'
			}
		},
		{
			jmname: 'smoothscroll',
			jmplugin: 'utils.scrollController',
			jmconfig: {
				'event': 'dominit'
			}
		},
		{
			jmname: 'videoplayer',
			jmplugin: 'modules.videoplayer',
			jmconfig: {
				'event': 'dominit',
				'url': '/videos/toystory',
				//'url':'/videos/ISS',
				//'url': 'https://www.youtube.com/watch?v=UE8yHySiJ4A',
				/*'width': '1280',
				'height': '720'*/
				'width': '640',
				'height': '360',
				'autostart': '',
				'preload':'auto',
				'loop': 'loop',
				'controls': 'controls'
			}
		},{
			jmname: 'videoplayer-orientation',
			jmplugin: 'modules.videoplayer',
			jmconfig: {
				'event': 'dominit',
				'url':'/videos/ISS',
				//'url': 'https://www.youtube.com/watch?v=UE8yHySiJ4A',
				'width': '1280',
				'height': '720'
				/*'width': '853',
				'height': '480'*/
			}
		},
		{
			jmname: 'videoplayer-bg',
			jmplugin: 'modules.videoplayer',
			jmconfig: {
				'event': 'dominit',
				'url':'/videos/ISS',
				//'url': 'https://www.youtube.com/watch?v=UE8yHySiJ4A',
				'width': '1280',
				'height': '720'
				/*'width': '853',
				'height': '480'*/
			}
		},
		{
			jmname: 'videoplayer-control',
			jmplugin: 'modules.videocontrol',
			jmconfig: {
				'event': 'dominit|raf-nc'
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

