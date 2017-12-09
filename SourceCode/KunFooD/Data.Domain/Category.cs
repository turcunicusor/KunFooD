using System;

namespace Data.Domain
{
    public class Category
    {
        private Category()
        {
            // EF Core
        }

        public Guid Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public DateTime CreatedAt { get; set; }
    }
}
