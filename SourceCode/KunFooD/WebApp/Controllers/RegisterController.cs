using Microsoft.AspNetCore.Mvc;

namespace WebApp.Controllers
{
    public class RegisterController : Controller
    {
        public IActionResult Index()
        {
            return View();
        }
    }
}
