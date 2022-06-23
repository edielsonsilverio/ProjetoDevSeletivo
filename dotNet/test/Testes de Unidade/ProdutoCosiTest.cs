using Business.Models;
using Xunit;

namespace Test
{
    public class ProdutoCosifTest
    {
        [Fact(DisplayName = "Nome não ser nulo ou vário")]
        [Trait("Unitário", "Model ProdutoCosif")]
        public void ProdutoCosif_CodigoProduto_NaoDeveSerNuloOuVazio()
        {
            // Arrange
            var model = new ProdutoCosif(1, 1, "12345678901");

            // Assert
            Assert.False(model.CodProduto == 0);
        }


        [Fact(DisplayName = "Validar as informações")]
        [Trait("Unitário", "Model ProdutoCosif")]
        public void ProdutoCosif_Campo_DevemEstarValidado()
        {
            // Arrange
            var model = new ProdutoCosif(1, 1, "12345678901");

            // Act
            var resultado = model.EhValido();

            // Assert
            Assert.True(resultado);
        }

        [Fact(DisplayName = "Validar as informações")]
        [Trait("Unitário", "Model Categoria")]
        public void ProdutoCosif_Campo_NaoDevemEstarValidado()
        {
            // Arrange
            var model = new ProdutoCosif(0, 0, "12345678901");

            // Act
            var resultado = model.EhValido();

            // Assert
            Assert.False(resultado);
        }
    }
}