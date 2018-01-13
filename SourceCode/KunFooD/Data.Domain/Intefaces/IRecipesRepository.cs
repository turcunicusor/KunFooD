using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Data.Domain.Entities;
using Data.Domain.Entities.Food;

namespace Data.Domain.Intefaces
{
    public interface IRecipesRepository : IGenericRepository<Recipe>
    {
        Task<Double> GetCostById(Guid id);
        Task UpdateAllCosts();
        Task<IEnumerable<Recipe>> GetByKitchenType(KitchenType cuisine, Task<IEnumerable<Recipe>> recipes);
        Task<IEnumerable<Recipe>> GetByCost(Double cost, Task<IEnumerable<Recipe>> recipes);
        Task<IEnumerable<Recipe>> GetByName(String name, Task<IEnumerable<Recipe>> recipes);
        Task<IEnumerable<Recipe>> GetByRating(Double rating, Task<IEnumerable<Recipe>> recipes);
        Task<IEnumerable<Recipe>> GetByVotesNumber(int votes, Task<IEnumerable<Recipe>> recipes);
        Task<IEnumerable<Recipe>> GetByPrepatationTime(int minutes, Task<IEnumerable<Recipe>> recipes);

        Task<IEnumerable<Recipe>> GetByIngredients(List<Ingredient> included, List<Ingredient> excluded,
            Task<IEnumerable<Recipe>> recipes);

        Task<IEnumerable<Recipe>> GetByOnlyIngredients(List<Ingredient> ingredients, Task<IEnumerable<Recipe>> recipes);
        Task<IEnumerable<Recipe>> GetByFilter(Filter filter);
    }
}
