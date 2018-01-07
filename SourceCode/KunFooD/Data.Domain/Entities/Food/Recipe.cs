using System;

namespace Data.Domain.Entities.Food
{
    public enum RecipeStatusType : byte
    {
        Approved, 
        Waiting,
        Rejected
    }
    public enum KitchenType : byte
    {
        Unspecified,
        Vegan, //0
        Vegetarian, //1
        European, 
        Asian,    
        Chinese,
        Japanese,
        Mexican,
        Italian,
        Russian,
        French
    }

    public class Recipe
    {
        private Recipe()
        {
            // EF Core
        }

        public Guid Id { get; private set; }
        public Guid UserId { get; private set; }

        public string Name { get; set; }
        public string Content { get;  set; }
        public RecipeStatusType Status { get; set; }
        public KitchenType Cuisine { get; set; }

        public double Cost { get;  set; }
        public double Rating { get; set; }

        public int VotesNumber { get; set; }
        public int NrPeopleQuantity { get; set; }
        public int PreparationTime { get; private set; } // timpul o sa fie exprimat in minute :)

        public static Recipe Create(Guid userId, string name, string content, RecipeStatusType status, int preparationTime, 
            int nrPeopleQuant, KitchenType cuisine)
        {
            var instance = new Recipe { Id = new Guid(), UserId = userId };
            instance.Update(content, preparationTime, status, cuisine, nrPeopleQuant);
            return instance;
        }

        public void Update(string content, int preparationTime, RecipeStatusType status, KitchenType cuisine, int nrPeopleQuantity)
        {
            Content = content;
            PreparationTime = preparationTime;
            Cuisine = cuisine;
            NrPeopleQuantity = nrPeopleQuantity;
            Cost = 0;
            Status = status;
            Rating = 0;
            VotesNumber = 0;
        }
    }
}
