using System.Collections.Generic;
using Data.Domain.Entities.Food;

namespace Data.Domain.Entities
{
    public class Filter
    {
        public KitchenType Cuisine { get; set; } //default Unspecified
        public double Cost { get; set; } // 0 - default. (Less than)
        public string Name { get; set; }
        public double Rating { get; set; } // greater than
        public int VotesNumber { get; set; } //greater than
        public int PreparationTime { get; set; } // timpul o sa fie exprimat in minute :)

        public List<Ingredient> IncludedIngredients { get; set; }
        public List<Ingredient> OnlyIngredients { get; set; }
        public List<Ingredient> ExcludedIngredients { get; set; }

        public Filter()
        {
            IncludedIngredients = null;
            OnlyIngredients = null;
            ExcludedIngredients = null;

            Cuisine = KitchenType.Unspecified;
            Cost = 0;
            Name = "";
            Rating = 0;
            VotesNumber = 0;
            PreparationTime = 0;
        }
    }
}
