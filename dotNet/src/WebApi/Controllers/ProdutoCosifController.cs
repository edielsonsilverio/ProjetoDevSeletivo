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
    [Route("api/produtocosif")]
    public class ProdutoCosifController : MainController
    {
        private readonly IMapper _mapper;
        private readonly string _propriedadeRelacionamento;
        private readonly IProdutoCosifRepository _repo;
        private readonly IProdutoCosifService _repoServices;

        public ProdutoCosifController(INotificacao notificador,
                                   IAspNetUser appUser,
                                   IMapper mapper,
                                   IProdutoCosifRepository repo,
                                   IProdutoCosifService repoServices) : base(notificador, appUser)
        {
            _mapper = mapper;
            _repo = repo;
            _repoServices = repoServices;
            _propriedadeRelacionamento = "Produto";
        }

        //[ClaimsAuthorize("ProdutoConsif", "R")]
        [HttpGet]
        public async Task<IActionResult> ObterTodos()
        {
            var lista = _mapper.Map<IEnumerable<ProdutoCosifViewModel>>(await _repo.ObterTodosAsync(includeProperties: _propriedadeRelacionamento)).ToList();
            return Ok(lista);
        }

        //[ClaimsAuthorize("ProdutoConsif", "R")]
        [HttpGet("consultar-id/{id}")]
        public async Task<IActionResult> ObterPorId(ProdutoCosifViewModel objViewModel)
        {
            var objeto = _mapper.Map<ProdutoCosifViewModel>(
                    await ObterProdutoConsif(objViewModel));
            return Ok(objeto);
        }

        [HttpGet("consultar-produtoid/{id}")]
        public async Task<IActionResult> ObterPorProdutoId(int id)
        {
            var lista = _mapper.Map<IEnumerable<ProdutoCosifViewModel>>(await _repo.ObterTodosAsync(x=> x.CodProduto == id,includeProperties: _propriedadeRelacionamento)).ToList();
            return Ok(lista);
        }

        //[ClaimsAuthorize("ProdutoConsif", "Adicionar")]
        [HttpPost]
        public async Task<ActionResult<ProdutoCosifViewModel>> Adicionar(ProdutoCosifViewModel objViewModel)
        {
            if (!ModelState.IsValid) return CustomResponse(ModelState);

            var result = await _repoServices.Adicionar(_mapper.Map<ProdutoCosif>(objViewModel));
            if (!result)
                return CustomResponse(ModelState);

            return CustomResponse(objViewModel);
        }

        //[ClaimsAuthorize("ProdutoConsif", "Atualizar")]
        [HttpPut]
        public async Task<ActionResult<ProdutoCosifViewModel>> Atualizar(ProdutoCosifViewModel objViewModel)
        {

            if (!ModelState.IsValid) return CustomResponse(ModelState);

            await _repoServices.Atualizar(_mapper.Map<ProdutoCosif>(objViewModel));

            return CustomResponse(objViewModel);
        }

        //[ClaimsAuthorize("ProdutoConsif", "Excluir")]
        [HttpDelete]
        public async Task<ActionResult<ProdutoCosifViewModel>> Excluir(ProdutoCosifViewModel objViewModel)
        {
            var viewModel = await ObterProdutoConsif(objViewModel);

            if (viewModel == null) return NotFound();

            await _repoServices.Remover(_mapper.Map<ProdutoCosif>(viewModel));

            return CustomResponse(viewModel);
        }

        private async Task<ProdutoCosifViewModel> ObterProdutoConsif(ProdutoCosifViewModel objViewModel)
        {
            return _mapper.Map<ProdutoCosifViewModel>(
                await _repo.ObterPorFiltroAsync(x => x.CodProduto == objViewModel.CodProduto && x.CodCosif == objViewModel.CodCosif,
                                                    includeProperties: _propriedadeRelacionamento));
        }
    }
}