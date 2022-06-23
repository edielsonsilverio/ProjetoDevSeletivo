USE Grupo_Estudo_Web
GO
 
ALTER PROCEDURE MigrarBanco
AS

DECLARE 
 @Id				INT
,@Codigo			VARCHAR(3)
,@Nome				VARCHAR(50)
,@Url				VARCHAR(max)

DELETE FROM Banco
DBCC CHECKIDENT('Banco', RESEED, 0)

BEGIN
	DECLARe Importa CURSOR FOR 

	SELECT 
		*
	FROM 
		Erp..Banco 
	WHERE 
 		Id > 0
	ORDER BY
		 Id
 				
	OPEN Importa
	FETCH NEXT FROM Importa INTO @Id,@Codigo,@Nome,@Url
	
	WHILE @@FETCH_STATUS = 0
		BEGIN

		  IF NOT EXISTS  (SELECT Id FROM Banco WHERE Id=@Id ) 
		       INSERT INTO Banco (Codigo,Nome,Url) VALUES (@Codigo,@Nome,@Url)
		
	FETCH NEXT FROM Importa INTO	@Id,@Codigo,@Nome,@Url

	END
   CLOSE Importa
   DEALLOCATE Importa
END

/*
		EXEC MigrarBanco

		SELECT * FROM Erp..Banco WHERE Id IN (1,2,3,4,5)

		SELECT * FROM Banco WHERE Id IN (0,1,2,3,4,5)
*/