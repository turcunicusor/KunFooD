﻿using FluentValidation;
using WebApp.DTOs;

namespace WebApp.DTOs_Validator
{
    public class LoginValidator : AbstractValidator<Login>
    {
        public LoginValidator()
        {
            RuleFor(usr => usr.Email).NotEmpty().EmailAddress();
            RuleFor(usr => usr.Password).Length(8, 20);
        }
    }
}
