using Data.Domain.Entities;
using Data.Domain.Entities.Food;
using Data.Domain.Entities.Forum;
using Microsoft.EntityFrameworkCore;

namespace Data.Persistence
{
    public sealed class DatabaseContext : DbContext, IDatabaseContext
    {
        public DatabaseContext(DbContextOptions<DatabaseContext> options) : base(options)
        {
            Database.EnsureCreated();
        }
        public DatabaseContext()
        {
            Database.EnsureCreated();
        }
        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<PairItem>()
                .HasKey(pairItem => new { pairItem.IngredientId, pairItem.RecipieId });
            modelBuilder.Entity<Post>()
                .HasKey(post => new { post.Id });
        }

        public DbSet<User> Users { get; set; }
        public DbSet<Thread> Threads { get; set; }
        public DbSet<Recipe> Recipes { get; set; }
        public DbSet<Post> Posts { get; set; }
        public DbSet<IngredientCategory> IngredientCategories { get; set; }
        public DbSet<Ingredient> Ingredients { get; set; }
        public DbSet<PairItem> PairItems { get; set; }
        public DbSet<Category> Categories { get; set; }
    }
}
