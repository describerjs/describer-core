# Doku HTML


## <!DOCTYPE html>
Die DOCTYPE ist die unverzichtbare Einleitung des HTML Dokuments und teilt dem Browser die verwendete HTML Version mit.


## <html class="no-js" lang="de">
Das *<html>* Element erhält zwei Attribute:

1. Das *lang* Attribut ist Pflicht und teilt dem Browser die zu verwendende Aussprache mit. Der entsprechende Schrifttyp wird festglegt und die Aussprache für das Interface gesetzt (beispielsweise für Form-Elemente wie Date-Picker oder Validierungen).
2. Zusätzlich wird die Klasse *no-js* gesetzt. Diese dient als Hilfe für die CSS Entwicklung und sagt lediglich, dass Javascript nicht unterstütz wird. Der Einsatz von Modernizr überschreibt diese Klasse mit *js*, um eine Javascript Unterstützung anzudeuten.


## <head>

### <title>
Der Dokumententitel, wird in der Browsertitelleiste bzw. Tab angezeigt.

### <meta charset="utf-8" />
Der zu verwendende Zeichensatz.

### <meta http-equiv="X-UA-Compatible" content="IE=edge" />
Mit dem Internet Explorer 8 wurde der Kompatibilitätsmodus eingeführt, mit dessen hilfe eine Seite so gerendert wird, wie eine ältere IE Version dies tun würde.  
Die Angabe *IE=edge* weist Internet Explorer an, den höchstmöglichen Modus zu nutzen, der in der entsprechenden Browserversion zur Verfügung steht. Im Klartext: Standardmodus.  
Die Positionierung dieses Metas ist sehr strikt! Hier gilt: im Header vor allen anderen Elementen, außer dem *<title>* und anderen *<meta>*.

### <meta name="description" content="$description$" />
*$description$* ist ein Beschreibungstext für die aktuelle Seite und wird dem User in den Suchergebnissen einer Suchmaschine angezeigt.

### <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1" />
Weist dem aktuellen Viewport an, in den kompletten sichtbaren Bereich zu Skalieren.

### <link rel="shortcut icon" href="/favicon/favicon.ico" />
Das Favicon der Seite, wird im Browsertab vor der URL/Titel bzw. in den gespeicherten Favoriten angezeigt.  

**<link rel="apple-touch-icon" href="/favicon/apple-touch-icon.png ">**  
**<link rel="apple-touch-icon" href="/favicon/apple-touch-icon-72x72.png" sizes="72x72" />**  
**<link rel="apple-touch-icon" href="/favicon/apple-touch-icon-114x114.png" sizes="114x114" />**  
**<link rel="apple-touch-icon-precomposed" href="/favicon/apple-touch-icon-144x144-precomposed.png" sizes="144x144" />**  
**<link rel="apple-touch-icon-precomposed" href="/favicon/apple-touch-icon-114x114-precomposed.png" sizes="114x114" />**  
**<link rel="apple-touch-icon-precomposed" href="/favicon/apple-touch-icon-72x72-precomposed.png" sizes="72x72" />**  
**<link rel="apple-touch-icon-precomposed" href="/favicon/apple-touch-icon-57x57-precomposed.png" />**  
iOS ermöglicht das speichern eines Favoriten auf dem Homescreen. Dazu lässt sich ein Icon referenzieren und lässt den Favoriten wie eine App aussehen. Für unterschiedlichste Geräte und Auflösungen gibt es jeweils ein eigenes Icon.  
  
**<meta name="msapplication-TileImage" content="img/favicon/ms-touch-icon-144x144-precomposed.png" />**  
**<meta name="msapplication-TileColor" content="#222222" />**  
Analog iOS bzw. apple-touch, allerdings für Windows 8. Hier lässt sich zusätzlich noch ein Farbwert für den Tile angeben.

### Festlegung der globalen JS-Variablen für die Unterscheidung DEV/LIVE-Betrieb ###
An dieser Stelle werden die globalen Variablen gesetzt, die für die Fallunterscheidung dienen, ob zum einen die minifizierten Datein verwendet werden sollen und zum anderen der local Storage verwendet werden kann.



	// Hier muss eine Servervariable eingefügt werden, welche den Zustand wiedergibt,
	// ob der Server ein Entwicklungs- oder LIVE-Server ist.
	@if (Config.Instance.IsDevServer)
    {
    	// DEV
	    <script>
		    window.UseLocalStorage = false;
		    window.loadUnminifyVersion = true;
		    window.IsDevServer = true;
	    </script>
    
    }
    else
    {
		// LIVE
	    <script>
		    window.IsDevServer = false;
		    var checkDebugging = function(){
		        try{
		            if(localStorage.getItem('debugging') !== null){
						// kein Verwendung vom local Storage
		                window.UseLocalStorage = false;
		                window.loadUnminifyVersion = true;
		            }else{
						// Verwendung vom local Storage
		                window.UseLocalStorage = true;
		                window.loadUnminifyVersion = false;
		            }
		        }catch(e){
					// kein Verwendung vom local Storage
		            window.UseLocalStorage = true;
		            window.loadUnminifyVersion = false;
		        }
		    };
		    checkDebugging();
	    </script>
    }

Um das Debugging auch LIVE zu ermöglichen, kann ein manueller (in der Browser-Konsole) Eintrag im local-Storage hinterlegt werden, der dessen Verwendung unterbindet. 

	window.localStorage.setItem('debugging', 'true');

### Weiteres inlineJS um das sofortige laden von CSS aus dem local Storage oder via Request durchzuführen. ###
#### So wird ein unstyled Content unterbunden  ####

	<script>
		// Hier wird eine Warnung ausgegeben, wenn der local Storage mit nicht versionierten "keys" für den Content gespeichert wird.
	    if(window.UseLocalStorage && window.loadUnminifyVersion){
	        console.warn('-------------!!!!!-----localStorage wird nicht gelöscht!------!!!!!-----');
	    }
	
	    // Das Objekt dient zum vorhalten von Funktionen, die unmittelbar nach dem ready-Event von jQuery ausgeführt werden sollen
	    window.domReadyObject = {
	        countProperties: function(){
	            var count = 0;
	            for(var property in this){
	                if(this.hasOwnProperty(property)){
	                    count += 1;
	                }
	            }
	            return count;
	        }
	    };
	
	    // Die übergebenen Funktion wird entweder unmittelbar ausgeführt, wenn jQuery geladen und das 'ready'-Event geschmissen wurde, oder im domReadyObject vorgehalten.
	    window.onDomOrAjaxReady = function(p_function){
	        if(typeof jQuery !== 'undefined'){
	            ($.isReady) ? p_function() : $(document).on('ready', p_function);
	        }else{
	            window.domReadyObject['func_' + window.domReadyObject.countProperties()] = p_function;
	        }
	    };
	
	    // Hier werden alle vorgehaltenen Funktionen im domReadyObject ausgeführt
	    window.execDomReadyObject = function(){
	        for(var property in window.domReadyObject){
	            if(window.domReadyObject.hasOwnProperty(property) && ('countProperties' !== property)){
	                window.domReadyObject[property]();
	            }
	        }
	    };
	
	    // Modernizr-Test auf localStorage
	    window.testLocalStorage = function(){
	        var mod = 'modernizr';
	        try{
	            localStorage.setItem(mod, mod);
	            localStorage.removeItem(mod);
	            return true;
	        }catch(e){
	            return false;
	        }
	    };
	
	    // Die Funktion prüft, ob es im localStorage schon einen identischen key (jeweils ohne versionierungsnummer) gibt und löscht diese incl. value im localStorage.
	    window.clearLocalStorageForKey = function(p_key){
	        var keyWithoutExtension = p_key.substr(0, p_key.lastIndexOf('.'));
	        var nonversionkey = keyWithoutExtension.substr(0, keyWithoutExtension.lastIndexOf('.'));
	        var patt = new RegExp(nonversionkey);
	        var index = 0;
	        var length = localStorage.length;
	        try{
	            for(; index <= length; index++){
	                if(patt.test(localStorage.key(index)) && (localStorage.key(index) !== p_key)){
	                    localStorage.removeItem(localStorage.key(index));
	                }
	            }
	        }catch(e){
	        }
	    };
	
	    // Fügt das CSS zum DOM entweder als link-Element oder aus dem localStorage
	    window.addCSSToDOM = function(p_src){
	        var linkElem;
	        var styleElem;
	        // wenn localStorage vorliegt aber der Datei-Pfade(key) und entsprechen die value nicht vorhanden ist.
	        // -> dynamische Erstellung eines link-tags mit Angabe des Datei-Pfades und anschließender ajax nach Dom-Ready um den Conten im localStorage abzulengen (kommt aus dem Cache).
	        if (window.UseLocalStorage && testLocalStorage() && (localStorage[p_src] === undefined)) {
	            // window.localStorage is available!
	            linkElem = document.createElement('link');
	            linkElem.setAttribute('rel', 'stylesheet');
	            linkElem.setAttribute('href', p_src);
	            document.getElementsByTagName('head')[0].appendChild(linkElem);
	            onDomOrAjaxReady(function(){
	                (function(){
	                    var xhr;
	                    xhr = new XMLHttpRequest();
	                    xhr.open('GET', p_src, true);
	                    xhr.send();
	                    xhr.onreadystatechange = function(){
	                        if(xhr.readyState === 4 && xhr.status !== 404 && xhr.responseText !== ''){
	                            clearLocalStorageForKey(p_src);
	                            localStorage[p_src] = xhr.responseText;
	                        }
	                    };
	                })()
	            });
	            // wenn localStorage vorliegt und der Datei-Pfade(key) und entsprecher value im localStorage vorhanden ist.
	            // -> dynamische Erstellung eines style-tags mit injection der value aus dem localStorage.
	        }else if(window.UseLocalStorage && testLocalStorage() && (localStorage[p_src] !== undefined)){
	            styleElem = document.createElement('style');
	            styleElem.appendChild(document.createTextNode(localStorage[p_src]));
	            document.getElementsByTagName('head')[0].appendChild(styleElem);
	            // wenn kein localStorage vorliegt
	            // -> dynamische Erstellung eines link-tags mit Angabe des Datei-Pfades
	        }else{
	            linkElem = document.createElement('link');
	            linkElem.setAttribute('rel', 'stylesheet');
	            linkElem.setAttribute('href', p_src);
	            document.getElementsByTagName('head')[0].appendChild(linkElem);
	        }
	    };
	
	    // Fügt das JS zum DOM entweder als link-Element oder aus dem localStorage
	    window.addJSToDOM = function(p_src, p_attrkey, p_attrval){
	        var scriptElem;
	        // wenn localStorage vorliegt aber der Datei-Pfade(key) und entsprechen die value nicht vorhanden ist.
	        // -> dynamische Erstellung eines script-tags mit Angabe des Datei-Pfades und anschließender ajax nach Dom-Ready um den Conten im localStorage abzulengen (kommt aus dem Cache).
	        if(window.UseLocalStorage && testLocalStorage() && (typeof localStorage[p_src] === 'undefined')){
	            // window.localStorage is available!
	            scriptElem = document.createElement('script');
	            scriptElem.setAttribute('src', p_src);
	            if(typeof p_attrkey !== 'undefined'){
	                scriptElem.setAttribute(p_attrkey, p_attrval);
	            }
	            scriptElem.async = false;
	            document.getElementsByTagName('head')[0].appendChild(scriptElem);
	            onDomOrAjaxReady(function(){
	                (function(){
	                    var xhr;
	                    xhr = new XMLHttpRequest();
	                    xhr.open('GET', p_src, true);
	                    xhr.send();
	                    xhr.onreadystatechange = function(){
	                        if(xhr.readyState === 4 && xhr.status !== 404 && xhr.responseText !== ''){
	                            clearLocalStorageForKey(p_src);
	                            localStorage[p_src] = xhr.responseText;
	                        }
	                    };
	                })()
	            });
	            // wenn localStorage vorliegt und der Datei-Pfade(key) und entsprecher value im localStorage vorhanden ist.
	            // -> dynamische Erstellung eines style-tags mit injection der value aus dem localStorage.
	        }else if(window.UseLocalStorage && testLocalStorage() && (typeof localStorage[p_src] !== 'undefined')){
	            scriptElem = document.createElement('script');
	            if(typeof p_attrkey !== 'undefined'){
	                scriptElem.setAttribute(p_attrkey, p_attrval);
	            }
	            scriptElem.text = localStorage[p_src];
	            document.getElementsByTagName('head')[0].appendChild(scriptElem);
	            // wenn kein localStorage vorliegt
	            // -> dynamische Erstellung eines link-tags mit Angabe des Datei-Pfades
	        }else{
	            scriptElem = document.createElement('script');
	            scriptElem.setAttribute('src', p_src);
	            if(typeof p_attrkey !== 'undefined'){
	                scriptElem.setAttribute(p_attrkey, p_attrval);
	            }
	            scriptElem.async = false;
	            document.getElementsByTagName('head')[0].appendChild(scriptElem);
	        }
	    };
	
	    window.checkLocalStorageByTimestamp = function(){
	        if(window.UseLocalStorage && testLocalStorage()){
	            try{
	                // wenn kein timestamp im localStorage vorhanden ist wird einer erstellt.
	                if(localStorage.getItem('timestamp') === null){
	                    localStorage['timestamp'] = new Date().getTime().toString();
	                }else{
	                    // wenn der timestamp im localStorage kleiner ist als der fest codierte Timestamp, wird wird der localStorage gelöscht.
	                    if (parseInt(localStorage['timestamp'], 10) < 1402389706108) { // Nicht Ändern!!!! So wird bei allen Clients der localStorage gelöscht!!!! Nur Ändern, wenn sich die Datei-Pfad in der main.js zu den Modulen ändern Bsp. require.config({  paths:{ 'jmButtonForAddClassOnRelatedElem': 'mylibs/AMD-Plugins/jmButtonForAddClassOnRelatedElem',......
	                        window.localStorage.clear();
	                    }
	                }
	            }catch(e){
	            }
	        }
	    };
	
	    checkLocalStorageByTimestamp();
	</script>
	<script>
	    if (window.loadUnminifyVersion) {
	        addJSToDOM('/js/externals/customized/modernizr.custom.js');
	        addJSToDOM('/js/externals/vendor/matchmedia.js');
	        addJSToDOM('/js/externals/originalReferenceSource/picturefill2.js');
	        addCSSToDOM('/css/style.css');
	        addJSToDOM('/js/externals/customized/require.2.1.11.js', 'data-main', '/js/main.js');
	    } else {
	        addJSToDOM('/js/build/externals/customized/modernizr.custom.6966b8.js');
	        addJSToDOM('/js/build/externals/vendor/matchmedia.05942b.js');
	        addJSToDOM('/js/build/externals/originalReferenceSource/picturefill2.40a9ae.js');
	        addJSToDOM('/js/build/externals/customized/require.2.1.11.fce06e.js', 'data-main', '/js/build/main.35bb76.js');
	        if (navigator.appVersion.indexOf("MSIE 8.") != -1) {
	            var linkElem = document.createElement('link');
	            linkElem.setAttribute('rel', 'stylesheet');
	            linkElem.setAttribute('href', '/css/min/style.458d37.css');
	            document.getElementsByTagName('head')[0].appendChild(linkElem);
	        } else {
	            addCSSToDOM('/css/min/style.458d37.css');
	        }
	    }
	</script>
	<noscript>
		@if (Config.Instance.IsDevServer)
		{
	    	<link rel="stylesheet" href="/css/style.css" />
		}
		else
		{
		    <link rel="stylesheet" href="/css/min/style.458d37.css" />
		}
		
		<link rel="stylesheet" href="/css/noscript.css" />
	</noscript> 
### <noscript>
Eine *<noscript>* Sektion kann beliebig oft sowohl im *<head>* als auch im *<body>* verwendet werden. In diesem Fall dient sie als Fallback zur "gewöhnlichen" Einbinding der Stylesheets, da diese gewöhnlich per Javascript geladen werden.
return shell_exec("echo $input | $Markdown_script");
## <body>

### <... role="...">
Die Role Attribute weisen den Elementen eine eindeutige Aufgabe zu und beschreiben die Struktur der Seite. Sie dienen der Barrierefreiheit und werden von ARIA (Accessible Rich Internet Apllication) gesteuert und können dem Anwender mitteilen wo er sich befindet bzw. was ihn an der entsprechenden Position des Dokuments erwartet.

#### <header role="banner">
Der Kopfbereich des Dokuments. Er besteht typischerweis aus zentralen Inhalten und Funktionen wie z.B Logo, Navigation, Suchfunktion, etc.

#### <nav role="navigation">
Die Hauptnavigation.

#### <form role="search">
Bei Verwendung einer internen Suchfunktion.

#### <main role="main">
Hier wird der Seiteninhalt untergebracht.

#### <footer role="contentinfo">
Der Fußbereich des Dokuments. Hier werden sämtliche Metainformationen wie Copyright, Fußnoten, etc. aufgeführt. Aber auch zusätzliche Informationen zum aktuellen Dokument.
