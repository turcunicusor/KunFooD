using System;
using System.Linq;
using Data.Domain.Entities.Food;
using Data.Domain.Intefaces;
using Data.Persistence;

namespace Business
{
    public class FridgeRepository :
        GenericRepository<PairItem>, IFridgeRepository
    {
        private readonly IDatabaseContext _databaseContext;

        public FridgeRepository(IDatabaseContext databaseContext) : base(databaseContext)
        {
            _databaseContext = databaseContext;
        }

        public void Delete(Guid ingredientId, Guid recipeId)
        {
            var pairItem = Get(ingredientId, recipeId);
            _databaseContext.PairItems.Remove(pairItem);
            Save();
        }

        public PairItem Get(Guid ingredientId, Guid recipeId)
        {
            return _databaseContext.PairItems.FirstOrDefault(pairItem =>
            pairItem.IngredientId == ingredientId && pairItem.RecipieId == recipeId);
        }
    }
}
