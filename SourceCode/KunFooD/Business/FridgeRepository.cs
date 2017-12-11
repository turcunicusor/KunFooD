using System;
using System.Collections.Generic;
using System.Linq;
using Data.Domain.Entities.Food;
using Data.Domain.Intefaces;
using Data.Persistence;

namespace Business
{
    public class FridgeRepository : IFridgeRepository
    {
        private readonly IDatabaseContext _databaseContext;

        public FridgeRepository(IDatabaseContext databaseContext)
        {
            _databaseContext = databaseContext;
        }

        public void AddPairItem(PairItem pairItem)
        {
            _databaseContext.PairItems.Add(pairItem);
            _databaseContext.SaveChanges();
        }

        public void DeletePairItem(Guid ingredientId, Guid recipeId)
        {
            var pairItem = GetPairItem(ingredientId, recipeId);
            _databaseContext.PairItems.Remove(pairItem);
        }

        public void EditPairItem(PairItem pairItem)
        {
            _databaseContext.PairItems.Update(pairItem);
            _databaseContext.SaveChanges();
        }

        public PairItem GetPairItem(Guid ingredientId, Guid recipeId)
        {
            return _databaseContext.PairItems.FirstOrDefault(pairItem =>
                pairItem.IngredientId == ingredientId && pairItem.RecipieId == recipeId);
        }

        public IReadOnlyCollection<PairItem> GetAll()
        {
            return _databaseContext.PairItems.ToList().AsReadOnly();
        }
    }
}
