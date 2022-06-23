using System.ComponentModel.DataAnnotations;

namespace Business.Models
{
    public class ProdutoCosifViewModel
    {

        [Required(ErrorMessage = "O campo {0} é obrigatório")]
        public int CodProduto { get; private set; }
        public string Produto { get; private set; }

        [Required(ErrorMessage = "O campo {0} é obrigatório")]
        public int CodCosif { get; private set; }

        public string CodClassificacao { get; private set; }
        public string CodCosifClassificacao { get; private set; }
        public bool Status { get; private set; }

        //public IEnumerable<MovimentacaoManualViewModel> Movimentacoes { get; set; }

    }
}
