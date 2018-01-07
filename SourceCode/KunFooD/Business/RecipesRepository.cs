using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Data.Domain.Entities.Food;
using Data.Domain.Intefaces;
using Data.Persistence;

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
            IEnumerable<Recipe> recipes = GetAll().Result;

            foreach (Recipe recipe in recipes)
            {
                recipe.Cost = GetCostById(recipe.Id);
            }
            await Save();
        }
    }
}
