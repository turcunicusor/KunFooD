﻿using System;
using System.Collections.Generic;

namespace Data.Domain.Intefaces
{
    public interface IRecipesRepository
    {
        void AddRecipe(Recipe recipe);
        void DeleteRecipe(Guid id);
        void EditRecipe(Recipe recipe);
        Recipe GetRecipe(Guid id);
        IReadOnlyCollection<Recipe> GetAll();
    }
}
