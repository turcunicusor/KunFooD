using Data.Domain;
using Microsoft.EntityFrameworkCore;

namespace Data.Persistence
{
    public interface IDatabaseContext
    {
        DbSet<User> Users { get; set; }
        DbSet<Thread> Threads { get; set; }
        DbSet<Recipe> Recipes { get; set; }
        DbSet<Post> Posts { get; set; }
        DbSet<IngredientCategory> IngredientCategories { get; set; }
        DbSet<Ingredient> Ingredients { get; set; }
        DbSet<PairItem> PairItems { get; set; }
        DbSet<Category> Categories { get; set; }

        int SaveChanges();
    }
}
