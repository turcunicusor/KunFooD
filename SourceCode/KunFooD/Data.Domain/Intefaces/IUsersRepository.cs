using System.Linq;
using Data.Domain.Entities;

namespace Data.Domain.Intefaces
{
    public interface IUsersRepository : IGenericRepository<User>
    {
        IQueryable<User> GetAdmins();
    }
}
