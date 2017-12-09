﻿using System;
using System.Collections.Generic;

namespace Data.Domain.Intefaces
{
    public interface IUsersRepository
    {
        void AddUser(User user);
        void DeleteUser(Guid id);
        void EditUser(User user);
        User GetUser(Guid id);
        IReadOnlyCollection<User> GetAll();
    }
}
