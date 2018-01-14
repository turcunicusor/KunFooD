using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using Data.Domain.Entities.Food;

namespace WebApp.DTO
{
    public class FilterDTO
    {
        public KitchenType Cuisine { get; set; }
        public double Cost { get; set; }
        public string Name { get; set; }
        public double Rating { get; set; }
        public int VotesNumber { get; set; }
        public int PreparationTime { get; set; }
        [Required]
        public List<IngredientFilterDTO> IncludedIngredients { get; set; }
        [Required]
        public List<IngredientFilterDTO> OnlyIngredients { get; set; }
        [Required]
        public List<IngredientFilterDTO> ExcludedIngredients { get; set; }
    }
}
