# JM-JS-Framework
1. <i class="entypo-lamp"></i>[Philosofie](#Philosofie) 
2. <i class="entypo-folder"></i>[File- und Ordnerstruktur](#Ordnerstruktur)
3. <i class="entypo-vcard"></i>[Deklaration von HTML-Module-Funktionen](#Deklaration)
4. <i class="entypo-brush"></i>[Erstellung von Plugins](#Erstellung)

## 1. <a name="Philosofie"></a>Philosophie

Das JM-JS-Framework verfolgt 4 wesentlichen Aspekten.

-	[Verwendung von jQuery](#Verwendung-von-jQuery) (man kann auf eine horrende Anzahl schon existierender Plugins zurückgreifen)
-	[Es verfolgt das AMD-Prinzip](#AMD-Prinzip) (asynchronous module definition) (loading on demand)
-	[Initialisierung der Module über Event-Delegation](#Event-Delegation)
-	[Deklaratives Umsetzen (ähnlich CSS) der Funktionalitäten durch Kombination aus bestehenden Plugins](#Deklaratives-Umsetzen)

### <a name="Verwendung-von-jQuery"></a>Die Wahl zur Verwendung von jQuery

Funktionalitäten im Web können mittels JavaScirpt durch verschieden Art und Weisen realisiert werden.
Bei nur sehr geringen Funktionalitäten könne Websites mit reinen JavaScirpt umgesetzt werden (Vanila JS).
Steigert sich der Funktionsumfang jedoch ist eine Abstraktionsschicht zur Vereinheitlichung der Browser-APIs und entsprechende Funktionswrapper, welche eine schnellere und einfachere Programmierung erlaubt, zu verwenden. Die sogenannten DOM-Manipulations-Frameworks wie z.B. mootools oder insbesondere jQuery haben zudem den Vorteil, dass eine Vielzahl von Programmiere ihre Plugins auf Basis dessen aufsetzen und somit eine Wiederverwendung im eigenen Projekt ermöglicht.

### <a name="AMD-Prinzip"></a>AMD

Eine weitere Komponente des Frameworks ist die Netzwerk- und Browser-Performance sowie dessen Wartbarkeit und Skalierbarkeit. Dies wurde mit dem AMD-Prinzip (asynchronous module definition) durch RequireJS umgesetzt. Es bietet den Vorteil, dass jedes Plugin in einer eigenen Datei geschrieben ist und auch nur diese bei Bedarf geladen wird. Ein Overhead, an nicht verwendeten Code, der nicht nur geladen werden muss sondern auch geparst wird, wird so vermieden.

### <a name="Event-Delegation"></a>Initialisierung der Module über Event-Delegation
die Initialisierung der Module on Demant durch die Interaktion vom User mit der Website bzw. durch das Framework selbst bei dom-ready bietet eine hohe Browser-Performance, da nur die benötigte Module initialisiert werden. Dies geschieht mittels Event-Delegation. Alle Event-Listener wie z.B. **click, change, dominit, jmtrigger ...** hören auf dem **body**, der wiederum nur bei den aufgelistente Elementen im **Selektor** seine **Funktion(handler)** ausführt.

	$body.on('change', 'select[data-jmname], input[type="radio"][data-jmname], etc.', function(e){ 

	});

	// $body 															-> $('body')
	// 'change'															-> Event/s
	// 'select[data-jmname], input[type="radio"][data-jmname], etc.' 	-> Selektor 
    // function(e){ ... });												-> Funktion

Zum Einen werden so nur eine geringe Anzahl an Event-Listener benötigt (Hörne nur auf den Body und nicht auf jedes entsprechende Element) und zum Anderen ist immer gewärleistet, dass auch interaktionen (vom User oder via dominit) auf Elemente, die durch einnen Ajax-Aufruf nachträglich in das DOM integriert werden, registriert werden.

### <a name="Deklaratives-Umsetzen"></a>Deklaratives Umsetzen (ähnlich CSS) der Funktionalitäten

Im Web lassen sich viel Funktionalitäten aus simpeln Aktionen (hier im Framework "actions" genannt) ableiten.
Diese sogenanten "actions" können zu Plugin-Kombinationen (oder halt actions-Kombinationen) kombiniert werde um diese gewünschten Funktionalität zu erhalten.

Die Deklaration geschieht in der ```_config.js```. Hier ist zu jedem jmplugin ein jmconfig-Objekt zu deklarieren. Im DOM werden die jmplugins mit einem Referenz-Name versehen ```data-jmname="..."```. Somit bleibt das HTML schlank und die Deklaration wir in einer entsprechenden Datei (```_config.js```) vorgenommen.

Bsp.: Konfiguration mit nur einem Plugin und Bindung an das HTML mit einer Referenz (data-jmname):

	// Beispielhafte Initialisierung im HTML:
	<a class="textlink" href="#anchor-optionen" data-jmname="anchor">Zusatzoptionen wählen</a>

-

	// Entsprechendes Config-JSON:
	{
	    jmname : 'anchor',                                  // wird im HTML referenziert
	    jmplugin: 'actions.scroll',                        // Plugin
	    jmconfig : {                                        // Konfigurationsobjekt
	        'event' : 'click',                              // die Aktion soll auf User-Klick gestartet werden
	        'scrollTo' : '$(this.$elem.attr(\'href\'))'     // Angabe, wohin gescrollt werden soll
	    }
	 }


Den größten Vorteil diese Herrangehenswiese ist neben der **sehr vereinheitlichten Deklaration** die **große Wiederverwendbarkeit** der Module. Folglich werden Request gespart und die Funktionalität der Plugins ist **robuster** (weniger Fehleranfällig) durch ihre hohe Verwendung.

## 2. <a name="Ordnerstruktur"></a>File- und Ordnerstruktur ##
Im Root-JS-Verzeichnis liegen die Dateien ```require-main.js``` und ```empty.js```. Des Weiteren liegen hier die Ordner **externals**, **mylibs** und **requre-css**.

### require-main.js ###
Sie wird als erste Datei von RequireJS geladen und ist die Basis des JMUI-Frameworks. Hier werden neben den body-Eventlistener für die Plugin-Initialisierung via Event-Delegation und den initial ausgeführten Funktionenaufrufe on dom-ready alle Plugins mit ihrem ***Verzeichnis-Pfad*** hinterlegt.


***Verzeichnis-Pfad der Plugins***

Er dient zum einen um eine **kürzere Referenz** auf das Plugin im require-Array zu bekommen und zum anderen ist er für die **Versionierung** notwendig. 

**Beispiel** des paths-Objekts in Anlehnung der **kürzeren Referenz**:


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
        
            'modules.carousel'                                 : 'mylibs/modules/carousel',
			'modules.carousel-ts'                              : 'mylibs/modules/carousel-ts',
            'modules.countdown'                                : 'mylibs/modules/countdown',

            'modules.video'                                    : 'mylibs/modules/video',
    
            'utils.helpers'                                    : 'mylibs/utils/helpers',
            'utils.jquery_helpers'                             : 'mylibs/utils/jquery.helpers',
            
            ...


Bei externen Dateien, welche entsprechend im externe-Ordner liegen wird nur der Dateiname als Key angegeben (ausgenommen overwritings), da diese in der Regen eindeutig genug sind.

Anders verhält es sich bei den selbst erstellten Dateien die im mylibs untergebracht sind. Diese werden mit ihrer ganzen Pfadangabe exklusive mylibs angegeben, wobei ein "/" mit einem "." und ein "." mit einem "_" ersetzt wird. 


**Beispiel** des paths-Objekts in Anlehnung an die **Versionierung** (versionierte require-main.fc251c.js):

	require.config({
	        paths      : {
	    
	            // externals
	
	            'scrolltotop'                                      : 'build/externals/customized/scrolltotop.b08575',
	            'jquery_autocomplete'                              : 'build/externals/customized/jquery.autocomplete.f69d17',
	            'jquery_ba-dotimeout'                              : 'build/externals/customized/jquery.ba-dotimeout.5af41c',
	

	            // mylibs
	            '_config'                                          : 'build/mylibs/_config.525c11',
	            '_super'                                           : 'build/mylibs/_super.9ff67a',
	            'actions.add'                                      : 'build/mylibs/actions/add.7e0ccd',
	            'actions.ajax'                                     : 'build/mylibs/actions/ajax.db6fa1',
	
	            'actions.trigger'                                  : 'build/mylibs/actions/trigger.8806d2',
	    	    
	            'modules.carousel'                                 : 'build/mylibs/modules/carousel.4381f9',
				'modules.carousel-ts'                              : 'build/empty',
	            'modules.countdown'                                : 'build/mylibs/modules/countdown.618b24',
	
	            'modules.video'                                    : 'build/mylibs/modules/video.22266d',
	    
	            'utils.helpers'                                    : 'build/mylibs/utils/helpers.021d32',
	            'utils.jquery_helpers'                             : 'build/mylibs/utils/jquery.helpers.6fed76',
	            
	            ...

Bei der versionierten require-main.js werden die Pfade wie folgt angepasst. Jeder Pfad wird um das prefix 'build/' erweiter, so das die Module alle aus dem neu angelegten build-Ordner geladen werden. Zudem erhalten die Dateinamen einen md5-hash, der via Grunt hinzugefügt werden. So wird das Cach-bustin unterbunden, da bei einer Modul-Änderung automatisch ein neue md5-hash (checksum) gebildet wird. Liegen keine Änderungen in der Datei vor, wird auch kein neue md5-hash gebildet und die Datei wird aus dem Browser-Cach bzw. aus dem localStorge geladen.

### empty.js ###

Die einzige Aufgabe der empty.js ist es, die Modul-Ladefunktionalität aufrecht zu halten und so das Plugin mit einem **lehres Objekt** zu erweitern.
*Beispiel*:
Soll bei der Auslieferung des Produkts ein Touch-Support nicht unterstützt werden, werden die entsprechenden Datein mit der Endung "-ts" (die den Support für das Modul bieten) aus dem Build-Ordner gelöscht. Demzufolge würde jedoch die Ladefunktionalität 

	define(['jquery', '_super', 'modules.carousel-ts'], function ($, _super, ts){ ...

von RequireJS fehlschlagen. Hier kommt die empty.js zum Einsatz. Auf sie wird im Datei-Pfade (siehe vorrangegangenes Beispiel der require-main.fc251c.js) verwiesen, welcher durch Grunt bei einer nicht vorhandener Datei automatisch gesetzt wird. Eine Versionierung ist hier nicht Notwendig, da der Inhalt sich nie änder wird.

### externals-Ordner ###

Hier werden die externen plugins abgelegt. Das Original-Plugin wird in **originalReferencesSource** hinterlegt, um bei Updates vergleichen zu können, welche Änderung ausschließlich der plugin-Entwickler vorgenommen hat.
Im Ordner **customized** werden externe Plugins aus dem Ordner originalReferencesSource kopiert und angepasst. Ist es möglich, die Original-Source im Nachhinein zu überschreiben, werden diese Überschreibungen in **overwritings** mit gleichnamige source gespeichert.


### mylibs-Ordner ###

Im mylibs-Ordner befinden sich 4 Unterordner (***actions***, ***custom***, ***modules*** und ***utils***) und die Datein ```_config.js```  (welche die Konfiguration der Plugins für ihren Anwendungsfall befinden) sowie die ```_super.js``` (Sie ist die "Super-Class", von der alle eigenen Plugins abgeleitet werden).

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

Hier sind die Datein ```helpers.js``` und ```jquery.helpers.js``` hinterlegt. ```helpers.js``` beinhaltet allgemeine Helper-Funktionen, die im globalen Objekt jmHF als Methoden hinterlegt sind. ```jquery.helpers.js``` sind Funktionen hinterlegt, die im jQuery-Objekt hinterlegt sind. Sie sind somit jQuery-Plugins, die wie üblich auf eine Dom-Selection angewendet werden könne. 

Bsp.: 

    var $data = $(p_data);             // p_data = '<div><p data-jmdominit="true" .....></p></div>'
    $('body').append($data);
    $data.triggerSelfexecObj();       // <- Funktion in der jquery.helpers.js


### require-css-Ordner ###

hier werden neben der ```css.js``` alle CSS-Datein abgeleg, die On-Demant für ein komplexes Modul benötigt werden. 
Hier wie z.B. ```video.css```, die das komplette Styling des Video-Players beinhalten. Da der Video-Player jedoch nur selten zum Einsatz kommt ist das CSS nicht in der globalen styles.css integriert, sondern wird durch das Nachladen der video.css bei Bedarf in die Seite integriert.

***css.js***

Die ```css.js``` ist ein RequireJS-Plugin. Sie wird benötigt um das nachladen von CSS via RequireJS umzusetzen.  


## 3. <a name="Deklaration"></a>Deklaration von HTML-Module-Funktionen ##

Die Deklaration geschieht als Objekt in der ```_config.js```. Die Auslagerung der Deklaration aus dem DOM hat zwei Vorteile. Zum einen bleibt das HTML schlank und Übersichtlich und zum Anderen befindet sich die Konfigurationen aller HTML-Module-Funktionen an einem zentralen Ort. 
Es ist mit der Anwendung von CSS vergleichbar. Hier werden auch die styles des Tags mit einer Klasse beschrieben und die Klassen werden in einer CSS-Datei deklariert.

Die Deklaration in der ```_config.js``` bestehend aus:


1. jmname
2. jmplugin
3. jmconfig

einfaches Beispiel:

	{
	    jmname : 'anchor',
	    jmplugin: 'actions.scroll',
	    jmconfig : {
	        'event' : 'click',
			'scrollTo' : '$(this.$elem.attr(\'href\'))'
	    }
	 }




###jmname###

Mit jmname wird die HTML-Module-Funktionalität beschrieben. Ebenso wird dieses im HTML-Tag angebeben und dient so als Referenz. 

	<a class="textlink" href="#anchor-optionen" data-jmname="anchor">Zusatzoptionen wählen</a>


###jmplugin###

Hier wird das zu verwendete Plugin bzw. die zu verwendeten Plugins angegeben. Werden für die HTML-Module-Funktionalität mehrer Plugins benötigt, werden diese mit "|" separiert.

Beispiel-Part:

	jmplugin: 'actions.remove|actions.add',

###jmconfig###

Für jedes jmplugin ist ein eigenes jmconfig-Objekt anzulenge. Bei mehreren Plugins sind diese in ein Array zu schreiben, wobei die Reihenfolge der Objekte der Reihenfolge der Plugins in jmplugin entspricht.

Beispiel einer kompletten HTML-Module-Funktionalität:

	{
		jmname : 'select-email-einstellung', 
		jmplugin: 'actions.remove|actions.add',            
		jmconfig :[                                        
	        {                                                  
	            'event' : 'change', 
	            'datatype' : 'class',
	            'data' : 'show',
	            'relatedTo': '$.makeArray(this.$elem.closest(\'.filter-panel\').siblings(\'table\').find(\'tr\'))'
	        },
	        {
	            'event' : 'change',
				'datatype' : 'class',
	            'data' : 'show',
				'relatedTo': '$.makeArray($(\'[data-jmdomselector="\'+this.$elem.val()+\'"]\'))'
	        }
	    ]
	}

Wie auch im CSS ist das Überschreiben bestimmter Values in **Ausnahmefällen** in HTML möglich.

### Deklaration im DOM für die Attribute data-jmname und data-jmconfig ###

Folgend werden mehrere Beispiele aufgelistet, wie eine Deklaration der HTML-Module-Funktionalität im DOM je nach Anwendungsfall aussehen könnte. Es wird zudem die Möglichkeit aufgezeigt, wie ein Überschreiben der jmconfig durch die Angabe des *data-jmconfig*-Attributs aussehen könnte.

Beispiel aus der ```_config.js```

	...
	{
	    jmname : 'ex-one-obj', 
	    jmplugin: 'actions.add',            
	    jmconfig : {
			'event' : 'click',
	        'data': 'alt'
			...
	    }
	},
	{
	    jmname : 'ex-two-obj', 
	    jmplugin: 'actions.add_1|actions.add_2',            
	    jmconfig : [{
			'event' : 'click',
	        'data': 'alt1'
			...
	    },{
			'event' : 'hover',
	        'data': 'alt2'
			...
	    }]
	}


#### Beispiel 1
Beispiel mit einem data-jmname und dem überschreiben eines key-value-Pair des entsprechendem data-jmconfig-Objekt (hier für das Plugin actions.add):

	<div data-jmname="ex-one-obj" data-jmconfig="{ 'data': 'neu' }">click</div>

##### Alternative Angabe zu Beispiel 1 
data-jmconfig-Objekt mit einem [ ] gewrappt (-> unnötiger mehraufwand):


	<div data-jmname="ex-one-obj" data-jmconfig="[{ 'data': 'neu' }]">click</div>

##### Alternative 2
data-jmconfig-Objekt wird zusätzlich in ein Objekt gewrappt, wobei das jmconfig-Objket als Value für die jmnames-Angabe steht. (-> unnötiger mehraufwand. wird nur benötigt, wenn mehrere HTML-Module-Funktionalitäten (via "|" getrennt) im data-jmname-Attribut gelistet sind)

	<div data-jmname="ex-one-obj" data-jmconfig="{'ex-one-obj': { 'data': 'neu' }}">click</div>

-> *Es wird die data-Angabe für das jmconfig-Objekt in der -config.js überschrieben.*

2) Beispiel mit einem data-jmname und dem überschreiben von mehreren key-value-Pairs der entsprechenden data-jmconfig-Objekte (hier für die Plugins actions.add_1 und actions.add_2 alias actions.add):

	<div data-jmname="ex-two-obj" data-jmconfig="[{ 'data': 'neu1' }, { 'event' : 'click', 'data': 'neu2' }]">click</div>

Alternative: data-jmconfig-Objekt wird zusätzlich in ein Objekt gewrappt, wobei das jmconfig-Array als Value für die jmnames-Angabe steht. (-> unnötiger mehraufwand. wird nur benötigt, wenn mehrere HTML-Module-Funktionalitäten (via "|" getrennt) im data-jmname-Attribut gelistet sind)

	<div data-jmname="ex-two-obj" data-jmconfig="{'ex-two-obj': [{ 'data': 'neu' }, { 'event' : 'click', 'data': 'neu2' }]}">click</div>

*Es wird zum einen die "data"-Angabe für das Plugin actions.add_1 ('data': 'alt') im jmconfig-Array (erstes Objekt) mit "neu" überschrieben und zum anderen wird für das Plugin actions.add_2 die "event"- und die "data"-Angabe ('event' : 'hover', 'data': 'alt2') mit "click" bzw. "neu2" überschrieben.*

> Wichtig! die Erweiterung des Plugin-Namens ..._1 oder ..._2 etc ist notwendig, da hier ein Plugin mehrmals für eine HTML-Module-Funktionalität in unterschielichen Konfigurationen verwendet wird. Andernfalls ist es dem Framework nicht möglicht zu überprüfen, ob das Plugin schon initialisiert wurde oder nicht.

3) Beispiel mit zwei data-jmnamen und dem überschreiben von mehreren key-value-Pairs der entsprechenden data-jmconfig-Objekte (hier für die Plugins actions.add (HTML-Module-Funktionalität: ex-one-obj), sowei actions.add_1 und actions.add_2 alias actions.add (HTML-Module-Funktionalität: ex-two-obj)):


	<div data-jmname="ex-one-obj|ex-two-obj" data-jmconfig="{ 'ex-one-obj' : { 'data': 'neu' }, 'ex-two-obj' : [{ 'data': 'neu1' }, { 'event' : 'click', 'data': 'neu2' }]}">click</div>


4) Beispiel mit einem data-jmname und dem überschreiben von nur einem key-value-Pairs des entsprechenden data-jmconfig-Objekte (hier für die Plugins actions.add_2 alias actions.add):

	<div data-jmname="ex-two-obj" data-jmconfig="[{}, { 'event' : 'click', 'data': 'neu2' }]">click</div>

> Wichtig! Betrifft die Überschreibung nicht alle Plugins, so sind für diese Plugins lehren Objekt anzugeben.



### Deklaration der Funktionalität des Plugins ###
// TODO Andreas noch überarbeiten
Die Funktionalitäten werden in der _config.js in einem entsprechenden Objekt deklariert. folgende Keys können für das entsprechende Plugin verwendet werden. Die unterstützen Plugins werden in ihrer Detailbeschreibung aufgelistet.

- event (für alle Plugins required)
- conditio (für alle Plugins)
- relatedTo
- datatype
- data
- wait
- url
- inject
- scrollTo (offsetangabe integrieren zuvor eigener key -> scrollToOffset)
- type  (zuvor method genannt im ajax-module)
- callback (zuvor afterexec genannt im ajax-module)  this.trigger('jmtrigger')? Erweitern des Eventlisteners in der _super.js z.B. jmtrigger:jmname+jmplugin
- width - modules.video
- height - modules.video
- zipcode - modules.formcomponents.autocomplete
- nextFocus - zuvor nextFocusNameAttr - modules.formcomponents.autocomplete
- animationsdelay - zuvor delay - modules.carousel
- loader - actions.link/actions.ajax
- loaderTo - zuvor additionalloadertarget - actions.ajax
- submit - zuvor ajax - modules.formcomponents.formvalidate
- // obsolate sollte als default zählen - hideby - modules.formcomponents.autocomplete
- //opposition - modules.dependentSelectionGroup
















#### event ####

die HTML-Module-Funktionen können durch unterschietliche Events ausgelöst werden. Über die Event-Listener am Body lassen sicht die Plugins durch folgende Events Initialisieren. 


- click (**alle** [data-jmname])
- change (**select**[data-jmname], **input**[data-jmname], **textarea**[data-jmname])
- jmtrigger (**alle** [data-jmname])


Nur bei dem form-Tag mit [data-jmname="form"] sind noch die events focus, blur, change und checkValidation als Event-Listener regirstiert.



##### click #####


##### change #####


##### jmtrigger #####

Folgende Events lassen sich nur durch die Angabe von data-jmdominit="true" als Data-Attribut im HTML aktivieren. Sie sind auch auf alle Tags anwendbar.


	// Beispielhafte Initialisierung im HTML:
	<input data-jmname="sync-val" data-jmdominit="true" type="text" name="vorname" />


##### dominit #####
die Aktion wird auf domready oder wenn das HTML-Element via ajax in das DOM injektet wird ausgeführt.

##### raf #####
Die Aktion wird auf jedem requestAnimationFrame durchgeführt (bei jedem neuzeichnen des Bildes)

##### interval-xxx (angegeben in z.B. interval-5000) #####
Die Aktion wird alle 5000 ms durchgeführt

##### blur #####
Die Aktion wird auf blur durchgeführt

##### hover #####
Die Aktion wird auf hover durchgeführt

##### keyup/keyup-delay-xxx (abgegeben in z.B. keyup-delay-500)  ##### 
Die Aktion wird auf keyup mit einem delay von 500 ms durchgeführt (erfolgt innerhalb dieser 500ms ein weiterer keyup-event, wird der vorherige überschrieben und die 500ms starte von neuen.)


Beispielhafte Implementierung für diese HTML-Module-Funktione in der _config.js:

	{
	    jmname : 'sync-val',
	    jmplugin: 'actions.add',
	    jmconfig: {
	        'event': 'dominit|change|keyup-delay-500', 
	        'datatype': 'text',
	        'relatedTo': '$.makeArray($(\'[data-jmdomselector="\'+this.$elem.attr(\'name\')+\'"]\'))', 
	        'data': 'jmHF.escapeHtml(this.$elem.val())'
	    }
	 }

Die HTML-Module-Funktionalität wird bei **domready**, **change** und bei **keyup** mit einem delay von 500 ms ausgefürt.




## 4. Erstellung von Plugins ##


-ts berücksichtigen
empty.js berücksichtigen