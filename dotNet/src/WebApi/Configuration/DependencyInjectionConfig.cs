using Business.Intefaces.Repository;
using Business.Services;
using Core.Data;
using Core.DomainObjects;
using Core.WebApi.Usuario;
using DataAccess.Context;
using DataAccess.Repository;
using Microsoft.EntityFrameworkCore;
using WebApi.Data.Initilize;
using WebAPI.Core.Usuario;

namespace WebApi.Configuration
{
    public static class DependencyInjectionConfig
    {
        public static IServiceCollection AddDependencyInjection(this IServiceCollection services,
                                                                     IConfiguration configuration)
        {
            #region CONTEXTO

            var conn = configuration.GetConnectionString("SqlServerConnection");
            services.AddDbContext<ApiDbContext>(options => options.UseSqlServer(conn));

            #endregion

            DependencyInjectionRepository(services);

            DependencyInjectionServices(services);

            services.AddScoped<INotificacao, Notificacao>();
            services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
            services.AddScoped<IAspNetUser, AspNetUser>();
            services.AddScoped<IDbInitializer, DbInitializer>();

            return services;
        }

        private static void DependencyInjectionServices(IServiceCollection services)
        {
            services.AddScoped<IProdutoService, ProdutoService>();
            services.AddScoped<IProdutoCosifService, ProdutoCosifService>();
            services.AddScoped<IMovimentacaoManualService, MovimentacaoManualService>();
        }

        private static void DependencyInjectionRepository(IServiceCollection services)
        {
            services.AddScoped<IProdutoRepository, ProdutoRepository>();
            services.AddScoped<IProdutoCosifRepository, ProdutoCosifRepository>();
            services.AddScoped<IMovimentacaoManualRepository, MovimentacaoManualRepository>();
        }
    }
}