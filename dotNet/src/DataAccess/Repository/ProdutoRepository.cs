using Business.Intefaces.Repository;

namespace DataAccess.Repository
{
    public class ProdutoRepository : Repository<Produto>, IProdutoRepository
    {
        public ProdutoRepository(ApiDbContext db) : base(db) { }
    }
}