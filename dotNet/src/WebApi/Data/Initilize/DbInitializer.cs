using Core;
using Core.Data;
using DataAccess.Context;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;

namespace WebApi.Data.Initilize
{
    public class DbInitializer : IDbInitializer
    {
        private readonly ApplicationDbContext _contextUser;
        private readonly ApiDbContext _contextAdm;

        private readonly UserManager<IdentityUser> _userManager;
        private readonly RoleManager<IdentityRole> _roleManager;
        public DbInitializer(
            ApplicationDbContext contextUser,
            ApiDbContext contextAdm,
            UserManager<IdentityUser> userManager,
            RoleManager<IdentityRole> roleManager)
        {
            _contextUser = contextUser;
            _contextAdm = contextAdm;
            _userManager = userManager;
            _roleManager = roleManager;
        }

        public void InitializeAdministrativo()
        {
            if (!_contextAdm.Database.GetPendingMigrations().Any())
                _contextAdm.Database.Migrate();
        }

        public void InitializeUser()
        {
            if (!_contextUser.Database.GetPendingMigrations().Any())
                return;
            //_contextUser.Database.Migrate();


            //Se não existir nenhuma regra, então cria as regras padrões.
            if (_roleManager.FindByNameAsync("ADMIN").Result == null)
            {
                _roleManager.CreateAsync(new IdentityRole(GlobalConstants.ADMIN)).GetAwaiter().GetResult();
                _roleManager.CreateAsync(new IdentityRole(GlobalConstants.FUNCIONARIO)).GetAwaiter().GetResult();
            }
            else return;

            CriarUsuarioAdministrador();

            CriarUsuarioCliente();
        }

        private void CriarUsuarioAdministrador()
        {
            if (_userManager.FindByEmailAsync("admin@teste.com.br").Result != null)
                return;

            //Configura um usuário padrão
            var adminUser = new IdentityUser
            {
                UserName = "admin",
                Email = "admin@teste.com.br",
                EmailConfirmed = true,
                PhoneNumber = "(65) 3025-6985",

            };

            //Cria um usuário
            _userManager.CreateAsync(adminUser, "Teste@123").GetAwaiter().GetResult();

            //Adiciona o Papel do usuário.
            _userManager.AddToRoleAsync(adminUser, GlobalConstants.ADMIN).GetAwaiter().GetResult();

        }

        private void CriarUsuarioCliente()
        {
            if (_userManager.FindByEmailAsync("cliente@teste.com.br").Result != null)
                return;

            //Cria o Usuario Cliente.
            var customerUser = new IdentityUser
            {
                UserName = "cliente",
                Email = "cliente@teste.com.br",
                EmailConfirmed = true,
                PhoneNumber = "(65) 3025-6985",

            };

            _userManager.CreateAsync(customerUser, "Teste@123").GetAwaiter().GetResult();
            _userManager.AddToRoleAsync(customerUser, GlobalConstants.FUNCIONARIO).GetAwaiter().GetResult();
        }
    }
}