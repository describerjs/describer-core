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
if('querySelector' in document && 'localStorage' in window && 'addEventListener' in window){
	pathToJQuery = 'describer-core/libs/jquery-2.1.0';
}else{
	pathToJQuery = 'describer-core/libs/jquery-1.11.0';
}
require.config({
	paths      : {
		// ******************* describer-core ******************************
		'async'                                             : 'describer-core/libs/async',
		'jquery'                                            : pathToJQuery,
		'scrolltotop'                                       : 'describer-core/libs/scrolltotop',
		'rAF'                                               : 'describer-core/libs/rAF',


		// mylibs
		'_config'                                           : 'describer-config',
		'core'                                              : 'describer-core/core',

		'_super'                                            : 'describer-core/_super',
		'actions.add'                                       : 'describer-core/actions/add',
		'actions.ajax'                                      : 'describer-core/actions/ajax',
		'actions.apply'                                     : 'describer-core/actions/apply',
		'actions.exec'                                      : 'describer-core/actions/exec',
		'actions.link'                                      : 'describer-core/actions/link',
		'actions.move'                                      : 'describer-core/actions/move',
		'actions.remove'                                    : 'describer-core/actions/remove',
		'actions.scroll'                                    : 'describer-core/actions/scroll',
		'actions.set'                                       : 'describer-core/actions/set',
		/*		'actions.sticky'                                   : 'mylibs/actions/sticky',*/
		'actions.toggle'                                    : 'describer-core/actions/toggle',
		'actions.trigger'                                   : 'describer-core/actions/trigger',



		// ******************* describer-more ******************************
		'config.googlemap'                                  : 'describer-more/config/googlemap',
		'modules.carousel'                                  : 'describer-more/modules/carousel',
		'modules.carousel-ts'                               : 'describer-more/modules/carousel-ts',

		/*'modules.carousel-ts'                              : 'empty',*/
		'modules.countdown'                                 : 'describer-more/modules/countdown',
		'modules.dependentSelectionGroup'                   : 'describer-more/modules/dependentSelectionGroup',
		'modules.equalheights'                              : 'describer-more/modules/equalheights',
		'modules.form.autocomplete'                         : 'describer-more/modules/form/autocomplete',
		'modules.form.formvalidate'                         : 'describer-more/modules/form/formvalidate',
		'modules.form.formvalidate-addon'                   : 'describer-more/modules/form/formvalidate-addon',
		'modules.form.selectOptionExtractInGroup'           : 'describer-more/modules/form/selectOptionExtractInGroup',
		'modules.form.submitbutton'                         : 'describer-more/modules/form/submitbutton',
		'modules.fotoupload'                                : 'describer-more/modules/fotoupload',
		'modules.googlemap'                                 : 'describer-more/modules/googlemap',
		'modules.modal'                                     : 'describer-more/modules/modal',
		'modules.onView'                                    : 'describer-more/modules/onView',
		'modules.parallax'                                  : 'describer-more/modules/parallax',
		'modules.scrollControlFrames'                       : 'describer-more/modules/scrollControlFrames',
		'modules.scrollControlTransform'                    : 'describer-more/modules/scrollControlTransform',
		'modules.tablesort'                                 : 'describer-more/modules/tablesort',
		'modules.video'                                     : 'describer-more/modules/video',
		'modules.videocontrol'                              : 'describer-more/modules/videocontrol',
		'modules.videoplayer'                               : 'describer-more/modules/videoplayer',

		// untouched externel
		'jquery_canvasResize'                               : 'describer-more/plugins/jquery.canvasResize',
		'fastclick'                                         : 'describer-more/plugins/fastclick',
		'fixedfixed'                                        : 'describer-more/plugins/fixedfixed',
		'fixedsticky'                                       : 'describer-more/plugins/fixedsticky',
		'jquery_mousewheel'                                 : 'describer-more/plugins/jquery.mousewheel',
		'md5'                                               : 'describer-more/plugins/md5',
		'video_4_10_2'                                      : 'describer-more/plugins/video.4.10.2',
		'videojs-youtube'                                   : 'describer-more/plugins/youtube',

		// customized externel
		'jquery_autocomplete'                               : 'describer-more/plugins/customized/jquery.autocomplete',
		'jquery_ba-dotimeout'                               : 'describer-more/plugins/customized/jquery.ba-dotimeout',
		'jquery_countdown'                                  : 'describer-more/plugins/customized/jquery.countdown',
		'jquery_countdown-de'                               : 'describer-more/plugins/customized/jquery.countdown-de',
		'jquery_exif'                                       : 'describer-more/plugins/customized/jquery.exif',
		'jquery_parallax'                                   : 'describer-more/plugins/customized/jquery.parallax',
		'jquery_plugin'                                     : 'describer-more/plugins/customized/jquery.plugin',
		'jquery_smoothMousewheel'                                : 'describer-more/plugins/customized/jquery.smoothMousewheel',
		'jquery_validate'                                   : 'describer-more/plugins/customized/jquery.validate',
		'owl_carousel'                                      : 'describer-more/plugins/customized/owl.carousel',
		'video'                                             : 'describer-more/plugins/customized/video',

		// overwritings externel
		'overwritings.jquery_validate'                      : 'describer-more/plugins/overwritings/jquery.validate',
		'overwritings.owl_carousel'                         : 'describer-more/plugins/overwritings/owl.carousel',

		// CSS for components
		'require-css.video'                                 : 'describer-more/require-css/video'
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
	        'css': 'describer-more/require-css/css' // or whatever the path to require-css is
	    }
	},
	waitSeconds: 500
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

			// Trigger Picturefill um die entsprechenden Images in die Div-Container zu injecten
			try{picturefill();}catch(e){}

			if(dc.debug){
				jmHF.checkConfigJS();
				jmHF.checkJmNameElementenOnNecessaryDominitAttribut();
			}
		});
	});
});