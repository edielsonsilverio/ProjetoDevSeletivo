USE Grupo_Estudo_Web
GO
 
ALTER PROCEDURE MigrarCbo
AS

DECLARE 
 @Id					INT
,@Codigo				VARCHAR(10)
,@Codigo_1994			VARCHAR(10)
,@Nome					VARCHAR(50)
,@Observacao			VARCHAR(max)

 
DELETE FROM Cbo
DBCC CHECKIDENT('Cbo', RESEED, 0)


BEGIN
	DECLARe Importa CURSOR FOR 

	SELECT 
		*
	FROM 
		Erp..Cbo 
	WHERE 
 		Id > 0
	ORDER BY
		 Id
 				
	OPEN Importa
	FETCH NEXT FROM Importa INTO @Id,@Codigo,@Codigo_1994,@Nome,@Observacao
	
	WHILE @@FETCH_STATUS = 0
		BEGIN

		  IF NOT EXISTS  (SELECT Id FROM Cbo WHERE Id=@Id ) 
		       INSERT INTO Cbo (Codigo,Codigo_1994,Nome,Observacao) VALUES (@Codigo,@Codigo_1994,@Nome,@Observacao)
		
	FETCH NEXT FROM Importa INTO	@Id,@Codigo,@Codigo_1994,@Nome,@Observacao

	END
   CLOSE Importa
   DEALLOCATE Importa
END

/*
		EXEC MigrarCbo

		SELECT * FROM Erp..Cbo WHERE Id IN (1,2,3,4,5)

		SELECT * FROM Cbo WHERE Id IN (0,1,2,3,4,5)
*/