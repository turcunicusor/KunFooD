﻿using System.Threading.Tasks;
using Data.Domain.Entities.Food;
using Data.Domain.Intefaces;
using Data.Persistence;
using Microsoft.EntityFrameworkCore;

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

        public async Task<bool> Exists(string name)
        {
            return await _databaseContext.IngredientCategories.AnyAsync(ingCateg =>
               ingCateg.Name.ToLower().Equals(name.ToLower()));
        }

        public async Task<IngredientCategory> GetByName(string name)
        {
            return await _databaseContext.IngredientCategories.FirstOrDefaultAsync(ingCateg =>
                ingCateg.Name.ToLower().Equals(name.ToLower()));
        }

    }
}
