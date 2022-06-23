USE Grupo_Estudo_Web
GO
 
CREATE PROCEDURE MigrarProduto_Unidade
AS

DECLARE 
 @Id					INT
,@Sigla					VARCHAR(10)
,@Descricao				VARCHAR(250)
,@Pode_Fracionar			VARCHAR(1)

DELETE FROM Produto_Unidade
DBCC CHECKIDENT('Produto_Unidade', RESEED,0)

BEGIN
	DECLARe Importa CURSOR FOR 

	SELECT 
		*
	FROM 
		Erp..Produto_Unidade 
	WHERE 
 		Id > 0
	ORDER BY
		 Id
 				
	OPEN Importa
	FETCH NEXT FROM Importa INTO @Id,@Sigla,@Descricao,@Pode_Fracionar
	
	WHILE @@FETCH_STATUS = 0
		BEGIN

		  IF NOT EXISTS  (SELECT Id FROM Produto_Unidade WHERE Id=@Id ) 
		       INSERT INTO Produto_Unidade (Sigla,Descricao,Pode_Fracionar) VALUES (@Sigla,@Descricao,@Pode_Fracionar)
		  
		
	FETCH NEXT FROM Importa INTO	@Id,@Sigla,@Descricao,@Pode_Fracionar

	END
   CLOSE Importa
   DEALLOCATE Importa
END

/*
		EXEC MigrarProduto_Unidade

		SELECT * FROM Erp..Produto_Unidade WHERE Id IN (0,1,2,3,4,5)

		SELECT * FROM Produto_Unidade WHERE Id IN (0,1,2,3,4,5)
*/