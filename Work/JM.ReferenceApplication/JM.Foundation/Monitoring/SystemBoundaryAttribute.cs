using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JM.Foundation
{
    public class SystemBoundaryAttribute : Attribute
    {
        public SystemBoundaryAttribute(string businessContext, BusinesImpact impact)
        {
            this.BusinessContext = businessContext;
            this.Impact = impact;
        }

        public string BusinessContext
        {
            get;
            private set;
        }

        public BusinesImpact Impact
        {
            get;
            private set;
        }
    }
}