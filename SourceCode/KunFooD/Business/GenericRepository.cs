using System;
using System.Linq;
using Data.Domain.Intefaces;
using Data.Persistence;
using Microsoft.EntityFrameworkCore;

namespace Business
{
    public abstract class GenericRepository<T> : IGenericRepository<T> where T : class
    {
        private readonly IDatabaseContext _databaseContext;
        private readonly DbSet<T> _entities;

        protected GenericRepository(IDatabaseContext databaseContext)
        {
            _databaseContext = databaseContext;
            _entities = (databaseContext as DbContext)?.Set<T>();
        }

        public virtual IQueryable<T> GetAll()
        {
            return _entities;
        }

        public T FindById(Guid id)
        {

            T entity = _entities.Find(id);
            return entity;
        }

        public virtual void Add(T entity)
        {
            _entities.Add(entity);
            Save();
        }

        public virtual void Delete(Guid id)
        {
            var entity = FindById(id);
            _entities.Remove(entity);
            Save();
        }

        public virtual void Edit(T entity)
        {
            _entities.Update(entity);
            Save();
        }

        public virtual void Save()
        {
            _databaseContext.SaveChanges();
        }
    }
}
