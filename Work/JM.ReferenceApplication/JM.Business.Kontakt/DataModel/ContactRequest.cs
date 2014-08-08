using JM.Business.Kontakt.Contracts.Model;
using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace JM.Business.Kontakt.DataModel
{
    [Table("ContactRequest")]
    public class ContactRequest : IContactRequest
    {
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ID { get; set; }
        [Required]
        public string UserID { get; set; }

        public string Subject { get; set; }

        public string Message { get; set; }
        
        [Required]
        public DateTime CreatedAt { get; set; }
    }
}