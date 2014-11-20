/*!
 * describer-core/main-core
 *
 * Copyright (c) 2014 Andreas Otten (aotten77)
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
		// libs
		'jquery'                                           : pathToJQuery,
		'scrolltotop'                                      : 'describer-core/libs/scrolltotop',
		'rAF'                                              : 'describer-core/libs/rAF',
		
		// actions
		'actions.add'                                      : 'describer-core/actions/add',
		'actions.ajax'                                     : 'describer-core/actions/ajax',
		'actions.link'                                     : 'describer-core/actions/link',
		'actions.remove'                                   : 'describer-core/actions/remove',
		'actions.scroll'                                   : 'describer-core/actions/scroll',
		'actions.set'                                      : 'describer-core/actions/set',
		'actions.toggle'                                   : 'describer-core/actions/toggle',
		'actions.trigger'                                  : 'describer-core/actions/trigger',

		// core
		'_config'                                          : 'describer-core/_config',
		'_super'                                           : 'describer-core/_super',
		'core'                                             : 'describer-core/core',
	},
	waitSeconds: 500
});


require(['jquery', '_config'], function require_jquery($){
	// need jquery
	require([ 'core'], function require_helpers(){
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

			if(window.debug){
				jmHF.checkConfigJS();
				jmHF.checkJmNameElementenOnNecessaryDominitAttribut();
			}
		});
	});
});