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
    [Route("api/produto")]
    public class ProdutoController : MainController
    {
        private readonly IMapper _mapper;
        private readonly IProdutoRepository _repo;
        private readonly IProdutoService _repoServices;

        public ProdutoController(INotificacao notificador,
                                   IAspNetUser appUser,
                                   IMapper mapper,
                                   IProdutoRepository repo,
                                   IProdutoService repoServices) : base(notificador, appUser)
        {
            _mapper = mapper;
            _repo = repo;
            _repoServices = repoServices;
        }

        //[ClaimsAuthorize("Produto", "R")]
        [HttpGet]
        public async Task<IActionResult> ObterTodos()
        {
            return Ok(_mapper.Map<IEnumerable<ProdutoViewModel>>(await _repo.ObterTodosAsync()).ToList());
        }

        //[ClaimsAuthorize("Produto", "R")]
        [HttpGet("consultar-id/{codProduto}")]
        public async Task<IActionResult> ObterPorId(int codProduto)
        {
            return Ok(_mapper.Map<ProdutoViewModel>(await ObterProduto(codProduto)));
        }

        //[ClaimsAuthorize("Produto", "Adicionar")]
        [HttpPost]
        public async Task<ActionResult<ProdutoViewModel>> Adicionar(ProdutoViewModel objViewModel)
        {
            if (!ModelState.IsValid) return CustomResponse(ModelState);

            var result = await _repoServices.Adicionar(_mapper.Map<Produto>(objViewModel));
            if (!result)
                return CustomResponse(ModelState);

            return CustomResponse(objViewModel);
        }

        //[ClaimsAuthorize("Produto", "Atualizar")]
        [HttpPut("{codProduto}")]
        public async Task<ActionResult<ProdutoViewModel>> Atualizar(int codProduto, ProdutoViewModel objViewModel)
        {
            if (codProduto != objViewModel.CodProduto)
            {
                AdicionarErroProcessamento("O id informado não é o mesmo que foi passado na query");
                return CustomResponse(objViewModel);
            }

            if (!ModelState.IsValid) return CustomResponse(ModelState);

            await _repoServices.Atualizar(_mapper.Map<Produto>(objViewModel));

            return CustomResponse(objViewModel);
        }

        //[ClaimsAuthorize("Produto", "Excluir")]
        [HttpDelete("{codProduto}")]
        public async Task<ActionResult<ProdutoViewModel>> Excluir(int codProduto)
        {
            var objViewModel = await ObterProduto(codProduto);

            if (objViewModel == null) return NotFound();

            await _repoServices.Remover(_mapper.Map<Produto>(objViewModel));

            return CustomResponse(objViewModel);
        }

        private async Task<ProdutoViewModel> ObterProduto(int codProduto)
        {
            return _mapper.Map<ProdutoViewModel>(
                await _repo.ObterPorFiltroAsync(x => x.CodProduto == codProduto));
        }
    }
}