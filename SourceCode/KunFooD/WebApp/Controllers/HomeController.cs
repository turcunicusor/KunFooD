﻿using System.Diagnostics;
using Microsoft.AspNetCore.Mvc;
using WebApp.Models;

namespace WebApp.Controllers
{
    public class HomeController : Controller
    {
        public IActionResult Index()
        {
            ViewBag.LoggedIn = false;

            return View();
        }

        [HttpGet]
        [Route("error")]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
