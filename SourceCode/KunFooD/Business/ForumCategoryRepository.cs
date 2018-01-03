using Data.Domain.Entities.Forum;
using Data.Domain.Intefaces;
using Data.Persistence;

namespace Business
{
    public class ForumCategoryRepository : GenericRepository<Category>, IForumCategoryRepository
    {
        private readonly IDatabaseContext _databaseContext;

        public ForumCategoryRepository(IDatabaseContext databaseContext) : base(databaseContext)
        {
            _databaseContext = databaseContext;
        }
    }
}
