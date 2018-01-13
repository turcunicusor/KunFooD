using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Data.Domain.Entities.Food;
using Data.Domain.Intefaces;
using Data.Persistence;

namespace Business
{
    public class IngredientsCategoryRepository :
        GenericRepository<IngredientCategory>, IIngredientsCategoryRepository
    {
        private readonly IDatabaseContext _databaseContext;

        public IngredientsCategoryRepository(IDatabaseContext databaseContext) : base(databaseContext)
        {
            _databaseContext = databaseContext;
        }

        public async Task<bool> Exists(String name)
        {
            IEnumerable<IngredientCategory> categories = await GetAll();
            foreach (var ingredientCategory in categories)
                if (name.Equals(ingredientCategory.Name))
                    return true;
            return false;
        }

        public async Task<IngredientCategory> GetByName(string name)
        {
            IEnumerable<IngredientCategory> categories = await GetAll();
            foreach (var ingredientCategory in categories)
                if (name.Equals(ingredientCategory.Name))
                    return ingredientCategory;
            return null;
        }

    }
}
