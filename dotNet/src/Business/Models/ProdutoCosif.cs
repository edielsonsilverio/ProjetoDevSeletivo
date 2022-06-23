using Business.Models.Validations;

namespace Business.Models
{
    public class ProdutoCosif : Entity
    {
        public int CodProduto { get; private set; }
        public int CodCosif { get; private set; }
        public string CodClassificacao { get; private set; }
        public bool Status { get; private set; }

        public IEnumerable<MovimentacaoManual> Movimentacoes { get; set; }

        //EF
        public Produto Produto { get; set; }


        public ProdutoCosif()
        {

        }

        public ProdutoCosif(int codProduto, int codCosif, string codClassificacao)
        {
            CodProduto = codProduto;
            CodCosif = codCosif;
            CodClassificacao = codClassificacao;
            Produto = new Produto();
        }

        public void StatusAtivo() => Status = true;

        public void StatusInAtivo() => Status = false;

        public override bool EhValido()
        {
            return new ProdutoCosifValidation().Validate(this).IsValid;
        }
    }
}
