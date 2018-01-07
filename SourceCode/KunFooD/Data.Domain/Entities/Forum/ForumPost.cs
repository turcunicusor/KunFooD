using System;

namespace Data.Domain.Entities.Forum
{
    public class ForumPost : Post
    {
        private ForumPost()
        {
            // EF Core
        }
        
        public Guid ThreadId { get; private set; }

        public static ForumPost Create(string content, Guid threadId, Guid userId)
        {
            var instance = new ForumPost { ThreadId = threadId, UserId = userId };
            instance.Update(content);
            return instance;
        }

        public void Update(string content)
        {
            Content = content;
        }
    }
}
