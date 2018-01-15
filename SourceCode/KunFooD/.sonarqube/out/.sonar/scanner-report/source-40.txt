using Data.Domain.Entities.Forum;
using FluentAssertions;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace UnitTests
{
    [TestClass]
    public class CategoryTests
    {
        [TestMethod]
        public void Category_Name_Should_Be_TestCategory()
        {
            string name = "TestCategory";
            Category category = Category.Create(name, "desc");

            category.Name.Should().Be(name);
        }
    }
}
