
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
			jmname   : 'back-to-top',
			jmplugin: 'actions.scroll',
			jmconfig : {
				'event'    : 'click',
				'scrollTo' : '.page'
			}
		}
	];
});

