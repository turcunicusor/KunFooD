using System.ComponentModel.DataAnnotations;

namespace WebApp.DTO
{
    public class RegisterDTO
    {
        [Required, MaxLength(256), Display(Name = "Full Name")]
        public string UserName { get; set; }

        [Required, MaxLength(256), Display(Name = "Email Address"), EmailAddress]
        public string Email { get; set; }

        [Required, MaxLength(50), Display(Name = "Password"), MinLength(6), DataType(DataType.Password)]
        public string Password { get; set; }

        [Required, MaxLength(50), Display(Name = "Confirm Password"), MinLength(6), DataType(DataType.Password)]
        [Compare("Password", ErrorMessage = "Passwords don't match.")]
        public string ConfirmPassword { get; set; }
    }
}
