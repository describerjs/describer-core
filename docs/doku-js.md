# JM-JS-Framework
- 1 <i class="entypo-lamp"></i>[Philosofie](#Philosofie) 
- 2 <i class="fontawesome-sitemap"></i>[File- und Ordnerstruktur](#Ordnerstruktur)
- 3 <i class="entypo-vcard"></i>[Deklaration von HTML-Module-Funktionen](#Deklaration)
- 4 <i class="entypo-brush"></i>[Erstellung von Plugins](#Erstellung)

## 1 <i class="entypo-lamp"></i><a name="Philosofie"></a>Philosophie

Das JM-JS-Framework verfolgt 4 wesentlichen Aspekten:

-    [1.1 Verwendung von jQuery](#Verwendung-von-jQuery) (man kann auf eine horrende Anzahl schon existierender Plugins zurückgreifen)
-    [1.2 Es verfolgt das AMD-Prinzip](#AMD-Prinzip) (asynchronous module definition) (loading on demand)
-    [1.3 Initialisierung der Module über Event-Delegation](#Event-Delegation)
-    [1.4 Deklaratives Umsetzen (ähnlich CSS) der Funktionalitäten durch Kombination aus bestehenden Plugins](#Deklaratives-Umsetzen)

### <a name="Verwendung-von-jQuery"></a>1.1 Die Wahl zur Verwendung von jQuery

Funktionalitäten im Web können mittels JavaScirpt durch verschieden Art und Weisen realisiert werden.
Bei nur sehr geringen Funktionalitäten könne Websites mit reinen JavaScirpt umgesetzt werden (Vanila JS).
Steigert sich der Funktionsumfang jedoch ist eine Abstraktionsschicht zur Vereinheitlichung der Browser-APIs und entsprechende Funktionswrapper, welche eine schnellere und einfachere Programmierung erlaubt, zu verwenden. Die sogenannten DOM-Manipulations-Frameworks wie z.B. mootools oder insbesondere jQuery haben zudem den Vorteil, dass eine Vielzahl von Programmiere ihre Plugins auf Basis dessen aufsetzen und somit eine Wiederverwendung im eigenen Projekt ermöglicht.

### <a name="AMD-Prinzip"></a>1.2 AMD

Eine weitere Komponente des Frameworks ist die Netzwerk- und Browser-Performance sowie dessen Wartbarkeit und Skalierbarkeit. Dies wurde mit dem AMD-Prinzip (asynchronous module definition) durch RequireJS umgesetzt. Es bietet den Vorteil, dass jedes Plugin in einer eigenen Datei geschrieben ist und auch nur diese bei Bedarf geladen wird. Ein Overhead, an nicht verwendeten Code, der nicht nur geladen werden muss sondern auch geparst wird, wird so vermieden.

### <a name="Event-Delegation"></a>1.3 Initialisierung der Module über Event-Delegation
die Initialisierung der Module on Demant durch die Interaktion vom User mit der Website bzw. durch das Framework selbst bei dom-ready bietet eine hohe Browser-Performance, da nur die benötigte Module initialisiert werden. Dies geschieht mittels Event-Delegation. Alle Event-Listener wie z.B. **click, change, dominit, jmtrigger ...** hören auf dem **body**, der wiederum nur bei den aufgelistente Elementen im **Selektor** seine **Funktion(handler)** ausführt.

    $body.on('change', 'select[data-jmname], input[type="radio"][data-jmname], etc.', function(e){ 
        ...
    });

|                  |                  |                       |  
| ----------------- | ----------------- | ---------------------------- |
| ```$body```  |<i class="fontawesome-hand-right"></i> | $('body')            |
| ```'change'```|<i class="fontawesome-hand-right"></i>| Event/s            |
| ```'select[data-jmname], input[type="radio"][data-jmname], etc.'```|<i class="fontawesome-hand-right"></i>| Selektor |
| ```function(e){ ... });```|<i class="fontawesome-hand-right"></i>| Funktion |


Zum einen werden so nur eine geringe Anzahl an Event-Listener benötigt (Hörne nur auf den Body und nicht auf jedes entsprechende Element) und zum anderen ist immer gewährleistet, dass auch Interaktionen (vom User oder via dominit) auf Elemente, die durch einen Ajax-Aufruf nachträglich in das DOM integriert werden, registriert werden.

### <a name="Deklaratives-Umsetzen"></a>1.4 Deklaratives Umsetzen (ähnlich CSS) der Funktionalitäten

Im Web lassen sich viel Funktionalitäten aus simplen Aktionen (hier im Framework "actions" genannt) ableiten.
Diese sogenannten "actions" können zu Plugin-Kombinationen (oder halt actions-Kombinationen) kombiniert werde um diese gewünschten Funktionalität zu erhalten.

Die Deklaration geschieht in der [```_config.js```](#_config). Hier ist zu jedem jmplugin ein jmconfig-Objekt zu deklarieren. Im DOM werden die jmplugins mit einem Referenz-Name versehen ```data-jmname="..."```. Somit bleibt das HTML schlank und die Deklaration wir in einer entsprechenden Datei ([```_config.js```](#_config)) vorgenommen.

<i class="fontawesome-beaker"></i> Beispiel: Konfiguration mit nur einem Plugin und Bindung an das HTML mit einer Referenz (data-jmname):
~~~
    // Beispielhafte Initialisierung im HTML:
    <a class="textlink" href="#anchor-optionen" data-jmname="anchor">Zusatzoptionen wählen</a>

~~~
~~~

    // Entsprechendes Config-JSON:
    {
        jmname : 'anchor',                                  // wird im HTML referenziert
        jmplugin: 'actions.scroll',                        // Plugin
        jmconfig : {                                        // Konfigurationsobjekt
            'event' : 'click',                              // die Aktion soll auf User-Klick gestartet werden
            'scrollTo' : '$(this.$elem.attr(\'href\'))'     // Angabe, wohin gescrollt werden soll
        }
     }

~~~
Den größten Vorteil diese Herangehensweise ist neben der **sehr vereinheitlichten Deklaration** die **große Wiederverwendbarkeit** der Module. Folglich werden Request gespart und die Funktionalität der Plugins ist **robuster** (weniger Fehleranfällig) durch ihre hohe Verwendung.

## 2 <i class="fontawesome-sitemap"></i><a name="Ordnerstruktur"></a>File- und Ordnerstruktur
Im JS-Verzeichnis liegen die Dateien **require-main.js** und **empty.js**. Des Weiteren liegen hier die Ordner **externals**, **mylibs** und **requre-css**.

- 2.1 [<i class="fontawesome-file"></i>require-main.js](#require-main)
- 2.2 [<i class="fontawesome-file"></i>empty.js](#empty)
- 2.3 [<i class="entypo-folder"></i>externals](#externals)
- 2.4 [<i class="entypo-folder"></i>mylibs](#mylibs)
    - 2.4.1 [<i class="entypo-folder"></i>actions](#actions)
    - 2.4.2 [<i class="entypo-folder"></i>modules](#modules)
    - 2.4.3 [<i class="entypo-folder"></i>custom](#custom)
    - 2.4.4 [<i class="entypo-folder"></i>utils](#utils)
- 2.5 [<i class="entypo-folder"></i>requre-css](#requre-css)
    - 2.5.1 [<i class="fontawesome-file"></i>css.js](#cssjs)

### <a name="require-main"></a>2.1 <i class="fontawesome-file"></i>require-main.js
Sie wird als erste Datei von RequireJS geladen und ist die Basis des JMUI-Frameworks. Hier werden neben den body-Eventlistener für die Plugin-Initialisierung via Event-Delegation und den initial ausgeführten Funktionenaufrufe on dom-ready alle Plugins mit ihrem ***Verzeichnis-Pfad*** hinterlegt.


#### Verzeichnis-Pfad der Plugins

Er dient zum einen um eine **kürzere Referenz** auf das Plugin im require-Array zu bekommen und zum anderen ist er für die **Versionierung** notwendig. 

<i class="fontawesome-beaker"></i> Beispiel des paths-Objekts in Anlehnung der **kürzeren Referenz**:


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


Bei externen Dateien, welche entsprechend im externe-Ordner liegen wird nur der Dateiname als Key angegeben (ausgenommen overwritings), da diese in der Regen eindeutig genug sind. Anders verhält es sich bei den selbst erstellten Dateien die im mylibs untergebracht sind. Diese werden mit ihrer ganzen Pfadangabe exklusive mylibs angegeben, wobei ein "/" mit einem "." und ein "." mit einem "_" ersetzt wird. 


<i class="fontawesome-beaker"></i> Beispiel des paths-Objekts in Anlehnung an die **Versionierung** (versionierte require-main.fc251c.js):

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

Bei der versionierten require-main.js werden die Pfade wie folgt angepasst. Jeder Pfad wird um das prefix 'build/' erweitert, so dass die Module alle aus dem neu angelegten build-Ordner geladen werden. Zudem erhalten die Dateinamen einen md5-hash, der via Grunt hinzugefügt werden. So wird das Cach-bustin unterbunden, da bei einer Modul-Änderung automatisch ein neue md5-hash (checksum) gebildet wird. Liegen keine Änderungen in der Datei vor, wird auch kein neue md5-hash gebildet und die Datei wird aus dem Browser-Cach bzw. aus dem localStorge geladen.

### <a name="empty"></a>2.2 <i class="fontawesome-file"></i>empty.js

Die einzige Aufgabe der empty.js ist es, die Modul-Ladefunktionalität aufrecht zu halten und so das Plugin mit einem **lehren Objekt** zu erweitern.
*Beispiel*:
Soll bei der Auslieferung des Produkts ein Touch-Support nicht unterstützt werden, werden die entsprechenden Dateien mit der Endung "-ts" (die den Support für das Modul bieten) aus dem Build-Ordner gelöscht. Demzufolge würde jedoch die Ladefunktionalität 
~~~
define(['jquery', '_super', 'modules.carousel-ts'], function ($, _super, ts){ ... 
~~~
von RequireJS fehlschlagen. Hier kommt die empty.js zum Einsatz. Auf sie wird im Datei-Pfade (siehe vorrangegangenes Beispiel der require-main.fc251c.js) verwiesen, welcher durch Grunt bei einer nicht vorhandener Datei automatisch gesetzt wird. Eine Versionierung ist hier nicht Notwendig, da der Inhalt sich nie ändern wird.

### <a name="externals"></a>2.3 <i class="entypo-folder"></i>externals-Ordner

Hier werden die externen Plugins abgelegt. Das Original-Plugin wird in **originalReferencesSource** hinterlegt, um bei Updates vergleichen zu können, welche Änderung ausschließlich der Plugin-Entwickler vorgenommen hat.
Im Ordner **customized** werden externe Plugins aus dem Ordner originalReferencesSource kopiert und angepasst. Ist es möglich, die Original-Source im Nachhinein zu überschreiben, werden diese Überschreibungen in **overwritings** mit gleichnamige source gespeichert.


### <a name="mylibs"></a>2.4 <i class="entypo-folder"></i>mylibs-Ordner

Im mylibs-Ordner befinden sich 4 Unterordner (***actions***, ***custom***, ***modules*** und ***utils***) und die Datein [```_config.js```](#_config)  (welche die Konfiguration der Plugins für ihren Anwendungsfall befinden) sowie die ```_super.js``` (Sie ist die "Super-Class", von der alle eigenen Plugins abgeleitet werden).

#### <a name="actions"></a>2.4.1 <i class="entypo-folder"></i>actions-Ordner

Hier werden die "actions-Plugins" hinterlegt. Mit diesen ist es möglich, Funktionen von Modulen (z.B. Navigation oder Toggelbox) zu beschreiben. Es wird hierzu ein JSON-Objekt in der [```_config.js```](#_config) angelegt und entsprechend mit den benötigten actions konfiguriert.

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


#### <a name="modules"></a>2.4.2 <i class="entypo-folder"></i>modules-Ordner

Ist es nicht möglich die benötigte Funktionalität der Komponente mit den actions und deren Kombination umzusetzen, können im Ordner ***modules*** Plugins angelegt werden, die diese Funktionalität erfüllen. Dis die Funktionalität allerding so speziell, dass sie nicht in anderen Projekten eine Anwendung finden, ist das zu entwickelnde Plugin im Ordner ***custom*** zu hinterlegen.

#### <a name="custom"></a>2.4.3 <i class="entypo-folder"></i>custom-Ordner

Wie schon zuvor beschrieben, werden hier die speziellen Plugins hinterlegt, die nicht in anderen Projekten wiederverwendbar sind.

#### <a name="utils"></a>2.4.4 <i class="entypo-folder"></i>utils-Ordner

Hier sind die Datein ```helpers.js``` und ```jquery.helpers.js``` hinterlegt. ```helpers.js``` beinhaltet allgemeine Helper-Funktionen, die im globalen Objekt jmHF als Methoden hinterlegt sind. ```jquery.helpers.js``` sind Funktionen hinterlegt, die im jQuery-Objekt hinterlegt sind. Sie sind somit jQuery-Plugins, die wie üblich auf eine Dom-Selektion angewendet werden könne. 

<i class="fontawesome-beaker"></i> Beispiel: 

    var $data = $(p_data);             // p_data = '<div><p data-jmdominit="true" .....></p></div>'
    $('body').append($data);
    $data.triggerSelfexecObj();       // <- Funktion in der jquery.helpers.js


### <a name="requirecss"></a>2.5 <i class="entypo-folder"></i>require-css-Ordner

hier werden neben der ```css.js``` alle CSS-Dateien abgelegt, die On-Demant für ein komplexes Modul benötigt werden. 
Hier wie z.B. ```video.css```, die das komplette Styling des Video-Players beinhalten. Da der Video-Player jedoch nur selten zum Einsatz kommt ist das CSS nicht in der globalen styles.css integriert, sondern wird durch das Nachladen der video.css bei Bedarf in die Seite integriert.

#### <a name="cssjs"></a>2.5.1 <i class="fontawesome-file"></i>css.js

Die ```css.js``` ist ein RequireJS-Plugin. Sie wird benötigt um das nachladen von CSS via RequireJS umzusetzen.  

----------

## 3 <i class="entypo-vcard"></i><a name="Deklaration"></a>Deklaration von HTML-Module-Funktionen

- 3.1 <i class="entypo-vcard"></i>[Deklaration in der _config.js](#_config)
- 3.2 <i class="entypo-vcard"></i>[Deklaration im DOM für die Attribute data-jmname und data-jmconfig](#Deklaration-im-DOM)
- 3.3 <i class="entypo-vcard"></i>[Deklaration der Funktionalität des Plugins](#Deklaration-der-Funktionalitaet)


### 3.1 <a name="_config"></a><i class="entypo-vcard"></i>Deklaration in der _config.js

Die Deklaration geschieht als Objekt in der [```_config.js```](#_config). Die Auslagerung der Deklaration aus dem DOM hat zwei Vorteile. Zum einen bleibt das HTML schlank und Übersichtlich und zum anderen befindet sich die Konfiguration aller HTML-Module-Funktionen an einem zentralen Ort. 
Es ist mit der Anwendung von CSS vergleichbar. Hier werden auch die styles des Tags mit einer Klasse beschrieben und die Klassen werden in einer CSS-Datei deklariert.

Das Deklaration-Objekt bestehend aus:

- <i class="entypo-tag"></i>[jmname](#jmname)
- [jmplugin](#jmplugin)
- <i class="fontawesome-cogs"></i>[jmconfig](#jmconfig)

<i class="fontawesome-beaker"></i> Beispiel:

    {
        jmname : 'anchor',
        jmplugin: 'actions.scroll',
        jmconfig : {
            'event' : 'click',
            'scrollTo' : '$(this.$elem.attr(\'href\'))'
        }
     }




#### <a name="jmname"></a><i class="entypo-tag"></i>jmname

Mit jmname wird die HTML-Module-Funktionalität beschrieben. Ebenso wird dieses im HTML-Tag angegeben und dient so als Referenz. 

    <a class="textlink" href="#anchor-optionen" data-jmname="anchor">Zusatzoptionen wählen</a>


#### <a name="jmplugin"></a> jmplugin

Hier wird das zu verwendete Plugin bzw. die zu verwendeten Plugins angegeben. Werden für die HTML-Module-Funktionalität mehrere Plugins benötigt, werden diese mit " | " separiert.

Beispiel-Part:

    jmplugin: 'actions.remove|actions.add',

#### <a name="jmconfig"></a><i class="fontawesome-cogs"></i>jmconfig

Für jedes jmplugin ist ein eigenes jmconfig-Objekt anzulegen. Bei mehreren Plugins sind diese in ein Array zu schreiben, wobei die Reihenfolge der Objekte der Reihenfolge der Plugins in jmplugin entspricht.

<i class="fontawesome-beaker"></i> Beispiel einer kompletten HTML-Module-Funktionalität:

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

----------

### <a name="Deklaration-im-DOM"></a>3.2 <i class="entypo-vcard"></i>Deklaration im DOM für die Attribute data-jmname und data-jmconfig

Folgend werden mehrere Beispiele aufgelistet, wie eine Deklaration der HTML-Module-Funktionalität im DOM je nach Anwendungsfall aussehen könnte. Es wird zudem die Möglichkeit aufgezeigt, wie ein Überschreiben der jmconfig durch die Angabe des *data-jmconfig*-Attributs aussehen könnte.

<i class="fontawesome-beaker"></i> Beispiel aus der [```_config.js```](#_config)

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


#### <i class="entypo-clipboard"></i> Fall 1
Deklaration mit einem data-jmname und dem überschreiben eines key-value-Pair des entsprechendem data-jmconfig-Objekt (hier für das Plugin ```actions.add```):

    <div data-jmname="ex-one-obj" data-jmconfig="{ 'data': 'neu' }">click</div>

##### <i class="entypo-switch"></i> Alternative 1 
> <i class="entypo-attention"></i> Unnötiger Mehraufwand

Das data-jmconfig-Objekt mit einem [ ] gewrappt:


    <div data-jmname="ex-one-obj" data-jmconfig="[{ 'data': 'neu' }]">click</div>

##### <i class="entypo-switch"></i> Alternative 2
> <i class="entypo-attention"></i> Unnötiger Mehraufwand. Diese Deklaration ist nur benötigt, wenn mehrere HTML-Module-Funktionalitäten (via " | " getrennt) im data-jmname-Attribut gelistet sind.

Das data-jmconfig-Objekt wird zusätzlich in ein Objekt gewrappt, wobei das jmconfig-Objket als Value für die jmnames-Angabe steht.

    <div data-jmname="ex-one-obj" data-jmconfig="{'ex-one-obj': { 'data': 'neu' }}">click</div>

<i class="fontawesome-hand-right"></i>Es wird die data-Angabe für das jmconfig-Objekt in der [```_config.js```](#_config) überschrieben.

#### <i class="entypo-clipboard"></i> Fall 2
Deklaration mit einem data-jmname und dem überschreiben von mehreren key-value-Pairs der entsprechenden data-jmconfig-Objekte (hier für die Plugins ```actions.add_1``` und ```actions.add_2``` alias ```actions.add```):

    <div data-jmname="ex-two-obj" data-jmconfig="[{ 'data': 'neu1' }, { 'event' : 'click', 'data': 'neu2' }]">click</div>

##### <i class="entypo-switch"></i> Alternative
> <i class="entypo-attention"></i> Unnötiger Mehraufwand. Diese Deklaration ist nur benötigt, wenn mehrere HTML-Module-Funktionalitäten (via " | " getrennt) im data-jmname-Attribut gelistet sind.

Das data-jmconfig-Objekt wird zusätzlich in ein Objekt gewrappt, wobei das jmconfig-Array als Value für die jmnames-Angabe steht.

    <div data-jmname="ex-two-obj" data-jmconfig="{'ex-two-obj': [{ 'data': 'neu' }, { 'event' : 'click', 'data': 'neu2' }]}">click</div>

<i class="fontawesome-hand-right"></i>Es wird zum einen die ```'data'```-Angabe für das Plugin ```actions.add_1``` (```'data': 'alt'```) im jmconfig-Array (erstes Objekt) mit "**neu**" überschrieben und zum anderen wird für das Plugin ```actions.add_2``` die ```'event'```- und die ```'data'```-Angabe (```'event' : 'hover', 'data': 'alt2'```) mit "**click**" bzw. "**neu2**" überschrieben.

> <i class="entypo-alert"></i> Wichtig! die Erweiterung des Plugin-Namens ```..._1``` oder ```..._2``` etc ist notwendig, da hier ein Plugin mehrmals für eine HTML-Module-Funktionalität in unterschiedlichen Konfigurationen verwendet wird. Andernfalls ist es dem Framework nicht möglich zu überprüfen, ob das Plugin schon initialisiert wurde oder nicht.

#### <i class="entypo-clipboard"></i> Fall 3
Deklaration mit zwei data-jmnamen und dem überschreiben von mehreren key-value-Pairs der entsprechenden data-jmconfig-Objekte (hier für die Plugins ```actions.add``` (HTML-Module-Funktionalität: ```ex-one-obj```), sowei ```actions.add_1``` und ```actions.add_2``` alias ```actions.add``` (HTML-Module-Funktionalität: ```ex-two-obj```)):


    <div data-jmname="ex-one-obj|ex-two-obj" data-jmconfig="{ 'ex-one-obj' : { 'data': 'neu' }, 'ex-two-obj' : [{ 'data': 'neu1' }, { 'event' : 'click', 'data': 'neu2' }]}">click</div>


#### <i class="entypo-clipboard"></i> Fall 4
Deklaration mit einem data-jmname und dem überschreiben von nur einem key-value-Pairs des entsprechenden data-jmconfig-Objekte (hier für die Plugins ```actions.add_2``` alias ```actions.add```):

    <div data-jmname="ex-two-obj" data-jmconfig="[{}, { 'event' : 'click', 'data': 'neu2' }]">click</div>

> <i class="entypo-alert"></i> Wichtig! Betrifft die Überschreibung nicht alle Plugins, so sind für diese Plugins lehren Objekt anzugeben.

----------

### <a name="Deklaration-der-Funktionalitaet"></a>3.3 <i class="entypo-vcard"></i>Deklaration der Funktionalität des Plugins
// TODO Andreas noch überarbeiten

Die Funktionalitäten werden in der [```_config.js```](#_config) in einem entsprechenden Objekt deklariert. Folgende Keys können für das entsprechende Plugin verwendet werden. Die unterstützen Plugins werden in ihrer Detailbeschreibung aufgelistet.

- [event](#event) (für alle Plugins required)
- [condition](#condition) (für alle Plugins)
- [wait](#wait) (für alle Plugins)
- [relatedTo](#relatedTo)
- [datatype](#datatype)
- [data](#data)
- [url](#url)
- [inject](#inject)
- [scrollTo](#scrollTo) (offsetangabe integrieren zuvor eigener key -> scrollToOffset)
- [type](#type)  (zuvor method genannt im ajax-module)
- [callback](#callback) (zuvor afterexec genannt im ajax-module)  this.trigger('jmtrigger')? Erweitern des Eventlisteners in der _super.js z.B. jmtrigger:jmname+jmplugin
- [width](#width) - modules.video
- [height](#height) - modules.video
- [zipcode](#zipcode) - modules.formcomponents.autocomplete
- [nextFocus](#nextFocus) - zuvor nextFocusNameAttr - modules.formcomponents.autocomplete
- [animationsdelay](#animationsdelay) - zuvor delay - modules.carousel
- [loader](#loader) - actions.link/actions.ajax
- [loaderTo](#loaderTo) - zuvor additionalloadertarget - actions.ajax
- [submit](#submit) - zuvor ajax - modules.formcomponents.formvalidate
- // obsolate sollte als default zählen - hideby - modules.formcomponents.autocomplete
- //opposition - modules.dependentSelectionGroup


#### <i class="entypo-key"></i><a name="event"></a>3.3.1 event  (Value: 'String')
Die Angabe 'event' wird von **allen** Plugins benötigt. Die HTML-Module-Funktionen können durch unterschietliche Events ausgelöst werden. Über die Event-Listener am Body lassen sich die Plugins durch folgende Events initialisieren: 

- [```'click'```](#click) (**alle** [data-jmname])
- [```'change'```](#change) (**select**[data-jmname], **input**[data-jmname], **textarea**[data-jmname])
- [```'jmtrigger'```](#jmtrigger) (**alle** [data-jmname])


Nur bei dem form-Tag mit ```form[data-jmname="form"]``` sind noch die Events ```'focus'```, ```'blur'```, ```'change'``` und ```'checkValidation'``` als Event-Listener registriert. 
Des Weiteren lassen sich folgende Events durch die Angabe von ```data-jmdominit="true"``` als Data-Attribut im HTML aktivieren. Sie sind auch auf alle Tags anwendbar.

- [```'dominit'```](#dominit)
- [```'raf'```](#raf)
- [```'interval-xxx'```](#interval)
- [```'blur'```](#blur)
- [```'hover'```](#hover)
- [```'keyup/keyup-delay-xxx'```](#keyup)

> <i class="entypo-attention"></i>Angabe von ```data-jmdominit="true"``` im Tag notwendig ```<input data-jmname="sync-val" data-jmdominit="true" type="text" name="vorname" />```

##### <a name="event"></a><i class="entypo-flash"></i>3.3.1.1 click
Die Aktion wird auf click durchgeführt

##### <a name="event"></a><i class="entypo-flash"></i>3.3.1.2 change
Die Aktion wird auf change durchgeführt

##### <a name="event"></a><i class="entypo-flash"></i>3.3.1.3 jmtrigger
Die Aktion wird auf jmtrigger durchgeführt

##### <a name="dominit"></a><i class="entypo-flash"></i>3.3.1.4 dominit
die Aktion wird auf domready oder wenn das HTML-Element via ajax in das DOM injektet wird ausgeführt.

##### <a name="raf"></a><i class="entypo-flash"></i>3.3.1.5 raf
Die Aktion wird auf jedem requestAnimationFrame durchgeführt (bei jedem neuzeichnen des Bildes)

##### <a name="interval"></a><i class="entypo-flash"></i>3.3.1.6 interval-xxx (angegeben in z.B. interval-5000)
Die Aktion wird alle 5000 ms durchgeführt

##### <a name="blur"></a><i class="entypo-flash"></i>3.3.1.7 blur
Die Aktion wird auf blur durchgeführt

##### <a name="hover"></a><i class="entypo-flash"></i>3.3.1.8 hover
Die Aktion wird auf hover durchgeführt

##### <a name="keyup"></a><i class="entypo-flash"></i>3.3.1.9 keyup/keyup-delay-xxx (abgegeben in z.B. keyup-delay-500)
Die Aktion wird auf keyup mit einem delay von 500 ms durchgeführt (erfolgt innerhalb dieser 500ms ein weiterer keyup-event, wird der vorherige überschrieben und die 500ms starte von neuen.). Wird kein -delay-xxx angegeben, wird die Aktion unmittelbar ausgeführt.


<i class="fontawesome-beaker"></i> Beispielhafte Implementierung für diese HTML-Module-Funktione in der [```_config.js```](#_config):

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

<i class="fontawesome-hand-right"></i> Die HTML-Module-Funktionalität wird bei **domready**, **change** und bei **keyup** mit einem delay von 500 ms ausgefürt.

----------

#### <i class="entypo-key"></i><a name="condition"></a>3.3.2 condition (Value: 'Boolean')
> <i class="entypo-info-circled"></i> Die Value wird via eval() in der JS-Kontext überführt

Die Angabe von ```'condition'``` ist **optional** für **alle** Plugins. Die Durchführung des Plugins ist von dieser Bedingung abhängig. 

<i class="fontawesome-beaker"></i> Beispiel 1: Hier wird das Karussell nur auf einem Device mit mindestens 46.8em Screen-Width gebaut. Ist die Bedingung nicht gegeben, wird das Plugin ```'modules.carousel'``` zwar initialisiert, aber die ```_exec```-Funktion innerhalb des Plugins wird nicht ausgeführt.

~~~
{
    jmname   : 'carousel',
    jmplugin: 'modules.carousel',
    jmconfig : {
        'event'                : 'dominit',
        'animationsdelay'      : '450',
        'condition'            : 'Modernizr.mq(\'only screen and (min-width : 46.8em)\')'
    }
}

~~~

<i class="fontawesome-beaker"></i> Beispiel 2: Der Flyout-Link (Hautpnavigations-Link):

Funktionsweise:

##### <i class="entypo-clipboard"></i> Fall 1 
Wird ein Flyout-Link auf einem Mobile-View (View < 60em) geklickt und der Layer mit der Unternavigation ist nicht sichtbar wird dieser sichtbar durch hinzufügen der Klasse show. 

> <i class="entypo-info-circled"></i>Das normale Linkverhalten wird bei a-Tags mit data-jmname grundsätzlich untertrückt.

##### <i class="entypo-clipboard"></i> Fall 2
Wird ein Flyout-Link auf einem Mobile-View (View < 60em) geklickt und der Layer mit der Unternavigation ist sichtbar, wird dem Link gefolgt.

<i class="fontawesome-hand-right"></i>Die URL im href wird geladen.

##### <i class="entypo-clipboard"></i> Fall 3
Wird ein Flyout-Link auf einem Desktop-View (View >= 60em) geklickt wird dem Link gefolgt

<i class="fontawesome-hand-right"></i>Die URL im href wird geladen.


Funktionsweise techinsch beschrieben mit condition:

Plugin 1 (```'acitons.add'```): Wird er bei einer Screen-Width von bis zu 60em (kleiner Desktop) der Link geklickt, wird die Klasse  show dem Parent-Element hinzugefügt.

Plugin 2 (```'actions.link'```): Ist die Screen-Width gleich Desktop oder hat das Eltern-Element die Klasse show, wird das Plugin ausgeführt. 


~~~
{
    jmname   : 'flyout-link',
    jmplugin: 'actions.add|actions.link',
    jmconfig : [
        {
            'event'    : 'click',
            'datatype' : 'class',
            'data'     : 'show',
            'relatedTo': 'this.$elem.parent()[0]',
            'condition': 'Modernizr.mq(\'only screen and (max-width : 60em)\')'
        },
        {
            'event'    : 'click',
            'condition': 'Modernizr.mq(\'only screen and (min-width : 60em)\') || this.$elem.parent().hasClass(\'show\')'
        }
    ]
}
~~~

----------

#### <i class="entypo-key"></i><a name="wait"></a>3.3.3 wait
> <i class="entypo-info-circled"></i> Ist als Event ```'raf'``` angegeben ist die Angabe von ```'wait'``` nicht berücksichtigt.
Bei der Angabe von ```'wait'``` wird die Ausführung um den entsprechenden Wert verzögert.

----------

#### <i class="entypo-key"></i><a name="relatedTo"></a>3.3.4 relatedTo  (Value: 'HTMLElement/e')
> <i class="entypo-info-circled"></i> Wenn in der Value ein 'this.' enthalten ist wird der Stirng via eval() in der JS-Kontext überführt.

Die Angabe ```'relatedTo'``` wird bei folgenden Plugins verwendet:
- actions.add (required)
- actions.ajax (required)
- actions.remove (required)
- actions.set (required)
- actions.sticky (required)
- actions.toggle (required)
- actions.trigger (required)
- modules.form.selectOptionsExtractInGroup (required)


Mit ```'relatedTo'``` wird das Target angegeben, auf dem die ```'action'``` anzuwenden ist.
Die Value könnte z.B. wie folgt aussehne: 
~~~
'relatedTo': 'this.$elem.parent()[0]'
~~~
<i class="fontawesome-hand-right"></i> HTMLElement

oder

~~~
'relatedTo': 'this.$elem.closest(\'form\').find(\'[data-jmdomselector*="OptionInternetFlatUpgrade"]\').not(this.$elem)[0]'
~~~  
<i class="fontawesome-hand-right"></i> HTMLElement

oder
~~~
'relatedTo': '$.makeArray(this.$elem.closest(\'.tb-content\').find(\'[data-jmname*="select-for-sync-and-set-area"]\'))'
~~~

<i class="fontawesome-hand-right"></i> [HTMLElement,HTMLElement,HTMLElement,HTMLElement]

----------

#### <i class="entypo-key"></i><a name="datatype"></a>3.3.5 datatype  (Value: 'String')

Die Angabe ```'datatype'``` wird bei folgenden Plugins verwendet:
- actions.add (required)
- actions.remove (required)
- actions.set (required)
- actions.toggle (required)

die Value ist ```'class'```, ```'html'```, ```'val'```, ```'prop'```, ```'style'```, ```'attr'``` oder ```'text'``` sein.

----------

#### <i class="entypo-key"></i><a name="data"></a>3.3.6 data  (Value: 'String')
> <i class="entypo-info-circled"></i> Wenn in der Value ein 'this.' enthalten ist wird der Stirng via eval() in der JS-Kontext überführt.

Die Angabe ```'data'``` wird bei folgenden Plugins verwendet:
- actions.add (required) (Ausnahme bei ```'datatype': 'html'```&sup1;)
- actions.ajax (optional)
- actions.remove (required) (Ausnahem bei ```'datatype': 'html'```)
- actions.set (required)
- actions.toggle (required)
- actions.trigger (required)

&sup1; Hier wird der Kommentar in den ```'childeNodes'``` von ```'relatetTo'```-Element als data genommen. 

~~~
'data'     : 'show'
~~~

oder via eval()

~~~
'data'     : 'this.$elem.val()'
~~~



#### <i class="entypo-key"></i><a name="url"></a>3.3.7 url


#### <i class="entypo-key"></i><a name="inject"></a>3.3.8 inject
#### <i class="entypo-key"></i><a name="scrollTo"></a>3.3.9 scrollTo (offsetangabe integrieren zuvor eigener key -> scrollToOffset)
#### <i class="entypo-key"></i><a name="type"></a>3.3.10 type  (zuvor method genannt im ajax-module)
#### <i class="entypo-key"></i><a name="callback"></a>3.3.11 callback (zuvor afterexec genannt im ajax-module)  this.trigger('jmtrigger')? Erweitern des Eventlisteners in der _super.js z.B. jmtrigger:jmname+jmplugin
#### <i class="entypo-key"></i><a name="width"></a>3.3.12 width - modules.video
#### <i class="entypo-key"></i><a name="height"></a>3.3.13 height - modules.video
#### <i class="entypo-key"></i><a name="zipcode"></a>3.3.14 zipcode - modules.formcomponents.autocomplete
#### <i class="entypo-key"></i><a name="nextFocus"></a>3.3.15 nextFocus - zuvor nextFocusNameAttr - modules.formcomponents.autocomplete
#### <i class="entypo-key"></i><a name="animationsdelay"></a>3.3.16 animationsdelay - zuvor delay - modules.carousel
#### <i class="entypo-key"></i><a name="loader"></a>3.3.17 loader - actions.link/actions.ajax
#### <i class="entypo-key"></i><a name="loaderTo"></a>3.3.18 loaderTo - zuvor additionalloadertarget - actions.ajax
#### <i class="entypo-key"></i><a name="submit"></a>3.3.19 submit - zuvor ajax - modules.formcomponents.formvalidate




## 4 <i class="entypo-brush"></i><a name="Erstellung"></a>Erstellung von Plugins


-ts berücksichtigen
empty.js berücksichtigen
