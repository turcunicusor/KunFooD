using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Data.Domain.Entities;
using Data.Domain.Entities.Food;
using Data.Domain.Intefaces;
using Microsoft.AspNetCore.Mvc;
using WebApp.DTO;
using WebApp.Filters;

namespace WebApp.Controllers
{
    [Route("[controller]")]
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
                    ingredient.Name, ingredient.Quantity, ingredient.Cost, ingredient.Weight);
            return Ok(recipe);
        }

        [HttpGet]
        [Route("All")]
        public async Task<IActionResult> GetAll()
        {
            await _recipesRepository.UpdateAllCosts();
            return Ok(await _recipesRepository.GetAll());
        }

        [HttpGet]
        public async Task<IActionResult> Get(string name)
        {
            return Ok(await _recipesRepository.GetByName(name, _recipesRepository.GetAll()));
        }

        [HttpPost]
        [Route("Filter")]
        public async Task<IActionResult> FilterRecipes([FromBody] FilterDTO filterDto)
        {
            if ((filterDto.IncludedIngredients.Count != 0 || filterDto.ExcludedIngredients.Count != 0) &&
                   filterDto.OnlyIngredients.Count != 0)
                return BadRequest("Ingredients lists are initialized wrong");
            List<Ingredient> includedIngredients = new List<Ingredient>();
            List<Ingredient> onlyIngredients = new List<Ingredient>();
            List<Ingredient> excludedIngredients = new List<Ingredient>();
            foreach (var ing in filterDto.IncludedIngredients)
                includedIngredients.Add(await _ingredientsRepository.GetByNameAndMeasure(ing.Name, ing.MeasurementUnit));
            foreach (var ing in filterDto.OnlyIngredients)
                onlyIngredients.Add(await _ingredientsRepository.GetByNameAndMeasure(ing.Name, ing.MeasurementUnit));
            foreach (var ing in filterDto.ExcludedIngredients)
                excludedIngredients.Add(await _ingredientsRepository.GetByNameAndMeasure(ing.Name, ing.MeasurementUnit));
            Filter filter = new Filter
            {
                Cost = filterDto.Cost,
                Cuisine = filterDto.Cuisine,
                ExcludedIngredients = excludedIngredients,
                IncludedIngredients = includedIngredients,
                Name = filterDto.Name,
                OnlyIngredients = onlyIngredients,
                PreparationTime = filterDto.PreparationTime,
                Rating = filterDto.Rating,
                VotesNumber = filterDto.VotesNumber
            };
            return Ok(await _recipesRepository.GetByFilter(filter));
        }

        [HttpGet("[action]")]
        public async Task<IActionResult> Details(Guid id)
        {
            RecipeDTO recipeDto = new RecipeDTO();

            var recipe = await _recipesRepository.FindById(id);

            recipeDto.Content = recipe.Content;
            recipeDto.Name = recipe.Name;
            recipeDto.PreparationTime = recipe.PreparationTime;
            recipeDto.Servings = recipe.NrPeopleQuantity;

            return View(recipeDto);
        }
    }
}
