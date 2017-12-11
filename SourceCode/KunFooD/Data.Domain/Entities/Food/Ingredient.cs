using System;

namespace Data.Domain.Entities.Food
{
    public class Ingredient
    {
        private Ingredient()
        {
            // EF Core
        }

        public Guid Id { get; private set; }
        public Guid IngredientCategoryId { get; private set; }
        public String Name { get; private set; }
        public String MeasuredUnit { get; private set; }
        public double Cost { get; private set; }

        public static Ingredient Create(Guid ingredientCategoryId, string name, string measuredUnit, double cost)
        {
            var instance = new Ingredient { Id = Guid.NewGuid() };
            instance.Update(ingredientCategoryId, name, measuredUnit, cost);
            return instance;
        }

        public void Update(Guid ingredientCategoryId, string name, string measuredUnit, double cost)
        {
            IngredientCategoryId = ingredientCategoryId;
            Name = name;
            MeasuredUnit = measuredUnit;
            Cost = cost;
        }
    }
}
