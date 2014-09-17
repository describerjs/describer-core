using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace JM.Foundation
{
    public static class LinqExtensions
    {
        public static IEnumerable<T> Concat<T>(this IEnumerable<T> list, T elem)
        {
            return list.Concat(new T[] { elem });
        }
    }
}
