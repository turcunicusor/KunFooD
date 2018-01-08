using Data.Domain.Intefaces;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using WebApp.DTO;
using WebApp.Filters;

namespace WebApp.Controllers
{
    [Route("[controller]")]
    [DefaultControllerFilter]
    public class ForumController : Controller
    {
        private readonly IForumCategoryRepository _categoryRepo;
        private readonly IForumThreadRepository _threadRepo;
        private readonly IUsersRepository _userRepo;

        public ForumController(IForumCategoryRepository categoryRepo, IForumThreadRepository threadRepo,
            IUsersRepository userRepo)
        {
            _categoryRepo = categoryRepo;
            _threadRepo = threadRepo;
            _userRepo = userRepo;
        }

        [HttpGet]
        public async Task<IActionResult> Index()
        {
            return View(await _categoryRepo.GetAll());
        }

        [HttpGet("[action]")]
        public async Task<IActionResult> Category(Guid id)
        {
            var category = await _categoryRepo.FindById(id);

            CategoryDTO dto = new CategoryDTO();
            dto.Category = category;

            var threads = await _threadRepo.GetByCategoryId(id);
            List<ThreadDTO> threadDtoList = new List<ThreadDTO>();

            foreach (var thread in threads)
            {
                ThreadDTO threadDto = new ThreadDTO();
                threadDto.Id = thread.Id;
                threadDto.Name = thread.Name;
                threadDto.Description = thread.Description;
                threadDto.CreatedAt = thread.CreatedAt;
                threadDto.AuthorName = await GetThreadAuthorName(thread.UserId);
                threadDtoList.Add(threadDto);
            }

            dto.Threads = threadDtoList;
            return View(dto);
        }

        [HttpGet("[action]")]
        public IActionResult CreateThread(Guid id)
        {
            CreateThreadDTO dto = new CreateThreadDTO();
            dto.CategoryId = id;

            return View(dto);
        }

        [HttpPost("[action]")]
        public async Task<IActionResult> CreateThread(CreateThreadDTO dto)
        {
            // TEMP CODE: Check email and get userid based on it
            var user = await _userRepo.GetByEmail(dto.UserEmail);
            if (user != null)
            {
                var thread = Data.Domain.Entities.Forum.Thread.Create(dto.Name, dto.Description, user.Id, dto.CategoryId);
                await _threadRepo.Add(thread);
                await _threadRepo.Save();

                return RedirectToAction("Category", "Forum", new { id = dto.CategoryId });
            }
            ModelState.AddModelError("", "TEMPCODE: Account doesn't exist!");

            // Something went bad, return dto back to view
            return View(dto);
        }

        [HttpGet("[action]")]
        public async Task<IActionResult> Thread(Guid id)
        {
            var thread = await _threadRepo.FindById(id);

            return View(thread);
        }

        private async Task<string> GetThreadAuthorName(Guid id)
        {
            var user = await _userRepo.FindById(id);
            return user.UserName;
        }
    }
}
