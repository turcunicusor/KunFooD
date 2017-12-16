using Data.Domain.Entities.Food;
using Data.Domain.Intefaces;
using Data.Persistence;

namespace Business
{
    public class IngredientsRepository :
        GenericRepository<Ingredient>, IIngredientsRepository
    {
        private readonly IDatabaseContext _databaseContext;

        public IngredientsRepository(IDatabaseContext databaseContext) : base(databaseContext)
        {
            _databaseContext = databaseContext;
        }
    }
}
