# Doku CSS/SCSS

## Grundlegendes
Der Grundgedanke bei der Erstellung und Pflege der Stylesheets ist *Konsistenz*. Daraus resultiert eine einheitliche Datei- und Codegestaltung.
Die Entwicklung erfolgt komplett in [Sass](http://sass-lang.com "Sass - http://sass-lang.com") und in Anwendung von [Atomic Design](http://patternlab.io/about.html "Atomic Design - http://patternlab.io/about.html").

Atomic Design verfolgt die Ansätze von:

- [SMACSS - Scalable and Modular Architecture for CSS](http://smacss.com "SMACSS - http://smacss.com")
- [OOCSS - Object-Oriented CSS](http://oocss.org "OOCSS - http://oocss.org")
- [BEM CSS Methology - Block, Element, Modifier](http://bem.info/method "BEM CSS Methology - http://bem.info/method")
- [csswizardry CSS-Guidelines](https://github.com/csswizardry/CSS-Guidelines "csswizardry CSS-Guidelines - https://github.com/csswizardry/CSS-Guidelines")


## File- & Ordnerstruktur

### scss
Auf der Hauptebene exisitieren zwei Stylesheets namens *style.scss* und *noscript.scss*. Beide Dateien werden in den Ordner *css* im Root-Verzeichnis kompiliert. Sie teilen sich globale Dateien wie Mixins, Variablen & Co., welche in "generic/_generic-import" als ein globaler Import zusammengefasst werden.

#### style.scss
Das ist das Stylesheet für die Website. Hier werden sämtliche Ressourcen aus den Verzeichnissen *base, generic & object* zusammengetragen, Dopplungen und "-noscript"-Dateien ausgeschlossen. Ebenfalls sind hier die benötigten UI-Module an letzter Stelle einzukommentieren.

#### noscript.scss
Hier finden sich Fallback Regeln für No-JS Support. Diese wird per HTML mittels <noscript> eingebunden. Wird ein UI-Modul verwendet, ist die entsprechende "-noscript"-Datei hier ebenfalls einzukommentieren.


### base: Die Basis
Das *base* Verzeichnis beinhaltet das Basis-Styling für alle globalen Elemente.

### generic: Die Grundausstattung
Der *generic* Ordner liefert die Grundausstattung für Sass (Mixins, Variablen, etc.) und ein Browser-Reset CSS. Zusätzlich gibt es noch den Unterordner *originalReferenceSource* für originale Referenzdateien von 3rd Party Add-Ons. Diese werden nicht in das Framework eingebunden, sondern dienen nur der Referenz.

#### Konfiguration
Im Verzeichnis befindet sich eine "_generic-import.scss" Datei. Diese importiert alle Ressourcen in diesem Verzeichnis, welche als "geteilte" angesehen werden. So referenzieren sowohl "style.scss", als auch "noscript.scss" auf diese Datei.

Die einzelnen Sektionen sind klar definiert, so werden als erstes externe Referenzen als Add-Ons eingebunden. Die Basis bilden hier das "Semantic-Grid-System" und das "Sassapparilla Typeset". Damit steht dem Projekt ein Content-Grid und Baseline-Grid zur Verfügung.

##### Add-Ons
###### Semantic-Grid-System
Geliefert werden eine Hand voll Mixins, die der modularen Anwendung dienen und das Grid direkt am Modul definieren lassen. Zur Konfiguration können die Anzahl, Breite und Abstand der Spalten in einem Pixelmaß festgelegt werden. Die enthaltenen Mixins errechnen daraus die prozentualen Werte, um in diesem Fall ein flexibles Raster zu erstellen.

###### Sassapparilla Typeset
Dieses Typeset dient zum definieren der Schriftgrade. So stehen Variablen "$alpha, $beta, $gamma, etc." zur Verfügung, um Schriftgrößen für <h1>-<h6>, <p>, <ul> usw. anzugeben.
Mithilfe von Funktionen aus Compass werden entsprechende line-heights und margins für die jeweiligen Elemente errechnet, woraus das Baseline-Grid für ein einheitliches Schriftbild resultiert.

##### Generic Elements
###### Variables
In den Variables wird die Konfiguration des Basis-Designs definiert. Dazu gehören u.A. sämtliche Farbwerte, Theme, Typo, Breakpoints und Abstände, die sich sowohl in der Anwendung von "base" als auch in den "objects" wiederfinden.

###### Functions
Eine Sammlung nützlicher Sass-Funktionen die zur Hilfe und Erleichterung der CSS-Entwicklung beitragen.

###### Mixins
Eine Sammlung nützlicher Sass-Mixins die zur Hilfe und Erleichterung der CSS-Entwicklung beitragen. Aber auch Standardwerte für Elemente werden hier zusammengefasst.

###### Placeholder
Eine Sammlung nützlicher Sass-Placeholder die zur Hilfe und Erleichterung der CSS-Entwicklung beitragen. Somit wird vermieden, dass @extend nicht dateiübergreifend, sondern auf zentrale Eigenschaften angewandt wird.

#### Reset
Ein einfaches CSS Reset.


### objects: Die modularen Elemente
In *object* sind die modularen Elemente untergebracht. Neben wichtigen Ressourcen wie Header, Footer & Co. gibt es noch den Unterordner *modules*. Hier finden sich die UI-Module nach bestem Gewissen.
Jedes UI-Modul bringt eine *-noscript*-Datei mit, in der die Regeln für No-JS Support aufgeführt sind.


## Modulerstellung
Ein Modul definiert sich als eigener Import und befindet sich in der Ordnerstruktur unter "/scss/objects/modules". Abgelegt wird die Datei mit der entsprechenden Benennung wie auch die des Moduls.