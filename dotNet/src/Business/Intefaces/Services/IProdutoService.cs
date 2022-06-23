using System.Threading.Tasks;
using Business.Models;

namespace Business.Intefaces.Services
{
    public interface IProdutoService
    {
        Task<bool> Adicionar(Produto objeto);
        Task<bool> Atualizar(Produto objeto);
        Task<bool> Remover(Produto objeto);
    }
}
