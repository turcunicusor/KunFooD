using Data.Domain.Intefaces;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using WebApp.DTO;

namespace WebApp.Controllers
{
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
        [Route("[controller]")]
        public async Task<IActionResult> Index()
        {
            return View(await _categoryRepo.GetAll());
        }

        [HttpGet]
        [Route("[controller]/[action]/{id}")]
        public async Task<IActionResult> Category(Guid id)
        { 
            var category = await _categoryRepo.FindById(id);

            CategoryDTO dto = new CategoryDTO();
            dto.Category = category;

            var threads = await _threadRepo.GetByCategoryId(id);
            List<ThreadDTO> threadDTOList = new List<ThreadDTO>();
           
            foreach(var thread in threads)
            {
                ThreadDTO threadDTO = new ThreadDTO();
                threadDTO.Id = thread.Id;
                threadDTO.Name = thread.Name;
                threadDTO.Description = thread.Description;
                threadDTO.CreatedAt = thread.CreatedAt;
                threadDTO.AuthorName = await GetThreadAuthorName(thread.UserId);
                threadDTOList.Add(threadDTO);
            }

            dto.Threads = threadDTOList;
            return View(dto);
        }

        [HttpGet]
        [Route("[controller]/[action]/{id}")]
        public IActionResult CreateThread(Guid id)
        {
            CreateThreadDTO dto = new CreateThreadDTO();
            dto.CategoryId = id;

            return View(dto);
        }

        [HttpPost]
        [Route("[controller]/[action]")]
        public async Task<IActionResult> CreateThread(CreateThreadDTO dto)
        {
            if(ModelState.IsValid)
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
                else
                    ModelState.AddModelError("", "TEMPCODE: Account doesn't exist!");
            }

            // Something went bad, return dto back to view
            return View(dto);
        }

        public async Task<string> GetThreadAuthorName(Guid id)
        {
            var user = await _userRepo.FindById(id);
            return user.UserName;
        }
    }
}
