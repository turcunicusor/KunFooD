using System;

namespace Data.Domain
{
    public class Post
    {
        private Post()
        {
            // EF Core
        }

        public Guid Id { get; set; }
        public string Content { get; set; }
        public DateTime CreatedAt { get; set; }
        public Guid ThreadId { get; set; }
        public Guid UserId { get; set; }
    }
}
