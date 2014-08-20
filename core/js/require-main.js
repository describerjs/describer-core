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
		'jquery_plugin'                                    : 'externals/customized/jquery.plugin',
		'jquery_validate'                                  : 'externals/customized/jquery.validate',
		'owl_carousel'                                     : 'externals/customized/owl.carousel',
		'overwritings.jquery_validate'                     : 'externals/customized/overwritings/jquery.validate',
		'overwritings.owl_carousel'                        : 'externals/customized/overwritings/owl.carousel',
		'video'                                            : 'externals/customized/video',
		'md5'                                              : 'externals/originalReferenceSource/md5',
		'rAF'                                              : 'externals/originalReferenceSource/rAF',
		'fastclick'                                        : 'externals/originalReferenceSource/fastclick',
		'fixedfixed'                                       : 'externals/originalReferenceSource/fixedfixed',
		'fixedsticky'                                      : 'externals/originalReferenceSource/fixedsticky',




		// mylibs
		'_config'                                          : 'mylibs/_config',
		'_super'                                           : 'mylibs/_super',
		'actions.add'                                      : 'mylibs/actions/add',
		'actions.ajax'                                     : 'mylibs/actions/ajax',
		'actions.link'                                     : 'mylibs/actions/link',
		'actions.remove'                                   : 'mylibs/actions/remove',
		'actions.scroll'                                   : 'mylibs/actions/scroll',
		'actions.set'                                      : 'mylibs/actions/set',
		'actions.sticky'                                   : 'mylibs/actions/sticky',
		'actions.toggle'                                   : 'mylibs/actions/toggle',
		'actions.trigger'                                  : 'mylibs/actions/trigger',

		'add-ons.formvalidate'                             : 'mylibs/add-ons/formvalidate',

		'modules.carousel'                                 : 'mylibs/modules/carousel',
		'modules.carousel-ts'                              : 'mylibs/modules/carousel-ts',

		/*'modules.carousel-ts'                              : 'empty',*/
		'modules.countdown'                                : 'mylibs/modules/countdown',
		'modules.dependentSelectionGroup'                  : 'mylibs/modules/dependentSelectionGroup',
		'modules.equalheights'                             : 'mylibs/modules/equalheights',
		'modules.form.autocomplete'                        : 'mylibs/modules/form/autocomplete',
		'modules.form.formvalidate'                        : 'mylibs/modules/form/formvalidate',
		'modules.form.selectOptionExtractInGroup'          : 'mylibs/modules/form/selectOptionExtractInGroup',
		'modules.form.submitbutton'                        : 'mylibs/modules/form/submitbutton',
		'modules.modal'                                    : 'mylibs/modules/modal',
		'modules.tablesort'                                : 'mylibs/modules/tablesort',
		'modules.video'                                    : 'mylibs/modules/video',

		'utils.helpers'                                    : 'mylibs/utils/helpers',
		'utils.jquery_helpers'                             : 'mylibs/utils/jquery.helpers',

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
		
	    'video': {
            exports: '_VideoJS'
        },
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


require(['jquery', '_config'], function($, _config){
	// need jquery
	require([ 'utils.jquery_helpers', 'utils.helpers', 'fastclick', 'jquery_ba-dotimeout'], function(){
		// DomReady
		$(function(){

			// -----------------------------------------------------
			// --------------- User Events -------------------------
			// -----------------------------------------------------

			var $body = $('body');


			//----------------- Listener for focus, change, blur, checkValidation -------------------------------------


			// Jedes Input(ausgenommen type="submit"), texarea und select feuert ein Event "checkValidation" wenn focus, change oder blur getriggert wird.
			$body.on(   'blur ' +
						'change ' +
						'focus ' +
						'checkValidation', 'form[data-jmname="form"]', jmHF.eventDelegationTrigger);
			// Change-Listener für select, input[type="radio"] und input[type="checkbox"] zur initialisierung und Aufruf der change-Funktion des Plugins
			$body.on('change',  'select[data-jmname], ' +
								'input[type="radio"][data-jmname], ' +
								'input[type="checkbox"][data-jmname], ' +
								'input[type="text"][data-jmname], ' +
								'input[type="email"][data-jmname]', jmHF.eventDelegationTrigger);



			//---------------------------------------------------------------------------------------------------------





			//----------------------------- Listener for click --------------------------------------------------------

			$body.on('click', 'a[data-jmname]', jmHF.eventDelegationTriggerForATags);
			// Click-Listener für Selbstschließende-Tags oder nur Text-Knoten beinhaltende Tags wie h3, input und button mit Attribut [data-jmelement] zur initialisierung und Aufruf der click-Funktion des Plugins
			// Click-Listener für Kontainer-Tags mit Attribut [data-jmelement] wie div, tr, li, ul select zur initialisierung und Aufruf der click-Funktion des Plugins
			$body.on('click',   'button[type="submit"][data-jmname], ' +
								'div[data-jmname],' +
								'h3[data-jmname], ' +
								'input[type="submit"][data-jmname], ' +
								'input[type="button"][data-jmname], ' +
								'input[type="text"][data-jmname], ' +
								'input[type="checkbox"][data-jmname], ' +
								'li[data-jmname], ' +
								'select[data-jmname]' +
								'tr[data-jmname], ' +
								'ul[data-jmname]', jmHF.eventDelegationTrigger);

			$body.on('click', 'label[data-jmname]', jmHF.eventDelegationTriggerForLabels);


			// Browser-Back-Button -> somit wird ein Spinner auf der Seite zuvor (Klick auf Link oder Submit-Button) gelöscht. Der Spinner dient zu besseren UX
			/*window.addEventListener("popstate", function(){
				$('#linkspinner').remove();
			});*/










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
			$body.requirementsForJmElements();

			// Initialisiert die Elemente, die mit dem Attribut data-jmdominit="true" versehen sind
			$body.triggerSelfexecObj();

			// Prüft die URL auf evtl. Variablen und für dann die entsprechende Funktionalität aus
			/*jmHF.applyUrlVars('scrollToId');
			jmHF.applyUrlVars('scrollToAreaEdit');
			jmHF.applyUrlVars('scrollToTBopenId');*/

			// Externe Lib. Sie wird verwendet, um ein delay von 300ms bei Klick auf Touch-Devices zu unterdrücken.
			// Die Verzögerung entsteht durch das warte des Device auf einen evtl. doppleClick, der ein Zoomen in die Seite auslöst.
			// Touchstart -> Klick
			//FastClick.attach(document.body);

			// Führt die im DomReadyObject hinterlegten Funktionen aus
			execDomReadyObject();

			// Trigger Picturefill um die entsprechenden Images in die Div-Container zu injecten
			picturefill();

			//jmHF.replaceSVGForOldBrowser();


			/*$(window).on('resize', function(){
				$.doTimeout('resize', 500, function () {
					$body.triggerSelfexecObj();
				});

			});*/

			// (function (d, s, id) {
			//     var js, fjs = d.getElementsByTagName(s)[0];
			//     if (d.getElementById(id)) return;
			//     js = d.createElement(s); js.id = id;
			//     js.src = "//connect.facebook.net/de_DE/all.js#xfbml=1&appId=" + window.FBID;
			//     fjs.parentNode.insertBefore(js, fjs);
			// }(document, 'script', 'facebook-jssdk'));

			/*(function () {
				var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
				ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';
				var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
			})();*/
			
			//////////////////////////////////// ie8 FIX for CSS Design ////////////////////////////////////////////////////////////////
			/*if (navigator.appVersion.indexOf("MSIE 8.") != -1) {
				(function () {
					$body.on('change', 'input[type="radio"], input[type="checkbox"]', function (e) {
						var that = this;
						$(that).ie8BugfixForRadioAndCheckbox();
					})
				})()
			}*/
			//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
			// (function (i, s, o, g, r, a, m) {
			//     i['GoogleAnalyticsObject'] = r; i[r] = i[r] || function () {
			//         (i[r].q = i[r].q || []).push(arguments)
			//     }, i[r].l = 1 * new Date(); a = s.createElement(o),
			//     m = s.getElementsByTagName(o)[0]; a.async = 1; a.src = g; m.parentNode.insertBefore(a, m)
			// })(window, document, 'script', '//www.google-analytics.com/analytics.js', 'ga');

			// ga('create', 'UA-47221651-1', 'kalbini-duyur.de');
			// ga('send', 'pageview');

			// Fix für den BUG @Soll beim Andrea geteste werden //
			// In CheckOut beim Seiten Aktualieseirung "Mit Offene/Ausgefüllte Lieferadresse-ToggleBox" 
			// Input felder werden alle disabled, aber die solllen immer "Enable/Editierbar" bleiben.
			// Hier korrektur für:
			// SHOW ToggleBox >> Input Felder Enable, auch mit Seiten Aktualieseirung
			// HIDE ToggleBox >> Input Felder disable, auch mit Seiten Aktualieseirung

			//////////////////////////////////// ie8 FIX for CSS Design ////////////////////////////////////////////////////////////////
			/*if($('#LieferadresseBlock').css('display') !== undefined){
				if($('#LieferadresseBlock').css('display') === 'none'){
					$('.tb-content :input').prop('disabled', false);
				}else{
					$('.tb-content :input').prop('disabled', true);
				}
			}*/
			//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		});
	});
});