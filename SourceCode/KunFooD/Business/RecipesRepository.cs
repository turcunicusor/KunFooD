using System;
using System.Collections.Generic;
using System.Linq;
using Data.Domain.Entities.Food;
using Data.Domain.Intefaces;
using Data.Persistence;

namespace Business
{
    public class RecipesRepository : IRecipesRepository
    {
        private readonly IDatabaseContext _databaseContext;
    }
}
