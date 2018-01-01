using System.IdentityModel.Tokens.Jwt;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using WebApp.DTO;
using WebApp.Filters;
using WebApp.Security;
using Data.Domain.Entities;
using Data.Domain.Intefaces;
using Microsoft.Extensions.Primitives;

namespace WebApp.Controllers
{
    [Route("[controller]")]
    public class LoginController : Controller
    {
        private readonly IUsersRepository _repository;

        public LoginController(IUsersRepository repository)
        {
            _repository = repository;
        }

        [HttpGet]
        public IActionResult Login()
        {
            // Get the Registered parameter if available
            StringValues registered;
            HttpContext.Request.Query.TryGetValue("Registered", out registered);

            // Send registered value to the view
            if (registered.Equals(StringValues.Empty))
                ViewData["Registered"] = 0;
            else
                ViewData["Registered"] = int.Parse(registered);
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
