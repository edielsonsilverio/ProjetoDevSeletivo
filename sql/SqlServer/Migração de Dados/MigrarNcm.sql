USE Grupo_Estudo_Web
GO
 
ALTER PROCEDURE MigrarNcm
AS

DECLARE 
 @Id					INT
,@Codigo				VARCHAR(8)
,@Descricao				VARCHAR(MAX)
,@Observacao			VARCHAR(MAX)
 
DELETE FROM Ncm
DBCC CHECKIDENT('Ncm', RESEED,0)

BEGIN
	DECLARe Importa CURSOR FOR 

	SELECT 
		*
	FROM 
		Erp..Ncm 
	WHERE 
 		Id > 0
	ORDER BY
		 Id
 				
	OPEN Importa
	FETCH NEXT FROM Importa INTO @Id,@Codigo,@Descricao,@Observacao
	
	WHILE @@FETCH_STATUS = 0
		BEGIN

		  IF NOT EXISTS  (SELECT Id FROM Ncm WHERE Id=@Id ) 
		       INSERT INTO Ncm (Codigo,Descricao,Observacao) VALUES (@Codigo,@Descricao,@Observacao)
		  
		
	FETCH NEXT FROM Importa INTO	@Id,@Codigo,@Descricao,@Observacao

	END
   CLOSE Importa
   DEALLOCATE Importa
END

/*
		EXEC MigrarNcm

		SELECT * FROM Erp..Ncm WHERE Id IN (0,1,2,3,4,5)

		SELECT * FROM Ncm WHERE Id IN (0,1,2,3,4,5)
*/