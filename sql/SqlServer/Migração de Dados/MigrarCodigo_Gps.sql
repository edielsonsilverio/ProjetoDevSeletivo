USE Grupo_Estudo_Web
GO
 
ALTER PROCEDURE MigrarCodigo_Gps
AS

DECLARE 
 @Id					INT
,@Codigo				INT
,@Descricao				VARCHAR(MAX)
 
DELETE FROM Codigo_Gps
DBCC CHECKIDENT('Codigo_Gps', RESEED, 0) 

BEGIN
	DECLARe Importa CURSOR FOR 

	SELECT 
		*
	FROM 
		Erp..Codigo_Gps 
	WHERE 
 		Id > 0
	ORDER BY
		 Id
 				
	OPEN Importa
	FETCH NEXT FROM Importa INTO @Id,@Codigo,@Descricao 
	
	WHILE @@FETCH_STATUS = 0
		BEGIN

		  IF NOT EXISTS  (SELECT Id FROM Codigo_Gps WHERE Id=@Id ) 
		       INSERT INTO Codigo_Gps (Codigo,Descricao) VALUES (@Codigo,@Descricao)
		
	FETCH NEXT FROM Importa INTO	@Id,@Codigo,@Descricao 

	END
   CLOSE Importa
   DEALLOCATE Importa
END

/*
		EXEC MigrarCodigo_Gps

		SELECT * FROM Erp..Codigo_Gps WHERE Id IN (1,2,3,4,5)

		SELECT * FROM Codigo_Gps WHERE Id IN (0,1,2,3,4,5)
*/