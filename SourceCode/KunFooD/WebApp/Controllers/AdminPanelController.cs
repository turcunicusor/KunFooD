using Data.Domain.Intefaces;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Threading.Tasks;
using WebApp.DTO;

namespace WebApp.Controllers
{
    [Route("[controller]")]
    public class AdminPanelController : Controller
    {
        private readonly IForumCategoryRepository _categoryRepo;

        public AdminPanelController(IForumCategoryRepository categoryRepo)
        {
            _categoryRepo = categoryRepo;
        }

        [HttpGet]
        public async Task<IActionResult> Index()
        {
            return View(await _categoryRepo.GetAll());
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> DeleteCategory(Guid id)
        {
            await _categoryRepo.Delete(id);
            await _categoryRepo.Save();
            return RedirectToAction("Index");
        }

        [HttpGet("[action]")]
        public IActionResult CreateCategory()
        {
            return View();
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> CreateCategory(CreateCategoryDTO dto)
        {
            if (ModelState.IsValid)
            {
                var category = Data.Domain.Entities.Forum.Category.Create(dto.Name, dto.Description);
                await _categoryRepo.Add(category);
                await _categoryRepo.Save();

                return RedirectToAction("Index", "AdminPanel");
            }
            
            // Something went bad, return dto back to view
            return View(dto);
        }
    }
}
