using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Business;
using Data.Domain.Entities.Forum;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace IntegrationTests
{
    [TestClass]
    public class ForumThreadRepositoryTest : BaseIntegrationTest
    {
        [TestMethod]
        public void TestGetByCategoryId()
        {
            RunOnDatabase(async s =>
            {
                DestroyDatabase();
                // Arrange
                var repository = new ForumThreadRepository(s);
                Guid userId = Guid.NewGuid();
                Guid categoryId = Guid.NewGuid();

                // Act
                await repository.Add(Thread.Create("nume", "descriere", userId, categoryId));

                // Assert
                IEnumerable<Thread> th = await repository.GetByCategoryId(categoryId);
                Assert.AreEqual(userId, th.First().UserId);
            });
        }
    }
}
