/*!
 * require-main
 *
 * http://joinmedia.de/
 *
 * Copyright (c) 2014 join.media GmbH & Co. KG
 *
 * Created by aotten77 on 22.08.2014.
 *
 * Released under the MIT license
 */
var pathToJQuery;
var buildPath = (window.dc.loadUnminifyVersion) ? '' : 'build/';
if('querySelector' in document && 'localStorage' in window && 'addEventListener' in window){
	pathToJQuery = buildPath+'describer-core/libs/jquery-2.1.0';
}else{
	pathToJQuery = buildPath+'describer-core/libs/jquery-1.11.0';
}
require.config({
	baseUrl: '/js',
	paths      : {
		// ******************* describer-core ******************************
		'_config'                                           : buildPath+'describer-config/describer',
		'config.validation'                                 : buildPath+'describer-config/validation',
		'config.googlemap'                                  : buildPath+'describer-config/googlemap',
		'config.require-css.video'                          : buildPath+'describer-config/require-css/video',
		'config.languageTextObj'                            : buildPath+'describer-config/languageTextObj',
		'language/nls/speak'                                : buildPath+'describer-config/nls/speak',
		'language/nls/en/speak'                             : buildPath+'describer-config/nls/en/speak',


		// ******************* describer-core ******************************
		'async'                                             : buildPath+'describer-core/libs/async',
		'jquery'                                            : pathToJQuery,
		'scrolltotop'                                       : buildPath+'describer-core/libs/scrolltotop',
		'rAF'                                               : buildPath+'describer-core/libs/rAF',


		// mylibs
		'core'                                              : buildPath+'describer-core/core',

		'_super'                                            : buildPath+'describer-core/_super',
		'actions.add'                                       : buildPath+'describer-core/actions/add',
		'actions.ajax'                                      : buildPath+'describer-core/actions/ajax',
		'actions.apply'                                     : buildPath+'describer-core/actions/apply',
		'actions.exec'                                      : buildPath+'describer-core/actions/exec',
		'actions.link'                                      : buildPath+'describer-core/actions/link',
		'actions.move'                                      : buildPath+'describer-core/actions/move',
		'actions.remove'                                    : buildPath+'describer-core/actions/remove',
		'actions.scroll'                                    : buildPath+'describer-core/actions/scroll',
		'actions.set'                                       : buildPath+'describer-core/actions/set',
		/*		'actions.sticky'                                   : 'mylibs/actions/sticky',*/
		'actions.toggle'                                    : buildPath+'describer-core/actions/toggle',
		'actions.trigger'                                   : buildPath+'describer-core/actions/trigger',



		// ******************* describer-more ******************************

		'modules.carousel'                                  : buildPath+'describer-more/modules/carousel',
		'modules.carousel-ts'                               : buildPath+'describer-more/modules/carousel-ts',

		/*'modules.carousel-ts'                              : 'describer-more/empty',*/
		'modules.countdown'                                 : buildPath+'describer-more/modules/countdown',
		'modules.dependentSelectionGroup'                   : buildPath+'describer-more/modules/dependentSelectionGroup',
		'modules.equalheights'                              : buildPath+'describer-more/modules/equalheights',
		'modules.form.autocomplete'                         : buildPath+'describer-more/modules/form/autocomplete',
		'modules.form.formvalidate'                         : buildPath+'describer-more/modules/form/formvalidate',
		'modules.form.selectOptionExtractInGroup'           : buildPath+'describer-more/modules/form/selectOptionExtractInGroup',
		'modules.form.submitbutton'                         : buildPath+'describer-more/modules/form/submitbutton',
		'modules.fotoupload'                                : buildPath+'describer-more/modules/fotoupload',
		'modules.googlemap'                                 : buildPath+'describer-more/modules/googlemap',
		'modules.modal'                                     : buildPath+'describer-more/modules/modal',
		'modules.onView'                                    : buildPath+'describer-more/modules/onView',
		'modules.parallax'                                  : buildPath+'describer-more/modules/parallax',
		'modules.scrollControlFrames'                       : buildPath+'describer-more/modules/scrollControlFrames',
		'modules.scrollControlTransform'                    : buildPath+'describer-more/modules/scrollControlTransform',
		'modules.tablesort'                                 : buildPath+'describer-more/modules/tablesort',
		'modules.video'                                     : buildPath+'describer-more/modules/video',
		'modules.videocontrol'                              : buildPath+'describer-more/modules/videocontrol',
		'modules.videoplayer'                               : buildPath+'describer-more/modules/videoplayer',

		// untouched externel
		'i18n'                                              : buildPath+'describer-more/plugins/i18n',
		'jquery_canvasResize'                               : buildPath+'describer-more/plugins/jquery.canvasResize',
		'fastclick'                                         : buildPath+'describer-more/plugins/fastclick',
		'fixedfixed'                                        : buildPath+'describer-more/plugins/fixedfixed',
		'fixedsticky'                                       : buildPath+'describer-more/plugins/fixedsticky',
		'jquery_mousewheel'                                 : buildPath+'describer-more/plugins/jquery.mousewheel',
		'md5'                                               : buildPath+'describer-more/plugins/md5',
		'video_4_10_2'                                      : buildPath+'describer-more/plugins/video.4.10.2',
		'videojs-youtube'                                   : buildPath+'describer-more/plugins/youtube',

		// customized externel
		'jquery_autocomplete'                               : buildPath+'describer-more/plugins/customized/jquery.autocomplete',
		'jquery_ba-dotimeout'                               : buildPath+'describer-more/plugins/customized/jquery.ba-dotimeout',
		'jquery_countdown'                                  : buildPath+'describer-more/plugins/customized/jquery.countdown',
		'jquery_countdown-de'                               : buildPath+'describer-more/plugins/customized/jquery.countdown-de',
		'jquery_exif'                                       : buildPath+'describer-more/plugins/customized/jquery.exif',
		'jquery_parallax'                                   : buildPath+'describer-more/plugins/customized/jquery.parallax',
		'jquery_plugin'                                     : buildPath+'describer-more/plugins/customized/jquery.plugin',
		'jquery_smoothMousewheel'                           : buildPath+'describer-more/plugins/customized/jquery.smoothMousewheel',
		'jquery_validate'                                   : buildPath+'describer-more/plugins/customized/jquery.validate',
		'owl_carousel'                                      : buildPath+'describer-more/plugins/customized/owl.carousel',
		'video'                                             : buildPath+'describer-more/plugins/customized/video',

		// overwritings externel
		'overwritings.jquery_validate'                      : buildPath+'describer-more/plugins/overwritings/jquery.validate',
		'overwritings.owl_carousel'                         : buildPath+'describer-more/plugins/overwritings/owl.carousel'
	},
	shim: {
		'jquery_canvasResize': {
			deps: ['jquery_exif', 'jquery']
		},
		'fastclick': {
			//These script dependencies should be loaded before loading
			//backbone.js
			//deps   : ['underscore', 'jquery'],
			//Once loaded, use the global 'Backbone' as the
			//module value.
			//exports: 'rAF'
		},
		
	    /*'video': {
            exports: '_VideoJS'
        },*/
		'fixedsticky': {
			deps: ['fixedfixed']
		}
	},
	map: {
	    '*': {
	        'css': buildPath+'describer-more/plugins/css' // or whatever the path to require-css is
	    }
	},
	waitSeconds: 500,
	locale: document.getElementsByTagName('html')[0].getAttribute('lang')
});


require(['jquery', '_config'], function require_jquery($){
	// need jquery
	require([ 'core', 'fastclick', 'jquery_ba-dotimeout'], function require_helpers(){
		// DomReady
		$(function domReady(){
			var $body = $('body');

			// -----------------------------------------------------
			// --------------- User Events -------------------------
			// -----------------------------------------------------

			//---------------- Listener for focus, change, blur, checkValidation -------------------------------------


			// Jedes Input(ausgenommen type="submit"), texarea und select feuert ein Event "checkValidation" wenn focus, change oder blur getriggert wird.
			// TODO Andreas evtl. obsolate da hier auch mit jmtrigger:checkValidation gearbeitet werden kann. Prüfen. Evtl. dominit="true" und blur, focus, jmtrigger:checkValidtion in den Config-Event-Stirng
			$body.on(   'blur ' +
						'change ' +
						'focus ' +
						'checkValidation', 'form[data-jmname="form"]', jmHF.eventDelegationTrigger);

			// Change-Listener für select, input[type="radio"] und input[type="checkbox"] zur initialisierung und Aufruf der change-Funktion des Plugins
			$body.on('change',  'select[data-jmname], ' +
								'textarea[data-jmname]'+
								'input[data-jmname]:not(input[type="radio"][data-jmname])', jmHF.eventDelegationTrigger);

			// Change-Listenerinput[type="radio"]
			$body.on('change',  'input[type="radio"][data-jmname]', jmHF.eventDelegationTriggerForRadios);


			//---------------- Listener for click --------------------------------------------------------

			$body.on('click', '[data-jmname]:not(label[data-jmname], a[data-jmname], form[data-jmname])', jmHF.eventDelegationTrigger);

			$body.on('click', 'a[data-jmname]', jmHF.eventDelegationTriggerForATags);

			$body.on('click', 'label[data-jmname]', jmHF.eventDelegationTriggerForLabels);


			// -----------------------------------------------------
			// --------------- generische Events -------------------
			// -----------------------------------------------------


			$body.on('dominit', '[data-jmname]', jmHF.eventDelegationTriggerForDomInit);

			// Change-Listener für select, input[type="radio"] und input[type="checkbox"] zur initialisierung und Aufruf der change-Funktion des Plugins
			$body.on('jmtrigger', '[data-jmname]', jmHF.eventDelegationTrigger);


			$(window).on('resize', jmHF.checkOrientation);
			// -----------------------------------------------------
			// -------- ausführen von Domready-Funktionen ----------
			// -----------------------------------------------------

			// läde die auf der Seite benötigten JS-Module
			$body.requirementsForJmPlugins();

			// Initialisiert die Elemente, die mit dem Attribut data-jmdominit="true" versehen sind
			$body.triggerSelfexecObj();

			// Externe Lib. Sie wird verwendet, um ein delay von 300ms bei Klick auf Touch-Devices zu unterdrücken.
			// Die Verzögerung entsteht durch das warte des Device auf einen evtl. doppleClick, der ein Zoomen in die Seite auslöst.
			// Touchstart -> Klick
			//FastClick.attach(document.body);

			// Führt die im DomReadyObject hinterlegten Funktionen aus
			execDomReadyObject();

			// Trigger jmtrigger:hash on element with id === hash
			if(window.location.hash !== ''){
				$(window.location.hash).jmtrigger('hash');
			}

			// Trigger Picturefill um die entsprechenden Images in die Div-Container zu injecten
			try{picturefill();}catch(e){}

			if(dc.debug){
				jmHF.checkConfigJS();
				jmHF.checkJmNameElementenOnNecessaryDominitAttribut();
			}
		});
	});
});