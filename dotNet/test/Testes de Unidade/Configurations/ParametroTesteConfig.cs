using AutoMapper;
using Business.Models;
using DataAccess.Context;
using GenFu;
using Microsoft.EntityFrameworkCore;
using Moq;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading;
using Test.Extensions;

namespace Tests.Mapping
{
    public abstract class ParametroTesteConfig
    {
        public static ApiDbContext ObterInstanciaContextoMock()
        {
            return CriarContext().Object;
        }

        public static ApiDbContext ObterInstanciaContextoInMemory(string databaseName)
        {
            var options = new DbContextOptionsBuilder<ApiDbContext>()
                .UseInMemoryDatabase(databaseName: databaseName)
                .Options;

            var context = new ApiDbContext(options);
            return context;
        }

        private static Mock<ApiDbContext> CriarContext()
        {
            //Cria um objeto Context do entityFramework e configura o DbSet e Retorna os objetos
            //Chama a função para obter todos
            var data = ObterProduto().AsQueryable();
            var dbSet = new Mock<DbSet<Produto>>();
            dbSet.As<IQueryable<Produto>>().Setup(x => x.Provider).Returns(data.Provider);
            dbSet.As<IQueryable<Produto>>().Setup(x => x.Expression).Returns(data.Expression);
            dbSet.As<IQueryable<Produto>>().Setup(x => x.ElementType).Returns(data.ElementType);
            dbSet.As<IQueryable<Produto>>().Setup(x => x.GetEnumerator()).Returns(data.GetEnumerator);

            //Configuração para simular o retorno de uma lista.
            dbSet.As<IAsyncEnumerable<Produto>>()
                .Setup(x => x.GetAsyncEnumerator(new CancellationToken()))
                .Returns(new AsyncEnumerator<Produto>(data.GetEnumerator()));

            //Configurção simular a consulta com um filtro.
            dbSet.As<IQueryable<Produto>>().Setup(x => x.Provider)
                .Returns(new AsyncQueryProvider<Produto>(data.Provider));


            var context = new Mock<ApiDbContext>();
            context.Setup(x => x.Produtos).Returns(dbSet.Object);
            return context;
        }

        protected static IEnumerable<Produto> ObterProduto()
        {
            //Cria Dados Fakes para fazer os testes.
            GenFu.GenFu.Configure<Produto>()
                .Fill(x => x.Descricao).AsArticleTitle()
                .Fill(x => x.CodProduto, () => { return (new Random().Next(1, 100)); });


            var model = GenFu.GenFu.ListOf<Produto>(30);

            return model;
        }

        public static IMapper ObterMapperConfig()
        {
            return new MapperConfiguration(cfg => { cfg.AddProfile(new MappingTest()); })
                .CreateMapper();
        }
    }
}