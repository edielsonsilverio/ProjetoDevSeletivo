using Business.Intefaces.Repository;

namespace DataAccess.Repository
{
    public class ProdutoCosifRepository : Repository<ProdutoCosif>, IProdutoCosifRepository
    {
        public ProdutoCosifRepository(ApiDbContext db) : base(db) { }
    }
}