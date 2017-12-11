using System;
using System.Collections.Generic;
using System.Linq;
using Data.Domain;
using Data.Domain.Entities.Food;
using Data.Domain.Intefaces;
using Data.Persistence;

namespace Business
{
    public class RecipesRepository : IRecipesRepository
    {
        private readonly IDatabaseContext _databaseContext;

        public RecipesRepository(IDatabaseContext databaseContext)
        {
            _databaseContext = databaseContext;
        }

        public void AddRecipe(Recipe recipe)
        {
            _databaseContext.Recipes.Add(recipe);
            _databaseContext.SaveChanges();
        }

        public void DeleteRecipe(Guid id)
        {
            var recipe = GetRecipe(id);
            _databaseContext.Recipes.Remove(recipe);
            _databaseContext.SaveChanges();
        }

        public void EditRecipe(Recipe recipe)
        {
            _databaseContext.Recipes.Update(recipe);
            _databaseContext.SaveChanges();
        }

        public Recipe GetRecipe(Guid id)
        {
            return _databaseContext.Recipes.FirstOrDefault(recipe => recipe.Id == id);
        }

        public IReadOnlyCollection<Recipe> GetAll()
        {
            return _databaseContext.Recipes.ToList().AsReadOnly();
        }
    }
}
