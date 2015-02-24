/*!
 * describer-config
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
		},

		{
			jmname: 'equalheights-not-mobile',
			jmplugin: 'modules.equalheights',
			jmconfig: {
				'event': 'dominit',
				// TODO Andreas & Daniel lösung finden für Modernizr.mq
				'condition': 'Modernizr.mq(\'only screen and (min-width : 46.8em)\')'
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
			jmname   : 'togglebox',
			jmplugin: 'actions.ajax|actions.toggle|actions.scroll',
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
				},{
					'event'		: 'click|jmtrigger:click',
					'wait'		: 'raf',
					'scrollTo'	: 'this.$elem[0]'/*,
					'condition'	: '(this.$elem.parent()[0].offsetHeight < window.innerHeight && (window.pageYoffset + window.innerHeight < this.$elem.parent()[0].getBoundingClientRect().top + this.$elem.parent()[0].getBoundingClientRect().height))'*/
				}
			]
		},

		{
			jmname: 'tab',
			jmplugin: 'actions.move',
			jmconfig: {
				'event': 'click',
				'inject': 'append',
				'relatedTo': 'this.$elem.parent()[0]',
				'condition': 'Modernizr.mq(\'only screen and (max-width : 46.8em)\')'
			}
		},

		{
			jmname   : 'modal',
			jmplugin: 'modules.modal',
			jmconfig : {
				'event'    : 'click',
				'method'	: 'post'
			}
		},

		{
			jmname: 'googlemap-joinmedia',
			jmplugin: 'modules.googlemap',
			jmconfig: {
				'event': 'raf-6',
				'relatedTo': 'this.$elem[0]',
				'offsetTop': '-2000px',
				'configMapName': 'joinmedia'
			}
		},
		{
			jmname   : 'form',
			jmplugin: 'modules.form.formvalidate',
			jmconfig : {
				'event'  : 'dominit',
				'ajax'  : 'false'
			}
		},

		{
			jmname   : 'submitbutton',
			jmplugin: 'modules.form.submitbutton|actions.trigger',
			jmconfig : [{
				'event': 'click'
			},{
				'event'    : 'click',
				'data'     : 'click',
				'condition': 'Modernizr.mq(\'only screen and (min-width : 48em)\') && (function(){ var _arr = [], $selection = $(\'form\').find(\'input, select, textarea\').not(\':submit, :reset, :image, [disabled], [type="hidden"]\'); $selection.each(function(index, item){ _arr.push($(item).valid()); }); window.formValid = $.inArray(false, _arr) === -1; if(!window.formValid){ try{ this.$relatedElem = $selection.eq($.inArray(false, _arr)).closest(\'li\').find(\'a[data-jmname="checkout-accordionbox"]\'); }catch(e){}} return !window.formValid  }).bind(this)()'
			}]
		},


		// {
		// 	jmname   : 'section-toggle',
		// 	jmplugin: 'actions.exec|actions.add_1|actions.add_2|actions.add_3|actions.scroll_1|actions.scroll_2',
		// 	jmconfig : [{
		// 		'event'     : 'dc-hashchange',
		// 		'exec' : 'window.scrollBy(window.pageYOffset,0);',
		// 		'condition' : '(window.dc.perf === 1)'
		// 	},{
		// 		'event'     : 'dominit',
		// 		'datatype'  : 'style',
		// 		'data'      : 'display:none',
		// 		'relatedTo' : 'this.$elem[0]',
		// 		'condition' : '(window.dc.perf === 1) && (this.$elem[0].offsetHeight !== 0) && (!((window.location.hash === \'\' && this.$elem.attr(\'id\') === \'stage\') || (window.location.hash === \'#\'+this.$elem.attr(\'id\'))|| (this.$elem.find(window.location.hash).doesExist())))',
		// 		'callback'  : 'window.dc.sectionchanging = false; (navigator.userAgent.indexOf(\'AppleWebKit\') !== -1) ? $(\'body\').scrollTop(0) : $(\'html\').scrollTop(0); this.$elem.find(\'[class*="JSINIT-"]\').not(\'[data-jmname="anchor-visible-on-perf1"]\').each(function(index, item){ $(item).removePlugins(); });'
		// 	},{
		// 		'event'     : 'dc-scrollEnd',
		// 		'datatype'  : 'style',
		// 		'data'      : 'display:none',
		// 		'relatedTo' : 'this.$elem[0]',
		// 		'condition' : '(window.dc.perf === 1) && (this.$elem[0].offsetHeight !== 0) && (!((window.location.hash === \'\' && this.$elem.attr(\'id\') === \'stage\') || (window.location.hash === \'#\'+this.$elem.attr(\'id\'))|| (this.$elem.find(window.location.hash).doesExist())))',
		// 		'callback'  : 'window.dc.sectionchanging = false; (navigator.userAgent.indexOf(\'AppleWebKit\') !== -1) ? $(\'body\').scrollTop(0) : $(\'html\').scrollTop(0); this.$elem.jmtrigger(\'scrollNow\'); this.$elem.find(\'[class*="JSINIT-"]\').not(\'[data-jmname="anchor-visible-on-perf1"]\').each(function(index, item){ $(item).removePlugins(); });'
		// 	},{
		// 		'event'    : 'dominit|dc-hashchange',
		// 		'datatype' : 'style',
		// 		'data'     : 'display:block',
		// 		'relatedTo': 'this.$elem[0]',
		// 		'condition': '(window.dc.perf === 1) && (this.$elem[0].offsetHeight === 0) && (((window.location.hash === \'\' && this.$elem.attr(\'id\') === \'stage\') || (window.location.hash === \'#\'+this.$elem.attr(\'id\')) || (this.$elem.find(window.location.hash).doesExist())))',
		// 		'callback' : 'if(window.location.hash === \'#\'+this.$elem.attr(\'id\')){this.$elem.jmtrigger(\'scrollNow\');}else{$(\'body\').trigger(\'dc-scrollEnd\')} window.dc.sectionchanging = true; this.$elem.find(\'[data-jmdominit="true"]\').not(\'[data-jmname="anchor-visible-on-perf1"]\').each(function(index, item){ $(item).trigger(\'dominit\'); });'
		// 	},{
		// 		'event'    : 'dominit',
		// 		'wait'     : '1000',
		// 		'scrollTo' : 'this.$elem.closest(\'body\').find(window.location.hash)[0]',
		// 		'scrollToOffset' : '-(this.$elem.closest(\'body\').find(\'.page-header\').height())',
		// 		'condition': '(window.dc.perf === 1) && (this.$elem.find(window.location.hash).doesExist())'
		// 	},{
		// 		'event'    : 'jmtrigger:scrollNow',
		// 		'scrollTo' : 'this.$elem.closest(\'body\').find(window.location.hash)[0]',
		// 		'scrollToOffset' : '-((this.$elem.find(window.location.hash).doesExist()) ? this.$elem.closest(\'body\').find(\'.page-header\').height() : 0)',
		// 		'condition': '(window.dc.perf === 1)'
		// 	}]
		// },





		// {
		// 	jmname   : 'nav-toggle',
		// 	jmplugin: 'actions.toggle',
		// 	jmconfig : {
		// 		'event'    : 'click',
		// 		'datatype' : 'class',
		// 		'data'     : 'show-menu',
		// 		'relatedTo': '#nav',
		// 		'condition': 'Modernizr.mq(\'only screen and (max-width : 60em)\')'
		// 	}
		// },




		// {
		// 	jmname   : 'nav-demo',
		// 	jmplugin: 'actions.toggle',
		// 	jmconfig : {
		// 		'event'    : 'click',
		// 		'datatype' : 'class',
		// 		'data'     : 'show-menu',
		// 		'relatedTo': '#nav-demo'
		// 	}
		// },



		// {
		// 	jmname   : 'nav-link',
		// 	jmplugin: 'actions.remove_1|actions.remove_2|actions.add|actions.link',
		// 	jmconfig : [
		// 		{
		// 			'event'    : 'hover',
		// 			'datatype' : 'class',
		// 			'data'     : 'show',
		// 			'relatedTo': '.flyout'
		// 		},
		// 		{
		// 			'event'    : 'click',
		// 			'datatype' : 'class',
		// 			'data'     : 'show',
		// 			'relatedTo': '.flyout'
		// 		},
		// 		{
		// 			'event'    : 'click',
		// 			'datatype' : 'class',
		// 			'data'     : 'show',
		// 			'relatedTo': 'this.$elem.next()[0]',
		// 			'condition': 'Modernizr.mq(\'only screen and (max-width : 60em)\')'
		// 		},
		// 		{
		// 			'event'    : 'click',
		// 			'condition': 'Modernizr.mq(\'only screen and (min-width : 60em)\') || this.$elem.next().hasClass(\'show\')'
		// 		}
		// 	]
		// },



		// {
		// 	jmname: 'set-related-navi-item-activ-on-view',
		// 	jmplugin: 'modules.onView',
		// 	jmconfig: {
		// 		'event': 'raf-6',
		// 		'relatedTo': '$(\'nav\').find(\'a[href="#\'+this.$elem.attr(\'id\')+\'"]\').parent()[0]',
		// 		'offsetBottom': '-100px',
		// 		'condition': 'Modernizr.mq(\'only screen and (min-width : 60em)\')'
		// 	}
		// },






		// {
		// 	jmname: 'add-remove-show-on-view',
		// 	jmplugin: 'modules.onView',
		// 	jmconfig: {
		// 		'event': 'raf-6',
		// 		'relatedTo': 'this.$elem[0]',
		// 		'onlyTopOfElem': 'true'
		// 	}
		// },




		// {
		// 	jmname: 'add-remove-show-on-view-not-mobile',
		// 	jmplugin: 'modules.onView',
		// 	jmconfig: {
		// 		'event': 'raf-6',
		// 		'relatedTo': 'this.$elem[0]',
		// 		'onlyTopOfElem': 'true',
		// 		'condition': 'Modernizr.mq(\'only screen and (min-width : 46.8em)\')'
		// 	}
		// },




		// {
		// 	jmname: 'add-remove-show-on-view-with-fallback',
		// 	jmplugin: 'actions.add|modules.onView',
		// 	jmconfig: [{
		// 		'event'    : 'dominit',
		// 		'datatype' : 'class',
		// 		'data'     : 'show',
		// 		'relatedTo': 'this.$elem[0]',
		// 		'condition': '(window.userOS === \'iOS\' && parseInt(window.userOSver.split(\'.\'), 10)< 8) || window.dc.perf <= 1'
		// 	},{
		// 		'event': 'raf-6',
		// 		'relatedTo': 'this.$elem[0]',
		// 		'onlyTopOfElem': 'true',
		// 		'condition': '!((window.userOS === \'iOS\' && parseInt(window.userOSver.split(\'.\'), 10)< 8) || window.dc.perf <= 1)'
		// 	}]
		// },




		// {
		// 	jmname   : 'menu-close',
		// 	jmplugin: 'actions.remove',
		// 	jmconfig : {
		// 		'event'    : 'click',
		// 		'datatype' : 'class',
		// 		'data'     : 'show',
		// 		'relatedTo': 'this.$elem.parent()[0]'
		// 	}
		// },



		// {
		// 	jmname   : 'flyout-link',
		// 	jmplugin: 'actions.add|actions.link',
		// 	jmconfig : [
		// 		{
		// 			'event'    : 'click',
		// 			'datatype' : 'class',
		// 			'data'     : 'show',
		// 			'relatedTo': 'this.$elem.parent()[0]',
		// 			'condition': 'Modernizr.mq(\'only screen and (max-width : 60em)\')'
		// 		},
		// 		{
		// 			'event'    : 'click',
		// 			'condition': 'Modernizr.mq(\'only screen and (min-width : 60em)\') || this.$elem.parent().hasClass(\'show\')'
		// 		}
		// 	]
		// },




		// {
		// 	jmname   : 'show-html-comment-only-desktop',
		// 	jmplugin: 'actions.add',
		// 	jmconfig : {
		// 		'event'   : 'dominit',
		// 		'datatype': 'html',
		// 		'condition': 'Modernizr.mq(\'only screen and (min-width : 60em)\')'
		// 	}

		// },



		// {
		// 	jmname   : 'modal',
		// 	jmplugin: 'modules.modal',
		// 	jmconfig : {
		// 		'event'    : 'click|dominit',
		// 		'method'	: 'post'
		// 	}
		// },



		// {
		// 	jmname   : 'togglepartner-flat',
		// 	jmplugin: 'actions.toggle|actions.trigger',
		// 	jmconfig : [
		// 		{
		// 			'event'    : 'change',
		// 			'datatype' : 'prop',
		// 			'data'     : 'checked',
		// 			'relatedTo': 'this.$elem.closest(\'form\').find(\'[data-jmdomselector*="OptionInternetFlatUpgrade"]\').not(this.$elem)[0]',
		// 			'condition': 'this.$elem.prop(\'checked\') && this.$elem.closest(\'form\').find(\'[data-jmdomselector*="OptionInternetFlatUpgrade"]\').not(this.$elem).prop(\'checked\')'
		// 		},
		// 		{
		// 			'wait':'raf',
		// 			'event'    : 'change',
		// 			'data'     : 'jmtrigger',
		// 			'relatedTo': 'this.$elem.closest(\'form\').find(\'[data-jmdomselector*="OptionInternetFlatUpgrade"]\').not(this.$elem)[0]',
		// 			'condition': 'this.$elem.prop(\'checked\') && this.$elem.closest(\'form\').find(\'[data-jmdomselector*="OptionInternetFlatUpgrade"]\').not(this.$elem).prop(\'checked\')'
		// 		}
		// 	]
		// },



		// {
		// 	// Soll das Carousel wieder abgebaut werde, wenn die condition bei orientations-change nicht mehr greift?
		// 	jmname   : 'carousel',
		// 	jmplugin: 'modules.carousel',
		// 	jmconfig : {
		// 		'event'    : 'dominit',
		// 		'delay'    : '450',
		// 		'condition': 'Modernizr.mq(\'only screen and (min-width : 46.8em)\')'
		// 	}
		// },



		// {
		// 	jmname   : 'checkbox-label-color',
		// 	jmplugin: 'actions.remove_1|actions.add_1|actions.remove_2|actions.add_2',
		// 	jmconfig : [
		// 		{
		// 			'event'    : 'change',
		// 			'datatype' : 'class',
		// 			'data'     : 'selected',
		// 			'relatedTo': 'this.$elem.closest(\'.label-input-modal\')[0]',
		// 			'condition': '!this.$elem.prop(\'checked\')'
		// 		},{
		// 			'event'    : 'change',
		// 			'datatype' : 'class',
		// 			'data'     : 'selected',
		// 			'relatedTo': 'this.$elem.closest(\'.label-input-modal\')[0]',
		// 			'condition': 'this.$elem.prop(\'checked\')'
		// 		},
		// 		{
		// 			'event'    : 'jmchange',
		// 			'datatype' : 'class',
		// 			'data'     : 'selected',
		// 			'relatedTo': 'this.$elem.closest(\'.label-input-modal\')[0]',
		// 			'condition': '!this.$elem.prop(\'checked\')'
		// 		},{
		// 			'event'    : 'jmchange',
		// 			'datatype' : 'class',
		// 			'data'     : 'selected',
		// 			'relatedTo': 'this.$elem.closest(\'.label-input-modal\')[0]',
		// 			'condition': 'this.$elem.prop(\'checked\')'
		// 		}
		// 	]
		// },



		// {
		// 	jmname   : 'select-for-sync-and-set-area',
		// 	jmplugin: 'actions.set|actions.add|actions.trigger',
		// 	jmconfig : [
		// 		{
		// 			'event'    : 'dominit',
		// 			'datatype' : 'val',
		// 			'relatedTo': 'this.$elem[0]',
		// 			'data':'this.$elem.closest(\'.tb-content\').children(\'input:checked\').val()'
		// 		},
		// 		/*{
		// 			'event'    : 'change',
		// 			'relatedTo': '[data-jmname=\"select-for-sync-and-set-area\"]',
		// 			'data'  : 'this.$elem.val()'
		// 		},*/
		// 		{
		// 			'event'    : 'change',
		// 			'datatype'  : 'prop',
		// 			'relatedTo': 'this.$elem.closest(\'.tb-content\').children(\'input[value="\'+this.$elem.val()+\'"]\')[0]',
		// 			'data'  : 'checked:true'
		// 		},
		// 		{
		// 			'event'    : 'change',
		// 			'relatedTo': 'this.$elem.closest(\'.tb-content\').children(\'input[value="\'+this.$elem.val()+\'"]\')[0]',
		// 			'data'     : 'change'
		// 		}/*,{
		// 			'event'    : 'change',
		// 			'datatype' : 'class',
		// 			'data'     : 'show',
		// 			'relatedTo': '.tb-content form'
		// 		},{
		// 			'wait'     : '0',
		// 			'event'    : 'change',
		// 			'datatype' : 'class',
		// 			'data'     : 'show',
		// 			'relatedTo': 'this.$elem.closest(\'body\').find(\'#\'+ this.$elem.val())'
		// 		}*/
		// 	]
		// },



		// {
		// 	jmname   : 'tarif-radio-for-set-select',
		// 	jmplugin: 'actions.set',
		// 	jmconfig :{
		// 		'event'    : 'change',
		// 		'datatype' : 'val',
		// 		'relatedTo': '$.makeArray(this.$elem.closest(\'.tb-content\').find(\'[data-jmname*="select-for-sync-and-set-area"]\'))',
		// 		'data'     : 'this.$elem.val()'
		// 	}

		// },


		{
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
		},

		{
			jmname: 'tab-selected',
			jmplugin: 'actions.move',
			jmconfig: {
				'event': 'dominit|click',
				'inject': 'append',
				'relatedTo': 'this.$elem.parent()[0]',
				'condition': 'Modernizr.mq(\'only screen and (max-width : 46.8em)\')'
			}
		},



		// {
		// 	jmname   : 'testlable',
		// 	jmplugin: 'actions.toggle',
		// 	jmconfig : {
		// 		'event'    : 'click',
		// 		'datatype' : 'class',
		// 		'data'     : 'show',
		// 		'relatedTo': 'this.$elem.parent()[0]'
		// 	}
		// },




		// {
		// 	jmname   : 'sync-val',
		// 	jmplugin: 'actions.add',
		// 	jmconfig :{
		// 		'event'    : 'dominit|change|keyup-delay-500',
		// 		'datatype' : 'text',
		// 		'relatedTo': '$.makeArray($(\'[data-jmdomselector="\'+this.$elem.attr(\'name\')+\'"]\'))',
		// 		'data':'jmHF.escapeHtml(this.$elem.val())'
		// 	}
		// },




		// {
		// 	jmname: 'equalheights-not-mobile',
		// 	jmplugin: 'modules.equalheights',
		// 	jmconfig: {
		// 		'event': 'dominit',
		// 		// TODO Andreas & Daniel lösung finden für Modernizr.mq
		// 		'condition': 'Modernizr.mq(\'only screen and (min-width : 46.8em)\')'
		// 	}
		// },



		// {
		// 	jmname: 'set-viewport-height',
		// 	jmplugin: 'actions.exec',
		// 	jmconfig: {
		// 		'event': 'dominit|dc-orientationchange',
		// 		'exec': 'this.$elem.css(\'height\', Math.max(document.documentElement.clientHeight, window.innerHeight || 0))'
		// 	}
		// },



		/*{
			jmname: 'animation-start-on-view',
			jmplugin: 'actions.add|actions.remove',
			jmconfig: [{
				'event': 'raf-6',
				'datatype' : 'class',
				'data'     : 'show',
				'relatedTo': 'this.$elem[0]',
				'init': 'this.eot = this.$elem.offset().top; this.offset = 0; this.animateTransformTag = $(this.$elem[0].contentDocument.getElementsByTagName(\'svg\')[0]).find(\'animateTransform, animate, animateMotion\')[0]',
				'condition': '!jmHF.hasClass(this.$elem[0], \'show\') && ((window.dc.win.pageYOffset + window.dc.win.innerHeight) > this.eot + this.offset)',
				'callback': 'this.animateTransformTag.beginElement()'
			},{
				'event': 'raf-6',
				'datatype' : 'class',
				'data'     : 'show',
				'relatedTo': 'this.$elem[0]',
				'init': 'this.eot = this.$elem.offset().top; this.offset = 0; this.animateTransformTag = $(this.$elem[0].contentDocument.getElementsByTagName(\'svg\')[0]).find(\'animateTransform, animate, animateMotion\')[0]',
				'condition': 'jmHF.hasClass(this.$elem[0], \'show\') &&  (!((window.dc.win.pageYOffset + window.dc.win.innerHeight) > this.eot + this.offset)) && (window.dc.win.pageYOffset < (this.eot + this.$elem[0].getBoundingClientRect().height))',
				'callback': 'this.animateTransformTag.endElement()'
			}]
		},*/

		
		// {
		// 	jmname: 'frame-ani-by-scrolling',
		// 	jmplugin: 'modules.scrollControlFrames',
		// 	jmconfig: {
		// 		'event': 'dominit|raf',
		// 		'loop': '20',
		// 		'actionOffsetTop':'0',
		// 		'actionRangeScale': '1'
		// 	}
		// },


		// {
		// 	jmname: 'scrollControlTransition',
		// 	jmplugin: 'modules.scrollControlTransform',
		// 	jmconfig: {
		// 		'event': 'dominit|raf',
		// 		'cssProperty':'translate|scale',
		// 		'actionOffsetTop':'-200',
		// 		'actionRangeScale': '1'
		// 	}
		// },



		// {
		// 	jmname   : 'back-to-top',
		// 	jmplugin: 'actions.scroll|actions.add',
		// 	jmconfig : [{
		// 		'event'    : 'click',
		// 		'scrollTo' : '.page'
		// 	}, {
		// 		'event'     : 'dominit',
		// 		'datatype'  : 'style',
		// 		'data'      : 'display:none',
		// 		'relatedTo' : 'this.$elem[0]',
		// 		'condition' : '(window.dc.perf === 1)'
		// 	}]
		// },



		// {
		// 	jmname   : 'layout-boundary',
		// 	jmplugin: 'actions.exec',
		// 	jmconfig : {
		// 		'event'    : 'dominit',
		// 		'exec' : 'this.$elem.css({ \'display\': \'block\', \'height\': this.$elem.outerHeight(), \'width\': this.$elem.outerWidth(), \'overflow\': \'hidden\', \'margin\': \'0\' });'
		// 	}
		// },



		// {
		// 	jmname: 'parallax-content-orientation',
		// 	jmplugin: 'modules.parallax',
		// 	jmconfig: {
		// 		'event': 'init-by-perf',
		// 		'data' : 'orientation'
		// 	}
		// },



		// {
		// 	jmname: 'parallax-content-scrollY',
		// 	jmplugin: 'modules.parallax',
		// 	jmconfig: {
		// 		'event': 'init-by-perf',
		// 		'data' : 'scrollY'/*,
		// 		'actionOffsetTop': '0',
		// 		'actionOffsetBottom': '0'*/
		// 	}
		// },



		// {
		// 	jmname: 'parallax-content-scrollY-fallback',
		// 	jmplugin: 'modules.parallax',
		// 	jmconfig: {
		// 		'event': 'init-by-perf',
		// 		'data' : 'scrollY-fallback'
		// 	}
		// },



		// {
		// 	jmname: 'parallax-content-orientationX-scrollY',
		// 	jmplugin: 'modules.parallax',
		// 	jmconfig: {
		// 		'event': 'init-by-perf',
		// 		'data' : 'orientationX-scrollY'
		// 	}
		// },



		// {
		// 	jmname: 'videoplayer',
		// 	jmplugin: 'modules.videoplayer',
		// 	jmconfig: {
		// 		'event': 'dominit',
		// 		'url': '/videos/toystory',
		// 		//'url':'/videos/ISS',
		// 		//'url': 'https://www.youtube.com/watch?v=UE8yHySiJ4A',
		// 		/*'width': '1280',
		// 		'height': '720'*/
		// 		'width': '100%',
		// 		'height': 'auto',
		// 		//'autoplay': 'autoplay',
		// 		//'preload':'auto',
		// 		'loop': 'loop',
		// 		'controls': 'controls'
		// 	}
		// },

		{
			jmname: 'videoplayer',
			jmplugin: 'modules.videoplayer',
			jmconfig: {
				'event': 'dominit',
				'url': '/video/SiegfriedMueller_120s_HDV_826x464',
				'width': '100%',
				'height': 'auto',
				'loop': 'loop',
				'controls': 'controls'
			}
		},


		// {
		// 	jmname: 'videoplayer-orientation',
		// 	jmplugin: 'modules.videoplayer',
		// 	jmconfig: {
		// 		'event': 'dominit',
		// 		'url':'/videos/ISS',
		// 		//'url': 'https://www.youtube.com/watch?v=UE8yHySiJ4A',
		// 		'width': '100%',
		// 		'height': 'auto',
		// 		'autoplay': 'autoplay',
		// 		'preload':'auto',
		// 		'loop': 'loop'
		// 		/*'width': '853',
		// 		'height': '480'*/
		// 	}
		// },



		// {
		// 	jmname: 'videoplayer-bg',
		// 	jmplugin: 'modules.videoplayer',
		// 	jmconfig: {
		// 		'event': 'dominit',
		// 		'url':'/videos/ISS',
		// 		// 'url': 'https://www.youtube.com/watch?v=FG0fTKAqZ5g',
		// 		'width': '100%',
		// 		'height': 'auto',
		// 		'autoplay': 'autoplay',
		// 		'preload':'auto',
		// 		'loop': 'loop'
		// 		// 'width': '853',
		// 		// 'height': '480'
		// 	}
		// },



		// {
		// 	jmname: 'videoplayer-control',
		// 	jmplugin: 'modules.videocontrol',
		// 	jmconfig: {
		// 		'event': 'dominit|raf'// raf -> raf-one
		// 	}
		// },



		/*{
			jmname: 'anchor-old',
			jmplugin: 'actions.scroll|actions.link',
			jmconfig: [{
				'event': 'click',
				'scrollTo': 'this.$elem.attr(\'href\')'
			},{
				'wait': '1000',
				'event': 'click',
				'callback': '(navigator.userAgent.indexOf(\'AppleWebKit\') !== -1) ? $(\'body\').scrollTop(0) : $(\'html\').scrollTop(0)',
				'condition': '(window.dc.perf === 1)'
			}]
		},*/
		/*{
			jmname: 'anchor',
			jmplugin: 'actions.scroll',
			jmconfig: {
				'event': 'click',
				'scrollTo': 'this.$elem.attr(\'href\')'
			}
		},*/
		/*{
			jmname: 'section-toggle-anchor',
			jmplugin: 'actions.scroll|actions.link|actions.add',
			jmconfig: [{
				'event': 'click',
				'scrollTo': 'this.$elem.attr(\'href\')',
				'condition': '(window.dc.perf !== 1)'
			},{
				*//*'wait': '100',*//*
				'event': 'click'*//*,
				'callback': '(navigator.userAgent.indexOf(\'AppleWebKit\') !== -1) ? $(\'body\').scrollTop(0) : $(\'html\').scrollTop(0)'*//*
			},{
				'event': 'dominit',
				'datatype': 'style',
				'data':'display:block',
				'condition': '(window.dc.perf === 1)'
			}]
		},*/



		// {
		// 	jmname: 'anchor',
		// 	jmplugin: 'actions.scroll|actions.link_1|actions.link_2',
		// 	jmconfig: [{
		// 		'event': 'click',
		// 		'scrollTo': 'this.$elem.attr(\'href\')',
		// 		'condition': '(window.dc.perf !== 1) && (window.location.href.indexOf(\'Impressum\') === -1)'
		// 	},{
		// 		'event': 'click',
		// 		'condition': '(window.dc.perf === 1) && (window.location.href.indexOf(\'Impressum\') === -1)'
		// 	},{
		// 		'event': 'click',
		// 		'prefix': '/',
		// 		'condition': 'window.location.href.indexOf(\'Impressum\') !== -1'
		// 	}]
		// },



		// {
		// 	jmname: 'anchor-visible-on-perf1',
		// 	jmplugin: 'actions.scroll|actions.link|actions.add',
		// 	jmconfig: [{
		// 		'event': 'click',
		// 		'scrollTo': 'this.$elem.attr(\'href\')',
		// 		'condition': '(window.dc.perf !== 1)'
		// 	},{
		// 		/*'wait': '1000',*/
		// 		'event': 'click',
		// 		'callback': '(navigator.userAgent.indexOf(\'AppleWebKit\') !== -1) ? $(\'body\').scrollTop(0) : $(\'html\').scrollTop(0)',
		// 		'condition': '(window.dc.perf === 1)'
		// 	},{
		// 		'event': 'dominit',
		// 		'datatype': 'style',
		// 		'data':'display:block',
		// 		'condition': '(window.dc.perf === 1)'
		// 	}]
		// },



		// {
		// 	jmname: 'googlemap-joinmedia',
		// 	jmplugin: 'modules.googlemap',
		// 	jmconfig: {
		// 		'event': 'raf-6',
		// 		'relatedTo': 'this.$elem[0]',
		// 		'offsetTop': '-2000px',
		// 		'configMapName': 'joinmedia'
		// 	}
		// },



		// {
		// 	jmname   : 'test1',
		// 	jmplugin: 'actions.add_1|actions.add_2|actions.add_3|actions.add_4',
		// 	jmconfig : [
		// 		{
		// 			'event'    : 'click',
		// 			'datatype' : 'class',
		// 			'data'     : 'show1',
		// 			'relatedTo': '.a'
		// 		},
		// 		{
		// 			'event'    : 'click',
		// 			'datatype' : 'class',
		// 			'data'     : 'show1',
		// 			'relatedTo': '.b'
		// 		},
		// 		{
		// 			'event'    : 'click',
		// 			'datatype' : 'class',
		// 			'data'     : 'show1',
		// 			'relatedTo': '.c'
		// 		},
		// 		{
		// 			'event'    : 'click',
		// 			'datatype' : 'class',
		// 			'data'     : 'show1',
		// 			'relatedTo': '.d'
		// 		}
		// 	]
		// },



		// {
		// 	jmname   : 'test2',
		// 	jmplugin: 'actions.add_1|actions.add_2|actions.add_3|actions.add_4',
		// 	jmconfig : [
		// 		{
		// 			'event'    : 'click',
		// 			'datatype' : 'class',
		// 			'data'     : 'show2',
		// 			'relatedTo': '.a'
		// 		},
		// 		{
		// 			'event'    : 'click',
		// 			'datatype' : 'class',
		// 			'data'     : 'show2',
		// 			'relatedTo': '.b'
		// 		},
		// 		{
		// 			'event'    : 'click',
		// 			'datatype' : 'class',
		// 			'data'     : 'show2',
		// 			'relatedTo': '.c'
		// 		},
		// 		{
		// 			'event'    : 'click',
		// 			'datatype' : 'class',
		// 			'data'     : 'show2',
		// 			'relatedTo': '.d'
		// 		}
		// 	]
		// }



	];
});

