using System.Threading.Tasks;
using Data.Domain.Intefaces;
using Microsoft.AspNetCore.Mvc;
using WebApp.Filters;

namespace WebApp.Controllers
{
    [Route("api/[controller]")]
    [DefaultControllerFilter]
    public class IngredientsController : Controller
    {
        private readonly IIngredientsRepository _ingredientsRepository;

        public IngredientsController(IIngredientsRepository ingredientsRepository)
        {
            _ingredientsRepository = ingredientsRepository;
        }

        [HttpGet]
        [Route("All")]
        public async Task<IActionResult> GetAll()
        {
            return Ok(await _ingredientsRepository.GetAll());
        }

        [HttpGet]
        public async Task<IActionResult> Get(string name)
        {
            return Ok(await _ingredientsRepository.GetByName(name));
        }
    }
}
