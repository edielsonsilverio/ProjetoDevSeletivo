using Business.Models.Validations;

namespace Business.Models
{
    public class Produto : Entity
    {
        public int CodProduto { get; private set; }
        public string Descricao { get; private set; }
        public bool Status { get; private set; }

        public IEnumerable<ProdutoCosif> ProdutoConsifs { get; set; }


        //EF
        public Produto() { }

        public Produto(int codProduto, string descricao)
        {
            CodProduto = codProduto;
            Descricao = descricao;
        }

        public void StatusAtivo() => Status = true;

        public void StatusInAtivo() => Status = false;

        public override bool EhValido()
        {
            return new ProdutoValidation().Validate(this).IsValid;
        }

    }

 
}
