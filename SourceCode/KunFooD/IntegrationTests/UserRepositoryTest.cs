using System.Linq;
using Business;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace IntegrationTests
{
    [TestClass]
    public class UserRepositoryTest : BaseIntegrationTest
    {
        [TestMethod]
        public void Given_Repository_When_AddingUser_Then_TheCount_ShouldBe_1()
        {
            RunOnDatabase(async s =>
            {
                DestroyDatabase();
                // Arrange
                var repository = new UsersRepository(s);
                var userList = GetDefaultUsers(1);

                // Act
                foreach (var usr in userList)
                {
                    await repository.Add(usr);
                }

                // Assert
                var users = repository.GetAll();
                Assert.AreEqual(1, users.Result.ToList().Count);
            });
        }
        [TestMethod]
        public void Given_Repository_When_GetAll_Then_TheCount_ShouldBe_4()
        {
            RunOnDatabase(async s =>
            {
                DestroyDatabase();
                // Arrange
                var repository = new UsersRepository(s);
                var userList = GetDefaultUsers(4);

                // Act
                foreach (var usr in userList)
                {
                    await repository.Add(usr);
                }

                // Assert
                var users = repository.GetAll();
                Assert.AreEqual(4, users.Result.ToList().Count);
            });
        }
        [TestMethod]
        public void Given_Repository_When_Delete_Then_ShouldBe_Correct()
        {
            RunOnDatabase(async s =>
            {
                DestroyDatabase();
                // Arrange
                var repository = new UsersRepository(s);
                var user = GetDefaultUsers().First();

                // Act
                await repository.Add(user);
                await repository.Delete(user.Id);

                // Assert
                var users = repository.GetAll();
                Assert.AreEqual(0, users.Result.ToList().Count);
            });
        }
        [TestMethod]
        public void Given_Repository_When_Update_Then_ShouldBe_Correct()
        {
            RunOnDatabase(async s =>
            {
                DestroyDatabase();
                // Arrange
                var repository = new UsersRepository(s);
                var user = GetDefaultUsers().First();

                // Act
                await repository.Add(user);
                user.Update("new name", true, "a1@gmail.com", "pass12_676", "gcsw2345678hgh", "hello world");
                await repository.Edit(user);

                // Assert
                var addedUser = repository.FindById(user.Id);
                Assert.AreEqual(addedUser.Result.UserName, "new name");
            });
        }
        [TestMethod]
        public void Given_Repository_When_GetAdmins_Then_TheCount_ShouldBe_3()
        {
            RunOnDatabase(async s =>
            {
                DestroyDatabase();
                // Arrange
                var repository = new UsersRepository(s);
                var userList = GetDefaultUsers(5);

                // Act
                foreach (var usr in userList)
                {
                    await repository.Add(usr);
                }

                // Assert
                var users = repository.GetAdmins();
                Assert.AreEqual(3, users.Result.ToList().Count);
            });
        }
    }
}
