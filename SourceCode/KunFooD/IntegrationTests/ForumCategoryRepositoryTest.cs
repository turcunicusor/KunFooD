using System.Linq;
using Business;
using Data.Domain.Intefaces;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace IntegrationTests
{
    [TestClass]
    public class ForumCategoryRepositoryTest : BaseIntegrationTest
    {
        [TestMethod]
        public void TestContructor()
        {
            RunOnDatabase(async s =>
            {
                DestroyDatabase();
                // Arrange
                var repository = new ForumCategoryRepository(s);
            });
        }
    }
}
