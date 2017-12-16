using Data.Domain.Intefaces;
using Data.Persistence;

namespace Business
{
    public class RecipesRepository : IRecipesRepository
    {
        private readonly IDatabaseContext _databaseContext;
    }
}
