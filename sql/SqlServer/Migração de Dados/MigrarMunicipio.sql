USE Grupo_Estudo_Web
GO
 
ALTER PROCEDURE MigrarMunicipio
AS

DECLARE @Id							INT
DECLARE @UfId						INT
DECLARE @Nome						VARCHAR(250)
DECLARE @Ibge						VARCHAR(20)
DECLARE @CodReceitaFederal			VARCHAR(20)
DECLARE @CodReceitaEstadual			VARCHAR(20)
 
DELETE FROM Municipio
DBCC CHECKIDENT('Municipio', RESEED, 0) 

BEGIN
	DECLARe Importa CURSOR FOR 

	SELECT 
		*
	FROM 
		Erp..Municipio 
	WHERE 
 		Id > 0
	ORDER BY
		 Id
 				
	OPEN Importa
	FETCH NEXT FROM Importa INTO   @Id,@UfId,@Nome,@Ibge,@CodReceitaFederal,@CodReceitaEstadual	

	WHILE @@FETCH_STATUS = 0	   
		BEGIN

		  IF NOT EXISTS  (SELECT Id FROM Municipio WHERE Id=@Id ) 
		       INSERT INTO Municipio (Uf_Id,Nome,Codigo_Ibge,Codigo_Estadual,Codigo_Receita_Federal	) VALUES (@UfId,@Nome,@Ibge,ISNULL(@CodReceitaFederal,''),ISNULL(@CodReceitaEstadual,''))
		
	FETCH NEXT FROM Importa INTO	@Id,@UfId,@Nome,@Ibge,@CodReceitaFederal,@CodReceitaEstadual	

	END
   CLOSE Importa
   DEALLOCATE Importa
END

/*
		EXEC MigrarMunicipio

		SELECT * FROM Erp..Municipio WHERE Id IN (1,2,3,4,5)

		SELECT * FROM Municipio WHERE Id IN (1,2,3,4,5)
*/