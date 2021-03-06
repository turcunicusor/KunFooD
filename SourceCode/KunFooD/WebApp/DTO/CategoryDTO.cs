﻿
using Data.Domain.Entities.Forum;
using System.Collections.Generic;

namespace WebApp.DTO
{
    public class CategoryDTO
    {
        public Category Category { get; set; }
        public IEnumerable<ThreadDTO> Threads { get; set; }
    }
}
