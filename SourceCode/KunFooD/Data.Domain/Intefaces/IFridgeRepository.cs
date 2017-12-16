using System;
using Data.Domain.Entities.Food;

namespace Data.Domain.Intefaces
{
    public interface IFridgeRepository : IGenericRepository<PairItem>
    {
        void Delete(Guid ingredientId, Guid recipeId);
        PairItem Get(Guid ingredientId, Guid recipeId);
    }
}
