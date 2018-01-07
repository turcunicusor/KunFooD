using System;
using System.Collections.Generic;
using System.Text;

namespace Data.Domain.Entities
{
    public class Post
    {
        public Guid Id { get; }
        public Guid UserId { get; set; }

        public string Content { get; set; }
        public DateTime CreatedAt { get; }

        public Post(string content)
        {
            Id = new Guid();
            CreatedAt = DateTime.Now;
            Content = content;
        }

        public Post()
        {
            Id = new Guid();
            CreatedAt = DateTime.Now;
        }
    }
}
