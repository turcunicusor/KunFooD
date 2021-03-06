﻿using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Data.Domain.Entities.Food;
using Data.Domain.Intefaces;
using Microsoft.AspNetCore.Mvc;
using WebApp.Filters;

namespace WebApp.Controllers
{
    [Route("api/[controller]")]
    [DefaultControllerFilter]
    public class IngredientsController : Controller
    {
        private readonly IIngredientsRepository _ingredientsRepository;
        private readonly IFridgeRepository _fridgeRepository;

        public IngredientsController(IIngredientsRepository ingredientsRepository, IFridgeRepository fridgeRepository)
        {
            _ingredientsRepository = ingredientsRepository;
            _fridgeRepository = fridgeRepository;
        }

        [HttpGet]
        [Route("All")]
        public async Task<IActionResult> GetAll()
        {
            return Ok(await _ingredientsRepository.GetAll());
        }

        [HttpGet]
        public async Task<IActionResult> Get(string name)
        {
            return Ok(await _ingredientsRepository.GetByName(name));
        }

        [HttpGet]
        [Route("ByRecipe")]
        public async Task<IActionResult> GetAllByRecipe(Guid recipeId)
        {
            IEnumerable<PairItem> p = await _fridgeRepository.GetByRecipe(recipeId);
            List<Ingredient> ingredients = new List<Ingredient>();
            foreach (var item in p)
                ingredients.Add(await _ingredientsRepository.FindById(item.IngredientId));
            return Ok(ingredients);
        }
    }
}
