using Core;
using Core.Data;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;


namespace WebApi.Data
{
    public class ApplicationDbContext : IdentityDbContext
    {
        private TipoServidorBancoDados _servidorDB;
        //public DbSet<Usuario> Usuarios { get; set; }
        //public DbSet<PermissaoClaim> PermissaoClaims { get; set; }

        public ApplicationDbContext(DbContextOptions<ApplicationDbContext> options) : base(options)
        {
            _servidorDB = TipoServidorBancoDados.SQLServer;
        }

        public ApplicationDbContext()
        {
            _servidorDB = TipoServidorBancoDados.SQLServer;
        }

        protected override void ConfigureConventions(ModelConfigurationBuilder configurationBuilder)
        {
            //configurationBuilder.ConfigurarConvencaoTipoColuna(_servidorDB);
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {

            //modelBuilder.ConfigurarServidorBancoDados(TipoServidorBancoDados.MySQL);
            modelBuilder.ConfigurarRelacionamentoEntidades(DeleteBehavior.Cascade);
            //modelBuilder.ApplyConfigurationsFromAssembly(typeof(ApplicationDbContext).Assembly);
            //modelBuilder.ApplyConfiguration(new UsuarioMapping());
            //modelBuilder.ApplyConfiguration(new PermissaoClaimMapping());
            base.OnModelCreating(modelBuilder);
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            //OptionsBuilderExtenstions.ConfigurarConexao(optionsBuilder,
            //    _servidorDB, GlobalConstants.CONEXAO_BANCO_MYSQL);

            //optionsBuilder.ConfigurarConexao(_servidorDB, GlobalConstants.CONEXAO_BANCO_POSTGRES);
            //optionsBuilder.ConfigurarConexao(_servidorDB, GlobalConstants.CONEXAO_BANCO_MYSQL);
            optionsBuilder.ConfigurarConexao(_servidorDB, GlobalConstants.CONEXAO_BANCO_SQLSERVER);

            // Criar a extensão postgis no banco de dados criado
            //CREATE EXTENSION postgis;
        }
    }
}