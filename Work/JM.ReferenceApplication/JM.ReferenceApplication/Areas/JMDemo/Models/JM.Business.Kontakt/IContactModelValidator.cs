using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace JM.ReferenceApplication.Areas.JMDemo.Models.JM.Business.Kontakt
{
    public interface  IContactModelValidator
    {
        void Validate();
    }

    public class ContactModelValidator : IContactModelValidator
    {
        public void Validate()
        {
            throw new NotImplementedException();
        }
    }
}
