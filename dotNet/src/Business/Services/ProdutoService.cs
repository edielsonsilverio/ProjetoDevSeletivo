using Business.Intefaces.Repository;
using Business.Intefaces.Services;
using Business.Models;
using Business.Models.Validations;

namespace Business.Services
{
    public class ProdutoService : BaseService, IProdutoService
    {
        private readonly IProdutoRepository _repo;

        public ProdutoService(INotificacao notifier, 
                              IProdutoRepository repo) : base(notifier)
        {
            _repo = repo;
        }
        public async Task<bool> Adicionar(Produto objeto)
        {
            if (!ExecutarValidacao(new ProdutoValidation(), objeto)) return false;

            if (_repo.ObterTodosAsync(x => x.Descricao == objeto.Descricao).Result.Any())
            {
                Notificar("Já existe um Produto com esta descrição.");
                return false;
            }
            objeto.StatusAtivo();
            await _repo.AdicionarAsync(objeto);
            return true;
        }
        public async Task<bool> Atualizar(Produto objeto)
        {
            if (!ExecutarValidacao(new ProdutoValidation(), objeto)) return false;

            
            await _repo.AtualizarAsync(objeto);
            return true;
        }
        public async Task<bool> Remover(Produto objeto)
        {
            await _repo.RemoverAsync(objeto);
            return true;
        }

        public void Dispose() => _repo?.Dispose();
    }
}