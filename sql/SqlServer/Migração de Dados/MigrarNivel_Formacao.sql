USE Grupo_Estudo_Web
GO
 
CREATE PROCEDURE MigrarNivel_Formacao
AS

DECLARE 
 @Id					INT
,@Nome					VARCHAR(100)
,@Descricao				VARCHAR(250)
 
DELETE FROM Nivel_Formacao
DBCC CHECKIDENT('Nivel_Formacao', RESEED,0)

BEGIN
	DECLARe Importa CURSOR FOR 

	SELECT 
		*
	FROM 
		Erp..Nivel_Formacao 
	WHERE 
 		Id > 0
	ORDER BY
		 Id
 				
	OPEN Importa
	FETCH NEXT FROM Importa INTO @Id,@Nome,@Descricao
	
	WHILE @@FETCH_STATUS = 0
		BEGIN

		  IF NOT EXISTS  (SELECT Id FROM Nivel_Formacao WHERE Id=@Id ) 
		       INSERT INTO Nivel_Formacao (Nome,Descricao) VALUES (@Nome,@Descricao)
		  
		
	FETCH NEXT FROM Importa INTO	@Id,@Nome,@Descricao

	END
   CLOSE Importa
   DEALLOCATE Importa
END

/*
		EXEC MigrarNivel_Formacao

		SELECT * FROM Erp..Nivel_Formacao WHERE Id IN (0,1,2,3,4,5)

		SELECT * FROM Nivel_Formacao WHERE Id IN (0,1,2,3,4,5)
*/