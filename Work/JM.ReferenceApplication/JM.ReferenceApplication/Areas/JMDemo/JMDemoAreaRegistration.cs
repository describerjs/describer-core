using System.Web.Mvc;
using JM.Foundation.Mvc.Routing;

namespace JM.ReferenceApplication.Areas.JMDemo
{
    public class JMDemoAreaRegistration : AreaRegistration 
    {
        public override string AreaName 
        {
            get 
            {
                return "JMDemo";
            }
        }

        public override void RegisterArea(AreaRegistrationContext context) 
        {
            var jmDemoDefault= context.MapRoute(
                "JMDemo_default",
                "JMDemo/{controller}/{action}/{id}",
                new { controller = "Start", action = "Index", id = UrlParameter.Optional }
            );
			jmDemoDefault.RouteHandler = new HyphenatedRouteHandler();
        }
    }
}