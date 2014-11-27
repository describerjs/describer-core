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
	pathToJQuery = 'externals/originalReferenceSource/jquery-2.1.0';
}else{
	pathToJQuery = 'externals/originalReferenceSource/jquery-1.11.0';
}
require.config({
	paths      : {
		// externals
		'jquery'                                           : pathToJQuery,
		'scrolltotop'                                      : 'externals/customized/scrolltotop',
		'jquery_autocomplete'                              : 'externals/customized/jquery.autocomplete',
		'jquery_ba-dotimeout'                              : 'externals/customized/jquery.ba-dotimeout',
		'jquery_countdown'                                 : 'externals/customized/jquery.countdown',
		'jquery_countdown-de'                              : 'externals/customized/jquery.countdown-de',
		'jquery_exif'                                      : 'externals/customized/jquery.exif',
		'jquery_parallax'                                  : 'externals/customized/jquery.parallax',
		'jquery_plugin'                                    : 'externals/customized/jquery.plugin',
		'jquery_validate'                                  : 'externals/customized/jquery.validate',
		'owl_carousel'                                     : 'externals/customized/owl.carousel',
		'overwritings.jquery_validate'                     : 'externals/customized/overwritings/jquery.validate',
		'overwritings.owl_carousel'                        : 'externals/customized/overwritings/owl.carousel',
		'video'                                            : 'externals/customized/video',
		'jquery_canvasResize'                              : 'externals/originalReferenceSource/jquery.canvasResize',
		'fastclick'                                        : 'externals/originalReferenceSource/fastclick',
		'fixedfixed'                                       : 'externals/originalReferenceSource/fixedfixed',
		'fixedsticky'                                      : 'externals/originalReferenceSource/fixedsticky',
		'jquery_mousewheel'                                : 'externals/originalReferenceSource/jquery.mousewheel',
		'jquery_smoothwheel'                               : 'externals/originalReferenceSource/jquery.smoothwheel',
		'md5'                                              : 'externals/originalReferenceSource/md5',
		'rAF'                                              : 'externals/originalReferenceSource/rAF',
		'video_4_10_2'                                     : 'externals/originalReferenceSource/video.4.10.2',
		'videojs-youtube'                                  : 'externals/originalReferenceSource/youtube',







		// mylibs
		'_config'                                          : 'describer-config',
		'core'                                             : 'describer-core/core',

		'_super'                                           : 'describer-core/_super',
		'actions.add'                                      : 'describer-core/actions/add',
		'actions.ajax'                                     : 'describer-core/actions/ajax',
		'actions.link'                                     : 'describer-core/actions/link',
		'actions.remove'                                   : 'describer-core/actions/remove',
		'actions.scroll'                                   : 'describer-core/actions/scroll',
		'actions.set'                                      : 'describer-core/actions/set',
/*		'actions.sticky'                                   : 'mylibs/actions/sticky',*/
		'actions.toggle'                                   : 'describer-core/actions/toggle',
		'actions.trigger'                                  : 'describer-core/actions/trigger',

		'modules.carousel'                                 : 'mylibs/modules/carousel',
		'modules.carousel-ts'                              : 'mylibs/modules/carousel-ts',

		/*'modules.carousel-ts'                              : 'empty',*/
		'modules.countdown'                                : 'mylibs/modules/countdown',
		'modules.dependentSelectionGroup'                  : 'mylibs/modules/dependentSelectionGroup',
		'modules.equalheights'                             : 'mylibs/modules/equalheights',
		'modules.form.autocomplete'                        : 'mylibs/modules/form/autocomplete',
		'modules.form.formvalidate'                        : 'mylibs/modules/form/formvalidate',
		'modules.form.formvalidate-addon'                  : 'mylibs/modules/form/formvalidate-addon',
		'modules.form.selectOptionExtractInGroup'          : 'mylibs/modules/form/selectOptionExtractInGroup',
		'modules.form.submitbutton'                        : 'mylibs/modules/form/submitbutton',
		'modules.fotoupload'                               : 'mylibs/modules/fotoupload',
		'modules.modal'                                    : 'mylibs/modules/modal',
		'modules.parallax'                                 : 'mylibs/modules/parallax',
		'modules.scrollControlFrames'                      : 'mylibs/modules/scrollControlFrames',
		'modules.scrollControlTransform'                  : 'mylibs/modules/scrollControlTransform',
		'modules.tablesort'                                : 'mylibs/modules/tablesort',
		'modules.video'                                    : 'mylibs/modules/video',
		'modules.videocontrol'                              : 'mylibs/modules/videocontrol',
		'modules.videoplayer'                              : 'mylibs/modules/videoplayer',



		'require-css.video'                                : 'require-css/video'
	},
	shim: {
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
	        'css': 'require-css/css' // or whatever the path to require-css is
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


			$body.on('dominit', '[data-jmname]', jmHF.eventDelegationTrigger);

			// Change-Listener für select, input[type="radio"] und input[type="checkbox"] zur initialisierung und Aufruf der change-Funktion des Plugins
			$body.on('jmtrigger', '[data-jmname]', jmHF.eventDelegationTrigger);



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

			if(window.debug){
				jmHF.checkConfigJS();
				jmHF.checkJmNameElementenOnNecessaryDominitAttribut();
			}
		});
	});
});