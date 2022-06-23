using System.Linq.Expressions;

namespace Business.Intefaces.Repository
{
    public interface IRepository<T> : IDisposable where T : class
    {
        Task<T> ObterPorIdAsync(int id);
        Task<IEnumerable<T>> ObterTodosAsync(
            Expression<Func<T, bool>> filter = null,
            Func<IQueryable<T>, IOrderedQueryable<T>> orderBy = null,
            Expression<Func<T, T>> field = null,
            string includeProperties = null,
            bool isTracking = false
        );
        Task<T> ObterPorFiltroAsync(
            Expression<Func<T, bool>> filter = null,
            Expression<Func<T, T>> field = null,
            string includeProperties = null,
            bool isTracking = false
        );
        Task AdicionarAsync(T entity);
        Task AdicionarRangeAsync(IEnumerable<T> entity);
        Task AtualizarAsync(T entity);
        Task AtualizarRangeAsync(IEnumerable<T> entity);
        Task<int> SaveChangesAsync();
        Task<bool> VerificarSeExisteAsync(Expression<Func<T, bool>> filter);
        Task RemoverAsync(T entity);
        Task RemoverRangeAsync(IEnumerable<T> entity);


        T ObterPorId(int id);
        IEnumerable<T> ObterTodos(
            Expression<Func<T, bool>> filter = null,
            Func<IQueryable<T>, IOrderedQueryable<T>> orderBy = null,
            Expression<Func<T, T>> field = null,
            string includeProperties = null,
            bool isTracking = false
        );
        T ObterPorFiltro(
            Expression<Func<T, bool>> filter = null,
            Expression<Func<T, T>> field = null,
            string includeProperties = null,
            bool isTracking = false
        );
        void Adicionar(T entity);
        void AdicionarRange(IEnumerable<T> entity);
        void Atualizar(T entity);
        void AtualizarRange(IEnumerable<T> entity);
        int SaveChanges();
        bool VerificarSeExiste(Expression<Func<T, bool>> filter);
        void Remover(T entity);
        void RemoverRange(IEnumerable<T> entity);
    }
}