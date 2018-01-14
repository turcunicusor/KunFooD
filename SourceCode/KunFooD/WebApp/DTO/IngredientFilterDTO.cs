using System;
using System.ComponentModel.DataAnnotations;

namespace WebApp.DTO
{
    public class IngredientFilterDTO
    {
        [Required, MaxLength(100000)]
        public String Name { get; set; }
        [Required, MaxLength(100000)]
        public String MeasurementUnit { get; set; }
    }
}
