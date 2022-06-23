USE Grupo_Estudo_Web
GO
 
ALTER PROCEDURE MigrarCnae
AS

DECLARE 
 @Id					INT
,@Codigo				VARCHAR(7)
,@Descricao				VARCHAR(MAX)
 
DELETE FROM Cnae
DBCC CHECKIDENT('Cnae', RESEED, 0) 

BEGIN
	DECLARe Importa CURSOR FOR 

	SELECT 
		*
	FROM 
		Erp..Cnae 
	WHERE 
 		Id > 0
	ORDER BY
		 Id
 				
	OPEN Importa
	FETCH NEXT FROM Importa INTO @Id,@Codigo,@Descricao 
	
	WHILE @@FETCH_STATUS = 0
		BEGIN

		  IF NOT EXISTS  (SELECT Id FROM Cnae WHERE Id=@Id ) 
		       INSERT INTO Cnae (Codigo,Denominacao) VALUES (@Codigo,@Descricao)
		
	FETCH NEXT FROM Importa INTO	@Id,@Codigo,@Descricao 

	END
   CLOSE Importa
   DEALLOCATE Importa
END

/*
		EXEC MigrarCnae

		SELECT * FROM Erp..Cnae WHERE Id IN (1,2,3,4,5)

		SELECT * FROM Cnae WHERE Id IN (0,1,2,3,4,5)
*/