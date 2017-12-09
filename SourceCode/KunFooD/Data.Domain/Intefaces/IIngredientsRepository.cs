using System;
using System.Collections.Generic;
using System.Text;

namespace Data.Domain.Intefaces
{
    public interface IIngredientsRepository
    {
        void AddIngredient(Ingredient ingredient);
        void DeleteIngredient(Guid id);
        void EditIngredient(Ingredient ingredient);
        Ingredient GetIngredient(Guid id);
        IReadOnlyCollection<Ingredient> GetAll();
    }
}
