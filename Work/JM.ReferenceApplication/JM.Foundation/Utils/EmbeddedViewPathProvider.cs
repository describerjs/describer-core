using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using System.Web.Hosting;

namespace JM.Foundation.Utils
{
    public class EmbeddedViewPathProvider : VirtualPathProvider
    {
        private class EmbeddedVirtualFile : VirtualFile
        {
            private readonly Assembly assembly;

            public EmbeddedVirtualFile(string virtualPath, Assembly assembly)
                : base(virtualPath)
            {
                this.assembly = assembly;
            }

            internal static string GetResourceName(string virtualPath)
            {
                if (!virtualPath.Contains("Areas/Manager/Views/Extensions"))
                {
                    return null;
                }

                var resourcename =
                    "JM.Foundation.Piranha.Areas.Manager.Views.Extensions." + virtualPath.Split('/').Last();

                return resourcename;
            }

            public override Stream Open()
            {
                var resourcename = GetResourceName(this.VirtualPath);
                return assembly.GetManifestResourceStream(resourcename);
            }
        }

        private readonly Assembly assembly;

        public EmbeddedViewPathProvider(Assembly assembly)
        {
            this.assembly = assembly;
        }

        private bool ResourceFileExists(string virtualPath)
        {
            var resourcename = EmbeddedVirtualFile.GetResourceName(virtualPath);
            var result = resourcename != null && assembly.GetManifestResourceNames().Contains(resourcename);
            return result;
        }

        public override bool FileExists(string virtualPath)
        {
            return base.FileExists(virtualPath) || ResourceFileExists(virtualPath);
        }


        public override VirtualFile GetFile(string virtualPath)
        {
            if (!base.FileExists(virtualPath))
            {
                return new EmbeddedVirtualFile(virtualPath, assembly);
            }
            else
            {
                return base.GetFile(virtualPath);
            }
        }
    }
}
