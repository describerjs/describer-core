using System;
using System.ComponentModel.DataAnnotations;
using JM.Business.Kontakt.Contracts.Model;

namespace JM.Business.Kontakt.Business.Model
{
	public class PersonalData : IPersonalData
	{
		[Required]
		public int ID { get; set; }
		[Required]
		public string UserID { get; set; }
        [Required(AllowEmptyStrings = false, ErrorMessage = "Bitte geben Sie eine Anrede an")]
        [RegularExpression(@"^(Herr|Frau)$", ErrorMessage = "Bitte wählen Sie zwischen 'Herr' und 'Frau'")]
        public string Salutation
        {
            get;
            set;
        }

        public string FirstName
        {
            get;
            set;
        }

        public string LastName
        {
            get;
            set;
        }

        public string Email
        {
            get;
            set;
        }

        public string PostCode
        {
            get;
            set;
        }

        public string Mobile
        {
            get;
            set;
        }

        public DateTime CreatedAt
        {
            get;
            set;
        }

        public DateTime? LastEditAt
        {
            get;
            set;
        }
    }
}
