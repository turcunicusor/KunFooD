using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Business;
using Data.Domain.Entities;
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
