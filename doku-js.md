1. Philosofie
2. File- und Ordnerstruktur
3. Deklaration von HTML-Module-Funktionen
4. Erstellung von Plugins

## 1. Philosophie ##
Das JM-JS-Framework verfolgt 4 wesentlichen Aspekten.

1. Verwendung von jQuery (man kann auf eine horrende Anzahl schon existierender Plugins zurückgreifen)
2. Es verfolgt das AMD-Prinzip (asynchronous module definition) (loading on demand)
3. Initialisierung der Module über Event-Delegation
4. Deklaratives Umsetzen (ähnlich CSS) der Funktionalitäten durch Kombination aus bestehenden Plugins

### die Wahl zur Verwendung von jQuery ###

Funktionalitäten im Web können mittels JavaScirpt durch verschieden Art und Weisen realisiert werden.
Bei nur sehr geringen Funktionalitäten könne Websites mit reinen JavaScirpt umgesetzt werden (Vanila JS).
Steigert sich der Funktionsumfang jedoch ist eine Abstraktionsschicht zur Vereinheitlichung der Browser-APIs und entsprechende Funktionswrapper, welche eine schnellere und einfachere Programmierung erlaubt, zu verwenden. Die sogenannten DOM-Manipulations-Frameworks wie z.B. mootools oder insbesondere jQuery haben zudem den Vorteil, dass eine Vielzahl von Programmiere ihre Plugins auf Basis dessen aufsetzen und somit eine Wiederverwendung im eigenen Projekt ermöglicht.

### AMD ###

Eine weitere Komponente des Frameworks ist die Netzwerk- und Browser-Performance sowie dessen Wartbarkeit und Skalierbarkeit. Dies wurde mit dem AMD-Prinzip (asynchronous module definition) durch RequireJS umgesetzt. Es bietet den Vorteil, dass jedes Plugin in einer eigenen Datei geschrieben ist und auch nur diese bei Bedarf geladen wird. Ein Overhead, an nicht verwendeten Code, der nicht nur geladen werden muss sondern auch geparst wird, wird so vermieden.

### Initialisierung der Module über Event-Delegation ###
die Initialisierung der Module on Demant durch die Interaktion vom User mit der Website bzw. durch das Framework selbst bei dom-ready bietet eine hohe Browser-Performance, da nur benötigte Module initialisiert werden. Dies geschieht mittels Event-Delegation. Alle Event-Listener hören auf dem body und werden dann entsprechend getriggert, wenn eine Aktion auf einem Element  



## 2. File- und Ordnerstruktur ##
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

Bei externen Dateien, welche entsprechend im externe-Ordner liegen wird nur der Dateiname als Key angegeben (ausgenommen overwritings), da diese in der Regen eindeutig genug sind.

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
Im Ordner **customized** werden externe Plugins aus dem Ordner originalReferencesSource kopiert und angepasst. Ist es möglich, die Original-Source im Nachhinein zu überschreiben, werden diese Überschreibungen in **overwritings** mit gleichnamige source gespeichert.


### mylibs-Ordner ###

Im mylibs-Ordner befinden sich 4 Unterordner (***actions***, ***custom***, ***modules*** und ***utils***) und die Datein ***_config.js***  (welche die Konfiguration der Plugins für ihren Anwendungsfall befinden) sowie die ***_super.js*** (Sie ist die "Super-Class", von der alle eigenen Plugins abgeleitet werden).

#### actions-Ordner#####

Hier werden die "actions-Plugins" hinterlegt. Mit diesen ist es möglich, Funktionen von Modulen (z.B. Navigation oder Toggelbox) zu beschreiben. Es wird hierzu ein JSON-Objekt in der _config.js angelegt und entsprechend mit den benötigten actions konfiguriert.

Folgende actions stehen zur verfügung:

- add
- ajax
- link
- remove
- scroll
- set
- sticky
- toggle
- trigger


#### modules-Ordner#####

Ist es nicht möglich die benötigte Funktionalität der Komponente mit den actions und deren Kombination umzusetzen, können im Ordner ***modules*** Plugins angelegt werden, die diese Funktionalität erfüllen. Dis die Funktionalität allerding so speziel, dass sie nicht in anderen Projekten eine Anwendung finden, ist das zu entwickelnde Plugin im Ordner ***custom*** zu hinterlegen.

#### custom-Ordner#####

Wie schon zuvor beschrieben, werden hier die speziellen Plugins hinterlegt, die nicht in anderen Projekten wiederverwendbar sind.

#### utils-Ordner#####

Hier sind die Datein helpers.js und jquery.helpers.js hinterlegt. helpers.js beinhaltet allgemeine Helper-Funktionen, die im globalen Objekt jmHF als Methoden hinterlegt sind. jquery.helpers.js sind Funktionen hinterlegt, die im jQuery-Objekt hinterlegt sind. Sie sind somit jQuery-Plugins, die wie üblich auf eine Dom-Selection angewendet werden könne. 

Bsp.: 

    var $data = $(p_data);             // p_data = '<div><p data-jmdominit="true" .....></p></div>'
    $('body').append($data);
    $data.triggerSelfexecObj();       // <- Funktion in der jquery.helpers.js


### require-css-Ordner ###

hier werden neben der css.js alle CSS-Datein abgeleg, die On-Demant für ein komplexes Modul benötigt werden. 
Hier wie z.B. video.css, die das komplette Styling des Video-Players beinhalten. Da der Video-Player jedoch nur selten zum Einsatz kommt ist das CSS nicht in der globalen styles.css integriert, sondern wird durch das Nachladen der video.css bei Bedarf in die Seite integriert.

***css.js***

Die css.js ist ein RequireJS-Plugin. Sie wird benötigt um das nachladen von CSS via RequireJS umzusetzen.  

## 3. Deklaration von HTML-Module-Funktionen ##
## 4. Erstellung von Plugins ##
