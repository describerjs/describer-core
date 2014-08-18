﻿using Piranha.IO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JM.Foundation.Piranha.Provider
{
    public class FileStorageProvider : global::Piranha.IO.LocalMediaProvider
    {
        public FileStorageProvider() : base(@"c:\temp\PiranhaMedia\Content", @"c:\temp\PiranhaMedia\Uploads")
        {
        }
    }
}
