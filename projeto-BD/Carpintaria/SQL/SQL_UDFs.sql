-- PROJETO DE CARPINTARIA
-- Realizado para a disciplina de Base de Dados
-- Mariana Pinto, nmec 84792
-- Gonçalo Arieiro, nmec 80130
--P3G4

--USE Carpintaria
--GO


-------UDF's------

--get Fornecedor by name
CREATE FUNCTION Projeto.getFornecedorByname (@forn_nome VARCHAR(50))
RETURNS TABLE

RETURN (
		SELECT *
FROM Projeto.Table_Fornecedores
WHERE nome = @forn_nome
		);
GO

--get Fornecedor by nif
CREATE FUNCTION Projeto.getFornecedorBynif (@forn_nif CHAR(9))
RETURNS TABLE

RETURN (
		SELECT *
FROM Projeto.Table_Fornecedores
WHERE nif = @forn_nif
		);
GO

--get Fornecedor by mail
CREATE FUNCTION Projeto.getFornecedorBymail (@forn_mail VARCHAR(70))
RETURNS TABLE

RETURN (
		SELECT *
FROM Projeto.Table_Fornecedores
WHERE mail = @forn_mail
		);
GO

--get Fornecedor by tel
CREATE FUNCTION Projeto.getFornecedorBytel (@forn_tel CHAR(9))
RETURNS TABLE

RETURN (
		SELECT *
FROM Projeto.Table_Fornecedores
WHERE tel = @forn_tel
		);
GO

--get Cliente by name
CREATE FUNCTION Projeto.getClienteByname (@client_nome VARCHAR(50))
RETURNS TABLE

RETURN (
		SELECT *
FROM Projeto.Table_Cliente
WHERE nome = @client_nome
		);
GO

--get Cliente by nif
CREATE FUNCTION Projeto.getClienteBynif (@client_nif CHAR(9))
RETURNS TABLE

RETURN (
		SELECT *
FROM Projeto.Table_Cliente
WHERE nif = @client_nif
		);
GO

--get Cliente by mail
CREATE FUNCTION Projeto.getClienteBymail (@client_mail VARCHAR(70))
RETURNS TABLE

RETURN (
		SELECT *
FROM Projeto.Table_Cliente
WHERE mail = @client_mail
		);
GO

--get Cliente by tel
CREATE FUNCTION Projeto.getClienteBytel (@client_tel CHAR(9))
RETURNS TABLE

RETURN (
		SELECT *
FROM Projeto.Table_Cliente
WHERE tel = @client_tel
		);
GO

--get Funcionario by name
CREATE FUNCTION Projeto.getFuncionarioByname (@funcionario_nome VARCHAR(50))
RETURNS TABLE

RETURN (
		SELECT *
FROM Projeto.Table_Funcionario
WHERE nome = @funcionario_nome
		);
GO

--get Funcionario by nif
CREATE FUNCTION Projeto.getFuncionarioBynif (@funcionario_nif CHAR(9))
RETURNS TABLE

RETURN (
		SELECT *
FROM Projeto.Table_Funcionario
WHERE nif = @funcionario_nif
		);
GO

--get Funcionario by mail
CREATE FUNCTION Projeto.getFuncionarioBymail (@funcionario_mail VARCHAR(70))
RETURNS TABLE

RETURN (
		SELECT *
FROM Projeto.Table_Funcionario
WHERE mail = @funcionario_mail
		);
GO

--get Funcionario by tel
CREATE FUNCTION Projeto.getFuncionarioBytel (@funcionario_tel CHAR(9))
RETURNS TABLE

RETURN (
		SELECT *
FROM Projeto.Table_Funcionario
WHERE tel = @funcionario_tel
		);
GO

--get MateriaPrima by tipo
CREATE FUNCTION Projeto.getMateriaPrimaBytipo (@materia_tipo VARCHAR(50))
RETURNS TABLE

RETURN (
		SELECT *
FROM Projeto.Table_MateriaPrima
WHERE tipo = @materia_tipo
		);
GO

--get Artigo by nome
CREATE FUNCTION Projeto.getArtigoBynome (@artigo_nome VARCHAR(50))
RETURNS TABLE

RETURN (
		SELECT *
FROM Projeto.Table_Artigo
WHERE nome = @artigo_nome
		);
GO

--get ClienteEncomenda by mome
CREATE FUNCTION Projeto.getClienteEncomendaBynome (@nome VARCHAR(50))
RETURNS TABLE

RETURN (
		SELECT *
FROM Projeto.Table_EncomendaCliente
WHERE cliente_nome = @nome
		);
GO

--get ClienteEncomenda by Estado de Pagamento
CREATE FUNCTION Projeto.getClienteEncomendaBypagamento (@pagamento VARCHAR(50))
RETURNS TABLE

RETURN (
		SELECT *
FROM Projeto.Table_EncomendaCliente
WHERE estado_paga = @pagamento
		);
GO

--get EncomendaFornecedor by nome funcionario
CREATE FUNCTION Projeto.getEncomendaFornecedorBynome (@nome VARCHAR(50))
RETURNS TABLE

RETURN (
		SELECT *
FROM Projeto.Table_EncomendaFornecedor
WHERE funcionario_nome = @nome
		);
GO

--get EncomendaFornecedor by id funcionario
CREATE FUNCTION Projeto.getEncomendaFornecedorByidfunc (@id INT)
RETURNS TABLE

RETURN (
		SELECT *
FROM Projeto.Table_EncomendaFornecedor
WHERE funcionario_id = @id
		);
GO

--get EncomendaFornecedor by estado de pagamento
CREATE FUNCTION Projeto.getEncomendaFornecedorBypagamento (@pagamento VARCHAR(50))
RETURNS TABLE

RETURN (
		SELECT *
FROM Projeto.Table_EncomendaFornecedor
WHERE estado_pag = @pagamento
		);
GO

--get EncomendaFornecedor by estado entrega
CREATE FUNCTION Projeto.getEncomendaFornecedorByentrega (@entrega VARCHAR(50))
RETURNS TABLE

RETURN (
		SELECT *
FROM Projeto.Table_EncomendaFornecedor
WHERE estado_entrega = @entrega
		);
GO

/*
DROP FUNCTION Projeto.getArtigoBynome;
DROP FUNCTION Projeto.getClienteBymail;
DROP FUNCTION Projeto.getClienteBynif;
DROP FUNCTION Projeto.getClienteByname;
DROP FUNCTION Projeto.getClienteBytel;
DROP FUNCTION Projeto.getClienteEncomendaBynome;
DROP FUNCTION Projeto.getClienteEncomendaBypagamento;
DROP FUNCTION Projeto.getEncomendaFornecedorByentrega;
DROP FUNCTION Projeto.getEncomendaFornecedorByidfunc;
DROP FUNCTION Projeto.getEncomendaFornecedorBynome;
DROP FUNCTION Projeto.getEncomendaFornecedorBypagamento;
DROP FUNCTION Projeto.getFornecedorBymail;
DROP FUNCTION Projeto.getFornecedorByname;
DROP FUNCTION Projeto.getFornecedorBynif;
DROP FUNCTION Projeto.getFornecedorBytel;
DROP FUNCTION Projeto.getFuncionarioBymail;
DROP FUNCTION Projeto.getFuncionarioByname;
DROP FUNCTION Projeto.getFuncionarioBynif;
DROP FUNCTION Projeto.getFuncionarioBytel;
DROP FUNCTION Projeto.getMateriaPrimaBytipo;
*/