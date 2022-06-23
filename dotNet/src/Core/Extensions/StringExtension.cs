namespace Core.Extensions
{
    public static class StringExtension
    {
        public static string ColunaDb(this string coluna) => coluna;

        public static string TabelaDb(this string tabela) => tabela.ToLower();
    }
}