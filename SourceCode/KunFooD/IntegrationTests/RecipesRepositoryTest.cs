using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Business;
using Data.Domain.Entities;
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
                var repository = new RecipesRepository(s);

                // Act

                // Assert
                Assert.IsTrue(true);
            });
        }
    }
}
