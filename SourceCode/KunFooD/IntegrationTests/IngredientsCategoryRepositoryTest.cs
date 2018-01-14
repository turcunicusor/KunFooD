using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using Business;
using Data.Domain.Entities.Food;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace IntegrationTests
{
    [TestClass]
    public class IngredientsCategoryRepositoryTest : BaseIntegrationTest
    {
        [TestMethod]
        public void Default_Ingredients_Category_Test()
        {
            RunOnDatabase(s =>
            {
                DestroyDatabase();
                // Arrange
                var repository = new IngredientsCategoryRepository(s);

                // Act

                // Assert
                Assert.IsTrue(true);
            });
        }
        [TestMethod]
        public void Add_IngredientCategory_Shoul_Work_Ok()
        {
            RunOnDatabase(async s =>
            {
                DestroyDatabase();
                // Arrange
                var categoryRepo = new IngredientsCategoryRepository(s);
                IEnumerable<IngredientCategory> categories = GetDefaultCategories();

                // Act
                foreach (var ingredientCategory in categories)
                {
                    await categoryRepo.Add(ingredientCategory);
                }
                
                // Assert
                var cat = categoryRepo.GetAll();
                Assert.AreEqual(categories.Count(), cat.Result.ToList().Count);
            });
        }
        [TestMethod]
        public void Exist_Should_Work_Ok()
        {
            RunOnDatabase(async s =>
            {
                DestroyDatabase();
                // Arrange
                var categoryRepo = new IngredientsCategoryRepository(s);
                IEnumerable<IngredientCategory> categories = GetDefaultCategories();

                // Act
                foreach (var ingredientCategory in categories)
                {
                    await categoryRepo.Add(ingredientCategory);
                }

                // Assert
                Boolean exists = categoryRepo.Exists("other-ingredients").Result;
                Assert.AreEqual(true, exists);
            });
        }
        [TestMethod]
        public void GetByName_Should_Work_Ok()
        {
            RunOnDatabase(async s =>
            {
                DestroyDatabase();
                // Arrange
                var categoryRepo = new IngredientsCategoryRepository(s);
                IEnumerable<IngredientCategory> categories = GetDefaultCategories();

                // Act
                foreach (var ingredientCategory in categories)
                {
                    await categoryRepo.Add(ingredientCategory);
                }

                // Assert
                IngredientCategory ic = categoryRepo.GetByName("First Category").Result;
                Assert.AreEqual(ic.Id, categories.First().Id);
            });
        }
    }
}
