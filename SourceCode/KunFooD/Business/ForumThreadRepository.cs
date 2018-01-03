
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Data.Domain.Entities.Forum;
using Data.Domain.Intefaces;
using Data.Persistence;
using Microsoft.EntityFrameworkCore;

namespace Business
{
    public class ForumThreadRepository : GenericRepository<Thread>, IForumThreadRepository
    {
        private readonly IDatabaseContext _databaseContext;

        public ForumThreadRepository(IDatabaseContext databaseContext) : base(databaseContext)
        {
            _databaseContext = databaseContext;
        }

        public async Task<IEnumerable<Thread>> GetByCategoryId(Guid id)
        {
            return await _databaseContext.Threads.Where(thread => thread.CategoryId == id).ToListAsync();
        }
    }
}
