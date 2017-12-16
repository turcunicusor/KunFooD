using FluentValidation;
using WebApp.DTOs;

namespace WebApp.DTOs_Validator
{
    public class CreateUsersValidator : AbstractValidator<CreateUsers>
    {
        public CreateUsersValidator()
        {
            RuleFor(users => users.Name).NotEmpty().WithMessage("Please specify name.");
            RuleFor(users => users.IsAdmin).NotEmpty();
            RuleFor(users => users.Email).EmailAddress().NotEmpty().WithMessage("Please specify name.");
            RuleFor(users => users.Password).NotEmpty().Length(8, 20).WithMessage("Please specify password.");
            RuleFor(users => users.Token).NotEmpty();
            RuleFor(users => users.Description).NotEmpty().Length(0, 500);
        }
    }
}
