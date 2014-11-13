using System.Web.Mvc;
using Autofac;
using Autofac.Configuration;
using Autofac.Integration.Mvc;
using JM.Foundation.ErrorHandling;

namespace JM.ReferenceApplication.App_Start
{
	/// <summary>
	/// Startet die Dependency Injection über AutoFac.
	/// Es werden Bindungen aus der unter "App_Data/autofac.config" liegenden Konfiguration gelesen
	/// und direkt im Code definierte Bindungen initialisiert.
	/// </summary>
	public class AutoFacConfig
	{
		/// <summary>
		/// Erstellt den DependencyResolver mit allen definierten Typen und registriert alle Controller
		/// </summary>
		public static IContainer RegisterDependencyResolver()
		{
			// Hier wird der DI-Container erzeugt, in dem alle Referenzen auf Typen (Klassen) gesammelt werden,
			// die über DI zur Verfügung stehen sollen.
			var autofacBuilder = new Autofac.ContainerBuilder();

			// Alle Controller registrieren damit das Referenzen im Controller-Constructor automatisch aufgelöst weden können
			autofacBuilder.RegisterControllers(typeof(MvcApplication).Assembly);

			// Registrierung von Typen per FluentApi
			// Ein Typ wird registriert, indem Implementation und Interface bekannt gemacht werden:
			// autofacBuilder.RegisterType<ExampleImplementation>().As<IExampleInterface>();
			// Dazu muss die Ursprungs-DLL aber in der Web.dll bekannt sein. Um diese Bindung zu umgehen
			// kann die Bindung auch über die Modul-Funktion von AutoFac eingebunden werden.
			
			//autofacBuilder
			//	.RegisterType<ImportantManager>()
			//	.As<IImportantManager>()
			//	.EnableInterfaceInterceptors();

			// --> Hier weitere Typen hinzufügen soweit notwendig <--

			// Registrierung von Modulen per Config
			// AutoFac Modul-Konfiguration einlesen. In dieser Config sind DLLs referenziert,
			// in denen über eine spezielle Klasse (geerbt von AutoFac.Module) alle für DI zu nutzenden Klassen und deren Scope definiert sind.
			autofacBuilder.RegisterModule(new XmlFileReader("App_Data/autofac.config"));

			// ErrorInterceptor und ErrorHandler registrieren
			// Interceptor anbinden
			// Alle Aufrufe in Businessklassen werden über den Interceptor abgefangen und ausgeführt, damit
			// dabei entstehende Exceptions besser behandelt werden können.
			autofacBuilder
				.RegisterType<ErrorInterceptor>();

			// ErrorHandler definieren
			autofacBuilder.RegisterInstance<IErrorHandler>(new ErrorHandler());

			// Abschliessend wird der Container erzeugt und dem DependencyResolver von MVC zugewiesen, über
			// diesen erfolgt dann das eigentliche Auflösen der Abhängigkeiten
			var container = autofacBuilder.Build();
			DependencyResolver.SetResolver(new AutofacDependencyResolver(container));
			return container;
		}
	}
}