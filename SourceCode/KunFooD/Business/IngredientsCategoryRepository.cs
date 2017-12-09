using System;
using System.Collections.Generic;
using System.Linq;
using Data.Domain;
using Data.Domain.Intefaces;
using Data.Persistence;

namespace Business
{
    public class IngredientsCategoryRepository : IIngredientsCategoryRepository
    {
        private readonly IDatabaseContext _databaseContext;

        public IngredientsCategoryRepository(IDatabaseContext databaseContext)
        {
            _databaseContext = databaseContext;
        }

        public void Add(IngredientCategory ingredientCategory)
        {
            _databaseContext.IngredientCategories.Add(ingredientCategory);
            _databaseContext.SaveChanges();
        }

        public void Delete(Guid id)
        {
            var ingredientCategory = Get(id);
            _databaseContext.IngredientCategories.Remove(ingredientCategory);
            _databaseContext.SaveChanges();
        }

        public void Edit(IngredientCategory ingredientCategory)
        {
            _databaseContext.IngredientCategories.Update(ingredientCategory);
            _databaseContext.SaveChanges();
        }

        public IngredientCategory Get(Guid id)
        {
            return _databaseContext.IngredientCategories.FirstOrDefault(ingredientCategory =>
                ingredientCategory.Id == id);
        }

        public IReadOnlyCollection<IngredientCategory> GetAll()
        {
            return _databaseContext.IngredientCategories.ToList().AsReadOnly();
        }
    }
}
