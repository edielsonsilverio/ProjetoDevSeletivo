using AutoMapper;
using Business.Models;

namespace Tests.Mapping
{
    public class MappingTest : Profile
    {
        public MappingTest()
        {
            CreateMap<Produto, ProdutoViewModel>().ReverseMap();
            CreateMap<ProdutoCosif, ProdutoCosifViewModel>().ReverseMap();
            CreateMap<MovimentacaoManual, MovimentacaoManualViewModel>().ReverseMap();
        }
    }
}