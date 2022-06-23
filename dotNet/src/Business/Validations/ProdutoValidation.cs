using FluentValidation;

namespace Business.Models.Validations
{
	public class ProdutoValidation : AbstractValidator<Produto>
    {
        public ProdutoValidation()
        {
            RuleFor(x => x.CodProduto)
                .GreaterThan(0).WithMessage("O campo {PropertyName} precicsa ser maior ou igual que zero")
                .WithName("Código do Produto");

        }   
    }
}
