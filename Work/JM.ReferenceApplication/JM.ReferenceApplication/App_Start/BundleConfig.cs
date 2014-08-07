using System.Web.Optimization;

namespace JM.ReferenceApplication
{
    public class BundleConfig
    {
        // Weitere Informationen zu Bundling finden Sie unter "http://go.microsoft.com/fwlink/?LinkId=301862"
        public static void RegisterBundles(BundleCollection bundles)
        {
			#region Bundles für /JMDemo & /JMTools

			bundles.Add(new ScriptBundle("~/jm/jquery").Include(
                        "~/Areas/JMDemo/js/jquery-{version}.js"));

			bundles.Add(new ScriptBundle("~/jm/jqueryval").Include(
						"~/Areas/JMDemo/js/jquery.validate*"));

			bundles.Add(new ScriptBundle("~/jm/modernizr").Include(
						"~/Areas/JMDemo/js/modernizr-*"));

			bundles.Add(new ScriptBundle("~/jm/bootstrap").Include(
					  "~/Areas/JMDemo/js/bootstrap.js",
					  "~/Areas/JMDemo/js/respond.js"));

			bundles.Add(new StyleBundle("~/jm/css").Include(
					  "~/Areas/JMDemo/css/bootstrap.css",
					  "~/Areas/JMDemo/css/site.css"));

			#endregion

			// Festlegen von "EnableOptimizations" auf "false" für Debugzwecke. Weitere Informationen
            // finden Sie unter "http://go.microsoft.com/fwlink/?LinkId=301862".
            BundleTable.EnableOptimizations = true;
        }
    }
}
