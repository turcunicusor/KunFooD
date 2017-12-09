using System;

namespace Data.Domain
{
    public class Thread
    {
        private Thread()
        {
            // EF Core
        }

        public Guid Id { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public DateTime CreatedAt { get; set; }
        public Guid UserId { get; set; }
        public Guid CategoryId { get; set; }
    }
}
