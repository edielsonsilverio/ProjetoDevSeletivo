using Business.Intefaces.Repository;
using Business.Intefaces.Services;
using Business.Models;
using Business.Models.Validations;

namespace Business.Services
{
    public class ProdutoCosifService : BaseService, IProdutoCosifService
    {
        private readonly IProdutoCosifRepository _repo;

        public ProdutoCosifService(INotificacao notifier,
                              IProdutoCosifRepository repo) : base(notifier)
        {
            _repo = repo;
        }
        public async Task<bool> Adicionar(ProdutoCosif objeto)
        {
            if (!ExecutarValidacao(new ProdutoCosifValidation(), objeto)) return false;

            if (_repo.ObterTodosAsync(x => x.CodProduto == objeto.CodProduto && x.CodCosif == objeto.CodCosif).Result.Any())
            {
                Notificar("Já existe um produto com este código.");
                return false;
            }
            objeto.StatusAtivo();
            await _repo.AdicionarAsync(objeto);
            return true;
        }
        public async Task<bool> Atualizar(ProdutoCosif objeto)
        {
            if (!ExecutarValidacao(new ProdutoCosifValidation(), objeto)) return false;

            await _repo.AtualizarAsync(objeto);
            return true;
        }
        public async Task<bool> Remover(ProdutoCosif objeto)
        {
            await _repo.RemoverAsync(objeto);
            return true;
        }

        public void Dispose() => _repo?.Dispose();

    }
}