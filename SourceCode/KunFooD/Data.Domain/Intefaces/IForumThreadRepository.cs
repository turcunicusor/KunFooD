
using Data.Domain.Entities.Forum;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Data.Domain.Intefaces
{
    public interface IForumThreadRepository : IGenericRepository<Thread>
    {
        Task<IEnumerable<Thread>> GetByCategoryId(Guid id);
    }
}
