using FluentValidation;
using WebApp.DTOs;

namespace WebApp.DTOs_Validator
{
    public class RegisterValidator : AbstractValidator<Register>
    {
        public RegisterValidator()
        {
            RuleFor(usr => usr.UserName).NotEmpty();
            RuleFor(usr => usr.Email).NotEmpty().EmailAddress();
            RuleFor(usr => usr.Password).Length(8, 20);
            RuleFor(usr => usr.ConfirmPassword).NotEmpty();
            RuleFor(usr => usr.ConfirmPassword).Equal(usr => usr.Password).WithMessage("Passwords do not match!");
        }
    }
}
