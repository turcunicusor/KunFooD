using System;

namespace Data.Domain.Entities.Forum
{
    public class Category
    {
        private Category()
        {
            // EF Core
        }

        public Guid Id { get; private set; }
        public string Name { get; private set; }
        public string Description { get; private set; }
        public DateTime CreatedAt { get; private set; }

        public static Category Create(string name, string description)
        {
            var instance = new Category { Id = Guid.NewGuid(), CreatedAt = DateTime.Now };
            instance.Update(name, description);
            return instance;
        }

        public void Update(string name, string description)
        {
            Name = name;
            Description = description;
        }
    }
}
