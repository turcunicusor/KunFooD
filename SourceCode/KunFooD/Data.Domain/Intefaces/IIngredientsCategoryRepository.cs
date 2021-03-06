﻿using System;
using System.Threading.Tasks;
using Data.Domain.Entities.Food;

namespace Data.Domain.Intefaces
{
    public interface IIngredientsCategoryRepository : IGenericRepository<IngredientCategory>
    {
        Task<bool> Exists(String name);
        Task<IngredientCategory> GetByName(string name);
    }
}
