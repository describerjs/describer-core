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
        private static SinkSubscription<SqlDatabaseSink> subscription;

        public static void ConfigureLogging()
        {
            // Monitoring des Logging Prozesses:
            var semanticListener = new ObservableEventListener();
            semanticListener.LogToFlatFile(@"c:\temp\logs\semanticlogging.log");
            semanticListener.EnableEvents(SemanticLoggingEventSource.Log, EventLevel.LogAlways, Keywords.All);

            // Startet das Event-Handling über EventSource
            ApplicationEvents.Log.Initialize();

            ObservableEventListener listener = new ObservableEventListener();

            listener
                .EnableEvents(
                    ApplicationEvents.Log,
                    Microsoft.Diagnostics.Tracing.EventLevel.LogAlways,
                    Microsoft.Diagnostics.Tracing.EventKeywords.All);

            LoggingConfig.subscription =
                listener
                .LogToSqlDatabase(
                    "JM.ReferenceApplication",
                    WebConfigurationManager.ConnectionStrings["EventTracingSqlSink"].ConnectionString);
        }

        public static void EndLogging()
        {
            if(LoggingConfig.subscription != null)
            {

                LoggingConfig.subscription.Dispose();
                LoggingConfig.subscription = null;
            }
        }
    }
}