using Data.Domain.Entities;
using Data.Domain.Intefaces;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Routing;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using WebApp.DTO;

namespace WebApp.Controllers
{
    [Route("[controller]")]
    public class RegisterController : Controller
    {
        private readonly IUsersRepository _repository;

        public RegisterController(IUsersRepository repository)
        {
            _repository = repository;
        }

        [HttpGet]
        public IActionResult Register()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Register(RegisterDTO dto)
        {
            if(ModelState.IsValid)
            {
                // Encrypt the password using SHA256
                byte[] bytes = Encoding.UTF8.GetBytes(dto.Password);
                SHA256Managed cipher = new SHA256Managed();
                byte[] hash = cipher.ComputeHash(bytes);
                string hashStr = "";
                foreach (byte b in hash)
                    hashStr += string.Format("{0:x2}", b);

                // Create the user and add it to database
                User user = Data.Domain.Entities.User.Create(dto.UserName, false, dto.Email, hashStr, null, "New user");
                await _repository.Add(user);

                // Redirect to login page with parameter registered
                return RedirectToAction("Login", new RouteValueDictionary(new {controller = "Login", Registered = 1 }));
            }

            // If there is any issue with the DTO, return to view
            return View(dto);
        }
    }
}
