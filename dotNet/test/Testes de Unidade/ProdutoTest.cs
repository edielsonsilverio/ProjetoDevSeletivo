using Business.Models;
using Xunit;

namespace Test
{
    public class ProdutoTest
    {
        [Fact(DisplayName = "Os Campos devem ser Obrigatórios")]
        [Trait("Unitário", "Model Produto")]
        public void Produto_Validacao_CamposDevemSerObrigatorio()
        {
            // Arrange
            var model = new Produto(1,"TESTE");

            // Act & Assert
            var result = model.EhValido();

            // Assert 
            Assert.True(result);
        }

        [Fact(DisplayName = "Nome não deve ser igual")]
        [Trait("Unitário", "Model Produto")]
        public void Produto_Nome_NaoDeveIgual()
        {
            // Arrange
            var model = new Produto(1, "TESTE");

            // Act
            var nome = "Teste";

            // Assert
            Assert.NotEqual(nome, model.Descricao);
        }

    }
}