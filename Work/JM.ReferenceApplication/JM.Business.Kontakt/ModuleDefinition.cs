using Autofac;
using Autofac.Extras.DynamicProxy2;
using JM.Business.Kontakt.Business.Manager;
using JM.Business.Kontakt.Contracts.Manager;

namespace JM.Business.Kontakt
{
	/// <summary>
	/// Registriert die Klassen dieser DLL, die für DI über AutoFac zur Verfügung stehen sollen.
	/// </summary>
	public class ModuleDefinition : Module
	{
		/// <summary>
		/// Override zum Hinzufügen der Registrationen
		/// </summary>
		/// <remarks>
		/// Der ContainerBuilder-Parameter wird nur für das aktuelle Modul genutzt.
		/// </remarks>
		/// <param name="builder">The builder through which components can be registered.</param>
		protected override void Load(ContainerBuilder builder)
		{
			// Basis-Syntax:
			//builder
			//	.RegisterType<ExampleImplementation>()
			//	.As<ExampleInterface>()
			//	.LifeTimeSetting;

			builder
				.RegisterType<KontaktManager>()
				.As<IKontaktManager>()
				.EnableInterfaceInterceptors()
				.SingleInstance();

			base.Load(builder);
		}
	}
}
