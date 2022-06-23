using Business.Models;

namespace Business.Intefaces.Services
{
    public interface IMovimentacaoManualService
    {
        Task<bool> Adicionar(MovimentacaoManual objeto);
        Task<bool> Atualizar(MovimentacaoManual objeto);
        Task<bool> Remover(MovimentacaoManual objeto);
    }
}
