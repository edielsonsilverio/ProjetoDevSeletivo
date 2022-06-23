using Business.Models;
using System;
using Tests.Mapping;
using Xunit;

namespace Test
{
    public class MovimentacaoManualServiceTest : ParametroTesteConfig
    {


        [Fact(DisplayName = "Adicionar uma Movimentação Manual")]
        [Trait("Unitário", "Serviço Movimentação Manual")]
        public void MovimentacaoManual_Adicionar_Novo()
        {
            //Arrange
            var context = ObterInstanciaContextoInMemory("BaseMovimentacaoAdicionar");

            var model = new MovimentacaoManual(DateTime.Now.Day, DateTime.Now.Year, "TESTE", 150.00M, 1, 1);

            //Act
             
            context.Add(model);
            var result = context.SaveChanges() > 0 ? true : false;

            //Assert
            Assert.True(result);
        }

    }
}