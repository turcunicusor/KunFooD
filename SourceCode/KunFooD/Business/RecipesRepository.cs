using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Data.Domain.Entities;
using Data.Domain.Entities.Food;
using Data.Domain.Intefaces;
using Data.Persistence;

namespace Business
{
    public class RecipesRepository :
        GenericRepository<Recipe>, IRecipesRepository
    {
        private readonly IDatabaseContext _databaseContext;
        private readonly IFridgeRepository _fridgeRepository;
        private readonly IIngredientsRepository _ingredientsRepository;

        public RecipesRepository(IDatabaseContext databaseContext, IFridgeRepository fridgeRepository, IIngredientsRepository ingredientsRepository) : base(databaseContext)
        {
            _databaseContext = databaseContext;
            _fridgeRepository = fridgeRepository;
            _ingredientsRepository = ingredientsRepository;
        }

        public async Task<Double> GetCostById(Guid id)
        {
            double cost = 0;
            IEnumerable<PairItem> pairs = await _fridgeRepository.GetByRecipe(id);
            foreach (PairItem pair in pairs)
            {
                var ingredient = await _ingredientsRepository.FindById(pair.IngredientId);
                cost += ingredient.Cost * pair.Quantity;
            }
            return cost;
        }

        public async Task UpdateAllCosts()
        {
            IEnumerable<Recipe> recipes = await GetAll();
            foreach (Recipe recipe in recipes)
            {
                recipe.Cost = await GetCostById(recipe.Id);
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
                recipe.Name.ToLower().Contains(name.ToLower()));
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
            int aproxError = 10;
            return (await recipes).Where(recipe =>
                recipe.PreparationTime >= minutes - aproxError && recipe.PreparationTime <= minutes + aproxError);
        }

        public async Task<bool> ContainsIngredient(Guid recipeId, Guid ingredientId)
        {
            IEnumerable<PairItem> pairs = await _fridgeRepository.GetByRecipe(recipeId);
            foreach (PairItem pair in pairs)
            {
                if (pair.IngredientId == ingredientId)
                    return true;
            }
            return false;
        }

        public async Task<int> IngredientsNumber(Guid recipeId)
        {
            IEnumerable<PairItem> pairs = await _fridgeRepository.GetByRecipe(recipeId);
            return pairs.Count();
        }

        public async Task<bool> IncludesTheseIngredients(Guid recipeId, List<Ingredient> ingredients)
        {
            foreach (var ingredient in ingredients)
            {
                if (false == await ContainsIngredient(recipeId, ingredient.Id))
                    return false;
            }
            return true;
        }

        public async Task<bool> ExcludesTheseIngredients(Guid recipeId, List<Ingredient> ingredients)
        {
            foreach (var ingredient in ingredients)
            {
                if (await ContainsIngredient(recipeId, ingredient.Id))
                    return false;
            }
            return true;
        }
        public async Task<IEnumerable<Recipe>> GetByIngredients(List<Ingredient> included, List<Ingredient> excluded, Task<IEnumerable<Recipe>> recipes)
        {
            //the lists should contain different ingrdients
            List<Recipe> recipesResult = new List<Recipe>();
            foreach (var recipe in recipes.Result)
            {
                if(await IncludesTheseIngredients(recipe.Id, included) && await ExcludesTheseIngredients(recipe.Id, excluded))
                    recipesResult.Add(recipe);
            }
            return recipesResult;
        }

        public async Task<IEnumerable<Recipe>> GetByOnlyIngredients(List<Ingredient> ingredients, Task<IEnumerable<Recipe>> recipes)
        {
            //the lists should contain different ingrdients
            List<Recipe> recipesResult = new List<Recipe>();
            foreach (var recipe in recipes.Result)
            {
                if (await IncludesTheseIngredients(recipe.Id, ingredients) && ingredients.Count == await IngredientsNumber(recipe.Id))
                    recipesResult.Add(recipe);
            }
            return recipesResult;
        }

        public async Task<IEnumerable<Recipe>> GetByFilter(Filter filter)
        {
            Task<IEnumerable<Recipe>> recipes = GetAll();
            if (filter.Cuisine != KitchenType.Unspecified)
                recipes = GetByKitchenType(filter.Cuisine, recipes);
            if (filter.Cost > 0)
                recipes = GetByCost(filter.Cost, recipes);
            if (filter.Name != "")
                recipes = GetByName(filter.Name, recipes);
            recipes = GetByRating(filter.Rating, recipes);
            recipes = GetByVotesNumber(filter.VotesNumber, recipes);
            if (filter.PreparationTime != 0)
                recipes = GetByPrepatationTime(filter.PreparationTime, recipes);

            if (filter.OnlyIngredients.Count != 0)
                recipes = GetByOnlyIngredients(filter.OnlyIngredients, recipes);
            else if (filter.ExcludedIngredients.Count != 0|| filter.IncludedIngredients.Count != 0)
                recipes = GetByIngredients(filter.IncludedIngredients, filter.ExcludedIngredients, recipes);

            return await recipes;
        }
    }
}
