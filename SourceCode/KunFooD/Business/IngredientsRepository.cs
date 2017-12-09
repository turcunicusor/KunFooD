using System;
using System.Collections.Generic;
using System.Linq;
using Data.Domain;
using Data.Domain.Intefaces;
using Data.Persistence;

namespace Business
{
    public class IngredientsRepository : IIngredientsRepository
    {
        private readonly IDatabaseContext _databaseContext;

        public IngredientsRepository(IDatabaseContext databaseContext)
        {
            _databaseContext = databaseContext;
        }

        public void AddIngredient(Ingredient ingredient)
        {
            _databaseContext.Ingredients.Add(ingredient);
            _databaseContext.SaveChanges();
        }

        public void DeleteIngredient(Guid id)
        {
            var ingredient = GetIngredient(id);
            _databaseContext.Ingredients.Remove(ingredient);
            _databaseContext.SaveChanges();
        }

        public void EditIngredient(Ingredient ingredient)
        {
            _databaseContext.Ingredients.Update(ingredient);
            _databaseContext.SaveChanges();
        }

        public Ingredient GetIngredient(Guid id)
        {
            return _databaseContext.Ingredients.FirstOrDefault(ingredient => ingredient.Id == id);
        }

        public IReadOnlyCollection<Ingredient> GetAll()
        {
            return _databaseContext.Ingredients.ToList().AsReadOnly();
        }
    }
}
