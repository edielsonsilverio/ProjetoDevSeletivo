using System.ComponentModel.DataAnnotations;

namespace Business.Models
{
    public class ProdutoViewModel
    {
        [Required(ErrorMessage = "O campo {0} é obrigatório")]
        public int CodProduto { get; set; }
        public string Descricao { get; set; }
        public bool Status { get; set; }

        public IEnumerable<ProdutoCosifViewModel> ProdutoConsifs { get; set; }


    }
}
