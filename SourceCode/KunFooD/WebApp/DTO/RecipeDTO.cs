﻿using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;

namespace WebApp.DTO
{
    public class RecipeDTO
    {
        [Required, MaxLength(100000)]
        public String Content { get; set; }
        public List<IngredientRecipeDTO> Ingredients { get; set; }
        [Required, MaxLength(100000)]
        public String Name { get; set; }
        public int PreparationTime { get; set; }
        public int Servings { get; set; }
        [Required, MaxLength(100000)]
        public String Summary { get; set; }
    }
}
