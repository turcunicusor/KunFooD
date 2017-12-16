using Data.Domain.Intefaces;
using Data.Persistence;

namespace Business
{
    public class FridgeRepository : IFridgeRepository
    {
        private readonly IDatabaseContext _databaseContext;
        /*
        public FridgeRepository(IDatabaseContext databaseContext)
        {
            _databaseContext = databaseContext;
        }

        public void DeletePairItem(Guid ingredientId, Guid recipeId)
        {
            var pairItem = GetPairItem(ingredientId, recipeId);
            _databaseContext.PairItems.Remove(pairItem);
        }

        public PairItem GetPairItem(Guid ingredientId, Guid recipeId)
        {
            return _databaseContext.PairItems.FirstOrDefault(pairItem =>
                pairItem.IngredientId == ingredientId && pairItem.RecipieId == recipeId);
        }
        */
    }
}
