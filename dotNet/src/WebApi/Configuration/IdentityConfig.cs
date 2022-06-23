using Business.Models;
using Core.WebApi.Identidade;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using WebApi.Data;
using WebApi.Extensions;

namespace WebApi.Configuration
{
    public static class IdentityConfig
    {
        public static IServiceCollection AddIdentityConfiguration(this IServiceCollection services,
            IConfiguration configuration)
        {
            var conn = configuration.GetConnectionString("SqlServerConnection");

            services.AddDbContext<ApplicationDbContext>(options =>
                options.UseSqlServer(conn));

            services.AddDefaultIdentity<IdentityUser>()
                .AddRoles<IdentityRole>()
                .AddEntityFrameworkStores<ApplicationDbContext>()
                .AddErrorDescriber<IdentityMensagensPortugues>()
                .AddDefaultTokenProviders();

            // JWT
            services.AddJwtConfiguration(configuration);
            return services;
        }
    }
}