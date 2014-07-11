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

### <noscript>
Eine *<noscript>* Sektion kann beliebig oft sowohl im *<head>* als auch im *<body>* verwendet werden. In diesem Fall dient sie als Fallback zur "gewöhnlichen" Einbinding der Stylesheets, da diese gewöhnlich per Javascript geladen werden.

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
