using JM.ReferenceApplication.Common.Monitoring;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace JM.ReferenceApplication.Infrastructure.Monitoring
{
    public class RequestTracerModule : IHttpModule
    {
        [ThreadStatic]
        private DateTime _beginRequestTime;

        public void Dispose()
        {
            // Do Nothing
        }

        public void Init(HttpApplication context)
        {
            context.BeginRequest += (s, args) =>
            {
                _beginRequestTime = DateTime.UtcNow;

                // Alle folgenden Events erhalten die selbe ID.
                ApplicationEvents.SetCurrentThreadActivityId(Guid.NewGuid());

                ApplicationEvents.Log.BeginRequest(context.Request.QueryString.ToString(), _beginRequestTime.ToString());
            };

            context.EndRequest += (s, args) =>
            {
                var endRequestTime = DateTime.UtcNow;
                var diff = endRequestTime - _beginRequestTime;
                ApplicationEvents.Log.EndRequest(context.Request.QueryString.ToString(), endRequestTime.ToString(), diff.ToString());
            };
        }
    }
}