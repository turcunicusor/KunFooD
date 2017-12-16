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
    public class UsersRepository :
        GenericRepository<DatabaseContext, User>, IUsersRepository
    {
        private readonly IDatabaseContext _databaseContext;

        public UsersRepository(IDatabaseContext databaseContext)
        {
            _databaseContext = databaseContext;
        }

    }
}
