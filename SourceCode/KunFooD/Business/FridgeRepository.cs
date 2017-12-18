using System;
using System.Linq;
using System.Threading.Tasks;
using Data.Domain.Entities.Food;
using Data.Domain.Intefaces;
using Data.Persistence;
using Microsoft.EntityFrameworkCore;

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

        public async Task Delete(Guid ingredientId, Guid recipeId)
        {
            var pairItem = Get(ingredientId, recipeId);
            _databaseContext.PairItems.Remove(pairItem.Result);
            await Save();
        }

        public async Task<PairItem> Get(Guid ingredientId, Guid recipeId)
        {
            return await _databaseContext.PairItems.FirstOrDefaultAsync(pairItem =>
            pairItem.IngredientId == ingredientId && pairItem.RecipieId == recipeId);
        }
    }
}
