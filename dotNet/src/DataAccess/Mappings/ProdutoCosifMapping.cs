namespace DataAccess.Mappings
{
    public class ProdutoCosifMapping : EntityMapping<ProdutoCosif>
    {
        private readonly static string _nameTable = "PRODUTO_COSIF";
        public ProdutoCosifMapping() : base(_nameTable) { }
        public override void Configure(EntityTypeBuilder<ProdutoCosif> builder)
        {
            base.Configure(builder);

            builder.HasKey(x => new { x.CodProduto, x.CodCosif });
            builder.Property(x => x.CodProduto).HasColumnName("COD_PRODUTO").HasColumnType("int");
            builder.Property(x => x.CodCosif).HasColumnName("COD_COSIF").HasColumnType("int");
            builder.Property(x => x.CodClassificacao).HasColumnName("COD_CLASSIFICACAO").HasColumnType("varchar(15)");
            builder.Property(x => x.Status).HasColumnName("STA_STATUS").HasColumnType("bit");

            builder
                .HasOne(x => x.Produto)
                .WithMany(p => p.ProdutoConsifs)
                .HasForeignKey(x => x.CodProduto);
        }
    }
}
