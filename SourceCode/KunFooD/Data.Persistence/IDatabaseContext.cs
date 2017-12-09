﻿using Data.Domain;
using Microsoft.EntityFrameworkCore;

namespace Data.Persistence
{
    public interface IDatabaseContext
    {
        DbSet<Data.Domain.User> Users { get; set; }
        DbSet<Data.Domain.Thread> Threads { get; set; }
        DbSet<Data.Domain.Recipe> Recipes { get; set; }
        DbSet<Data.Domain.Post> Posts { get; set; }
        DbSet<Data.Domain.IngredientCategory> IngredientCategories { get; set; }
        DbSet<Data.Domain.Ingredient> Ingredients { get; set; }
        DbSet<Data.Domain.PairItem> PairItems { get; set; }
        DbSet<Data.Domain.Category> Categories { get; set; }

        int SaveChanges();
    }
}
