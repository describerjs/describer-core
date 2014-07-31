define(function(){

	// !!!!!!!!!!!!!!!!!!!!!! **************** im HTML **************** !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	//
	//   Anwender der Module im HTML
	//  ____________________________
	//
	//   in MVC:
	//
	//   Hinzufügen des Attributs data_jmname
	//
	//   Bsp.: data_jmname="filterpanel"
	//
	//   in HTML:
	//
	//   Hinzufügen des Attributs data-jmname
	//
	//   Bsp.: data-jmname="filterpanel"
	//
	//
	//
	//
	//
	//    ** Überschreiben der Default-Konfiguration (Default-Konfiguration befindet sich in der _config.js) des Moduls
	//  __________________________________________________________________________________________________________________
	//
	//
	//    1 X data-jmname
	//
	//
	//    MVC
	// Bsp.: data_jmname="filterpanel", data_jmconfig="{ \"relatedTo\": \"[name='AystarOptionSelectionModel.OptionAyDeSmart']\" }"
	//
	//    HTML
	// Bsp.: data-jmname="filterpanel" data-jmconfig="{ 'condition': 'Modernizr.mq(\'only screen and (min-width : 46.8em)\')' }"
	//
	//
	//
	//
	//
	//   2.... X data-jmname
	//
	//   // TODO Andreas bitte testen evtl. falsche Angabe es müsste hier mit Komma getrennt und im Array definiert sein....
	//
	//    MVC
	// Bsp.: data_jmname="autocomplete-plz|sync-val", data_jmconfig="{ \"relatedTo\": \"[name='AystarOptionSelectionModel.OptionAyDeSmart']\" }|{ \"relatedTo\": \"[name='AystarOptionSelectionModel.OptionAyDeSmart']\" }"
	//
	//    HTML
	// Bsp.: data-jmname="autocomplete-plz|sync-val", data-jmconfig="{ 'condition': 'Modernizr.mq(\'only screen and (min-width : 46.8em)\')' }|{ 'condition': 'Modernizr.mq(\'only screen and (min-width : 46.8em)\')' }"
	//
	//
	//
	//
	//
	//
	//
	//   ** besteht das Modul aus mehreren Plugins (jmelement), dann werden die data-config-Objekte in einem Array gelistet.
	//  _______________________________________________________________________________________________________________________
	//
	//  //TODO Andreas Beispiele for MVC und HTML müssen noch richtig aufgeliste und getestet werde.
	//    MVC
	// Bsp.: data_jmname="flyout-link", data_jmconfig="[{ \"relatedTo\": \"[name='AystarOptionSelectionModel.OptionAyDeSmart']\" }|{ \"relatedTo\": \"[name='AystarOptionSelectionModel.OptionAyDeSmart']\" }"
	//
	//    HTML
	// Bsp.: data-jmname="autocomplete-plz", data-jmconfig="[{ 'condition': 'Modernizr.mq(\'only screen and (min-width : 46.8em)\')' }|{ 'condition': 'Modernizr.mq(\'only screen and (min-width : 46.8em)\')' }"
	//
	//  Richtig -> Bsp.: data-jmname="nav-link" data-jmconfig="[{'event':'click','datatype':'class','data':'show1'},{'event':'click','datatype':'class','data':'show','relatedTo':'this.$elem.next()[0]', 'condition': 'Modernizr.mq(\'only screen and (max-width : 50em)\')'}]"
	//
	//
	//
	// !!!!!!!!!!!!!!!!!!!!!! ************************++********* !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!


	// !!!!!!!!!!!!!!!!!!!!!! ************************** in _config.js  !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
	//
	//   1 X data-jmelement
	//
	//	    {
	//          jmname   : 'nav',
	//          jmelement: 'actions.toggle',
	//          jmconfig : {
	//              'event'    : 'click',
	//              'datatype' : 'class',
	//              'data'     : 'show-menu',
	//              'relatedTo': '#nav'
	//          }
	//	    }
	//
	//
	//   2... X data-jmelement
	//
	//      {
	//          jmname   : 'flyout-link',
    //          jmelement: 'actions.add|actions.link',
	//          jmconfig : [
	//              {
	//                  'event'    : 'click',
	//                  'datatype' : 'class',
	//                  'data'     : 'show',
	//                  'relatedTo': 'this.$elem.parent()[0]',
	//                  'condition': 'Modernizr.mq(\'only screen and (max-width : 50em)\')'
	//              },
	//              {
	//                  'event'    : 'click',
	//                  'condition': 'Modernizr.mq(\'only screen and (min-width : 50em)\') || this.$elem.parent().hasClass(\'show\')'
	//              }
	//          ]
	//       }
	//
	//
	// !!!!!!!!!!!!!!!!!!!!!! ************************++********* !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

	return [
		{
			jmname   : 'togglebox',
			jmelement: 'actions.toggle',
			jmconfig : {
				'event'    : 'click',
				'datatype' : 'class',
				'data'     : 'show',
				'relatedTo': 'this.$elem.parent()[0]'
			}
		}
	];
});

