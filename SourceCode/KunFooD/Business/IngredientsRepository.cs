using System;
using System.Collections;
using System.Collections.Generic;
using System.Threading.Tasks;
using Data.Domain.Entities.Food;
using Data.Domain.Intefaces;
using Data.Persistence;

namespace Business
{
    public class IngredientsRepository :
        GenericRepository<Ingredient>, IIngredientsRepository
    {
        private readonly IDatabaseContext _databaseContext;

        public IngredientsRepository(IDatabaseContext databaseContext) : base(databaseContext)
        {
            _databaseContext = databaseContext;
        }

        public bool Exists(String name)
        {
            IEnumerable<Ingredient> ingredients = GetAll().Result;
            foreach (var ingredient in ingredients)
            {
                if (name.Equals(ingredient.Name))
                    return true;
            }
            return false;
        }

        public bool Exists(String name, string measureUnit)
        {
            IEnumerable<Ingredient> ingredients = GetAll().Result;
            foreach (var ingredient in ingredients)
            {
                if (name.Equals(ingredient.Name) && measureUnit.Equals(ingredient.MeasuredUnit))
                    return true;
            }
            return false;
        }

        public Ingredient GetByNameAndMeasure(String name, String measureUnit)
        {
            IEnumerable<Ingredient> ingredients = GetAll().Result;
            foreach (var ingredient in ingredients)
            {
                if (name.Equals(ingredient.Name) && measureUnit.Equals(ingredient.MeasuredUnit))
                    return ingredient;
            }
            return null;
        }

        public void UpdateIngredientsCategory(String ingredientName, Guid? categoryId)
        {
            //Guid? categoryId = GetSpecificCategory(ingredientName);
            if (categoryId != null)
            {
                IEnumerable<Ingredient> ingredients = GetAll().Result;
                foreach (var ingredient in ingredients)
                {
                    if (ingredientName.Equals(ingredient.Name))
                        ingredient.Update(categoryId ?? Guid.Empty, ingredient.Name, ingredient.MeasuredUnit, ingredient.Cost);
                }
                _databaseContext.SaveChanges();
            }
        }

        public Guid? GetSpecificCategory(String ingredientName)
        {
            IEnumerable<Ingredient> ingredients = GetAll().Result;
            var categoryRepo = new IngredientsCategoryRepository(_databaseContext);
            foreach (var ingredient in ingredients)
            {
                if (ingredientName.Equals(ingredient.Name))
                {
                    if (!categoryRepo.FindById(ingredient.IngredientCategoryId).Result.Name.Equals("other-ingredients"))
                        return ingredient.IngredientCategoryId;
                }
            }
            return null;
        }

        public async Task AddIngredientCustom(Guid recipeId, string categoryName, string measureUnit, string name,
            double quantity)
        {
            var categoryRepository = new IngredientsCategoryRepository(_databaseContext);
            Ingredient ingredient;
            if (!Exists(name, measureUnit))
            {
                Guid categoryId;
                if (!categoryRepository.Exists(categoryName))
                {
                    IngredientCategory igCat = IngredientCategory.Create(categoryName);
                    categoryId = igCat.Id;
                }
                else
                {
                    categoryId = categoryRepository.GetByName(categoryName).Id;
                }
                ingredient = Ingredient.Create(categoryId, name, measureUnit, 0);
                await Add(ingredient);
                UpdateIngredientsCategory(name, GetSpecificCategory(name));
            }
            else
            {
                if (!categoryName.Equals("other-ingredients"))
                    UpdateIngredientsCategory(name, categoryRepository.GetByName(categoryName).Id);
                ingredient = GetByNameAndMeasure(name, measureUnit);
            }
            var fridgeRepo = new FridgeRepository(_databaseContext);
            await fridgeRepo.Add(PairItem.Create(ingredient.Id, recipeId, quantity));
        }
    }
}
