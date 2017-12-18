﻿using System.IdentityModel.Tokens.Jwt;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using WebApp.DTOs;
using WebApp.Filters;
using WebApp.Security;
using Data.Domain.Entities;
using Data.Domain.Intefaces;

namespace WebApp.Controllers
{
    [Route("api/[controller]")]
    [DefaultControllerFilter]
    public class LoginController : Controller
    {
        private readonly IUsersRepository _repository;

        public LoginController(IUsersRepository repository)
        {
            _repository = repository;
        }

        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Login([FromBody] Login newLogin)
        {
            User user = await _repository.GetByEmail(newLogin.Email);
            if (user != null)
            {
                var token = JwtToken.GenerateToken(user);
                return Ok(new
                {
                    token = new JwtSecurityTokenHandler().WriteToken(token)
                });
            }
            return Unauthorized();
        }
    }
}
