
using System.Collections.Generic;

namespace WebApp.DTO
{
    public class HomepageDTO
    {
        public IEnumerable<Data.Domain.Entities.Food.Recipe> recipeList { get; set; }
    }
}
