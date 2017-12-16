using System;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Data.Domain.Entities;
using Data.Domain.Intefaces;
using WebApp.DTOs;
using WebApp.Filters;

namespace WebApp.Controllers
{
    [Route("api/[controller]")]
    [UsersControllerFilter]
    public class UsersController : Controller
    {
        private readonly IUsersRepository _repository;

        public UsersController(IUsersRepository repository)
        {
            _repository = repository;
        }

        [HttpGet]
        [Route("getAll")]
        public IActionResult Index()
        {
            return Ok(_repository.GetAll());
        }

        [HttpGet]
        [Route("get")]
        public async Task<IActionResult> Details(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }
            var user = await _repository.GetAll()
                .SingleOrDefaultAsync(m => m.Id == id);
            if (user == null)
            {
                return NotFound();
            }
            return Ok(user);
        }

        [HttpPost]
        public IActionResult Create([FromBody] CreateUsers createUsers)
        {
            User user = Data.Domain.Entities.User.Create(createUsers.Name, createUsers.IsAdmin, createUsers.Email, createUsers.Password, createUsers.Token, createUsers.Description);
            if (ModelState.IsValid)
            {
                _repository.Add(user);
                return Ok(user);
            }
            return Ok(user);
        }

        [HttpGet]
        [Route("edit")]
        public async Task<IActionResult> Edit(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var user = await _repository.GetAll().SingleOrDefaultAsync(m => m.Id == id);
            if (user == null)
            {
                return NotFound();
            }
            return Ok(user);
        }

        [HttpPut("{id}")]
        public IActionResult Edit(Guid id, [FromBody]UpdateUsers user)
        {
            if (id != user.Id)
            {
                return NotFound();
            }
            User u1 = _repository.FindById(id);
            if (ModelState.IsValid)
            {
                try
                {
                    _repository.Edit(Data.Domain.Entities.User.Create(user.Name, user.IsAdmin, user.Email, user.Password, user.Token, user.Description));
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!UserExists(user.Id))
                    {
                        return NotFound();
                    }
                    throw;
                }
                return Ok(u1);
            }
            return Ok(u1);
        }

        [HttpDelete]
        public async Task<IActionResult> Delete(Guid id)
        {
            var user = await _repository.GetAll()
                .SingleOrDefaultAsync(m => m.Id == id);
            _repository.Delete(id);
            if (user == null)
            {
                return NotFound();
            }
            return View(user);
        }

        private bool UserExists(Guid id)
        {
            return _repository.GetAll().Any(e => e.Id == id);
        }
    }
}
