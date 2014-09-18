using Autofac;
using JM.Foundation;
using JM.Foundation.ErrorHandling;
using JM.ReferenceApplication.Common.Monitoring;
using Microsoft.Diagnostics.Tracing;
using Microsoft.Practices.EnterpriseLibrary.SemanticLogging;
using Microsoft.Practices.EnterpriseLibrary.SemanticLogging.Sinks;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace JM.ReferenceApplication.App_Start
{
    public static class LoggingConfig
    {
        private static SinkSubscription<SqlDatabaseSink> s_subscription;

        public static void ConfigureLogging(IContainer container)
        {
            if (true) // ToDo: per config
            {
                try
                {
                    // Monitoring des Logging Prozesses:
                    var semanticListener = new ObservableEventListener();
                    semanticListener.LogToFlatFile(@"c:\temp\logs\semanticlogging.log");
                    semanticListener.EnableEvents(SemanticLoggingEventSource.Log, EventLevel.LogAlways, Keywords.All);
                }
                catch
                {
                    // Do nothing
                }
            }

            // Startet das Event-Handling über EventSource
            ApplicationEvents.Log.Initialize();

            ObservableEventListener listener = new ObservableEventListener();

            var registeredEventSources =
                container
                .Resolve<IEnumerable<JMEventSourceBase>>()
                .Concat(ApplicationEvents.Log);
           
            foreach (var item in registeredEventSources)
            {
                listener
                    .EnableEvents(
                        item,
                        Microsoft.Diagnostics.Tracing.EventLevel.LogAlways,
                        Microsoft.Diagnostics.Tracing.EventKeywords.All);
            }
            
            listener
                .EnableEvents(
                    "System.Threading.Tasks.TplEventSource",
                    EventLevel.Informational,
                    (EventKeywords)1);

            s_subscription =
                listener
                .LogToSqlDatabase(
                    "JM.ReferenceApplication",
                    WebConfigurationManager.ConnectionStrings["EventTracingSqlSink"].ConnectionString);
        }

        public static void EndLogging()
        {
            if (s_subscription != null)
            {
                s_subscription.Dispose();
                s_subscription = null;
            }
        }
    }
}