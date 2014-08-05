using System;
using Autofac;
using Autofac.Configuration;
using Autofac.Extras.DynamicProxy2;
using Autofac.Integration.Mvc;
using JM.Business.Data;
using JM.Business.Manager;
using JM.Foundation.ErrorHandling;
using JM.ReferenceApplication.Common.Monitoring;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;
using JM.ReferenceApplication.Areas.JMDemo.Models.JM.Business.Kontakt;
using JM.Business.Kontakt.Contracts.Model;
using JM.Foundation.DependencyInjection;

namespace JM.ReferenceApplication
{
	public class MvcApplication : System.Web.HttpApplication
	{
		/// <summary>
		/// Wird beim Start der Application ausgeführt
		/// </summary>
		protected void Application_Start()
		{
			//////////////////////////////////////////////////////////////////////////////////////
			#region MVC Bootstrapping

			AreaRegistration.RegisterAllAreas();
			FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
			RouteConfig.RegisterRoutes(RouteTable.Routes);
			BundleConfig.RegisterBundles(BundleTable.Bundles);

			// Information Disclosure: MVC-Header entfernen
			MvcHandler.DisableMvcResponseHeader = true;

			#endregion

			// Startet das Event-Handling über EventSource
			ApplicationEvents.Log.Initialize();

			// Logaufruf: Start der Application
			ApplicationEvents.Log.ApplicationStartup();

			//////////////////////////////////////////////////////////////////////////////////////
			#region AutoFac - Dependency Injection

			// Hier wird der DI-Container erzeugt, in dem alle Referenzen auf Typen (Klassen) gesammelt werden,
			// die über DI zur Verfügung stehen sollen.
			var autofacBuilder = new Autofac.ContainerBuilder();

			// Alle Controller registrieren damit das Referenzen im Controller-Constructor automatisch aufgelöst weden können
			autofacBuilder.RegisterControllers(typeof (MvcApplication).Assembly);

			// Ein Typ wird registriert, indem Implementation und Interface bekannt gemacht werden:
			// autofacBuilder.RegisterType<ExampleImplementation>().As<IExampleInterface>();
			// Dazu muss die Ursprungs-DLL aber in der Web.dll bekannt sein. Um diese Bindung zu umgehen
			// kann die Bindung auch über die Modul-Funktion von AutoFac eingebunden werden.
			autofacBuilder.RegisterType<ExampleDataRepository>()
				.As<IExampleDataRepository>();

			autofacBuilder.RegisterType<LameManager>()
				.As<ILameManager>();

			autofacBuilder
				.RegisterType<ImportantManager>()
				.As<IImportantManager>()
				.EnableInterfaceInterceptors();

			// --> Hier weitere Typen hinzufügen soweit notwendig <--

			// AutoFac Modul-Konfiguration einlesen. In dieser Config sind DLLs referenziert,
			// in denen über eine spezielle Klasse alle für DI zu nutzenden Klassen und deren Scope definiert sind.
			autofacBuilder.RegisterModule(new XmlFileReader("App_Data/autofac.config"));

			// Interceptor anbinden
			// Alle Aufrufe in Businessklassen werden über den Interceptor abgefangen und ausgeführt, damit
			// dabei entstehende Exceptions besser behandelt werden können.
			autofacBuilder
				.RegisterType<ErrorInterceptor>();

			// ErrorHandler definieren
			autofacBuilder.RegisterInstance<IErrorHandler>(new ErrorHandler());

            autofacBuilder
                .RegisterType<ContactModel>()
                //.As<IContactModel>()
                .As<ContactModel>();

            autofacBuilder
                .RegisterType<ContactModelValidator>()
                .As<IContactModelValidator>();

			// Abschliessend wird der Container erzeugt und dem DependencyResolver von MVC zugewiesen, über
			// diesen erfolgt dann das eigentliche Auflösen der Abhängigkeiten
			var container = autofacBuilder.Build();
			DependencyResolver.SetResolver(new AutofacDependencyResolver(container));

			#endregion

            ModelBinders.Binders.DefaultBinder = new AbstractModelBinder(DependencyResolver.Current);
		}

		/// <summary>
		/// Wird vor dem Senden der Response ausgeführt
		/// </summary>
		/// <param name="sender">object Sender</param>
		/// <param name="e">EventArgs e</param>
		protected void Application_PreSendRequestHeaders(object sender, EventArgs e)
		{
			var app = sender as MvcApplication;
			if (app == null || app.Context == null)
				return;

			var headers = app.Context.Response.Headers;
			headers.Remove("Server");
		}
	}
}