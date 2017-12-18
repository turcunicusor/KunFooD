using System.Linq;
using Business;
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
                var data = repository.GetAll();
                Assert.AreEqual(0, data.Result.ToList().Count);
            });
        }
    }
}
