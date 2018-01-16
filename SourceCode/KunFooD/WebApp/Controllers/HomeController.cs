using System.Collections.Generic;
using System.Diagnostics;
using System.Threading.Tasks;
using Data.Domain.Intefaces;
using Microsoft.AspNetCore.Mvc;
using WebApp.DTO;
using WebApp.Filters;
using WebApp.Models;

namespace WebApp.Controllers
{
    [DefaultControllerFilter]
    public class HomeController : Controller
    {
        private readonly IRecipesRepository _recipesRepo;

        public HomeController(IRecipesRepository recipesRepo)
        {
            _recipesRepo = recipesRepo;
        }

        [HttpGet]
        public async Task<IActionResult> Index()
        {
            ViewBag.LoggedIn = false;
            
            HomepageDTO homepageDTO = new HomepageDTO();
            homepageDTO.recipeList = await _recipesRepo.GetAll();
            
            return View(homepageDTO);
        }

        [HttpGet]
        [Route("error")]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
