using FluentValidation;

namespace Business.Models.Validations
{
	public class ProdutoCosifValidation : AbstractValidator<ProdutoCosif>
    {
        public ProdutoCosifValidation()
        {
            RuleFor(x => x.CodProduto)
                .GreaterThan(0).WithMessage("O campo {PropertyName} precicsa ser maior ou igual que zero")
                .WithName("Código do Produto");


            RuleFor(x => x.CodCosif)
                .GreaterThan(0).WithMessage("O campo {PropertyName} precicsa ser maior ou igual que zero")
                .WithName("Código do Cosif");
        }   
    }
}
