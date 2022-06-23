USE Grupo_Estudo_Web
GO
 
ALTER PROCEDURE MigrarProduto
AS

DECLARE 
 @Id					INT
,@CodigoBarra			VARCHAR(10)
,@Descricao				VARCHAR(50)
,@DescricaoResumida		VARCHAR(50)
,@ValorCompra			NUMERIC(18,6)
,@ValorVenda			NUMERIC(18,6)
,@EstoqueAtual			NUMERIC(18,6)
,@EstoqueMinimo			NUMERIC(18,6)
,@Foto					VARBINARY(MAX)


DELETE FROM Produto
DBCC CHECKIDENT('Produto', RESEED,0)

BEGIN
	DECLARe Importa CURSOR FOR 

	SELECT 
		 ProdutoID
		,CodigoBarra
		,Descricao
		,DescricaoResumida
		,ValorCompra
		,ValorVenda
		,EstoqueAtual
		,EstoqueMinimo
		,Foto
	FROM 
		Siscom..Produto 
	WHERE 
 		ProdutoID > 0
	ORDER BY
		 ProdutoID
 				
	OPEN Importa
	FETCH NEXT FROM Importa INTO @Id,@CodigoBarra,@Descricao,@DescricaoResumida,@ValorCompra,@ValorVenda,@EstoqueAtual,@EstoqueMinimo,@Foto
	
	WHILE @@FETCH_STATUS = 0
		BEGIN

		  IF NOT EXISTS  (SELECT Id FROM Produto WHERE Id=@Id ) 
		       INSERT INTO 
						Produto(
									 Codigo_Interno
									,Nome
									,Descricao
									,Valor_Compra
									,Valor_Venda
									,Quantidade_Estoque
									,Estoque_Minimo
									,Foto,Produto_Sub_Grupo_Id
									,Produto_Marca_Id
									,Produto_Unidade_Id
									,Tributo_Icms_Custom_Cab_Id
									,Tributo_Grupo_Tributario_Id
						) 
			   VALUES	(
							@CodigoBarra
							,@Descricao
							,@DescricaoResumida
							,@ValorCompra
							,@ValorVenda
							,@EstoqueAtual
							,@EstoqueMinimo
							,@Foto
							,1
							,1
							,1
							,1
							,1)
		  
		
	FETCH NEXT FROM Importa INTO @Id,@CodigoBarra,@Descricao,@DescricaoResumida,@ValorCompra,@ValorVenda,@EstoqueAtual,@EstoqueMinimo,@Foto

	END
   CLOSE Importa
   DEALLOCATE Importa
END

/*
		EXEC MigrarProduto

		SELECT * FROM Siscom..Produto WHERE ProdutoId IN (0,1,2,3,4,5)

		SELECT * FROM Produto WHERE Id IN (0,1,2,3,4,5)



*/

--UPDATE Siscom..Produto SET EstoqueAtual = 999