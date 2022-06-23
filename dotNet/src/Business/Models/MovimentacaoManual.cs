using Business.Models.Validations;

namespace Business.Models
{
    public class MovimentacaoManual : Entity
    {
        public int DataMes { get; private set; }
        public int DataAno { get; private set; }
        public int NumeroLancamento { get; private set; }
       
        public string Descricao { get; private set; }
        public DateTime DataMovimento { get; private set; }
        public string CodUsuario { get; private set; }
        public decimal Valor { get; private set; }

        public int CodProduto { get; private set; }

        public int CodCosif { get; private set; }
        public ProdutoCosif ProdutoConsif { get; private set; }

        //EF
        public MovimentacaoManual(){}

        public MovimentacaoManual(
            int dataMes, 
            int dataAno, 
            string descricao, 
            decimal valor,
            int codProduto,
            int codCosif)
        {
            DataMes = dataMes;
            DataAno = dataAno;
            Descricao = descricao;
            Valor = valor;
            CodProduto = codProduto;
            CodCosif = codCosif;

            CodUsuario = "TESTE";
            DataMovimento = DateTime.Now;
        }

        public void DefinirNovoNumeroLancamento(int numero)
        {
            NumeroLancamento = numero;
        }
        public override bool EhValido()
        {
            return new MovimentacaoManualValidation().Validate(this).IsValid;
        }
    }
}
