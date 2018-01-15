using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Data.Domain.Intefaces;
using Microsoft.AspNetCore.Mvc;
using WebApp.Filters;

namespace WebApp.Controllers
{
    [Route("api/[controller]")]
    [DefaultControllerFilter]
    public class IngredientCategoryController : Controller
    {
        private readonly IIngredientsCategoryRepository _ingredientsCategoryRepository;

        public IngredientCategoryController(IIngredientsCategoryRepository ingredientsCategoryRepository)
        {
            _ingredientsCategoryRepository = ingredientsCategoryRepository;
        }

        [HttpGet]
        [Route("All")]
        public async Task<IActionResult> GetAll()
        {
            return Ok(await _ingredientsCategoryRepository.GetAll());
        }
    }
}
