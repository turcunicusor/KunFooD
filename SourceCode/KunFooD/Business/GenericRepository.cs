using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Data.Domain.Intefaces;
using Microsoft.EntityFrameworkCore;

namespace Business
{
    public abstract class GenericRepository<C, T> :
        IGenericRepository<T> where T : class where C : DbContext, new()
    {
        private C _entities = new C();
        public C Context
        {
            get { return _entities; }
            set { _entities = value; }
        }

        public virtual IQueryable<T> GetAll()
        {
            IQueryable<T> query = _entities.Set<T>();
            return query;
        }

        public T FindById(Guid id)
        {

            T entity = _entities.Set<T>().Find(id);
            return entity;
        }

        public virtual void Add(T entity)
        {
            _entities.Set<T>().Add(entity);
            Save();
        }

        public virtual void Delete(Guid id)
        {
            var entity = FindById(id);
            _entities.Set<T>().Remove(entity);
            Save();
        }

        public virtual void Edit(T entity)
        {
            _entities.Set<T>().Update(entity);
            Save();
        }

        public virtual void Save()
        {
            _entities.SaveChanges();
        }
    }
}
