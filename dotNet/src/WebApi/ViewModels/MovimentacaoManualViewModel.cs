using System.ComponentModel.DataAnnotations;

namespace Business.Models
{
    public class MovimentacaoManualViewModel  
    {
        [Required(ErrorMessage = "O campo {0} é obrigatório")]
        public int DataMes { get; set; }

        [Required(ErrorMessage = "O campo {0} é obrigatório")]
        public int DataAno { get; set; }


        [Required(ErrorMessage = "O campo {0} é obrigatório")]
        public string Descricao { get; set; }

        public int NumeroLancamento { get; set; }

        public string CodUsuario { get; set; }
        public decimal Valor { get; set; }

        public int CodProduto { get;  set; }
        public string Produto { get; set; }

        public int CodCosif { get;  set; }
        public ProdutoCosifViewModel ProdutoConsif { get;  set; }

    }
}
