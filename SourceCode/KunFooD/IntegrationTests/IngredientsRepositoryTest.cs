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
    }
}
