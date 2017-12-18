using FluentValidation;
using WebApp.DTOs;

namespace WebApp.DTOs_Validator
{
    public class CreateUsersValidator : AbstractValidator<CreateUsers>
    {
        public CreateUsersValidator()
        {
            RuleFor(users => users.Name).NotEmpty();
            RuleFor(users => users.IsAdmin).NotEmpty();
            RuleFor(users => users.Email).EmailAddress().NotEmpty();
            RuleFor(users => users.Password).Length(8, 20);
            RuleFor(users => users.Token).NotEmpty();
            RuleFor(users => users.Description).NotEmpty().Length(0, 500);
        }
    }
}
