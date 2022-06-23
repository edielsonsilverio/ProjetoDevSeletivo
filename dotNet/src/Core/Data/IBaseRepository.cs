using Core.DomainObjects;

namespace Core.Data
{
    public interface IBaseRepository<T> : IDisposable where T : IAggregateRoot
    {
        IUnitOfWork UnitOfWork { get; }
    }
}