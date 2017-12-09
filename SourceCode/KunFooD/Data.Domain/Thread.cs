using System;

namespace Data.Domain
{
    public class Thread
    {
        private Thread()
        {
            // EF Core
        }

        public Guid Id { get; private set; }
        public string Name { get; private set; }
        public string Description { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public Guid UserId { get; private set; }
        public Guid CategoryId { get; private set; }

        public static Thread Create(string name, string description, Guid userId, Guid categoryId)
        {
            var instance = new Thread { Id = new Guid(), CreatedAt = DateTime.Now, UserId = userId, CategoryId = categoryId };

            return instance;
        }

        public void Update(string name, string description)
        {
            Name = name;
            Description = description;
        }
    }
}
