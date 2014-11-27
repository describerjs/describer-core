using JM.Foundation.ErrorHandling;
using Microsoft.Diagnostics.Tracing;

namespace joinmedia.Common.Monitoring
{
	[EventSource(Name = "JM-ReferenceApplication")]
	public sealed partial class ApplicationEvents : JMEventSourceBase<ApplicationEvents>
	{
	}
}