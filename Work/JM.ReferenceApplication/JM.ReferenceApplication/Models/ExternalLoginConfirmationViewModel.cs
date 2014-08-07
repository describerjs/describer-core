using System.ComponentModel.DataAnnotations;

namespace JM.ReferenceApplication.Models
{
    public class ExternalLoginConfirmationViewModel
    {
        [Required]
        [EmailAddress]
        [Display(Name = "E-Mail")]
        public string Email
        {
            get;
            set;
        }
    }
}