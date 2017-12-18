using Data.Domain.Entities;
using Data.Domain.Intefaces;
using Microsoft.AspNetCore.Mvc;
using WebApp.DTOs;
using WebApp.Filters;

namespace WebApp.Controllers
{
    [Route("api/[controller]")]
    [DefaultControllerFilter]
    public class RegisterController : Controller
    {
        private readonly IUsersRepository _repository;

        public RegisterController(IUsersRepository repository)
        {
            _repository = repository;
        }

        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Register([FromBody] Register newUser)
        {
            User user = Data.Domain.Entities.User.Create(newUser.UserName, false, newUser.Email, newUser.Password, null, null);
            _repository.Add(user);
            return Ok(user);
        }
    }
}
