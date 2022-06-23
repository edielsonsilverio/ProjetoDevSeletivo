namespace DataAccess.Mappings
{
    public class MovimentacaoManualMapping : EntityMapping<MovimentacaoManual>
    {
        private readonly static string _nameTable = "MOVIMENTO_MANUAL";
        public MovimentacaoManualMapping() : base(_nameTable) { }
        public override void Configure(EntityTypeBuilder<MovimentacaoManual> builder)
        {
            base.Configure(builder);

            builder.HasKey(x => new { x.DataMes, x.DataAno, x.NumeroLancamento, x.CodProduto, x.CodCosif });
            builder.Property(x => x.DataMes).HasColumnName("DAT_MES").HasColumnType("int");
            builder.Property(x => x.DataAno).HasColumnName("DAT_ANO").HasColumnType("int");
            builder.Property(x => x.NumeroLancamento).HasColumnName("NUM_LANCAMENTO").HasColumnType("int");
            builder.Property(x => x.CodProduto).HasColumnName("COD_PRODUTO").HasColumnType("int");
            builder.Property(x => x.CodCosif).HasColumnName("COD_COSIF").HasColumnType("int");

            builder.Property(x => x.Descricao).HasColumnName("DES_DESCRICAO").HasColumnType("varchar(300)");
            builder.Property(x => x.DataMovimento).HasColumnName("DAT_MOVIMENTO").HasColumnType("smalldatetime");

            builder.Property(x => x.CodUsuario).HasColumnName("COD_USUARIO").HasColumnType("varchar(15)");
            builder.Property(x => x.Valor).HasColumnName("VAL_VALOR").HasColumnType("numeric(18,2)");

            builder
                .HasOne(x => x.ProdutoConsif)
                .WithMany(p => p.Movimentacoes)
                .HasForeignKey(x => new { x.CodProduto, x.CodCosif });
        }
    }
}
