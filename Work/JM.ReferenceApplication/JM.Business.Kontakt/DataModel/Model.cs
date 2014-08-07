using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using JM.Business.Kontakt.Contracts.Model;

namespace JM.Business.Kontakt.DataModel
{
	/// <summary>
	/// Das Datenmodel für diese Anwendung verfolgt den Code First Ansatz von EF. 
    /// Hier werden die Tables als Klassen beschrieben, 
    /// die Verknüpfung untereinander erfolgt über Fluid Syntax im DataContext.
	/// </summary>
	[Table("PersonalData")]
	public class PersonalData : IPersonalData
	{
		[DatabaseGenerated(DatabaseGeneratedOption.Identity)]
		public int ID { get; set; }
		[Required]

        public string UserID { get; set; }

        public string Salutation { get; set; }

		public string FirstName { get; set; }

		public string LastName { get; set; }

		public string Email { get; set; }
		
        [MaxLength(5)]
		public string PostCode { get; set; }
		
        public string Mobile { get; set; }
		[Required]
		public DateTime CreatedAt { get; set; }
		
        public DateTime? LastEditAt { get; set; }
	}
}