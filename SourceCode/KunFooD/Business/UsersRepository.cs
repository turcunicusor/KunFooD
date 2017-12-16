using System;
using System.Collections.Generic;
using System.Linq;
using Data.Domain;
using Data.Domain.Entities;
using Data.Domain.Intefaces;
using Data.Persistence;
using Microsoft.EntityFrameworkCore;

namespace Business
{
    public class UsersRepository : IUsersRepository
    {
        private readonly IDatabaseContext _databaseContext;

        public UsersRepository(IDatabaseContext databaseContext)
        {
            _databaseContext = databaseContext;
        }

        public void AddUser(User user)
        {
            _databaseContext.Users.Add(user);
            _databaseContext.SaveChanges();
        }

        public void DeleteUser(Guid id)
        {
            var user = GetUser(id);
            _databaseContext.Users.Remove(user);
            _databaseContext.SaveChanges();
        }

        public void EditUser(User user)
        {
            _databaseContext.Users.Update(user);
            _databaseContext.SaveChanges();
        }

        public User GetUser(Guid id)
        {
            return _databaseContext.Users.FirstOrDefault(user => user.Id == id);
        }

        public IQueryable<User> GetAll()
        {
            return _databaseContext.Users;
        }
    }
}
