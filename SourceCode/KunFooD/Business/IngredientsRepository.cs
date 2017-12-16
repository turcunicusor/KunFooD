using System;
using System.Collections.Generic;
using System.Linq;
using Data.Domain.Entities.Food;
using Data.Domain.Intefaces;
using Data.Persistence;

namespace Business
{
    public class IngredientsRepository : IIngredientsRepository
    {
        private readonly IDatabaseContext _databaseContext;

    }
}
