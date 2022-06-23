using Business.Intefaces.Repository;
using Business.Intefaces.Services;
using Business.Models;
using Business.Models.Validations;

namespace Business.Services
{
    public class MovimentacaoManualService : BaseService, IMovimentacaoManualService
    {
        private readonly IMovimentacaoManualRepository _repo;

        public MovimentacaoManualService(INotificacao notifier,
                              IMovimentacaoManualRepository repo) : base(notifier)
        {
            _repo = repo;
        }
        public async Task<bool> Adicionar(MovimentacaoManual objeto)
        {
            if (!ExecutarValidacao(new MovimentacaoManualValidation(), objeto)) return false;

            if (_repo.ObterTodosAsync(x => x.CodProduto == objeto.CodProduto 
                                             && x.CodCosif == objeto.CodCosif
                                             && x.DataAno == objeto.DataAno
                                             && x.DataMes == objeto.DataMes
                                             && x.NumeroLancamento == objeto.NumeroLancamento).Result.Any())
            {
                Notificar("Já existe movimentto com estas informações.");
                return false;
            }

            objeto.DefinirNovoNumeroLancamento(_repo.ObterNumeroLancamento(objeto));

            await _repo.AdicionarAsync(objeto);
            return true;
        }

        public async Task<bool> Atualizar(MovimentacaoManual objeto)
        {
            if (!ExecutarValidacao(new MovimentacaoManualValidation(), objeto)) return false;

            await _repo.AtualizarAsync(objeto);
            return true;
        }
        public async Task<bool> Remover(MovimentacaoManual objeto)
        {
            await _repo.RemoverAsync(objeto);
            return true;
        }

        public void Dispose() => _repo?.Dispose();

    }
}