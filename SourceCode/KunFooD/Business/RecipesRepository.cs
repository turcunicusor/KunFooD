using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Data.Domain.Entities;
using Data.Domain.Entities.Food;
using Data.Domain.Intefaces;
using Data.Persistence;
using Microsoft.EntityFrameworkCore;

namespace Business
{
    public class RecipesRepository :
        GenericRepository<Recipe>, IRecipesRepository
    {
        private readonly IDatabaseContext _databaseContext;

        public RecipesRepository(IDatabaseContext databaseContext) : base(databaseContext)
        {
            _databaseContext = databaseContext;
        }

        public double GetCostById(Guid id)
        {
            double cost = 0;
            var fridgeRepository = new FridgeRepository(_databaseContext);
            var ingredientRepository = new IngredientsRepository(_databaseContext);
            Ingredient ingredient;
            IEnumerable<PairItem> pairs = fridgeRepository.GetByRecipe(id).Result;
            foreach(PairItem pair in pairs)
            {
                ingredient = ingredientRepository.FindById(pair.IngredientId).Result;
                cost += ingredient.Cost * pair.Quantity;
            }
            
            return cost;
        }

        public async Task UpdateAllCosts()
        {
            IEnumerable<Recipe> recipes = await GetAll();

            foreach (Recipe recipe in recipes)
            {
                recipe.Cost = GetCostById(recipe.Id);
            }
            await Save();
        }

        public async Task<IEnumerable<Recipe>> GetByKitchenType(KitchenType cuisine, Task<IEnumerable<Recipe>> recipes)
        {
            return (await recipes).Where(recipe =>
                recipe.Cuisine == cuisine);
        }

        public async Task<IEnumerable<Recipe>> GetByCost(Double cost, Task<IEnumerable<Recipe>> recipes)
        {
            //UpdateAllCosts();
            return (await recipes).Where(recipe =>
                recipe.Cost < cost && recipe.Cost > 0); //when recipe.Cost == 0 then it's unspecified
        }

        public async Task<IEnumerable<Recipe>> GetByName(String name, Task<IEnumerable<Recipe>> recipes)
        {
            return (await recipes).Where(recipe =>
                recipe.Name.Contains(name));
        }

        public async Task<IEnumerable<Recipe>> GetByRating(Double rating, Task<IEnumerable<Recipe>> recipes)
        {
            return (await recipes).Where(recipe =>
                recipe.Rating >= rating);
        }

        public async Task<IEnumerable<Recipe>> GetByVotesNumber(int votes, Task<IEnumerable<Recipe>> recipes)
        {
            return (await recipes).Where(recipe =>
                recipe.VotesNumber >= votes);
        }

        public async Task<IEnumerable<Recipe>> GetByPrepatationTime(int minutes, Task<IEnumerable<Recipe>> recipes)
        {
            return (await recipes).Where(recipe =>
                recipe.PreparationTime >= minutes - 5 && recipe.PreparationTime <= minutes + 5);
        }

        public bool ContainsIngredient(Guid recipeId, Guid ingredientId)
        {
            var fridgeRepository = new FridgeRepository(_databaseContext);
            IEnumerable<PairItem> pairs = fridgeRepository.GetByRecipe(recipeId).Result;
            foreach (PairItem pair in pairs)
            {
                if (pair.IngredientId == ingredientId)
                    return true;
            }
            return false;
        }

        public int IngredientsNumber(Guid recipeId)
        {
            var fridgeRepository = new FridgeRepository(_databaseContext);
            IEnumerable<PairItem> pairs = fridgeRepository.GetByRecipe(recipeId).Result;
            return pairs.Count();
        }

        public bool IncludesTheseIngredients(Guid recipeId, List<Ingredient> ingredients)
        {
            foreach (var ingredient in ingredients)
            {
                if (false == ContainsIngredient(recipeId, ingredient.Id))
                    return false;
            }
            return true;
        }

        public bool ExcludesTheseIngredients(Guid recipeId, List<Ingredient> ingredients)
        {
            foreach (var ingredient in ingredients)
            {
                if (ContainsIngredient(recipeId, ingredient.Id))
                    return false;
            }
            return true;
        }

        public async Task<IEnumerable<Recipe>> GetByIngredients(List<Ingredient> included, List<Ingredient> excluded, Task<IEnumerable<Recipe>> recipes)
        {
            //the lists should contain different ingrdients
            return (await recipes).Where(recipe =>
                IncludesTheseIngredients(recipe.Id, included) && ExcludesTheseIngredients(recipe.Id, excluded));
        }

        public async Task<IEnumerable<Recipe>> GetByOnlyIngredients(List<Ingredient> ingredients, Task<IEnumerable<Recipe>> recipes)
        {
            //the lists should contain different ingrdients

            return (await recipes).Where(recipe =>
                IncludesTheseIngredients(recipe.Id, ingredients) && ingredients.Count == IngredientsNumber(recipe.Id));
        }

        public async Task<IEnumerable<Recipe>> GetByFilter(Filter filter)
        {
            return await GetAll();
        }
    }
}
