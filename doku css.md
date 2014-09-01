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


### base
Das *base* Verzeichnis beinhaltet das Basis-Styling für alle globalen Elemente.

### generic: grundausstattung
Der *generic* Ordner liefert die Grundausstattung für Sass (Mixins, Variablen, etc.) und ein Browser-Reset CSS. Zusätzlich gibt es noch den Unterordner *originalReferenceSource* für originale Referenzdateien von 3rd Party Add-Ons. Diese werden nicht in das Framework eingebunden, sondern dienen nur der Referenz.

### objects: modulare elemente
In *object* sind die modularen Elemente untergebracht. Neben wichtigen Ressourcen wie Header, Footer & Co. gibt es noch den Unerordner *modules*. Hier finden sich die UI-Module nach bestem Gewissen.
Jedes UI-Modul bringt eine *-noscript*-Datei mit, in der die Regeln für No-JS Support aufgeführt sind.


## Modulerstellung
Jegliche Erweiterung an modularen Elementen sind im Verzeichnis *objects* zu hinterlegen. Sämtliche UI-Module finden sich im Unterordner *modules* wieder. 
Jede Datei steht für ein eigenes Modul und ist im Aufbau des Quellcodes immer gleich:

### Kommentarblock mit dem Namen des Moduls
	/*------------------------------------*\
	    $TOGGLEBOX
	\*------------------------------------*/

### Kommentarblock mit Dokumentation zur Funktionsweise des Moduls
	/**
	 * Ein-/Auf-/Zuklapp Element
	 *
		<div class="togglebox">
			<a class="tb-subject" data-jmname="togglebox">$toggletitle$</a>
			<div class="tb-content">
				$togglecontent$
			</div>
		</div>
	 *
	 * Die Togglebox wird mit einem umschließenden <div class="togglebox"> eingeleitet.
	 * Innerhalb <div class="togglebox"> liegen auf gleicher Ebene zwei Elemente:
	 *
	 * <a class="tb-subject" data-jmname="togglebox">$toggletitle$</a>
	 * Beschreibt den Titel der Togglebox bzw. den Link.
	 * data-jmname="togglebox" weist das javascript an, das <div class="togglebox"> um die Klasse "show" zu erweitern
	 * und somit den Inhalt zu <div class="tb-content"> ein- bzw. auszublenden.
	 *
	 * <div class="tb-content">
	 * Alles was zum Content der Togglebox gehört wird hier eingefügt.
	 *
	**/

### CSS zum Modul
	.togglebox {
		// Der verantwortliche Link zum öffnen des Toggles "tb-content".
		.tb-subject {
			/**/
		}

		// Der eigentliche Content.
		.tb-content {
			display: none;
		}

		// "togglebox" wird mit "show" erweitert und interagiert entsprechend.
		&.show {
			.tb-content {
				display: block;
			}
		}
	}

Jede Regel erhält einen Kommentar zur Bedeutung und Anwendung.