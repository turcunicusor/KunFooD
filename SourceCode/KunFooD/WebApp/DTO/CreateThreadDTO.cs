﻿
using System;
using System.ComponentModel.DataAnnotations;

namespace WebApp.DTO
{
    public class CreateThreadDTO
    {
        [Required]
        public Guid CategoryId { get; set; }

        [Required, MaxLength(256), Display(Name = "Name")]
        public string Name { get; set; }

        [Required, Display(Name = "Content")]
        public string Description { get; set; }

//        [Required]
//        public string UserEmail { get; set; }
    }
}
