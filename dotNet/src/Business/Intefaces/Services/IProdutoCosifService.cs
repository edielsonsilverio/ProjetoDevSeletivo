using Business.Models;

namespace Business.Intefaces.Services
{
    public interface IProdutoCosifService
    {
        Task<bool> Adicionar(ProdutoCosif objeto);
        Task<bool> Atualizar(ProdutoCosif objeto);
        Task<bool> Remover(ProdutoCosif objeto);
    }
}
