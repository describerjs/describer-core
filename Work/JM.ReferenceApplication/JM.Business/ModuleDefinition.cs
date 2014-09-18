using Autofac;
using Autofac.Extras.DynamicProxy2;
using JM.Foundation.ErrorHandling;

namespace JM.Business
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
            builder
                .RegisterInstance<ModuleEvents>(ModuleEvents.Log)
                .As<JMEventSourceBase>();

			base.Load(builder);
		}
	}
}
