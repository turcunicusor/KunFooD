namespace WebApp.DTO
{
    public class CreateUsers
    {
        public string Name { get; set; }
        public bool IsAdmin { get; set; }
        public string Email { get; set; }
        public string Password { get; set; }
        public string Token { get; set; }
        public string Description { get; set; }
    }
}
