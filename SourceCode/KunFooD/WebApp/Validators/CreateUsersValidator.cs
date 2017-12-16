using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using FluentValidation;
using WebApp.DTOs;

namespace WebApp.Validators
{
    public class CreateUsersValidator : AbstractValidator<CreateUsers>
    {
        public CreateUsersValidator()
        {
            RuleFor(users => users.Name).NotEmpty();
            RuleFor(users => users.Password).NotEmpty();
            RuleFor(users => users.Email).EmailAddress();
        }
    }
}
