using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;

namespace Data.Domain.Intefaces
{
    public interface IGenericRepository<T> where T : class
    {
        IQueryable<T> GetAll();
        T FindById(Guid id);
        void Add(T entity);
        void Delete(Guid id);
        void Edit(T entity);
        void Save();
    }
}
