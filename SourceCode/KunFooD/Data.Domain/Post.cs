using System;

namespace Data.Domain
{
    public class Post
    {
        private Post()
        {
            // EF Core
        }

        public Guid Id { get; private set; }
        public string Content { get; private set; }
        public DateTime CreatedAt { get; private set; }
        public Guid ThreadId { get; private set; }
        public Guid UserId { get; private set; }

        public static Post Create(string content, Guid threadId, Guid userId)
        {
            var instance = new Post { Id = new Guid(), CreatedAt = DateTime.Now, ThreadId = threadId, UserId = userId };
            instance.Update(content);

            return instance;
        }

        public void Update(string content)
        {
            Content = content;
        }
    }
}
