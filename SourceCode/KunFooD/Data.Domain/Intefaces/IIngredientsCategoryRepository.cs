using System;
using System.Collections.Generic;
using System.Text;

namespace Data.Domain.Intefaces
{
    public interface IIngredientsCategoryRepository
    {
        void Add(IngredientCategory ingredientCategory);
        void Delete(Guid id);
        void Edit(IngredientCategory ingredientCategory);
        IngredientCategory Get(Guid id);
        IReadOnlyCollection<IngredientCategory> GetAll();
    }
}
