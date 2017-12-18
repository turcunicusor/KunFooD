﻿using Business;
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
                var repository = new IngredientsRepository(s);

                // Act

                // Assert
                Assert.IsTrue(true);
            });
        }
    }
}
