﻿using System;
using System.ComponentModel.DataAnnotations;

namespace WebApp.DTO
{
    public class IngredientDTO
    {
        [Required, MaxLength(100000)]
        public String Category { get; set; }
        [Required, MaxLength(100000)]
        public String MeasurementUnit { get; set; }
        [Required, MaxLength(100000)]
        public String Name { get; set; }
        public double Quantity { get; set; }
    }
}
