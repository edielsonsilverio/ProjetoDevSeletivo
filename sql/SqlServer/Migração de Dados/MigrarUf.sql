USE Grupo_Estudo_Web
GO
 
ALTER PROCEDURE MigrarUf
AS

DECLARE @Id				INT
DECLARE @Sigla			VARCHAR(2)
DECLARE @Nome			VARCHAR(50)
DECLARE @Ibge			VARCHAR(2)

DELETE FROM Uf
DBCC CHECKIDENT('Uf', RESEED, 0) 

BEGIN
	DECLARe Importa CURSOR FOR 

	SELECT 
		*
	FROM 
		Erp..uf 
	WHERE 
 		Id > 0
	ORDER BY
		 Id
 				
	OPEN Importa
	FETCH NEXT FROM Importa INTO @Id,@Sigla,@Nome,@Ibge
	
	WHILE @@FETCH_STATUS = 0
		BEGIN

		  IF NOT EXISTS  (SELECT Id FROM Uf WHERE Id=@Id ) 
		       INSERT INTO Uf (Sigla,Nome,Codigo_Ibge) VALUES (@Sigla,@Nome,@Ibge)
		
	FETCH NEXT FROM Importa INTO	@Id,@Sigla,@Nome,@Ibge

	END
   CLOSE Importa
   DEALLOCATE Importa
END

/*
		EXEC MigrarUf

		SELECT * FROM Erp..Uf WHERE Id IN (1,2,3,4,5)

		SELECT * FROM Uf WHERE Id IN (1,2,3,4,5)
*/