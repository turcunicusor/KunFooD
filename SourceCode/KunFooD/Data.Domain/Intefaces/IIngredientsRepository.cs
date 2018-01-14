using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Data.Domain.Entities.Food;

namespace Data.Domain.Intefaces
{
    public interface IIngredientsRepository : IGenericRepository<Ingredient>
    {
        Task AddIngredientCustom(Guid recipeId, string categoryName, string measureUnit, string name,
            double quantity);
        Task<IEnumerable<Ingredient>> GetByName(string name);
    }
}
