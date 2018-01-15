using System;
using System.Collections.Generic;
using System.Linq;
using Business;
using Data.Domain.Entities;
using Data.Domain.Entities.Food;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace IntegrationTests
{
    [TestClass]
    public class RecipesRepositoryTest : BaseIntegrationTest
    {
        [TestMethod]
        public void Default_Recipes_Test()
        {
            RunOnDatabase(s =>
            {
                DestroyDatabase();
                // Arrange
                var fridgeRepo = new FridgeRepository(s);
                var ingredCatRepo = new IngredientsCategoryRepository(s);
                var ingredientRepo = new IngredientsRepository(s, ingredCatRepo, fridgeRepo);
                var repository = new RecipesRepository(s, fridgeRepo, ingredientRepo);

                // Act

                // Assert
                Assert.IsTrue(true);
            });
        }
        [TestMethod]
        public void GetByKithen_Should_Work_Ok()
        {
            RunOnDatabase(async s =>
            {
                DestroyDatabase();
                // Arrange
                var fridgeRepo = new FridgeRepository(s);
                var ingredCatRepo = new IngredientsCategoryRepository(s);
                var ingredRepo = new IngredientsRepository(s, ingredCatRepo, fridgeRepo);
                var recipeRepo = new RecipesRepository(s, fridgeRepo, ingredRepo);
                // Act
                Populate(s);
                var res = await recipeRepo.GetByKitchenType(KitchenType.Asian, recipeRepo.GetAll());
                // Assert
                Assert.IsTrue(1 == res.ToList().Count);
            });
        }
        [TestMethod]
        public void GetByCost_Should_Work_Ok()
        {
            RunOnDatabase(async s =>
            {
                DestroyDatabase();
                // Arrange
                var fridgeRepo = new FridgeRepository(s);
                var ingredCatRepo = new IngredientsCategoryRepository(s);
                var ingredRepo = new IngredientsRepository(s, ingredCatRepo, fridgeRepo);
                var recipeRepo = new RecipesRepository(s, fridgeRepo, ingredRepo);
                // Act
                Populate(s);
                var res = await recipeRepo.GetByCost(400, recipeRepo.GetAll());
                // Assert
                Assert.AreEqual(0, res.ToList().Count);
            });
        }
        [TestMethod]
        public void GetByRating_Should_Work_Ok()
        {
            RunOnDatabase(async s =>
            {
                DestroyDatabase();
                // Arrange
                var fridgeRepo = new FridgeRepository(s);
                var ingredCatRepo = new IngredientsCategoryRepository(s);
                var ingredRepo = new IngredientsRepository(s, ingredCatRepo, fridgeRepo);
                var recipeRepo = new RecipesRepository(s, fridgeRepo, ingredRepo);
                // Act
                Populate(s);
                var res = await recipeRepo.GetByRating(4, recipeRepo.GetAll());
                // Assert
                Assert.IsTrue(0 == res.ToList().Count);
            });
        }
        [TestMethod]
        public void GetByVotesNumber_Should_Work_Ok()
        {
            RunOnDatabase(async s =>
            {
                DestroyDatabase();
                // Arrange
                var fridgeRepo = new FridgeRepository(s);
                var ingredCatRepo = new IngredientsCategoryRepository(s);
                var ingredRepo = new IngredientsRepository(s, ingredCatRepo, fridgeRepo);
                var recipeRepo = new RecipesRepository(s, fridgeRepo, ingredRepo);
                // Act
                Populate(s);
                var res = await recipeRepo.GetByVotesNumber(4, recipeRepo.GetAll());
                // Assert
                Assert.IsTrue(0 == res.ToList().Count);
            });
        }
        [TestMethod]
        public void GetByIngredients_Should_Work_Ok()
        {
            RunOnDatabase(async s =>
            {
                DestroyDatabase();
                // Arrange
                var fridgeRepo = new FridgeRepository(s);
                var ingredCatRepo = new IngredientsCategoryRepository(s);
                var ingredRepo = new IngredientsRepository(s, ingredCatRepo, fridgeRepo);
                var recipeRepo = new RecipesRepository(s, fridgeRepo, ingredRepo);
                // Act
                Populate(s);
                var res = await recipeRepo.IngredientsNumber(recipeRepo.GetByName("r1", recipeRepo.GetAll()).Result.First().Id);
                // Assert
                Assert.IsTrue(3 == res);
            });
        }
        [TestMethod]
        public void ContainsIngredient_Should_Work_Ok()
        {
            RunOnDatabase(async s =>
            {
                DestroyDatabase();
                // Arrange
                var fridgeRepo = new FridgeRepository(s);
                var ingredCatRepo = new IngredientsCategoryRepository(s);
                var ingredRepo = new IngredientsRepository(s, ingredCatRepo, fridgeRepo);
                var recipeRepo = new RecipesRepository(s, fridgeRepo, ingredRepo);
                // Act
                Populate(s);
                var res = await recipeRepo.ContainsIngredient(recipeRepo.GetByName("r1", recipeRepo.GetAll()).Result.First().Id, ingredRepo.GetByName("i1").Result.First().Id);
                // Assert
                Assert.IsTrue(res);
            });
        }
        [TestMethod]
        public void IncludesIngredients_Should_Work_Ok()
        {
            RunOnDatabase(async s =>
            {
                DestroyDatabase();
                // Arrange
                var fridgeRepo = new FridgeRepository(s);
                var ingredCatRepo = new IngredientsCategoryRepository(s);
                var ingredRepo = new IngredientsRepository(s, ingredCatRepo, fridgeRepo);
                var recipeRepo = new RecipesRepository(s, fridgeRepo, ingredRepo);
                // Act
                Populate(s);
                List<Ingredient> igToAdd = new List<Ingredient>();
                igToAdd.Add(ingredRepo.GetByName("i1").Result.First());
                var res = await recipeRepo.IncludesTheseIngredients(recipeRepo.GetByName("r1", recipeRepo.GetAll()).Result.First().Id, igToAdd);

                // Assert
                Assert.AreEqual(true, res);
            });
        }

        [TestMethod]
        public void ExcludesIngredients_Should_Work_Ok()
        {
            RunOnDatabase(async s =>
            {
                DestroyDatabase();
                // Arrange
                var fridgeRepo = new FridgeRepository(s);
                var ingredCatRepo = new IngredientsCategoryRepository(s);
                var ingredRepo = new IngredientsRepository(s, ingredCatRepo, fridgeRepo);
                var recipeRepo = new RecipesRepository(s, fridgeRepo, ingredRepo);
                // Act
                Populate(s);
                List<Ingredient> igToAdd = new List<Ingredient>();
                igToAdd.Add(ingredRepo.GetByName("i1").Result.First());
                var res = await recipeRepo.ExcludesTheseIngredients(recipeRepo.GetByName("r1", recipeRepo.GetAll()).Result.First().Id, igToAdd);

                // Assert
                Assert.AreEqual(false, res);
            });
        }

        [TestMethod]
        public void GetByOnlyIngredients_Should_Work_Ok()
        {
            RunOnDatabase(async s =>
            {
                DestroyDatabase();
                // Arrange
                var fridgeRepo = new FridgeRepository(s);
                var ingredCatRepo = new IngredientsCategoryRepository(s);
                var ingredRepo = new IngredientsRepository(s, ingredCatRepo, fridgeRepo);
                var recipeRepo = new RecipesRepository(s, fridgeRepo, ingredRepo);
                // Act
                Populate(s);
                List<Ingredient> igToAdd = new List<Ingredient>();
                igToAdd.Add(ingredRepo.GetByName("i1").Result.First());
                var res = await recipeRepo.GetByOnlyIngredients(igToAdd, recipeRepo.GetAll());

                // Assert
                Assert.AreEqual(1, res.ToList().Count);
            });
        }
        [TestMethod]
        public void GetByIngredientsIncAndExc_Should_Work_Ok()
        {
            RunOnDatabase(async s =>
            {
                DestroyDatabase();
                // Arrange
                var fridgeRepo = new FridgeRepository(s);
                var ingredCatRepo = new IngredientsCategoryRepository(s);
                var ingredRepo = new IngredientsRepository(s, ingredCatRepo, fridgeRepo);
                var recipeRepo = new RecipesRepository(s, fridgeRepo, ingredRepo);
                // Act
                Populate(s);
                List<Ingredient> igToAdd = new List<Ingredient>();
                List<Ingredient> igToExclude = new List<Ingredient>();
                igToAdd.Add(ingredRepo.GetByName("i1").Result.First());
                igToAdd.Add(ingredRepo.GetByName("i3").Result.First());
                var res = await recipeRepo.GetByIngredients(igToAdd, igToExclude, recipeRepo.GetAll());

                // Assert
                Assert.AreEqual(1, res.ToList().Count);
            });
        }
        [TestMethod]
        public void GetByPreparationTime_Should_Work_Ok()
        {
            RunOnDatabase(async s =>
            {
                DestroyDatabase();
                // Arrange
                var fridgeRepo = new FridgeRepository(s);
                var ingredCatRepo = new IngredientsCategoryRepository(s);
                var ingredRepo = new IngredientsRepository(s, ingredCatRepo, fridgeRepo);
                var recipeRepo = new RecipesRepository(s, fridgeRepo, ingredRepo);
                // Act
                Populate(s);
                
                var res = await recipeRepo.GetByPrepatationTime(25, recipeRepo.GetAll());

                // Assert
                Assert.AreEqual(1, res.ToList().Count);
            });
        }
        [TestMethod]
        public void GetByFilter_Should_Work_Ok()
        {
            RunOnDatabase(async s =>
            {
                DestroyDatabase();
                // Arrange
                var fridgeRepo = new FridgeRepository(s);
                var ingredCatRepo = new IngredientsCategoryRepository(s);
                var ingredRepo = new IngredientsRepository(s, ingredCatRepo, fridgeRepo);
                var recipeRepo = new RecipesRepository(s, fridgeRepo, ingredRepo);
                // Act
                Populate(s);
                var filtru = new Filter();
       
                //var res = await recipeRepo.GetByFilter(filtru);
                filtru.Name = "r1";
                filtru.Cuisine = KitchenType.Asian;
                filtru.PreparationTime = 10;

                var res = await recipeRepo.GetByFilter(filtru);
                // Assert
                Assert.AreEqual(1, res.ToList().Count);
            });
        }
    }
}
