using System;

namespace WebApp.DTO
{
    public class UpdateUsers
    {
        public Guid Id { get; set; }
        public string Name { get; set; }
        public bool IsAdmin { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Token { get; set; }
        public string Description { get; set; }
    }
}
