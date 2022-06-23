using FluentValidation;

namespace Business.Models.Validations
{
	public class MovimentacaoManualValidation : AbstractValidator<MovimentacaoManual>
    {
        public MovimentacaoManualValidation()
        {
            RuleFor(x => x.CodProduto)
                .GreaterThan(0).WithMessage("O campo {PropertyName} precicsa ser maior ou igual que zero")
                .WithName("Código do Produto");


            RuleFor(x => x.CodCosif)
                .GreaterThan(0).WithMessage("O campo {PropertyName} precicsa ser maior ou igual que zero")
                .WithName("Código do Cosif");

            RuleFor(x => x.Descricao)
                .NotEmpty().WithMessage("O campo {PropertyName} precicsa ser fornecido")
                .Length(2, 50).WithMessage("O campo {PropertyName} precisa ter entre {MinLength} e {MaxLength} caracteres")
                .WithName("Descrição");


            RuleFor(x => x.Valor)
               .GreaterThan(-1).WithMessage("O campo {PropertyName} precicsa ser maior ou igual que zero")
               .WithName("Valor da Movimentação");

            RuleFor(x => x.DataAno)
               .GreaterThan(1900).WithMessage("O campo {PropertyName} precicsa ser maior")
               .WithName("Ano");

            RuleFor(x => x.DataMes)
               .GreaterThan(0).WithMessage("O campo {PropertyName} precicsa ser maior que zero")
               .LessThan(13).WithMessage("O campo {PropertyName} precicsa ser menor que 13")
               .When(x => x.DataMes > 0 && x.DataMes < 13).WithMessage("O campo {PropertyName} precicsa ser 1 a 12")
               .WithName("Mês");
        }   
    }
}
