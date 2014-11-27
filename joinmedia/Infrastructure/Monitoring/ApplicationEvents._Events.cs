using Microsoft.Diagnostics.Tracing;

namespace joinmedia.Common.Monitoring
{
	public partial class ApplicationEvents
	{
		[Event(1000, Level = EventLevel.Informational)]
		public void UserSignedIn(string userName)
		{
			if (IsEnabled())
			{
				WriteEvent(1000, userName);
			}
		}

		[Event(1001, Level = EventLevel.Informational)]
		public void UserSignedOut(string userName)
		{
			if (IsEnabled())
			{
				WriteEvent(1001, userName);
			}
		}
	}
}
