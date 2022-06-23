using Business.Intefaces.Repository;
using Core.DomainObjects;

namespace DataAccess.Repository
{
    public abstract class Repository<T> : IRepository<T> where T : class, new()
    {
        protected readonly DbContext _db;
        internal DbSet<T> dbSet;

        public Repository(DbContext db)
        {
            try
            {
                _db = db;
                this.dbSet = _db.Set<T>();
            }
            catch (Exception ex)
            {
                var error = ex.Message;
                throw;
            }
        }

        #region Métodos  syncronos
        public T ObterPorId(int id) => dbSet.Find(id);

        public T ObterPorFiltro(
            Expression<Func<T, bool>> filter = null,
            Expression<Func<T, T>> field = null,
            string includeProperties = null,
            bool isTracking = false)
        {
            IQueryable<T> query = dbSet;
            if (filter != null)
                query = query.Where(filter);

            if (includeProperties != null)
                foreach (var includeProperty in includeProperties.Split(new char[] { ',' },
                    StringSplitOptions.RemoveEmptyEntries))
                    query = query.Include(includeProperty);

            if (field != null)
                query = query.Select(field);

            if (!isTracking)
                query = query.AsNoTracking();

            return query.FirstOrDefault();
        }

        public IEnumerable<T> ObterTodos(
            Expression<Func<T, bool>> filter = null,
            Func<IQueryable<T>, IOrderedQueryable<T>> orderBy = null,
            Expression<Func<T, T>> field = null,
            string includeProperties = null,
            bool isTracking = false)
        {
            IQueryable<T> query = dbSet;
            if (filter != null)
                query = query.Where(filter);

            if (includeProperties != null)
                foreach (var includeProperty in includeProperties.Split(new char[] { ',' },
                    StringSplitOptions.RemoveEmptyEntries))
                    query = query.Include(includeProperty);

            if (field != null)
                query = query.Select(field);

            if (orderBy != null)
                return orderBy(query);

            if (!isTracking)
                query = query.AsNoTracking();

            return query.ToList();
        }
        public void Adicionar(T entity)
        {
            dbSet.Add(entity);
            SaveChanges();
        }

        public void AdicionarRange(IEnumerable<T> entity)
        {
            dbSet.AddRangeAsync(entity);
            SaveChanges();
        }

        public void Atualizar(T entity)
        {
            dbSet.Update(entity);
            SaveChanges();
        }

        public void AtualizarRange(IEnumerable<T> entity)
        {
            dbSet.AddRange(entity);
            SaveChanges();
        }

        public int SaveChanges() => _db.SaveChanges();
        public bool VerificarSeExiste(Expression<Func<T, bool>> filter)
        {
            IQueryable<T> query = dbSet;
            if (filter == null) return false;

            if (query.Where(filter).Count() > 0)
                return true;

            return false;
        }

        public void Remover(T entity)
        {
            dbSet.Remove(entity);
            SaveChanges();
        }


        public void RemoverRange(IEnumerable<T> entity)
        {
            dbSet.RemoveRange(entity);
            SaveChanges();
        }
        #endregion

        #region Métodos Asyncronos
        public async Task<T> ObterPorIdAsync(int id) => await dbSet.FindAsync(id);

        public async Task<T> ObterPorFiltroAsync(
            Expression<Func<T, bool>> filter = null,
            Expression<Func<T, T>> field = null,
            string includeProperties = null,
            bool isTracking = false)
        {
            IQueryable<T> query = dbSet;
            if (filter != null)
                query = query.Where(filter);

            if (includeProperties != null)
                foreach (var includeProperty in includeProperties.Split(new char[] { ',' },
                    StringSplitOptions.RemoveEmptyEntries))
                    query = query.Include(includeProperty);

            if (field != null)
                query = query.Select(field);

            if (!isTracking)
                query = query.AsNoTracking();

            return await query.FirstOrDefaultAsync();
        }

        public async Task<IEnumerable<T>> ObterTodosAsync(
            Expression<Func<T, bool>> filter = null,
            Func<IQueryable<T>, IOrderedQueryable<T>> orderBy = null,
            Expression<Func<T, T>> field = null,
            string includeProperties = null,
            bool isTracking = false)
        {
            IQueryable<T> query = dbSet;
            if (filter != null)
                query = query.Where(filter);

            if (includeProperties != null)
                foreach (var includeProperty in includeProperties.Split(new char[] { ',' },
                    StringSplitOptions.RemoveEmptyEntries))
                    query = query.Include(includeProperty);

            if (field != null)
                query = query.Select(field);

            if (orderBy != null)
                return orderBy(query);

            if (!isTracking)
                query = query.AsNoTracking();

            return await query.ToListAsync();
        }
        public async Task AdicionarAsync(T entity)
        {
            await dbSet.AddAsync(entity);
            await SaveChangesAsync();
        }

        public async Task AdicionarRangeAsync(IEnumerable<T> entity)
        {
            await dbSet.AddRangeAsync(entity);
            await SaveChangesAsync();
        }

        public async Task AtualizarAsync(T entity)
        {
            dbSet.Update(entity);
            await SaveChangesAsync();
        }

        public async Task AtualizarRangeAsync(IEnumerable<T> entity)
        {
            dbSet.AddRange(entity);
            await SaveChangesAsync();
        }

        public async Task<int> SaveChangesAsync() => await _db.SaveChangesAsync();
        public Task<bool> VerificarSeExisteAsync(Expression<Func<T, bool>> filter)
        {
            IQueryable<T> query = dbSet;
            if (filter == null) return Task.Run(() => false);

            if (query.Where(filter).Count() > 0)
                return Task.Run(() => true);

            return Task.Run(() => false);
        }

        public async Task RemoverAsync(T entity)
        {
            dbSet.Remove(entity);
            await SaveChangesAsync();
        }

        public async Task RemoverRangeAsync(IEnumerable<T> entity)
        {
            dbSet.RemoveRange(entity);
            await SaveChangesAsync();
        }
        #endregion

        public void Dispose() => _db.Dispose();
    }
}