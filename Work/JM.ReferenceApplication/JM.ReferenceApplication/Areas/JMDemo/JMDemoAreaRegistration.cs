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
            var JMDemo_default = context.MapRoute(
                "JMDemo_default",
                "JMDemo/{controller}/{action}/{id}",
                new { controller = "Start", action = "Index", id = UrlParameter.Optional });
            
            JMDemo_default.RouteHandler = new HyphenatedRouteHandler();
        }
    }
}