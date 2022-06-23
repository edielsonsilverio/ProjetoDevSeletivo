using Core.DomainObjects;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.ModelBinding;
using WebAPI.Core.Usuario;

namespace WebAPI.Core.Controllers
{
    [ApiController]
    public abstract class MainController : ControllerBase
    {
        private readonly INotificacao _notifier;
        public readonly IAspNetUser AppUser;
        //protected ILogger Logger;
        public Guid UsuarioId { get; set; }
        protected bool UsuarioAutenticado { get; set; }

        protected MainController(INotificacao notifier,
            IAspNetUser appUser//,ILogger logger
        )
        {
            _notifier = notifier;
            AppUser = appUser;
            //Logger = logger;
            if (appUser.EstaAutenticado())
            {
                UsuarioId = appUser.ObterUserId();
                UsuarioAutenticado = true;
            }
        }

        protected bool OperacaoValida() => !_notifier.TemNotificacao();

        protected ActionResult CustomResponse(object result = null)
        {
            if (OperacaoValida())
                return Ok(new { success = true, data = result });

            return BadRequest(new { success = false, errors = _notifier.ObterNotificacao().Select(n => n.Mensagem) });
        }

        protected ActionResult CustomResponse(ModelStateDictionary modelState)
        {
            if (!modelState.IsValid) NotificadorErroModelInvalida(modelState);
            return CustomResponse();
        }

        protected void NotificadorErroModelInvalida(ModelStateDictionary modelState)
        {
            var erros = modelState.Values.SelectMany(e => e.Errors);
            foreach (var erro in erros)
            {
                var errorMsg = erro.Exception == null ? erro.ErrorMessage : erro.Exception.Message;
                AdicionarErroProcessamento(errorMsg);
            }
        }

        protected void AdicionarErroProcessamento(string mensagem) => _notifier.Manipualador(new NotificacaoMensagem(mensagem));
    }
}