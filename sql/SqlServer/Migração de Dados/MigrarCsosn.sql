USE Grupo_Estudo_Web
GO
 
ALTER PROCEDURE MigrarCsosn
AS

DECLARE 
 @Id					INT
,@Codigo				VARCHAR(3)
,@Descricao				VARCHAR(MAX)
,@Observacao			VARCHAR(MAX)
 
DELETE FROM Csosn
DBCC CHECKIDENT('Csosn', RESEED, 0)  

BEGIN
	DECLARe Importa CURSOR FOR 

	SELECT 
		*
	FROM 
		Erp..Csosn 
	WHERE 
 		Id > 0
	ORDER BY
		 Id
 				
	OPEN Importa
	FETCH NEXT FROM Importa INTO @Id,@Codigo,@Descricao,@Observacao
	
	WHILE @@FETCH_STATUS = 0
		BEGIN

		  IF NOT EXISTS  (SELECT Id FROM Csosn WHERE Id=@Id ) 
		       INSERT INTO Csosn (Codigo,Descricao,Observacao) VALUES (@Codigo,@Descricao,@Observacao)
		
	FETCH NEXT FROM Importa INTO	@Id,@Codigo,@Descricao,@Observacao

	END
   CLOSE Importa
   DEALLOCATE Importa
END

/*
		EXEC MigrarCsosn

		SELECT * FROM Erp..Csosn WHERE Id IN (1,2,3,4,5)

		SELECT * FROM Csosn WHERE Id IN (0,1,2,3,4,5)
*/