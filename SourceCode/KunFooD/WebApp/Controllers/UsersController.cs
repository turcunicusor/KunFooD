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
        [Route("All")]
        public async Task<IActionResult> Index()
        {
            return Ok(await _repository.GetAll());
        }

        [HttpGet]
        [Route("Admins")]
        public IActionResult GetAdmins()
        {
            return Ok(_repository.GetAdmins());
        }

        [HttpGet]
        [Route("get")]
        public async Task<IActionResult> Details(Guid id)
        {
            var user = await _repository.FindById(id);
            if (user == null)
            {
                return NotFound();
            }
            return Ok(user);
        }

        [HttpPost]
        public IActionResult Create([FromBody] CreateUsers usrToCreate)
        {
            User user = null;
            if (!ModelState.IsValid) return BadRequest(usrToCreate);
            user = Data.Domain.Entities.User.Create(usrToCreate.Name, usrToCreate.IsAdmin, usrToCreate.Email, usrToCreate.Password, usrToCreate.Token, usrToCreate.Description);
            _repository.Add(user);
            return Ok(user);
        }

        [HttpGet]
        [Route("edit")]
        public async Task<IActionResult> Edit(Guid id)
        {
            var user = await _repository.FindById(id);
            if (user == null)
            {
                return NotFound();
            }
            await _repository.Edit(user);
            return Ok(user);
        }

        [HttpPut("{id}")]
        public async Task<IActionResult> Edit(Guid id, [FromBody]UpdateUsers userToUpdate)
        {
            if (id != userToUpdate.Id)
            {
                return NotFound();
            }
            var user = await _repository.FindById(id);
            // to think about it
            user.Update(userToUpdate.Name, userToUpdate.IsAdmin, userToUpdate.Email, userToUpdate.Password, userToUpdate.Token, userToUpdate.Description);
            await _repository.Edit(user); 
            return Ok(user);
        }

        [HttpDelete]
        public async Task<IActionResult> Delete(Guid id)
        {
            var user = await _repository.FindById(id);
            if (user == null)
            {
                return NotFound(id);
            }
            await _repository.Delete(id);
            return Ok(user);
        }
    }
}
