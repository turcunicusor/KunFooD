﻿using Data.Domain;
using Microsoft.EntityFrameworkCore;

namespace Data.Persistence
{
    public class DatabaseContext : DbContext, IDatabaseContext
    {
        public DatabaseContext(DbContextOptions<DatabaseContext> options) : base(options)
        {
            Database.EnsureCreated();
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<PairItem>()
                .HasKey(pairItem => new { pairItem.IngredientId, pairItem.RecipieId });
        }

        public DbSet<Data.Domain.User> Users { get; set; }
        public DbSet<Data.Domain.Thread> Threads { get; set; }
        public DbSet<Data.Domain.Recipe> Recipes { get; set; }
        public DbSet<Data.Domain.Post> Posts { get; set; }
        public DbSet<Data.Domain.IngredientCategory> IngredientCategories { get; set; }
        public DbSet<Data.Domain.Ingredient> Ingredients { get; set; }
        public DbSet<Data.Domain.PairItem> PairItems { get; set; }
        public DbSet<Data.Domain.Category> Categories { get; set; }
    }
}
