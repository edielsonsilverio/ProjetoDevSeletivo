using Business.Models;
using System;
using Xunit;

namespace Test
{
    public class MovimentacaoManualTest
    {
        [Fact(DisplayName = "Os Campos devem ser Obrigatórios")]
        [Trait("Unitário", "Model Movimentação Manual")]
        public void MovimentacaoManual_Validacao_CamposSaoValidos()
        {
            // Arrange
            var model = new MovimentacaoManual(DateTime.Now.Day, DateTime.Now.Year, "TESTE", 150.00M, 1, 1);

            // Act & Assert
            var result = model.EhValido();

            // Assert 
            Assert.True(result);
        }

        [Fact(DisplayName = "Os Campos devem ser Obrigatórios")]
        [Trait("Unitário", "Model Movimentação Manual")]
        public void MovimentacaoManual_Validacao_CamposNaoSaoValidos()
        {
            // Arrange
            var model = new MovimentacaoManual(DateTime.Now.Day, DateTime.Now.Year,string.Empty, 150.00M, 1,1);

            // Act & Assert
            var result = model.EhValido();

            // Assert 
            Assert.False(result);
        }

        [Fact(DisplayName = "Nome não deve ser igual")]
        [Trait("Unitário", "Model Movimentação Manual")]
        public void MovimentacaoManual_Nome_NaoDeveIgual()
        {
            // Arrange
            var model = new MovimentacaoManual(DateTime.Now.Day, DateTime.Now.Year, "TESTE", 150.00M, 1, 1);

            // Act
            var descricao = "Teste";

            // Assert
            Assert.NotEqual(descricao, model.Descricao);
        }

    }
}