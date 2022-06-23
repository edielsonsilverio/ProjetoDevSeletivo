namespace DataAccess.Context;
public class ApiDbContext : DbContext, IUnitOfWork
{
    private TipoServidorBancoDados _servidorDB;
    public ApiDbContext() {
        _servidorDB = TipoServidorBancoDados.SQLServer;
    }
    public ApiDbContext(DbContextOptions<ApiDbContext> options) : base(options)
    {
        ChangeTracker.QueryTrackingBehavior = QueryTrackingBehavior.NoTracking;
        ChangeTracker.AutoDetectChangesEnabled = false;
        _servidorDB = TipoServidorBancoDados.SQLServer;
    }

    #region PROPRIEDADES [DbSet]

    public DbSet<Produto> Produtos { get; set; }
    public DbSet<ProdutoCosif> ProdutoConsifs { get; set; }
    public DbSet<MovimentacaoManual> MovimentacaoManuais { get; set; }

    #endregion FIM DAS PROPRIEDADES [DbSet]

    public async Task<bool> Commit()
    {
        foreach (var entry in ChangeTracker.Entries().Where(entry => entry.Entity.GetType().GetProperty("DataCadastro") != null))
        {
            if (entry.State == EntityState.Added)
                entry.Property("DataCadastro").CurrentValue = DateTime.Now;

            if (entry.State == EntityState.Modified)
                entry.Property("DataCadastro").IsModified = false;
        }

        var sucesso = await base.SaveChangesAsync() > 0;
        return sucesso;
    }

    protected override void ConfigureConventions(ModelConfigurationBuilder configurationBuilder)
    {
        configurationBuilder.ConfigurarConvencaoTipoColuna(_servidorDB);
    }

   
    protected override void OnModelCreating(ModelBuilder modelBuilder)
    {
        modelBuilder.ConfigurarRelacionamentoEntidades(DeleteBehavior.ClientSetNull);

        modelBuilder.ApplyConfigurationsFromAssembly(typeof(ApiDbContext).Assembly);
    }
}
