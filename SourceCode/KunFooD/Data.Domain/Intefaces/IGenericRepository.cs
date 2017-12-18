using System;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace Data.Domain.Intefaces
{
    public interface IGenericRepository<T> where T : class
    {
        Task<IEnumerable<T>> GetAll();
        Task<T> FindById(Guid id);
        Task Add(T entity);
        Task Delete(Guid id);
        Task Edit(T entity);
        Task Save();
    }
}
