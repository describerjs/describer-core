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
die Initialisierung der Module on Demant durch die Interaktion vom User mit der Website bzw. durch das Framework selbst bei dom-ready bietet eine hohe Browser-Performance, da nur die benötigte Module initialisiert werden. Dies geschieht mittels Event-Delegation. Alle Event-Listener wie z.B. **click, change, dominit, jmtrigger ...** hören auf dem **body**, der wiederum nur bei den aufgelistente elementen im **Selektor** seine **Funktion** ausführt.

	$body.on('change', 'select[data-jmname], input[type="radio"][data-jmname], etc.', function(e){ 

	});

	// $body 															-> $('body')
	// 'change'															-> Event/s
	// 'select[data-jmname], input[type="radio"][data-jmname], etc.' 	-> Selektor 
    // function(e){ 													-> Funktion

	   });

Zum Einen werden so nur eine geringe Anzahl an Event-Listener benötigt (Hörne nur auf den Body und nicht auf jedes entsprechende Element) und zum Anderen ist immer gewärleistet, dass auch interaktionen (vom User oder via dominit) auf Elemente, die durch einnen Ajax-Aufruf nachträglich in das DOM integriert werden, registriert werden.

### Deklaratives Umsetzen (ähnlich CSS) der Funktionalitäten ###

Im Web lassen sich viel Funktionalitäten aus simpeln Aktionen "actions" ableiten.
Diese sogenanten "actions" können zu Plugin-Kombinationen (oder halt actions-Kombinationen) kombiniert werde um diese gewünschten Funktionalität zu erhalten.

Die Deklaration geschieht in der _config.js. Hier ist zu jedem jmelement ein jmconfig-Objekt zu deklarieren. Im DOM werden die jmelemente mit einem Referenz-Name versehen (data-jmname="..."). Somit bleibt das HTML schlank und die Deklaration wir in einer entsprechenden Datei (_config.js) vorgenommen.

Bsp.: Konfiguration mit nur einem Plugin und Bindung an das HTML mit einer Referenz (data-jmname):

	// Beispielhafte Initialisierung im HTML:
	<a class="textlink" href="#anchor-optionen" data-jmname="anchor">Zusatzoptionen wählen</a>

-

	// Entsprechendes Config-JSON:
	{
	    jmname : 'anchor',                                  // wird im HTML referenziert
	    jmelement: 'actions.scroll',                        // Plugin
	    jmconfig : {                                        // Konfigurationsobjekt
	        'event' : 'click',                              // die Aktion soll auf User-Klick gestartet werden
	        'scrollTo' : '$(this.$elem.attr(\'href\'))'     // Angabe, wohin gescrollt werden soll
	    }
	 }


Den größten Vorteil diese Herrangehenswiese ist neben der **sehr vereinheitlichten Deklaration** die **große Wiederverwendbarkeit** der Module. Folglich werden Request gespart und die Funktionalität der Plugins ist **robuster** (weniger Fehleranfällig) durch ihre hohe Verwendung.

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

Die Deklaration geschieht in der _config.js. Hier ist zu jedem jmelement ein jmconfig-Objekt zu deklarieren. Im DOM werden die jmelemente mit einem Referenz-Name versehen (data-jmname="..."). Somit bleibt das HTML schlank und die Deklaration wir in einer entsprechenden Datei (_config.js) vorgenommen.

### Allgemeine Deklaration ###

#### Bsp. 1: Deklaration mit nur einem Plugin und Bindung an das HTML mit einer Referenz (data-jmname): ####

	// Beispielhafte Initialisierung im HTML:
	<a class="textlink" href="#anchor-optionen" data-jmname="anchor">Zusatzoptionen wählen</a>
_

	// Entsprechendes Config-JSON:
	{
	    jmname : 'anchor',                                  // wird im HTML referenziert
	    jmelement: 'actions.scroll',                        // Plugin
	    jmconfig : {                                        // Konfigurationsobjekt
	        'event' : 'click',                              // die Aktion soll auf User-Klick gestartet werden
	        'scrollTo' : '$(this.$elem.attr(\'href\'))'     // Angabe, wohin gescrollt werden soll
	    }
	 }


#### Bsp. 2: Konfiguration mit zwei Plugins und Bindung an das HTML mit einer Referenz (data-jmname): ####

	// Beispielhafte Initialisierung im HTML:
	<select class="select" data-jmname="select-email-einstellung">.....</select>

_

	//Entsprechendes Config-JSON:
	{
	    jmname : 'select-email-einstellung',                // wird im HTML referenziert
	    jmelement: 'actions.remove|actions.add',            // Plugin: wenn mehrere Plugins kombiniet werde sollen, sind diese mit einem | zu trennen.
	    // Werden gleichnamige Plugins mehrfach verwendet, sind diese im jmelement mit vorangehenden_ durchzunummerieren. Bsp.: jmelement: 'actions.remove_1|actions.add_1|actions.remove_2|actions.add_2'
	    // für jedes Plugin muss ein config-Objekt hinterlegt sein. Da hier zwei Plugins kombiniert werde, sind die config-Objekte in einem Array hinterlegt und mit einem Komma getrennt.
	    // Die Reihenfolge einspricht der Reihenfolge der Plugins im jmelement.
	    jmconfig :[                                        
	        {                                                  
	            'event' : 'change',                             // die Aktions soll bei einem change-Event des Elements stattfinden.
	            'datatype' : 'class',                           // es soll eine Klasse weggenommen werden.
	            'data' : 'show',                                // der Name lautet show.
	            // die Aktion soll auf diesem/n Element/en durchgeführt werden. (Hier wird mittels $.makeArray eine jQuery-Selection in ein Array mit HTML-Elementen umgewandelt,
	            // da diese im Plugin immer mit einem $() gewrappt werden (und somit nicht nochmal mit jQuery-Funktionalitäten versehen werden sollen.).
	            // Bei 'relatedTo' könnten z.B. auch '.classe' oder '#id' oder '[attr="..."]' angegeben werden. )
	            'relatedTo': '$.makeArray(this.$elem.closest(\'.filter-panel\').siblings(\'table\').find(\'tr\'))'
	        },
	        {
	            'event' : 'change',                             // die Aktions soll bei einem change-Event des Elements stattfinden.
	            'datatype' : 'class',                           // es soll eine Klasse hinzugefügt werden.
	            'data' : 'show',                                // der Name lautet show.
	            // die Aktion soll auf diesem/n Element/en durchgeführt werden.
	            'relatedTo': '$.makeArray($(\'[data-jmdomselector="\'+this.$elem.val()+\'"]\'))'
	        }
	    ]
	 }

#### Bsp. 3: Kombinieren von mehreren data-jmname: ####

	// Beispielhafte Initialisierung im HTML:
	// <input class="input-autocomplete" data-jmdominit="true" data-jmname="autofillInput|sync-val" data-rule-jmbankname="Bitte geben Sie eine gültigen Banknamen ein." data-rule-jmrequired="Bitte ausfüllen" id="Bank" maxlength="50" name="Payment.BankName" type="text" value="Wird automatisch ausgefüllt" disabled="disabled" tabindex="-1">

### Deklaration - Event ###

die HTML-Module-Funktionen kann durch unterschietliche Events getriggert werden. Über die Event-Listener am Body lassen sicht die Plugins durch folgende Events Initialisieren.

#### click ####

h3[data-jmname],
input[type="submit"][data-jmname],
input[type="button"][data-jmname],
button[type="submit"][data-jmname],
input[type="text"][data-jmname],
input[type="checkbox"][data-jmname],
button[type="submit"][data-jmname],
div[data-jmname],
a[data-jmname],
label[data-jmname],
tr[data-jmname],
li[data-jmname],
ul[data-jmname],
select[data-jmname]

#### change ####

select[data-jmname],
input[type="radio"][data-jmname],
input[type="checkbox"][data-jmname],
input[type="text"][data-jmname],
input[type="email"][data-jmname]

#### focus change blur checkValidation ####
NUR AUF FORM-TAGS MIT DEM ATTRIBUT data-jmname="form"


Einige Events benötigen jedoch aufgrund ihrer Bestimmtheit das Attribut data-jmdominit="true"

	// Beispielhafte Initialisierung im HTML:
	<input data-jmname="sync-val" data-jmdominit="true" type="text" name="vorname" />

Bei den hier folgenden Events ist dieses Attribut von nöten.

#### dominit ####
die Aktion wird auf domready oder wenn das HTML-Element via ajax in das DOM injektet wird ausgeführt.

#### raf ####
Die Aktion wird auf jedem requestAnimationFrame durchgeführt (bei jedem neuzeichnen des Bildes)

#### interval (angegeben in z.B. interval-5000) ####
Die Aktion wird alle 5000 ms durchgeführt

#### blur ####
Die Aktion wird auf blur durchgeführt

#### hover ####
Die Aktion wird auf hover durchgeführt

#### keyup (abgegeben in z.B. keyup-dotimeout-500)  #### 
Die Aktion wird auf keyup mit einem delay von 500 ms durchgeführt (erfolgt innerhalb dieser 500ms ein weiterer keyup-event, wird der vorherige überschrieben und die 500ms starte von neuen.)

#### jmchange ####
Die Aktion wird durchgeführt, wenn jmchange auf diesem Element getriggert wird

Beispielhafte Implementierung für diese HTML-Module-Funktione in der _config.js

	{
	    jmname : 'sync-val',                                // wird im HTML referenziert
	    jmelement: 'actions.add',                           // Plugin
	    jmconfig :{                                         // Konfigurationsobjekt
	        // das action wird bei domready, change und bei keyup mit einem delay von 500 ms (erfolgt innerhalb dieser 500ms ein weiterer keyup-event, wird der vorherige überschrieben und die 500ms starte von neuen.)
	        'event' : 'dominit|change|keyup-dotimeout-500', 
	        'datatype' : 'text',                            // es soll text hinzugefügt werden
	        // die Aktion soll auf diesem/n Element/en durchgeführt werden.
	        'relatedTo': '$.makeArray($(\'[data-jmdomselector="\'+this.$elem.attr(\'name\')+\'"]\'))', 
	        'data':'jmHF.escapeHtml(this.$elem.val())'      // der Text aus dem input-field soll hinzugefügt werden.
	    }
	 }



## 4. Erstellung von Plugins ##
