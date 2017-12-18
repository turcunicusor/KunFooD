using System.Collections.Generic;
using System.Threading.Tasks;
using Data.Domain.Entities;

namespace Data.Domain.Intefaces
{
    public interface IUsersRepository : IGenericRepository<User>
    {
        Task<IEnumerable<User>> GetAdmins();
        Task<User> GetByEmail(string email);
    }
}
