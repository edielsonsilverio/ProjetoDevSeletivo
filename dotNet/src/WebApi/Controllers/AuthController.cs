using Core.DomainObjects;
using Core.WebApi.Identidade;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using WebApi.ViewModels;
using WebAPI.Core.Controllers;
using WebAPI.Core.Usuario;

namespace WebApi.Controllers
{
    public class AuthController : MainController
    {
        private readonly SignInManager<IdentityUser> _signInManager;
        private readonly UserManager<IdentityUser> _userManager;
        private readonly AppSettings _appSettings;

        public AuthController(INotificacao notifier,
                              IAspNetUser appUser,
                              SignInManager<IdentityUser> signInManager,
                              UserManager<IdentityUser> userManager,
                              IOptions<AppSettings> appSettings,
                              IAspNetUser user,
                              INotificacao notificacao) : base(notificacao, user)
        {
            _signInManager = signInManager;
            _userManager = userManager;
            _appSettings = appSettings.Value;
        }

        [HttpPost("nova-conta")]
        public async Task<ActionResult> Registrar([FromBody] UsuarioRegistro registerUser)
        {
            if (!ModelState.IsValid) return CustomResponse(ModelState);

            var user = new IdentityUser
            {
                UserName = registerUser.Email,
                Email = registerUser.Email,
                EmailConfirmed = true
            };

            var result = await _userManager.CreateAsync(user, registerUser.Senha);

            if (result.Succeeded)
                return CustomResponse(await GerarJwt(user.Email));

            foreach (var error in result.Errors)
                AdicionarErroProcessamento(error.Description);

            return CustomResponse(registerUser);
        }

        [HttpPost("autenticar")]
        public async Task<ActionResult> Login([FromBody] UsuarioLogin loginUser)
        {
            if (!ModelState.IsValid) return CustomResponse(ModelState);

            var result = await _signInManager.PasswordSignInAsync(loginUser.Email, loginUser.Senha, false, true);

            if (result.Succeeded)
            {
                var token = await GerarJwt(loginUser.Email);
                return CustomResponse(token);
            }

            if (result.IsLockedOut)
            {
                AdicionarErroProcessamento("Usuário temporariamente bloqueado por tentativas inválidas");
                return CustomResponse(loginUser);
            }
            AdicionarErroProcessamento("Usuário ou Senha incorretos.");
            return CustomResponse(loginUser);
        }



        private async Task<UsuarioRespostaLogin> GerarJwt(string email)
        {
            //Obtêm um usuário com base no email
            var user = await _userManager.FindByEmailAsync(email);

            //Obtêm as claims(Permissões) do usuário
            var claims = await _userManager.GetClaimsAsync(user);

            //Configuração de nova claism com base nas informações do tokem.
            var identityClaims = await ObterClaimsUsuario(user, claims);

            var encodedToken = CodificarToken(identityClaims);
            return ObterRespostaToken(encodedToken, user, claims);

        }

        private async Task<ClaimsIdentity> ObterClaimsUsuario(IdentityUser user, IList<Claim> claims)
        {
            //Obtêm as roles(Papel) do usuário
            var userRoles = await _userManager.GetRolesAsync(user);

            //Id do usuário
            claims.Add(new Claim(JwtRegisteredClaimNames.Sub, user.Id));

            //Email do usuário
            claims.Add(new Claim(JwtRegisteredClaimNames.Email, user.Email));

            //Cria uma chave única para o token.
            claims.Add(new Claim(JwtRegisteredClaimNames.Jti, Guid.NewGuid().ToString()));

            //Configura quando o token vai expirar.
            claims.Add(new Claim(JwtRegisteredClaimNames.Nbf, ToUnixEpochDate(DateTime.UtcNow).ToString()));

            //Configura a hora que o token foi emitido
            claims.Add(new Claim(JwtRegisteredClaimNames.Iat, ToUnixEpochDate(DateTime.UtcNow).ToString(), ClaimValueTypes.Integer64));

            //Adiciona uma claim com as roles
            foreach (var userRole in userRoles)
                claims.Add(new Claim("role", userRole));

            //Configura as claim no Identity
            var identityClaims = new ClaimsIdentity();
            identityClaims.AddClaims(claims);
            return identityClaims;
        }

        private string CodificarToken(ClaimsIdentity identityClaims)
        {
            //Cria o objeto para geração do Token
            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(_appSettings.Secret);

            //Configura e Cria o Token com base nas informações configuradas pelo sistema.
            var token = tokenHandler.CreateToken(new SecurityTokenDescriptor
            {
                Issuer = _appSettings.Emissor,
                Audience = _appSettings.ValidoEm,
                Subject = identityClaims,
                Expires = DateTime.UtcNow.AddHours(_appSettings.ExpiracaoHoras),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            });
            //Escreve o token e retorna.
            var encodedToken = tokenHandler.WriteToken(token);
            return encodedToken;
        }

        private UsuarioRespostaLogin ObterRespostaToken(string encodedToken, IdentityUser user, IEnumerable<Claim> claims)
        {
            //Configura a resposta do método.
            return new UsuarioRespostaLogin
            {
                AccessToken = encodedToken,
                ExpiresIn = TimeSpan.FromHours(_appSettings.ExpiracaoHoras).TotalSeconds,
                UsuarioToken = new UsuarioToken
                {
                    Id = user.Id,
                    Email = user.Email,
                    Claims = claims.Select(c => new UsuarioClaim { Type = c.Type, Value = c.Value })
                }
            };
        }
        private static long ToUnixEpochDate(DateTime date)
            => (long)Math.Round((date.ToUniversalTime() - new DateTimeOffset(1970, 1, 1, 0, 0, 0, TimeSpan.Zero)).TotalSeconds);
    }
}