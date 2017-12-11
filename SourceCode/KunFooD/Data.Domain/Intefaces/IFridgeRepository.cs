﻿using System;
using System.Collections.Generic;
using Data.Domain.Entities.Food;

namespace Data.Domain.Intefaces
{
    public interface IFridgeRepository
    {
        void AddPairItem(PairItem pairItem);
        void DeletePairItem(Guid ingredientId, Guid recipeId);
        void EditPairItem(PairItem pairItem);
        PairItem GetPairItem(Guid ingredientId, Guid recipeId);
        IReadOnlyCollection<PairItem> GetAll();
    }
}