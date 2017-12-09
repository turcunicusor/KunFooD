using System;

namespace Data.Domain
{
    public class User
    {
        private User()
        {
            // EF Core    
        }

        public Guid Id { get; private set; }
        public string Name { get; private set; }
        public bool IsAdmin { get; private set; }
        public string Password { get; private set; }
        public string Token { get; private set; }
        public string Description { get; private set; }
        public DateTime CreatedAt { get; private set; }

        public static User Create(string name, bool isAdmin, string password, string token, string description)
        {
            var instance = new User {Id = Guid.NewGuid(), CreatedAt = DateTime.Now};
            instance.Update(name, isAdmin, password, token, description);
            return instance;
        }

        public void Update(string name, bool isAdmin, string password, string token, string description)
        {
            Name = name;
            IsAdmin = isAdmin;
            Password = password;
            Token = token;
            Description = description;
        }
    }
}
