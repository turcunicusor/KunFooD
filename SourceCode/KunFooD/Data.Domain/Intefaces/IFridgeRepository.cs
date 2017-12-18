using System;
using System.Threading.Tasks;
using Data.Domain.Entities.Food;

namespace Data.Domain.Intefaces
{
    public interface IFridgeRepository : IGenericRepository<PairItem>
    {
        Task Delete(Guid ingredientId, Guid recipeId);
        Task<PairItem> Get(Guid ingredientId, Guid recipeId);
    }
}
