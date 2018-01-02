using System;

namespace Data.Domain.Entities.Food
{
    public class Recipe
    {
        private Recipe()
        {
            // EF Core
        }

        public Guid Id { get; private set; }
        public Guid UserId { get; private set; }
        public String Content { get; private set; }
        public int PreparationTime { get; private set; } // timpul o sa fie exprimat in minute :)
        public double Cost { get; private set; }
        public String Status { get; set; }
        public double Rating { get; set; }
        public int VotesNumber { get; set; }

        public static Recipe Create(Guid userId, string content, int preparationTime, double cost)
        {
            var instance = new Recipe { Id = new Guid(), UserId = userId };
            instance.Update(content, preparationTime, cost, null, 0, 0);
            return instance;
        }

        public void Update(string content, int preparationTime, double cost, string status, double rating,
            int votesNumber)
        {
            Content = content;
            PreparationTime = preparationTime;
            Cost = cost;
            Status = status;
            Rating = rating;
            VotesNumber = votesNumber;
        }
    }
}
