-- PROJETO DE CARPINTARIA
-- Realizado para a disciplina de Base de Dados
-- Mariana Pinto, nmec 84792
-- Gonçalo Arieiro, nmec 80130
--P3G4

--USE Carpintaria
--GO

---Procedures----
--getCarpintaria
CREATE PROCEDURE Projeto.getCarpintaria
AS
SELECT *
FROM Projeto.Table_Carpintaria
GO
--exec Projeto.getCarpintaria

--getLogIn
CREATE PROCEDURE Projeto.getLogIn
AS
SELECT *
FROM Projeto.Table_LogIn
GO
--exec Projeto.getLogIn

--getFornecedores
CREATE PROCEDURE Projeto.getFornecedor
AS
SELECT *
FROM Projeto.Table_Fornecedores
GO

-- getClientes
CREATE PROCEDURE Projeto.getCliente
AS
SELECT *
FROM Projeto.Table_Cliente
GO


--getFuncionário
CREATE PROCEDURE Projeto.getFuncionario
AS
SELECT *
FROM Projeto.Table_Funcionario
GO

-- getMateriaPrima
CREATE PROCEDURE Projeto.getMateriaPrima
AS
SELECT *
FROM Projeto.Table_MateriaPrima
GO

-- getArtigo
CREATE PROCEDURE Projeto.getArtigo
AS
SELECT *
FROM Projeto.Table_Artigo
GO

-- getEncomendaCliente
CREATE PROCEDURE Projeto.getEncomendaCliente
AS
SELECT *
FROM Projeto.Table_EncomendaCliente
GO

-- getEncomendaFornecedor
CREATE PROCEDURE Projeto.getEncomendaFornecedor
AS
SELECT *
FROM Projeto.Table_EncomendaFornecedor
GO

-- getConstroiEncomenda
CREATE PROCEDURE Projeto.getConstroiEncomenda
AS
SELECT *
FROM Projeto.Table_ConstroiEncomenda
GO

--getMateriaFornececida
CREATE PROCEDURE Projeto.getMateriaFornececida
AS
SELECT *
FROM Projeto.Table_MateriaFornecida
GO

--getEncFeitaFornecedor
CREATE PROCEDURE Projeto.getEncFeitaFornecedor
AS
SELECT *
FROM Projeto.Table_EncFeitaFornecedor
GO

--getMateriaPrecisa
CREATE PROCEDURE Projeto.getMateriaPrecisa
AS
SELECT *
FROM Projeto.Table_MateriaPrecisa
GO

--getContemEncomendaCliente
CREATE PROCEDURE Projeto.getContemEncomenda
AS
SELECT *
FROM Projeto.Table_ContemEncomendaCliente
GO


 ---- Insert ----
--InsertFornecedor

--EXEC Projeto.InsertFornecedor
--	@nome = 'Pedro Santos',
--	@nif = '123455711',
--	@tel = '967744324',
--	@mail = 'costa@ua.pt',
--	@morada = 'Rua do Teste',
--	@metodo_pag = 'Dinheiro';

--Done 100%
CREATE PROCEDURE Projeto.InsertFornecedor
	(
	@nome VARCHAR(50),
	@nif CHAR(9),
	@tel CHAR(9),
	@mail VARCHAR(70),
	@morada VARCHAR(100),
	@metodo_pag VARCHAR(100)
	)
AS
BEGIN
	IF ISNUMERIC(@tel) !=1 OR @nome = null OR @nif = null or @morada = null OR (LEN(@nome)) > 50 OR (LEN(@nif)) > 9 OR (LEN(@tel)) > 9 OR (LEN(@morada)) > 100 OR (LEN(@metodo_pag)) > 100
		BEGIN
		PRINT 'Error in Insert Fornecedor!'
		END
		INSERT INTO Projeto.Table_Fornecedores
	VALUES
		(
		@nome,
		@nif,
		@tel,
		@mail,
		@morada,
		@metodo_pag
		)
END
GO

--InsertCliente

--EXEC Projeto.InsertCliente
--	@nome = 'Pedro Afonso',
--	@nif = '123456780',
--	@tel = '967744324',
--	@mail = 'costa@ua.pt',
--	@morada = 'Rua do Teste';

--Done 100%
CREATE PROCEDURE Projeto.InsertCliente
	(
	@nome VARCHAR(50),
	@nif CHAR(9),
	@tel CHAR(9),
	@mail VARCHAR(70),
	@morada VARCHAR(100)
	)
AS
BEGIN
	IF ISNUMERIC(@tel) !=1 OR @nome = null OR @nif = null OR @morada = null OR (LEN(@nome)) > 50 OR (LEN(@nif)) > 9 OR (LEN(@tel)) > 9 OR (LEN(@morada)) > 100
		BEGIN
		PRINT 'Error in Insert Cliente!'
		END
		INSERT INTO Projeto.Table_Cliente
	VALUES
		(
		@nome,
		@nif,
		@tel,
		@mail,
		@morada
		)
END
GO

--insertFuncionario

--EXEC Projeto.InsertFuncionario
--	@nome = 'Luis Pedro',
--	@nif = '999999999',
--	@tel = '967799324',
--	@mail = 'lp@ua.pt',
--	@morada = 'Rua dos Testes',
--	@salario = 100;

--Done 100%
CREATE PROCEDURE Projeto.InsertFuncionario
	(
	@nome VARCHAR(50),
	@nif CHAR(9),
	@tel CHAR(9),
	@mail VARCHAR(70),
	@morada VARCHAR(100),
	@salario INT
	)
AS
BEGIN
	IF ISNUMERIC(@tel) !=1 OR @nome = null OR @nif = null OR @morada = null OR @salario = null OR  (LEN(@nome)) > 50 OR (LEN(@nif)) > 9 OR (LEN(@tel)) > 9 OR (LEN(@morada)) > 100
		BEGIN
		PRINT 'Error in Insert Funcionário!'
		END
		INSERT INTO Projeto.Table_Funcionario
	VALUES
		(
		@nome,
		@nif,
		@tel,
		@mail,
		@morada,
		@salario
		)
END
GO

--insertMateriaPrima

--exec Projeto.InsertMateriaPrima
--	@tipo = 'Taxa', 
--	@quantidade = 1000, 
--	@preço = 15,
--	@tamanho = null,
--	@tempo_seca = null,
--	@marca = 'Cabeça Grande',
--	@cor =  null;

--Done 100%
CREATE PROCEDURE Projeto.InsertMateriaPrima
	(
	@tipo VARCHAR(50), 
	@quantidade INT, 
	@preco INT,
	@tamanho VARCHAR(50),
	@tempo_seca INT,
	@marca VARCHAR(50),
	@cor VARCHAR(50)
	)
AS
BEGIN
	IF  @tipo = null OR @quantidade = null OR @preco = null OR @marca = null OR (LEN(@tipo)) > 50 OR (LEN(@tamanho)) > 50 OR (LEN(@marca)) > 50 OR (LEN(@cor)) > 50
		BEGIN
		PRINT 'Error in Insert Materia Prima!'
		END
		INSERT INTO Projeto.Table_MateriaPrima
	VALUES
		(
		@tipo,
		@quantidade,
		@preco,
		@tamanho,
		@tempo_seca,
		@marca,
		@cor
		)
END
GO

--insertArtigo

--exec Projeto.InsertArtigo
--	@nome = 'Cadeira',  
--	@preço = 100,
--	@quantidade =  1,
--	@descricao = 'Mesa de sala(200x200), castanho escura';

--Done 100%
CREATE PROCEDURE Projeto.InsertArtigo
	(
	@nome VARCHAR(50),
	@preco INT, 
	@quantidade INT, 
	@descricao VARCHAR(500)
	)
AS
BEGIN
	IF  @nome = null OR @preco = null OR @quantidade = null OR @descricao = null OR (LEN(@nome)) > 50 OR (LEN(@descricao)) > 500
		BEGIN
		PRINT 'Error in Insert Artigo!'
		END
		INSERT INTO Projeto.Table_Artigo
	VALUES
		(
		@nome,
		@preco,
		@quantidade,
		@descricao
		)
END
GO

--InsertEncomendaCliente

--exec Projeto.InsertEncomendaCliente 
--	@nif = '123456777', 
--	@data_in = '2020-06-15',
--	@data_out = '2020-06-16',
--	@descricao = 'Moveis amarelos e mesa da cozinha',
--	@estado_prod = 'Testes',
--	@estado_paga = 'pago',
--	@preco = 5;

--Done 100%
CREATE PROCEDURE Projeto.InsertEncomendaCliente
	(
	@nif CHAR(9),  
	@data_in DATE,
	@data_out DATE,
	@descricao VARCHAR(500),
	@estado_prod VARCHAR(100),
	@estado_paga VARCHAR(100),
	@preco INT
	)
AS
	BEGIN TRAN
	DECLARE @id INT;
	DECLARE @client_id INT;

	SELECT @id = id FROM Projeto.Table_Cliente WHERE nif = @nif;
	SELECT @client_id = @id;

	DECLARE @nome VARCHAR(50);
	DECLARE @client_nome VARCHAR(50);

	SELECT @nome = nome FROM Projeto.Table_Cliente WHERE nif = @nif;
	SELECT @client_nome = @nome;

	IF @nif = null
		BEGIN
		PRINT 'Cliente Desconhecido'
		ROLLBACK TRAN
		END
	
	IF @data_in < CAST(CAST(GETDATE() AS DATE) AS DATETIME)
		BEGIN
		PRINT 'Data Inválida'
		ROLLBACK TRAN
		END

	IF @data_out < CAST(CAST(GETDATE() AS DATE) AS DATETIME)
		BEGIN
		PRINT 'Data Inválida'
		ROLLBACK TRAN
		END
	
	IF @descricao = null OR LEN(@descricao) > 500
		BEGIN
		PRINT 'Descrição Incorreta'
		ROLLBACK TRAN
		END

	IF @estado_prod = null OR LEN(@estado_prod) > 100
		BEGIN
		PRINT 'Estado de Produção Incorreto'
		ROLLBACK TRAN
		END

	IF @estado_paga = null OR LEN(@estado_paga) > 100
		BEGIN
		PRINT 'Estado de Pagamento Incorreto'
		ROLLBACK TRAN
		END
	
	IF @preco = null
		BEGIN
		PRINT 'Estado de Pagamento Incorreto'
		ROLLBACK TRAN
		END

		INSERT INTO Projeto.Table_EncomendaCliente
	VALUES(
			@client_id,
			@client_nome,
			@data_in,
			@data_out,
			@descricao,
			@estado_prod,
			@estado_paga,
			@preco
			)

	COMMIT TRAN
GO

--InsertConstroiEncomenda
--EXEC Projeto.InsertConstroiEncomenda
--	@id_enc_cliente = 3,
--	@func_id = 5;

--Done 100%
CREATE PROCEDURE Projeto.InsertConstroiEncomenda 
	(
	@id_enc_cliente INT, 
	@func_id INT
	)
AS
	DECLARE @id INT;
	DECLARE @fid INT;
	DECLARE @id_cliente INT;
	DECLARE @id_funcionario INT;

	SELECT @id = id FROM Projeto.Table_EncomendaCliente WHERE id = @id_enc_cliente;
    SELECT @id_cliente = @id;

	SELECT @fid = id FROM Projeto.Table_Funcionario WHERE id = @func_id;
	SELECT @id_funcionario = @fid;

	INSERT INTO Projeto.Table_ConstroiEncomenda
	VALUES(
			@id_cliente,
			@id_funcionario
			)
GO

--InsertEncomendaFornecedor

--exec Projeto.InsertEncomendaFornecedor
--	@nif = '123556789', 
--	@data_in = '2020-06-15',
--	@data_out = '2020-06-16',
--	@preco = 5,
--	@descrição = 'Moveis castanhos e mesa da cozinha',
--	@estado_entrega = 'Teste',
--	@estado_pag = 'pago';

--Done 100%
CREATE PROCEDURE Projeto.InsertEncomendaFornecedor
	(
	@nif CHAR(9),
	@data_in DATE,
	@data_out DATE,
	@preco INT,
	@descrição VARCHAR(500),
	@estado_entrega VARCHAR(100),
	@estado_pag VARCHAR(100)
	)
AS
	BEGIN TRAN
	DECLARE @id INT;
	DECLARE @funcionario_id INT;

	SELECT @id = id FROM Projeto.Table_Funcionario WHERE nif = @nif;
	SELECT @funcionario_id = @id;

	DECLARE @nome VARCHAR(50);
	DECLARE @funcionario_nome VARCHAR(50);

	SELECT @nome = nome FROM Projeto.Table_Funcionario WHERE nif = @nif;
	SELECT @funcionario_nome = @nome;
	
	IF @data_in < CAST(CAST(GETDATE() AS DATE) AS DATETIME)
		BEGIN
		PRINT 'Data Inválida'
		ROLLBACK TRAN
		END

	IF @data_out < CAST(CAST(GETDATE() AS DATE) AS DATETIME)
		BEGIN
		PRINT 'Data Inválida'
		ROLLBACK TRAN
		END
	
	IF @preco = null
		BEGIN
		PRINT 'Estado de Pagamento Incorreto'
		ROLLBACK TRAN
		END
	
	IF @descrição = null OR LEN(@descrição) > 500
		BEGIN
		PRINT 'Descrição Incorreta'
		ROLLBACK TRAN
		END

	IF @estado_entrega = null OR LEN(@estado_entrega) > 100
		BEGIN
		PRINT 'Estado de Produção Incorreto'
		ROLLBACK TRAN
		END

	IF @estado_pag = null OR LEN(@estado_pag) > 100
		BEGIN
		PRINT 'Estado de Pagamento Incorreto'
		ROLLBACK TRAN
		END

		INSERT INTO Projeto.Table_EncomendaFornecedor
	VALUES(
			@funcionario_nome,
			@funcionario_id,
			@data_in,
			@data_out,
			@preco,
			@descrição,
			@estado_entrega,
			@estado_pag
			)
	COMMIT TRAN
GO

--InsertMateriaFornececida

--EXEC Projeto.InsertMateriaFornececida
--	@materia_id = 5,
--	@fornecedor_id = 1;
	
--Done 100%
CREATE PROCEDURE Projeto.InsertMateriaFornececida
	(
	@materia_id INT, 
	@fornecedor_id INT
	)
AS
	DECLARE @id INT;
	DECLARE @fid INT;
	DECLARE @id_materia INT;
	DECLARE @id_funcionario INT;

	SELECT @id = id FROM Projeto.Table_MateriaPrima WHERE id = @materia_id;
    SELECT @id_materia = @id;

	SELECT @fid = id FROM Projeto.Table_Fornecedores WHERE id = @fornecedor_id;
	SELECT @id_funcionario = @fid;

	INSERT INTO Projeto.Table_MateriaFornecida
	VALUES(
			@id_materia,
			@id_funcionario
			)
GO

--insertEncFeitaFornecedor

--EXEC Projeto.InsertEncFeitaFornecedor
--	@encomenda_id = 5,
--	@fornecedor_id = 1;
	
--Done 100%
CREATE PROCEDURE Projeto.InsertEncFeitaFornecedor
	(
	@encomenda_id INT, 
	@fornecedor_id INT
	)
AS
	DECLARE @id INT;
	DECLARE @fid INT;
	DECLARE @id_encomenda INT;
	DECLARE @id_fornecedor INT;

	SELECT @id = id FROM Projeto.Table_EncomendaFornecedor WHERE id = @encomenda_id;
    SELECT @id_encomenda = @id;

	SELECT @fid = id FROM Projeto.Table_Fornecedores WHERE id = @fornecedor_id;
	SELECT @id_fornecedor = @fid;

	INSERT INTO Projeto.Table_EncFeitaFornecedor
	VALUES(
			@id_encomenda,
			@id_fornecedor
			)
GO

--InsertMateriaPrecisa

--EXEC Projeto.InsertMateriaPrecisa
--	@artigo_id = 3,
--	@materia_id = 3;

--Done 100%
CREATE PROCEDURE Projeto.InsertMateriaPrecisa
	(
	@artigo_id INT, 
	@materia_id INT
	)
AS
	DECLARE @id INT;
	DECLARE @fid INT;
	DECLARE @id_artigo INT;
	DECLARE @id_materia INT;

	SELECT @id = id FROM Projeto.Table_Artigo WHERE id = @artigo_id;
    SELECT @id_artigo = @id;

	SELECT @fid = id FROM Projeto.Table_MateriaPrima WHERE id = @materia_id;
	SELECT @id_materia = @fid;

	INSERT INTO Projeto.Table_MateriaPrecisa
	VALUES(
			@id_artigo,
			@id_materia
			)
GO

--InsertContemEncomendaCliente

--EXEC Projeto.InsertContemEncomendaCliente
--	@artigo_id = 3,
--	@encomenda_id = 3;
	
--Done 100%
CREATE PROCEDURE Projeto.InsertContemEncomendaCliente
	(
	@artigo_id INT, 
	@encomenda_id INT
	)
AS
	DECLARE @id INT;
	DECLARE @fid INT;
	DECLARE @id_artigo INT;
	DECLARE @id_encomenda INT;

	SELECT @id = id FROM Projeto.Table_Artigo WHERE id = @artigo_id;
    SELECT @id_artigo = @id;

	SELECT @fid = id FROM Projeto.Table_EncomendaCliente WHERE id = @encomenda_id;
	SELECT @id_encomenda = @fid;

	INSERT INTO Projeto.Table_ContemEncomendaCliente
	VALUES(
			@id_artigo,
			@id_encomenda
			)
GO

----Updates----

--updateFuncionario
--100% Done
CREATE PROCEDURE Projeto.UpdateFuncionario
	(
	@ids INT, 
	@nome VARCHAR(50),
	@nif CHAR(9),
	@tel CHAR(9),
	@mail VARCHAR(70),
	@morada VARCHAR(100),
	@salario INT
	)

AS
BEGIN
    BEGIN TRAN
        UPDATE Projeto.Table_Funcionario
        SET nome = @nome, nif = @nif, tel = @tel, mail = @mail, morada = @morada, salario = @salario
        WHERE id = @ids
    COMMIT TRAN
END		
GO

--updateFornecedor
--100% Done
CREATE PROCEDURE Projeto.UpdateFornecedor
	(
	@ids INT, 
	@nome VARCHAR(50),
	@nif CHAR(9),
	@tel CHAR(9),
	@mail VARCHAR(70),
	@morada VARCHAR(100),
	@metodo_pag VARCHAR(100)
	)

AS
BEGIN
    BEGIN TRAN
        UPDATE Projeto.Table_Fornecedores
        SET nome = @nome, nif = @nif, tel = @tel, mail = @mail, morada = @morada, metodo_pag = @metodo_pag
        WHERE id = @ids
    COMMIT TRAN
END		
GO

--updateCliente
--100% Done
CREATE PROCEDURE Projeto.UpdateCliente
	(
	@ids INT, 
	@nome VARCHAR(50),
	@nif CHAR(9),
	@tel CHAR(9),
	@mail VARCHAR(70),
	@morada VARCHAR(100)
	)

AS
BEGIN
    BEGIN TRAN
        UPDATE Projeto.Table_Cliente
        SET nome = @nome, nif = @nif, tel = @tel, mail = @mail, morada = @morada
        WHERE id = @ids
    COMMIT TRAN
END		
GO

--updateEncomendaCliente
--EXEC Projeto.UpdateEncomendaCliente @ids = 5, @nif = '999999999', @data_in = '2020-06-15',
--	@data_out = '2020-06-16', @descricao = 'Moveis teste', @estado_prod = 'Teste', @estado_paga = 'pago', @preco = 6
--GO
--100% Done
CREATE PROCEDURE Projeto.UpdateEncomendaCliente
	(
	@ids INT, 
	@nif CHAR(9),
	@data_in DATE,
	@data_out DATE,
	@descricao VARCHAR(500),
	@estado_prod VARCHAR(100),
	@estado_paga VARCHAR(100),
	@preco INT
	)

AS
BEGIN
    BEGIN TRAN
	IF @data_in < CAST(CAST(GETDATE() AS DATE) AS DATETIME)
			BEGIN
			PRINT 'Data Inválida'
			ROLLBACK TRAN
			END
	IF @data_out < CAST(CAST(GETDATE() AS DATE) AS DATETIME)
			BEGIN
			PRINT 'Data Inválida'
			ROLLBACK TRAN
			END

	DECLARE @id INT;
	DECLARE @cliente_id INT;
	DECLARE @nome VARCHAR(50);
	DECLARE @cliente_nome VARCHAR(50);

	SELECT @id = id, @nome = nome FROM Projeto.Table_Cliente WHERE nif = @nif;
	SELECT @cliente_id = @id;
	SELECT @cliente_nome = @nome;


	--SELECT @nome = nome FROM Projeto.Table_Cliente WHERE nif = @nif;
	--SELECT @client_nome = @nome;

        UPDATE Projeto.Table_EncomendaCliente
        SET cliente_id = @cliente_id, cliente_nome = @cliente_nome, data_in = @data_in, data_out = @data_out, descricao = @descricao, estado_prod = @estado_prod, 
			estado_paga = @estado_paga, preco = @preco
        WHERE id = @ids
    COMMIT TRAN
END		
GO

--updateEncomendaFornecedor
--EXEC Projeto.UpdateEncomendaFornecedor @ids = 5, @nif = '123556789', @data_in = '2020-06-15',
--	@data_out = '2020-06-18', @descrição = 'Moveis castanhos e mesa da cozinha', @estado_entrega = 'Teste', @estado_pag = 'pago', @preco = 8
--	GO
--100% Done
CREATE PROCEDURE Projeto.UpdateEncomendaFornecedor
	(
	@ids INT, 
	@nif CHAR(9),
	@data_in DATE,
	@data_out DATE,
	@descrição VARCHAR(500),
	@estado_entrega VARCHAR(100),
	@estado_pag VARCHAR(100),
	@preco INT
	)

AS
BEGIN
    BEGIN TRAN
	IF @data_in < CAST(CAST(GETDATE() AS DATE) AS DATETIME)
			BEGIN
			PRINT 'Data Inválida'
			ROLLBACK TRAN
			END
	IF @data_out < CAST(CAST(GETDATE() AS DATE) AS DATETIME)
			BEGIN
			PRINT 'Data Inválida'
			ROLLBACK TRAN
			END

	DECLARE @id INT;
	DECLARE @funcionario_id INT;
	DECLARE @nome VARCHAR(50);
	DECLARE @funcionario_nome VARCHAR(50);

	SELECT @id = id,@nome = nome FROM Projeto.Table_Funcionario WHERE nif = @nif;
	SELECT @funcionario_id = @id;
	SELECT @funcionario_nome = @nome;

        UPDATE Projeto.Table_EncomendaFornecedor
        SET funcionario_id = @funcionario_id, funcionario_nome = @funcionario_nome, data_in = @data_in, data_out = @data_out, descrição = @descrição, estado_entrega = @estado_entrega, 
			estado_pag = @estado_pag, preco = @preco
        WHERE id = @ids
    COMMIT TRAN
END		
GO

----Removes----

--RemoveFornecedor
CREATE PROCEDURE Projeto.RemoveFornecedor(@id int)
AS
BEGIN TRAN
   DELETE FROM Projeto.Table_Fornecedores WHERE id = @id 
COMMIT TRAN
GO
--EXEC Projeto.RemoveFornecedor @id = 1;

--RemoveCliente
CREATE PROCEDURE Projeto.RemoveCliente(@id int)
AS
BEGIN TRAN
   DELETE FROM Projeto.Table_Cliente WHERE id = @id 
COMMIT TRAN
GO
--EXEC Projeto.RemoveCliente @id = 1;

--RemoveFuncionario
CREATE PROCEDURE Projeto.RemoveFuncionario(@id int)
AS
BEGIN TRAN
   DELETE FROM Projeto.Table_Funcionario WHERE id = @id 
COMMIT TRAN
GO

--EXEC Projeto.RemoveFuncionario @id = 1;

--RemoveMateriaPrima
CREATE PROCEDURE Projeto.RemoveMateriaPrima(@id int)
AS
BEGIN TRAN
   DELETE FROM Projeto.Table_MateriaPrima WHERE id = @id 
COMMIT TRAN
GO
--EXEC Projeto.RemoveMateriaPrima @id = 1;

--Artigo
CREATE PROCEDURE Projeto.RemoveArtigo(@id int)
AS
BEGIN TRAN
   DELETE FROM Projeto.Table_Artigo WHERE id = @id 
COMMIT TRAN
GO
--EXEC Projeto.RemoveArtigo @id = 1;

--EncomendaCliente
CREATE PROCEDURE Projeto.RemoveEncomendaCliente(@id int)
AS
BEGIN TRAN
   DELETE FROM Projeto.Table_EncomendaCliente WHERE id = @id 
COMMIT TRAN
GO

--EXEC Projeto.RemoveEncomendaCliente @id = 3;

--EncomendaFornecedor
CREATE PROCEDURE Projeto.RemoveEncomendaFornecedor(@id int)
AS
BEGIN TRAN
   DELETE FROM Projeto.Table_EncomendaFornecedor WHERE id = @id 
COMMIT TRAN
GO
--EXEC Projeto.RemoveEncomendaFornecedor @id = 4;

/*
DROP PROCEDURE Projeto.getArtigo;
DROP PROCEDURE Projeto.getCarpintaria;
DROP PROCEDURE Projeto.getCliente;
DROP PROCEDURE Projeto.getConstroiEncomenda;
DROP PROCEDURE Projeto.getContemEncomenda;
DROP PROCEDURE Projeto.getEncFeitaFornecedor;
DROP PROCEDURE Projeto.getEncomendaCliente;
DROP PROCEDURE Projeto.getEncomendaFornecedor;
DROP PROCEDURE Projeto.getFornecedor;
DROP PROCEDURE Projeto.getFuncionario;
DROP PROCEDURE Projeto.getLogIn;
DROP PROCEDURE Projeto.getMateriaFornececida;
DROP PROCEDURE Projeto.getMateriaPrecisa;
DROP PROCEDURE Projeto.getMateriaPrima;
DROP PROCEDURE Projeto.InsertArtigo;
DROP PROCEDURE Projeto.InsertCliente;
DROP PROCEDURE Projeto.InsertConstroiEncomenda;
DROP PROCEDURE Projeto.InsertContemEncomendaCliente;
DROP PROCEDURE Projeto.InsertEncFeitaFornecedor;
DROP PROCEDURE Projeto.InsertEncomendaCliente;
DROP PROCEDURE Projeto.InsertEncomendaFornecedor;
DROP PROCEDURE Projeto.InsertFornecedor;
DROP PROCEDURE Projeto.InsertFuncionario;
DROP PROCEDURE Projeto.InsertMateriaFornececida;
DROP PROCEDURE Projeto.InsertMateriaPrecisa;
DROP PROCEDURE Projeto.InsertMateriaPrima;
DROP PROCEDURE Projeto.RemoveArtigo;
DROP PROCEDURE Projeto.RemoveCliente;
DROP PROCEDURE Projeto.RemoveEncomendaCliente;
DROP PROCEDURE Projeto.RemoveFuncionario;
DROP PROCEDURE Projeto.RemoveEncomendaFornecedor;
DROP PROCEDURE Projeto.RemoveFornecedor;
DROP PROCEDURE Projeto.RemoveMateriaPrima;
DROP PROCEDURE Projeto.UpdateCliente;
DROP PROCEDURE Projeto.UpdateEncomendaCliente;
DROP PROCEDURE Projeto.UpdateEncomendaFornecedor;
DROP PROCEDURE Projeto.UpdateFornecedor;
DROP PROCEDURE Projeto.UpdateFuncionario;

*/





