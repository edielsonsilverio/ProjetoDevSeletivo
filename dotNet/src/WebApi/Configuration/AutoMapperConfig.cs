
using AutoMapper;
using Business.Models;
using WebApi.ViewModels;

namespace WebApi.Configuration
{
    public class AutoMapperConfig : Profile
    {
        public AutoMapperConfig()
        {
            CreateMap<ProdutoViewModel, Produto>().ReverseMap();
            CreateMap<ProdutoCosif, ProdutoCosifViewModel>()
                 .ForMember(dest => dest.Produto, opt => opt.MapFrom(src => src.Produto.Descricao))
                 .ForMember(dest => dest.CodCosifClassificacao, opt => opt.MapFrom(src => $"{src.CodProduto} - ({src.CodClassificacao})"));

            CreateMap<ProdutoCosifViewModel, ProdutoCosif>();

            CreateMap<MovimentacaoManual, MovimentacaoManualViewModel>()
                .ForMember(dest => dest.Produto, opt => opt.MapFrom(src => src.ProdutoConsif.Produto.Descricao));


            CreateMap<MovimentacaoManualViewModel, MovimentacaoManual>()
                .ForMember(dest => dest.ProdutoConsif, opt => opt.Ignore());
        }
    }
}