using System;
using System.Collections.Generic;
using System.Linq;
using Data.Domain.Entities;

namespace Data.Domain.Intefaces
{
    public interface IUsersRepository
    {
        void AddUser(User user);
        void DeleteUser(Guid id);
        void EditUser(User user);
        User GetUser(Guid id);
        IQueryable<User> GetAll();
    }
}
