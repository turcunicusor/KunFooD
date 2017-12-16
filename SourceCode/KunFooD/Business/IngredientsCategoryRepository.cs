﻿using Data.Domain.Entities.Food;
using Data.Domain.Intefaces;
using Data.Persistence;

namespace Business
{
    public class IngredientsCategoryRepository :
        GenericRepository<IngredientCategory>, IIngredientsCategoryRepository
    {
        private readonly IDatabaseContext _databaseContext;

        public IngredientsCategoryRepository(IDatabaseContext databaseContext) : base(databaseContext)
        {
            _databaseContext = databaseContext;
        }
    }
}
