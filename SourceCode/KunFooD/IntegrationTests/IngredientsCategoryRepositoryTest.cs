using Business;
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
    }
}
