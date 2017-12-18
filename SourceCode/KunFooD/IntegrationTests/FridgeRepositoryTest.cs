using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Business;
using Data.Domain.Entities;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace IntegrationTests
{
    [TestClass]
    public class FridgeRepositoryTest : BaseIntegrationTest
    {
        [TestMethod]
        public void Given_Repository_When_Delete_Then_ShouldBe_Correct()
        {
            RunOnDatabase(async s =>
            {
                DestroyDatabase();
                // Arrange
                var repository = new FridgeRepository(s);
                var pairItem = GetPairItems().First();

                // Act
                await repository.Add(pairItem);
                var pairAdded = repository.Get(pairItem.IngredientId, pairItem.RecipieId).Result;
                await repository.Delete(pairAdded.IngredientId, pairAdded.RecipieId);

                // Assert
                var users = repository.GetAll();
                Assert.AreEqual(0, users.Result.ToList().Count);
            });
        }
    }
}
