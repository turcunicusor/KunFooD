using Data.Domain.Intefaces;
using Data.Persistence;

namespace Business
{
    public class IngredientsRepository : IIngredientsRepository
    {
        private readonly IDatabaseContext _databaseContext;

    }
}
