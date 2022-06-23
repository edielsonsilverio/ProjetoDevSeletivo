using Business.Models;

namespace Business.Intefaces.Repository
{
    public interface IMovimentacaoManualRepository : IRepository<MovimentacaoManual>
    {
        Task<IEnumerable<MovimentacaoManual>> ObterTodos();
        int ObterNumeroLancamento(MovimentacaoManual model);

    }
}
