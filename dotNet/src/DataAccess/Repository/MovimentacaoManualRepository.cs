using Business.Intefaces.Repository;

namespace DataAccess.Repository
{
    public class MovimentacaoManualRepository : Repository<MovimentacaoManual>, IMovimentacaoManualRepository
    {
        private readonly ApiDbContext _db;
        public MovimentacaoManualRepository(ApiDbContext db) : base(db) { 
            _db = db;   
        }

        public int ObterNumeroLancamento(MovimentacaoManual model)
        {
            var numero = base.ObterTodos(x => x.DataMes == model.DataMes && x.DataAno == model.DataAno).ToList() ;
                                  
            if(!numero.Any())
                return 1;
 
            return numero.Max(x => x.NumeroLancamento) + 1;
            //return numero + 1;

        }

        public async Task<IEnumerable<MovimentacaoManual>> ObterTodos()
        {
            var lista = _db.MovimentacaoManuais.Include(x => x.ProdutoConsif).ThenInclude(a => a.Produto);
            return lista;
        }
    }
}