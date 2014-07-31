## File- und Ordnerstrucktur ##
Im Root-JS-Verzeichnis liegt die **main.js**. Des Weiteren liegen hier die Ordner **externals**, **mylibs** und **requre-css**.

### main.js ###
Sie wird als erste Datei von RequireJS geladen. Es werden hier alle ***Konfigurationen*** von RequireJS vorgenommen sowie alle ***body-Eventlistener*** und die ***initial ausgeführten Funktionenaufrufe*** on dom-ready.

***Konfigurationen***

In erster Linie werden unter require.config({ paths: {...} }); alle Module mit einer entsprechenden Key für den Verzeichnis-Pfad hinterlegt. 

Beispiel:


     require.config({
        paths      : {
    
            // externals

            'scrolltotop'                                      : 'externals/customized/scrolltotop',
            'jquery_autocomplete'                              : 'externals/customized/jquery.autocomplete',
            'jquery_ba-dotimeout'                              : 'externals/customized/jquery.ba-dotimeout',

    
            // mylibs
            '_config'                                          : 'mylibs/_config',
            '_super'                                           : 'mylibs/_super',
            'actions.add'                                      : 'mylibs/actions/add',
            'actions.ajax'                                     : 'mylibs/actions/ajax',

            'actions.trigger'                                  : 'mylibs/actions/trigger',
    
            'add-ons.formvalidate'                             : 'mylibs/add-ons/formvalidate',
    
            'modules.carousel'                                 : 'mylibs/modules/carousel',
            'modules.countdown'                                : 'mylibs/modules/countdown',

            'modules.video'                                    : 'mylibs/modules/video',
    
            'utils.helpers'                                    : 'mylibs/utils/helpers',
            'utils.jquery_helpers'                             : 'mylibs/utils/jquery.helpers',
            
            ...

Bei externen Datein, welche entsprechend im externe-Ordner liegen wird nur der Dateiname als Key angegeben (ausgenommen overwritings), da diese in der Regen eindeutig genug sind.

Anders verhält es sich bei den selbst erstellten Dateien die im mylibs untergebracht sind. Diese werden mit ihrer ganzen Pfadangabe exklusive mylibs angegeben, wobei ein "/" mit einem "." und ein "." mit einem "_" ersetzt wird. 


***body-Eventlistener***

Die Eventlistener, die auf dem body hören, werden entweder durch User-Interaktionen (click, change, focus, blur und nach click auf einen submitbutton -> trigger "checkValidation") oder von der execdomReadyObject-Funktion getriggert.
 

***initial ausgeführten Funktionenaufrufe***

- $body.requirementsForJmElements();
- $body.triggerSelfexecObj();
- execDomReadyObject();
- picturefill();
- jmHF.replaceSVGForOldBrowser();



### externals-Ordner ###

Hier werden die externen plugins abgelegt. Das Original-Plugin wird in **originalReferencesSource** hinterlegt, um bei Updates vergleichen zu können, welche Änderung ausschließlich der plugin-Entwickler vorgenommen hat.
Im Ordner **customized** werden externe Plugins aus dem Ordner originalReferencesSource kopiert und angepasst. Ist es möglich, die original-Source im Nachhinein zu überschreiben, werden diese Überschreibungen in **overwritings** mit gleichnamige source gespeichert.


### mylibs-Ordner ###

