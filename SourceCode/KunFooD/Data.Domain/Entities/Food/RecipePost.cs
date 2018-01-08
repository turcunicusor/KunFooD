using System;

namespace Data.Domain.Entities.Food
{
    public class RecipePost : Post
    {
        private RecipePost()
        {
            // EF Core
        }

        public Guid RecipeId { get; private set; }

        public static RecipePost Create(string content, Guid recipeId)
        {
            var instance = new RecipePost { RecipeId = recipeId };
            instance.Update(content);
            return instance;
        }

        public void Update(string content)
        {
            Content = content;
        }
    }
}
