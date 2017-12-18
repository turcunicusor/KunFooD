﻿using System;
using System.Collections.Generic;
using System.Linq;
using Data.Domain.Entities;
using Data.Domain.Entities.Food;
using Data.Persistence;
using Microsoft.VisualStudio.TestTools.UnitTesting;
using Microsoft.EntityFrameworkCore;

namespace IntegrationTests
{
    public abstract class BaseIntegrationTest
    {
        protected virtual bool UseSqlServer => false;

        [TestInitialize]
        public virtual void TestInitialize()
        {
            DestroyDatabase();
            CreateDatabase();
        }

        [TestCleanup]
        public virtual void TestCleanup()
        {
            DestroyDatabase();
        }

        protected void RunOnDatabase(Action<DatabaseContext> databaseAction)
        {
            if (UseSqlServer) RunOnSqlServer(databaseAction);
            else RunOnMemory(databaseAction);
        }

        private void RunOnSqlServer(Action<DatabaseContext> databaseAction)
        {
            var connection = @"Server = .\SQLEXPRESS; Database = Todos.Development.Tests; Trusted_Connection = true;";

            var options = new DbContextOptionsBuilder<DatabaseContext>()
                .UseSqlServer(connection)
                .Options;

            using (var context = new DatabaseContext(options))
            {
                databaseAction(context);
            }
        }

        private void RunOnMemory(Action<DatabaseContext> databaseAction)
        {
            var options = new DbContextOptionsBuilder<DatabaseContext>()
                .UseInMemoryDatabase("KunFoodTest")
                .Options;

            using (var context = new DatabaseContext(options))
            {
                databaseAction(context);
            }
        }

        private void CreateDatabase()
        {
            RunOnDatabase(context => context.Database.EnsureCreated());
        }

        public void DestroyDatabase()
        {
            RunOnDatabase(context => context.Database.EnsureDeleted());
        }

        public static IEnumerable<User> GetDefaultUsers(int count = 1)
        {
            List<User> users = new List<User>
            {
                User.Create("name1", true, "a1@gmail.com", "pass12_676", "gcsw2345678hgh", "hello world"),
                User.Create("name2", true, "a2@gmail.com", "pass12_676", "gcsw2345678hgh", "hello world"),
                User.Create("name3", false, "a3@gmail.com", "pass12_676", "gcsw2345678hgh", "hello world"),
                User.Create("name4", true, "a4@gmail.com", "pass12_676", "gcsw2345678hgh", "hello world"),
                User.Create("name5", false, "a5@gmail.com", "pass12_676", "gcsw2345678hgh", "hello world")
            };
            if (0 >= count) throw new IndexOutOfRangeException("Null or negative count [in BaseIntegrationTest class]");
            if (users.Count < count) throw new IndexOutOfRangeException("Not enough users in User List [in BaseIntegrationTest class]");
            return users.Take(count);
        }

        public static IEnumerable<PairItem> GetPairItems(int count = 1)
        {
            List<PairItem> items = new List<PairItem>
            {
                PairItem.Create(Guid.NewGuid(), Guid.NewGuid(), 1.4f),
                PairItem.Create(Guid.NewGuid(), Guid.NewGuid(), 5.3f),
                PairItem.Create(Guid.NewGuid(), Guid.NewGuid(), 8.4f),
                PairItem.Create(Guid.NewGuid(), Guid.NewGuid(), 9.4f),
                PairItem.Create(Guid.NewGuid(), Guid.NewGuid(), 3.4f),
                PairItem.Create(Guid.NewGuid(), Guid.NewGuid(), 2.1f)
            };
            if (0 >= count) throw new IndexOutOfRangeException("Null or negative count [in BaseIntegrationTest class]");
            if (items.Count < count) throw new IndexOutOfRangeException("Not enough users in Pair Item List [in BaseIntegrationTest class]");
            return items.Take(count);
        }
    }
}