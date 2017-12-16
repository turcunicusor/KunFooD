using Data.Domain.Entities;
using Data.Domain.Intefaces;
using Data.Persistence;

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

    }
}
