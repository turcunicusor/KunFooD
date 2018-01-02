using System.ComponentModel.DataAnnotations;

namespace WebApp.DTO
{
    public class LoginDTO
    {
        [Required, MaxLength(256), Display(Name = "Email"), EmailAddress]
        public string Email { get; set; }

        [Required, MaxLength(50), Display(Name = "Password"), MinLength(6), DataType(DataType.Password)]
        public string Password { get; set; }
    }
}
