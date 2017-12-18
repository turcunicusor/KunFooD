using Microsoft.AspNetCore.Mvc;
using WebApp.DTOs;
using WebApp.Filters;

namespace WebApp.Controllers
{
    [Route("api/[controller]")]
    [DefaultControllerFilter]
    public class LoginController : Controller
    {
        [HttpGet]
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public IActionResult Login([FromBody] Login newLogin)
        {
            // to do
            return Ok(newLogin);
        }
    }
}
