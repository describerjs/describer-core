using System.ComponentModel.DataAnnotations;

namespace JM.ReferenceApplication.Infrastructure.Models
{
    public class LoginViewModel
    {
        [Required]
        [Display(Name = "Benutzername")]
        [StringLength(20, ErrorMessage = "\"{0}\" muss mindestens {2} Zeichen lang sein.", MinimumLength = 6)]
        public string UserName { get; set; }

        [Required]
        [DataType(DataType.Password)]
        [Display(Name = "Kennwort")]
        public string Password { get; set; }

        [Display(Name = "Speichern?")]
        public bool RememberMe { get; set; }
    }
}