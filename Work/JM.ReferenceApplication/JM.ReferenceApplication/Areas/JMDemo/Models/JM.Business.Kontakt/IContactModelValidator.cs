using System;

namespace JM.ReferenceApplication.Areas.JMDemo.Models.JM.Business.Kontakt
{
    public interface IContactModelValidator
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
