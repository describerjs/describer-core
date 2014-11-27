﻿using Microsoft.Diagnostics.Tracing;
using System;

namespace joinmedia.Common.Monitoring
{
	public partial class ApplicationEvents
	{
		[Event(1, Level = EventLevel.Informational)]
		public void ApplicationStartup()
		{
			if (IsEnabled())
			{
				WriteEvent(1);
			}
		}

		[Event(2, Level = EventLevel.Informational)]
		public void ApplicationStopped()
		{
			if (IsEnabled())
			{
				WriteEvent(2);
			}
		}

		[Event(10000, Level = EventLevel.Informational, Opcode = EventOpcode.Start, Task = Tasks.RequestMonitoring)]
		public void BeginRequest(string queryString)
		{
			if (IsEnabled())
			{
				WriteEvent(10000, queryString);
			}
		}

		[Event(10001, Level = EventLevel.Informational, Opcode = EventOpcode.Stop, Task = Tasks.RequestMonitoring)]
		public void EndRequest(string queryString, string duration)
		{
			if (IsEnabled())
			{
				WriteEvent(10001, queryString, duration);
			}
		}

		////[Event(10000, Level = EventLevel.Verbose)]
		////public void BeginRequestVerbose(DateTime utcTimeStamp, string querryString)
		////{
		////    if (IsEnabled())
		////    {
		////        WriteEvent(10000);
		////    }
		////}
	}
}
