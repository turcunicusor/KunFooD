using System;
using System.Threading.Tasks;
using Data.Domain.Entities;
using Data.Domain.Entities.Food;
using Data.Domain.Intefaces;
using Microsoft.AspNetCore.Mvc;
using WebApp.DTO;
using WebApp.Filters;

namespace WebApp.Controllers
{
    [Route("api/[controller]")]
    [DefaultControllerFilter]
    public class RecipesController : Controller
    {
        private readonly IRecipesRepository _recipesRepository;
        private readonly IIngredientsRepository _ingredientsRepository;
        private readonly IUsersRepository _usersRepository;

        public RecipesController(IRecipesRepository recipesRepository, IIngredientsRepository ingredientsRepository, IUsersRepository usersRepository)
        {
            _recipesRepository = recipesRepository;
            _ingredientsRepository = ingredientsRepository;
            _usersRepository = usersRepository;
        }

        [HttpPost]
        public async Task<IActionResult> Create([FromBody] RecipeDTO recipeDto)
        {
            User adminUser = await _usersRepository.GetByName("admin");
            var recipe = Recipe.Create(adminUser.Id, recipeDto.Name, recipeDto.Content, RecipeStatusType.Approved,
                recipeDto.PreparationTime, recipeDto.Servings, KitchenType.Unspecified);
            await _recipesRepository.Add(recipe);
            foreach (var ingredient in recipeDto.Ingredients)
                await _ingredientsRepository.AddIngredientCustom(recipe.Id, ingredient.Category, ingredient.MeasurementUnit,
                    ingredient.Name, ingredient.Quantity);
            return Ok(recipe);
        }

        [HttpGet]
        [Route("All")]
        public async Task<IActionResult> GetAll()
        {
            return Ok(await _recipesRepository.GetAll());
        }

        [HttpGet]
        public async Task<IActionResult> Get(string name)
        {
            return Ok(await _recipesRepository.GetByName(name, _recipesRepository.GetAll()));
        }
    }
}
