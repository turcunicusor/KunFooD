using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Data.Domain.Entities.Food;
using Data.Domain.Intefaces;
using Data.Persistence;
using Microsoft.EntityFrameworkCore;

namespace Business
{
    public class IngredientsRepository :
        GenericRepository<Ingredient>, IIngredientsRepository
    {
        private readonly IDatabaseContext _databaseContext;
        private readonly IIngredientsCategoryRepository _ingredientsCategoryRepository;
        private readonly IFridgeRepository _fridgeRepository;

        public IngredientsRepository(IDatabaseContext databaseContext, IIngredientsCategoryRepository ingredientsCategoryRepository, IFridgeRepository fridgeRepository) : base(databaseContext)
        {
            _databaseContext = databaseContext;
            _ingredientsCategoryRepository = ingredientsCategoryRepository;
            _fridgeRepository = fridgeRepository;
        }

        public async Task<bool> Exists(String name)
        {
            return await _databaseContext.Ingredients.AnyAsync(ingredient => ingredient.Name.ToLower().Equals(name.ToLower()));
        }

        public async Task<bool> Exists(String name, string measureUnit)
        {
            return await _databaseContext.Ingredients.AnyAsync(ingredient => ingredient.Name.ToLower().Equals(name.ToLower()) && ingredient.MeasuredUnit.ToLower().Equals(measureUnit.ToLower()));
        }

        public async Task<IEnumerable<Ingredient>> GetByName(string name)
        {
            return await _databaseContext.Ingredients.Where(ingredient => ingredient.Name.ToLower().Contains(name.ToLower())).ToListAsync();
        }

        public async Task<Ingredient> GetByNameAndMeasure(String name, String measureUnit)
        {
            return await _databaseContext.Ingredients.FirstOrDefaultAsync(ingredient => ingredient.Name.ToLower().Contains(name.ToLower()) && ingredient.MeasuredUnit.ToLower().Equals(measureUnit.ToLower()));
        }

        public async Task UpdateIngredientsCategory(String ingredientName, Guid? categoryId)
        {
            //Guid? categoryId = GetSpecificCategory(ingredientName);
            if (categoryId != null)
            {
                IEnumerable<Ingredient> ingredients = await GetAll();
                foreach (var ingredient in ingredients)
                    if (ingredientName.Equals(ingredient.Name))
                        ingredient.Update(categoryId ?? Guid.Empty, ingredient.Name, ingredient.MeasuredUnit, ingredient.Cost);
                _databaseContext.SaveChanges();
            }
        }

        public async Task<Guid?> GetSpecificCategory(String ingredientName)
        {
            IEnumerable<Ingredient> ingredients = await GetAll();
            foreach (var ingredient in ingredients)
            {
                if (ingredientName.Equals(ingredient.Name))
                {
                    if (!(await _ingredientsCategoryRepository.FindById(ingredient.IngredientCategoryId)).Name.Equals("other-ingredients"))
                        return ingredient.IngredientCategoryId;
                }
            }
            return null;
        }

        public async Task AddIngredientCustom(Guid recipeId, string categoryName, string measureUnit, string name,
            double quantity)
        {
            Ingredient ingredient;
            if (!await Exists(name, measureUnit))
            {
                Guid categoryId;
                if (! await _ingredientsCategoryRepository.Exists(categoryName))
                {
                    IngredientCategory igCat = IngredientCategory.Create(categoryName);
                    await _ingredientsCategoryRepository.Add(igCat);
                    categoryId = igCat.Id;
                }
                else
                {
                    categoryId = (await _ingredientsCategoryRepository.GetByName(categoryName)).Id;
                }
                ingredient = Ingredient.Create(categoryId, name, measureUnit, 0);
                await Add(ingredient);
                await UpdateIngredientsCategory(name, await GetSpecificCategory(name));
            }
            else
            {
                if (!categoryName.Equals("other-ingredients"))
                {
                    if (! await _ingredientsCategoryRepository.Exists(categoryName))
                    {
                        IngredientCategory igCat = IngredientCategory.Create(categoryName);
                        await _ingredientsCategoryRepository.Add(igCat);
                    }
                    await UpdateIngredientsCategory(name, (await _ingredientsCategoryRepository.GetByName(categoryName)).Id);
                }
                ingredient = await GetByNameAndMeasure(name, measureUnit);
            }
            await _fridgeRepository.Add(PairItem.Create(ingredient.Id, recipeId, quantity));
        }
    }
}
