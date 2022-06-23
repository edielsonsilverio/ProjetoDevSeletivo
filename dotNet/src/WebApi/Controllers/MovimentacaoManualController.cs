using AutoMapper;
using Business.Intefaces.Repository;
using Business.Models;
using Core.DomainObjects;
using Microsoft.AspNetCore.Mvc;
using WebAPI.Core.Controllers;
using WebAPI.Core.Usuario;

namespace Api.Controllers
{
    //[Authorize]
    //[ApiVersion("1.0")]
    [Route("api/movimentacao-manual")]
    public class MovimentacaoManualController : MainController
    {
        private readonly IMapper _mapper;
        private readonly string _propriedadeRelacionamento;
        private readonly IMovimentacaoManualRepository _repo;
        private readonly IMovimentacaoManualService _repoServices;
 
        public MovimentacaoManualController(INotificacao notificador,
                                   IAspNetUser appUser,
                                   IMapper mapper,
                                   IMovimentacaoManualRepository repo,
                                   IMovimentacaoManualService repoServices) : base(notificador, appUser)
        {
            _mapper = mapper;
            _repo = repo;
            _repoServices = repoServices;
            _propriedadeRelacionamento = "ProdutoConsif";
        }

        //[ClaimsAuthorize("MovimentacaoManual", "R")]
        [HttpGet]
        public async Task<IActionResult> ObterTodos()
        {
            var lista = _mapper.Map<IEnumerable<MovimentacaoManualViewModel>>(await _repo.ObterTodos()).ToList();
            return Ok(lista);
        }

        ////[ClaimsAuthorize("MovimentacaoManual", "Adicionar")]
        [HttpPost]
        public async Task<ActionResult<MovimentacaoManualViewModel>> Adicionar([FromBody]MovimentacaoManualViewModel objViewModel)
        {
            if (!ModelState.IsValid) return CustomResponse(ModelState);

            var result = await _repoServices.Adicionar(_mapper.Map<MovimentacaoManual>(objViewModel));
            if (!result)
                return CustomResponse(ModelState);

            return CustomResponse(objViewModel);
        }

    }
}