USE Grupo_Estudo_Web
GO
 
ALTER PROCEDURE MigrarCst_Icms
AS

DECLARE 
 @Id					INT
,@Codigo				VARCHAR(2)
,@Descricao				VARCHAR(MAX)
,@Observacao			VARCHAR(MAX)
 
DELETE FROM Cst_Icms
DBCC CHECKIDENT('Cst_Icms', RESEED, 0) 

BEGIN
	DECLARe Importa CURSOR FOR 

	SELECT 
		*
	FROM 
		Erp..Cst_Icms 
	WHERE 
 		Id > 0
	ORDER BY
		 Id
 				
	OPEN Importa
	FETCH NEXT FROM Importa INTO @Id,@Codigo,@Descricao,@Observacao
	
	WHILE @@FETCH_STATUS = 0
		BEGIN

		  IF NOT EXISTS  (SELECT Id FROM Cst_Icms WHERE Id=@Id ) 
		       INSERT INTO Cst_Icms (Codigo,Descricao,Observacao) VALUES (@Codigo,@Descricao,@Observacao)
		
	FETCH NEXT FROM Importa INTO	@Id,@Codigo,@Descricao,@Observacao

	END
   CLOSE Importa
   DEALLOCATE Importa
END

/*
		EXEC MigrarCst_Icms

		SELECT * FROM Erp..Cst_Icms WHERE Id IN (1,2,3,4,5)

		SELECT * FROM Cst_Icms WHERE Id IN (1,2,3,4,5)
*/