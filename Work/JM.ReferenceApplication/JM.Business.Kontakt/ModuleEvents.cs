﻿using JM.Foundation.ErrorHandling;
using Microsoft.Diagnostics.Tracing;

namespace JM.Business.Kontakt
{
	/// <summary>
	/// Bietet Funktionen zum Loggen/Erfassen aller definierten Events in diesem Modul
	/// </summary>
	public class ModuleEvents : JMEventSourceBase
	{
		//////////////////////////////////////////////////////////////////////////////////////
		#region Implementation der abstrakten Klasse JMEventSourceBase

		/// <summary>
		/// Loggt eine schwere Ausnahme in einer Busines-Logik
		/// </summary>
		[Event(1, Level = EventLevel.Error, Task = Tasks.CriticalBusinessTask)]
		protected override void FatalBusinessException(
			string message,
			string details,
			string context,
			string parameters)
		{
			if (this.IsEnabled()) base.WriteEvent(1, context, message, details, parameters);
		}

		/// <summary>
		/// Loggt eine generische Ausnahme in einer Busines-Logik
		/// </summary>
		[Event(2, Level = EventLevel.Error)]
		protected override void GenericException(string message, string details, string parameters)
		{
			base.WriteEvent(2, message, details, parameters);
		}
		
		/// <summary>
		/// Loggt eine Ausnahme in einer Busines-Logik
		/// </summary>
		[Event(3, Level = EventLevel.Error)]
		protected override void BusinessException(
			string message,
			string details,
			string context,
			string parameters)
		{
			base.WriteEvent(3, message, details, parameters);
		}

		#endregion

		[Event(3, Level = EventLevel.Informational)]
		public void ContactFormSent(string email, string firstname, string lastname)
		{
			base.WriteEvent(103, email, firstname, lastname);
		}


		/// <summary>
		/// Definierte Tasks für dieses Modul
		/// </summary>
		public class Tasks
		{
			public const EventTask CriticalBusinessTask = (EventTask)1;
			public const EventTask BusinessTask = (EventTask)2;
			public const EventTask GenericTask = (EventTask)3;
		}
	}
}