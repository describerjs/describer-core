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
        private readonly Assembly _assembly;

        public EmbeddedViewPathProvider(Assembly assembly)
        {
            this._assembly = assembly;
        }

        public override bool FileExists(string virtualPath)
        {
            return base.FileExists(virtualPath) || ResourceFileExists(virtualPath);
        }

        public override VirtualFile GetFile(string virtualPath)
        {
            if (!base.FileExists(virtualPath))
            {
                return new EmbeddedVirtualFile(virtualPath, _assembly);
            }
            else
            {
                return base.GetFile(virtualPath);
            }
        }

        public override System.Web.Caching.CacheDependency GetCacheDependency(string virtualPath, System.Collections.IEnumerable virtualPathDependencies, DateTime utcStart)
        {
            if (ResourceFileExists(virtualPath))
            {
                return null;
            }
            else
            {
                return Previous.GetCacheDependency(virtualPath, virtualPathDependencies, utcStart);
            }
        }

        private bool ResourceFileExists(string virtualPath)
        {
            var resourcename = EmbeddedVirtualFile.GetResourceName(virtualPath);
            var result = resourcename != null && _assembly.GetManifestResourceNames().Contains(resourcename);
            return result;
        }

        private class EmbeddedVirtualFile : VirtualFile
        {
            private readonly Assembly _assembly;

            public EmbeddedVirtualFile(string virtualPath, Assembly assembly)
                : base(virtualPath)
            {
                this._assembly = assembly;
            }

            public override Stream Open()
            {
                var resourcename = GetResourceName(this.VirtualPath);
                return _assembly.GetManifestResourceStream(resourcename);
            }

            internal static string GetResourceName(string virtualPath)
            {
                if (!virtualPath.Contains("Areas/Manager/Views/Extensions"))
                {
                    return null;
                }

                var resourcename =
                    "JM.Foundation.Piranha.Extensions." + virtualPath.Split('/').Last();

                return resourcename;
            }
        }
    }
}
