﻿using System;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Data.Domain.Entities;
using Data.Domain.Intefaces;
using WebApp.DTO;
using WebApp.Filters;

namespace WebApp.Controllers
{
    [Route("api/[controller]")]
    [DefaultControllerFilter]
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
        public async Task<IActionResult> GetAdmins()
        {
            return Ok(await _repository.GetAdmins());
        }

        [HttpGet]
        [Route("{id}")]
        public async Task<IActionResult> GetById(Guid id)
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
            User user = Data.Domain.Entities.User.Create(usrToCreate.Name, usrToCreate.IsAdmin, usrToCreate.Email, usrToCreate.Password, usrToCreate.Token, usrToCreate.Description);
            _repository.Add(user);
            return Ok(user);
        }

        [HttpPut]
        [Route("{id}")]
        public async Task<IActionResult> Update(Guid id, [FromBody]UpdateUsers userToUpdate)
        {
            if (id != userToUpdate.Id)
            {
                return NotFound();
            }
            var user = await _repository.FindById(id);
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
