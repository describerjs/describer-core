using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(JM.ReferenceApplication.Startup))]

namespace JM.ReferenceApplication
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
