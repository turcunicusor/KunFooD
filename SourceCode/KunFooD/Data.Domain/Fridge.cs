using System;

namespace Data.Domain
{
    public class Fridge
    {
        private Fridge()
        {
            // EF Core
        }

        public Guid IngredientId { get; private set; }
        public Guid RecipieId { get; private set; }
        public double Quantity { get; private set; }

        public static Fridge Create(Guid ingredientId, Guid recipieId, double quantity)
        {
            var instance = new Fridge();
            instance.Update(ingredientId, recipieId, quantity);
            return instance;
        }

        public void Update(Guid ingredientId, Guid recipieId, double quantity)
        {
            IngredientId = ingredientId;
            RecipieId = recipieId;
            Quantity = quantity;
        }
    }
}
