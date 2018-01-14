using System.IdentityModel.Tokens.Jwt;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using WebApp.DTO;
using WebApp.Security;
using Data.Domain.Entities;
using Data.Domain.Intefaces;
using Microsoft.Extensions.Primitives;
using System.Text;
using System.Security.Cryptography;
using Microsoft.AspNetCore.Http;
using WebApp.Filters;

namespace WebApp.Controllers
{
    [Route("[controller]")]
    [DefaultControllerFilter]
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
            HttpContext.Request.Query.TryGetValue("Registered", out var registered);

            // Send registered value to the view
            if (registered.Equals(StringValues.Empty))
                ViewData["Registered"] = 0;
            else
                ViewData["Registered"] = int.Parse(registered);
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Login(LoginDTO dto)
        {
            User user = await _repository.GetByEmail(dto.Email);

            // Check if the user exists
            if (user != null)
            {
                // Hash the model password
                byte[] bytes = Encoding.UTF8.GetBytes(dto.Password);
                SHA256Managed cipher = new SHA256Managed();
                byte[] hash = cipher.ComputeHash(bytes);
                string hashStr = "";
                foreach (byte b in hash)
                    hashStr += string.Format("{0:x2}", b);

                // Check if the passwords match
                if (user.Password.Equals(hashStr))
                {
                    // Generate the token
                    var token = JwtToken.GenerateToken(user);

                    // Write the token to the cookie
                    Response.Cookies.Append("SessionId", new JwtSecurityTokenHandler().WriteToken(token));

                    HttpContext.Session.SetString("user_id", user.Id.ToString());
                    // Redirect to homepage
                    return RedirectToAction("Index", "Home");
                }
                ModelState.AddModelError("", "Invalid password!");
            }
            else
                ModelState.AddModelError("", "Account is not registered!");

            // If something went bad, return the model back to view
            return View(dto);
        }
    }
}
