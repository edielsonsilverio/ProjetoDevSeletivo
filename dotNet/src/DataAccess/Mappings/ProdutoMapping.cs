namespace DataAccess.Mappings
{
    public class ProdutoMapping : EntityMapping<Produto>
    {
        private readonly static string _nameTable = "PRODUTO";
        public ProdutoMapping() : base(_nameTable) { }
        public override void Configure(EntityTypeBuilder<Produto> builder)
        {
            base.Configure(builder);

            builder.HasKey(x => x.CodProduto);
            builder.Property(x => x.CodProduto).HasColumnName("COD_PRODUTO").HasColumnType("int");
            builder.Property(x => x.Descricao).HasColumnName("DES_PRODUTO").HasColumnType("varchar(50)");
            builder.Property(x => x.Status).HasColumnName("STA_STATUS").HasColumnType("bit");

        }
    }
}
