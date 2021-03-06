﻿using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Data.Domain.Entities;
using Data.Domain.Intefaces;
using Data.Persistence;
using Microsoft.EntityFrameworkCore;

namespace Business
{
    public class UsersRepository :
        GenericRepository<User>, IUsersRepository
    {
        private readonly IDatabaseContext _databaseContext;

        public UsersRepository(IDatabaseContext databaseContext) : base(databaseContext)
        {
            _databaseContext = databaseContext;
        }

        public async Task<IEnumerable<User>> GetAdmins()
        {
            return await _databaseContext.Users.Where(user => user.IsAdmin).ToListAsync();
        }

        public async Task<User> GetByEmail(string email)
        {
            return await _databaseContext.Users.FirstOrDefaultAsync(user => user.Email.Equals(email));
        }

        public async Task<User> GetByName(string userName)
        {
            return await _databaseContext.Users.FirstOrDefaultAsync(user => user.UserName.Equals(userName));
        }
    }
}
