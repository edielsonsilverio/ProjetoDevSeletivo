using Business.Models;
using System;
using Tests.Mapping;
using Xunit;

namespace Test
{
    public class ProdutoServiceTest : ParametroTesteConfig
    {


        [Fact(DisplayName = "Adicionar uma Produto")]
        [Trait("Unitário", "Serviço Produto")]
        public void Produto_Adicionar_NovoProduto()
        {
            //Arrange
            var context = ObterInstanciaContextoInMemory("BaseProdutoAdicionar");

            var model = new Produto(1, "TESTE");

            //Act
            context.Add(model);
            var result = context.SaveChanges() > 0 ? true : false;

            //Assert
            Assert.True(result);
        }

      
    }
}