using System;
using System.Collections.Generic;
using System.Linq;
using Business;
using Data.Domain.Entities.Food;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace IntegrationTests
{
    [TestClass]
    public class IngredientsRepositoryTest : BaseIntegrationTest
    {
        [TestMethod]
        public void Default_Ingredients_Test()
        {
            RunOnDatabase(s =>
            {
                DestroyDatabase();
                // Arrange
                var fridgeRepo = new FridgeRepository(s);
                var ingredCatRepo = new IngredientsCategoryRepository(s);
                var repository = new IngredientsRepository(s, ingredCatRepo, fridgeRepo);

                // Act

                // Assert
                Assert.IsTrue(true);
            });
        }
        [TestMethod]
        public void Exists_Should_Work_Ok()
        {
            RunOnDatabase(async s =>
            {
                DestroyDatabase();
                // Arrange
                var fridgeRepo = new FridgeRepository(s);
                var ingredCatRepo = new IngredientsCategoryRepository(s);
                var ingredRepo = new IngredientsRepository(s, ingredCatRepo, fridgeRepo);
                IEnumerable<IngredientCategory> categories = GetDefaultCategories();
                // Act
                foreach (var ingredientCategory in categories)
                {
                    await ingredCatRepo.Add(ingredientCategory);
                }
                await ingredRepo.Add(Ingredient.Create(ingredCatRepo.GetAll().Result.First().Id, "onion", "piece", 1.2));

                // Assert
                Boolean bool1 = ingredRepo.Exists("onion").Result;
                Boolean bool2 = ingredRepo.Exists("onion", "piece").Result;
                Boolean bool3 = ingredRepo.Exists("onion", "slice").Result;
                Assert.IsTrue(bool1 && bool2 && !bool3);
            });
        }

        [TestMethod]
        public void AddIngredientCustom_ShouldWork()
        {
            RunOnDatabase(async s =>
            {
                DestroyDatabase();
                // Arrange
                var fridgeRepo = new FridgeRepository(s);
                var ingredCatRepo = new IngredientsCategoryRepository(s);
                var ingredRepo = new IngredientsRepository(s, ingredCatRepo, fridgeRepo);
                var recipeRepo = new RecipesRepository(s, fridgeRepo, ingredRepo);
                IEnumerable<IngredientCategory> categories = GetDefaultCategories();
                // Act
                Populate(s);
                int count = ingredRepo.GetAll().Result.Count();
                await ingredRepo.AddIngredientCustom(recipeRepo.GetAll().Result.First().Id, "t", "ms", "new", 1, 1, 1);
                await ingredRepo.AddIngredientCustom(recipeRepo.GetAll().Result.First().Id, "First Category", "i3", "cup", 1, 1, 1);
                //await ingredRepo.AddIngredientCustom(recipeRepo.GetAll().Result.First().Id, "Another Category", "i3", "cup", 1, 1, 1);
                await ingredRepo.AddIngredientCustom(recipeRepo.GetAll().Result.First().Id, "asfasfasfasfy", "i5", "cup", 1, 1, 1);
                // Assert
                Assert.AreEqual(count +3, ingredRepo.GetAll().Result.Count());
            });
        }
        [TestMethod]
        public void GetSpecificCategory_ShouldWork()
        {
            RunOnDatabase(async s =>
            {
                DestroyDatabase();
                // Arrange
                var fridgeRepo = new FridgeRepository(s);
                var ingredCatRepo = new IngredientsCategoryRepository(s);
                var ingredRepo = new IngredientsRepository(s, ingredCatRepo, fridgeRepo);
                var recipeRepo = new RecipesRepository(s, fridgeRepo, ingredRepo);
                IEnumerable<IngredientCategory> categories = GetDefaultCategories();
                // Act
                Populate(s); 
                await ingredRepo.AddIngredientCustom(recipeRepo.GetAll().Result.First().Id, "asfasfasfasfy", "cup", "i5", 1, 1, 1);
                await ingredRepo.AddIngredientCustom(recipeRepo.GetAll().Result.First().Id, "other-ingredients", "cup", "i6", 1, 1, 1);
                var res = await ingredRepo.GetSpecificCategory("i5");
                var res2 = await ingredRepo.GetSpecificCategory("i6");
                var res1 = await ingredRepo.GetSpecificCategory("null");
                // Assert
                Assert.AreEqual(res, ingredCatRepo.GetByName("asfasfasfasfy").Result.Id);
                Assert.AreEqual(res2, null);
                Assert.AreEqual(null, res1);
            });
        }
    }
}
