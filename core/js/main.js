var pathToJQuery;
if('querySelector' in document && 'localStorage' in window && 'addEventListener' in window){
	pathToJQuery = 'externals/vendor/jquery-2.1.0';
}else{
	pathToJQuery = 'externals/vendor/jquery-1.11.0';
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
		'fixedfixed'                                       : 'externals/originalReferenceSource/fixedfixed',
		'fixedsticky'                                      : 'externals/originalReferenceSource/fixedsticky',
		'fastclick'                                        : 'externals/vendor/fastclick',



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
		'utils.jquery.helpers'                             : 'mylibs/utils/jquery.helpers',

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
	require([ 'utils.jquery.helpers', 'utils.helpers', 'fastclick', 'jquery_ba-dotimeout'], function(){
		// 'jmHelperFunction', 'stickem'
		// DomReady
		$(function(){

			// -----------------------------------------------------
			// --------------- User Events -------------------------
			// -----------------------------------------------------

			var $body = $('body');
			// Jedes Input(ausgenommen type="submit"), texarea und select feuert ein Event "checkValidation" wenn focus, change oder blur getriggert wird.
			$body.on('focus change blur checkValidation', 'form[data-jmname="form"]', function(e){
				var $this = $(this);
				var _jmname = $this.attr('data-jmname').split('|');
				for(var i = 0, leni = _jmname.length; i < leni; i++){
					jmHF.bindPlugin({ '$element': $this, 'jmname': _jmname[i], 'plugin': jmHF.getJmElementByJmName(_config, _jmname[i]), 'e': e });
				}
			});

			//TODO Andreas Check auf Elemente da hier jetzt nicht mehr a-Tag verwendet wird
			// Click-Listener für Selbstschließende-Tags oder nur Text-Knoten beinhaltende Tags wie a, h3, input und button mit Attribut [data-jmelement] zur initialisierung und Aufruf der click-Funktion des Plugins
			$body.on('click', 'h3[data-jmname], input[type="submit"][data-jmname], input[type="button"][data-jmname], button[type="submit"][data-jmname], input[type="text"][data-jmname], input[type="checkbox"][data-jmname], button[type="submit"][data-jmname]', function(e){
				var $target = $(e.target);
				var _jmname = $target.attr('data-jmname').split('|');
				for(var i = 0, leni = _jmname.length; i < leni; i++){
					jmHF.bindPlugin({ '$element': $target, 'jmname': _jmname[i], 'plugin': jmHF.getJmElementByJmName(_config, _jmname[i]), 'e': e });
				}
			});
			// ********************************************************************************************


			// Click-Listener für Kontainer-Tags mit Attribut [data-jmelement] wie div, tr, li, ul select zur initialisierung und Aufruf der click-Funktion des Plugins
			$body.on('click', 'div[data-jmname], a[data-jmname], label[data-jmname], tr[data-jmname], li[data-jmname], ul[data-jmname], select[data-jmname]', function(e){
				var $this = $(this);
				/*if($.type($this.attr('data-jmpreventdefault')) !== 'undefined'){
					e.preventDefault();
				}*/
				if(this.tagName.toLowerCase() === 'a'){
					e.preventDefault();
				}
				var _jmname = $this.attr('data-jmname').split('|');
				// Fix für doppelten Eventtrigger, der bei (Label > input[type="radio"]) besteht. Hier wird zuerste der Event von Lable gefeuert und dann noch vom radio.
				if(!((e.target.nodeName.toLowerCase() === 'label') && ($(e.target).find('input[type="radio"]').doesExist() || $(e.target).find('input[type="checkbox"]').doesExist()))){
					// jmHF.triggerChangeEventForAllRadiosInGroup wird aufgerufen, damit jeder Radio-Butten das Change-Event feuert, wenn sich in der Gruppe die Selection ändert.
					jmHF.triggerChangeEventForAllRadiosInGroup(e);
					for(var i = 0, leni = _jmname.length; i < leni; i++){
						jmHF.bindPlugin({ '$element': $this, 'jmname': _jmname[i], 'plugin': jmHF.getJmElementByJmName(_config, _jmname[i]), 'e': e });
					}
				}
			});
			// ********************************************************************************************



			// ********************************************************************************************

			// Change-Listener für select, input[type="radio"] und input[type="checkbox"] zur initialisierung und Aufruf der change-Funktion des Plugins
			$body.on('change', 'select[data-jmname], input[type="radio"][data-jmname], input[type="checkbox"][data-jmname], input[type="text"][data-jmname], input[type="email"][data-jmname]', function(e){
				var $this = $(this);
				//jmHF.triggerChangeEventForAllRadiosInGroup(e);
				var _jmname = $this.attr('data-jmname').split('|');
				for(var i = 0, leni = _jmname.length; i < leni; i++){
					jmHF.bindPlugin({ '$element': $this, 'jmname': _jmname[i], 'plugin': jmHF.getJmElementByJmName(_config, _jmname[i]), 'e': e });
				}
			});
			// ********************************************************************************************


			// Browser-Back-Button -> somit wird ein Spinner auf der Seite zuvor (Klick auf Link oder Submit-Button) gelöscht. Der Spinner dient zu besseren UX
			/*window.addEventListener("popstate", function(){
				$('#linkspinner').remove();
			});*/

			// -----------------------------------------------------
			// --------------- generische Events -------------------
			// -----------------------------------------------------


			$body.on('dominit', function(e){
				var $target = $(e.target);
				var _jmname = $target.attr('data-jmname').split('|');
				for(var i = 0, leni = _jmname.length; i < leni; i++){
					jmHF.bindPlugin({ '$element': $target, 'jmname': _jmname[i], 'plugin': jmHF.getJmElementByJmName(_config, _jmname[i]), 'e': e });
				}
				/*if($.type($target.attr('data-jmelement')) !== 'undefined'){
					jmHF.bindPlugin({ '$element': $target, 'plugin': $target.attr('data-jmelement'), 'e': e });
				}else{
					jmHF.bindPlugin({ '$element': $target, 'plugin': jmHF.getJmElementByJmName(_config, $target.attr('data-jmname')), 'e': e });
				}*/
			});


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

			// Führt die im DomReadyObject hinterlegten Functionen aus
			execDomReadyObject();

			// Trigger Picturefill um die entsprechenden Images in die Div-Container zu injecten
			picturefill();

			jmHF.replaceSVGForOldBrowser();


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

			(function () {
				var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
				ga.src = ('https:' == document.location.protocol ? 'https://' : 'http://') + 'stats.g.doubleclick.net/dc.js';
				var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
			})();
			
			//////////////////////////////////// ie8 FIX for CSS Design ////////////////////////////////////////////////////////////////
			if (navigator.appVersion.indexOf("MSIE 8.") != -1) {
				$body.find('input[type="radio"], input[type="checkbox"]').on('change', function (e) {
	                setTimeout(function() { checkDOMElements(); }, 200);
	            })
	            function checkDOMElements() {
	                $('input[type="radio"], input[type="checkbox"]').each(function (e) {
	                    if ($('#' + this.id).is(':checked')) {
	                        $('#' + this.id).addClass('option-checked');
	                    } else {
	                        $('#' + this.id).removeClass('option-checked');
	                    }
	                });
	            }
	            checkDOMElements();
        	}
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
			if($('#LieferadresseBlock').css('display') !== undefined){
				if($('#LieferadresseBlock').css('display') === 'none'){
					$('.tb-content :input').prop('disabled', false);
				}else{
					$('.tb-content :input').prop('disabled', true);
				}
			}
		});
	});
});