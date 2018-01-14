using Business;
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
    }
}
