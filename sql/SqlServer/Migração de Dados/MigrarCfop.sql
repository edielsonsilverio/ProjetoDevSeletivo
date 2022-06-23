USE Grupo_Estudo_Web
GO
 
ALTER PROCEDURE MigrarCfop
AS

DECLARE 
 @Id					INT
,@Codigo				INT
,@Descricao				VARCHAR(MAX)
,@Aplicacao				VARCHAR(MAX)

DELETE FROM Cfop
DBCC CHECKIDENT('Cfop', RESEED, 0) 

BEGIN
	DECLARe Importa CURSOR FOR 

	SELECT 
		*
	FROM 
		Erp..Cfop 
	WHERE 
 		Id > 0
	ORDER BY
		 Id
 				
	OPEN Importa
	FETCH NEXT FROM Importa INTO @Id,@Codigo,@Descricao,@Aplicacao
	
	WHILE @@FETCH_STATUS = 0
		BEGIN

		  IF NOT EXISTS  (SELECT Id FROM Cfop WHERE Id=@Id ) 
		       INSERT INTO Cfop (Codigo,Descricao,Aplicacao) VALUES (@Codigo,@Descricao,@Aplicacao)
		
	FETCH NEXT FROM Importa INTO	@Id,@Codigo,@Descricao,@Aplicacao

	END
   CLOSE Importa
   DEALLOCATE Importa
END

/*
		EXEC MigrarCfop

		SELECT * FROM Erp..Cfop WHERE Id IN (1,2,3,4,5)

		SELECT * FROM Cfop WHERE Id IN (0,1,2,3,4,5)
*/