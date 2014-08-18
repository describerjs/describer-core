using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JM.Foundation.Piranha.Provider
{
    public class FileStorageProvider : global::Piranha.IO.LocalMediaCacheProvider
    {
        public FileStorageProvider() : base(@"c:\temp\PiranhaMedia", @"c:\temp\PiranhaMedia\Content", @"c:\temp\PiranhaMedia\Uploads")
        {

        }
    }
}
