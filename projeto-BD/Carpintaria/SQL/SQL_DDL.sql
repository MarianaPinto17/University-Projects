-- PROJETO DE CARPINTARIA
-- Realizado para a disciplina de Base de Dados
-- Mariana Pinto, nmec 84792
-- Gonçalo Arieiro, nmec 80130
--P3G4
--USE Carpintaria
--GO
/*
CREATE SCHEMA Projeto
--DROP SCHEMA Projeto
GO
--GO

--Done
--Tabela que mostra os dados da carpintaria 
CREATE TABLE Projeto.Table_Carpintaria (
	nome			VARCHAR(50)				NOT NULL,
	nif				CHAR(9)					NOT NULL,
	tel				CHAR(9)					NOT NULL,
	mail			VARCHAR(70)				NOT NULL,
	morada			VARCHAR(100)			NOT NULL,
	PRIMARY KEY (nif),
	UNIQUE(nif)
);

--Done
--Tabela LogIn da Carpintaria
CREATE TABLE Projeto.Table_LogIn(
	username		VARCHAR(50)				NOT NULL,
	password		VARCHAR(10)				NOT NULL,
	PRIMARY KEY (username)
);

--Done
--Tabela que mostra os Fornecedores da Carpintaria
CREATE TABLE Projeto.Table_Fornecedores (
	id				INT						NOT NULL IDENTITY(1,1),
	nome			VARCHAR(50)				NOT NULL,			
	nif				CHAR(9)					NOT NULL,
	tel				CHAR(9)					NOT NULL,
	mail			VARCHAR(70),
	morada			VARCHAR(100)			NOT NULL,
	metodo_pag		VARCHAR(100)			NOT NULL,
	PRIMARY KEY (id),
	UNIQUE(nif)
);
--drop TABLE Projeto.Table_Fornecedores 
--Done
--Tabela que mostra os clientes da Carpintaria
CREATE TABLE Projeto.Table_Cliente (
	id				INT						NOT NULL IDENTITY(1,1),
	nome			VARCHAR(50)				NOT NULL,
	nif				CHAR(9)					NOT NULL,
	tel				CHAR(9)					NOT NULL,
	mail			VARCHAR(70),
	morada			VARCHAR(100)			NOT NULL,
	PRIMARY KEY (id),
	UNIQUE(nif)
);
--drop TABLE Projeto.Table_Cliente
--Done
--Tabela que mostra os funcionários da Carpintaria
CREATE TABLE Projeto.Table_Funcionario(
	id				INT						NOT NULL IDENTITY(1,1),
	nome			VARCHAR(50)				NOT NULL,
	nif				CHAR(9)					NOT NULL,
	tel				CHAR(9)					NOT NULL,
	mail			VARCHAR(70),
	morada			VARCHAR(100)			NOT NULL,
	salario			INT						NOT NULL,
	PRIMARY KEY (id),
	UNIQUE(nif)
);
--drop TABLE Projeto.Table_Funcionario
--Done
--Tabela que mostra a Materia Prima existente na Carpintaria
CREATE TABLE Projeto.Table_MateriaPrima(
	id				INT						NOT NULL IDENTITY(1,1),
	tipo			VARCHAR(50)				NOT NULL,
	quantidade		INT						NOT NULL,
	preco			INT						NOT NULL,
	tamanho			VARCHAR(50),
	tempo_seca		INT,
	marca			VARCHAR(50)				NOT NULL,
	cor				VARCHAR(50),
	PRIMARY KEY (id)
);
--drop TABLE Projeto.Table_MateriaPrima
--Done
--Tabela que mostra os artigos disponiveis na carpintaria
CREATE TABLE Projeto.Table_Artigo(
	id				INT						NOT NULL IDENTITY(1,1),
	nome			VARCHAR(50)				NOT NULL,
	preco			INT						NOT NULL,
	quantidade		INT						NOT NULL,
	descricao		VARCHAR(500)			NOT NULL,
	PRIMARY KEY (id)
);
--drop TABLE Projeto.Table_Artigo
--Done
--Tabela que mostra as encomendas dos clientes a carpintaria
CREATE TABLE Projeto.Table_EncomendaCliente(
	id				INT						NOT NULL IDENTITY(1,1),
	cliente_id		INT						NOT NULL,
	cliente_nome	VARCHAR(50)				NOT NULL,
	data_in			DATE					NOT NULL,
	data_out		DATE					NOT NULL,
	descricao		VARCHAR(500)			NOT NULL,
	estado_prod		VARCHAR(100)			NOT NULL,
	estado_paga		VARCHAR(100)			NOT NULL,
	preco			INT						NOT NULL,
	FOREIGN KEY (cliente_id) REFERENCES Projeto.Table_Cliente(id),
	PRIMARY KEY (id)
);
--drop TABLE Projeto.Table_EncomendaCliente
--Done
--Tabela mostra as encomendas feitas ao Fornecedor por um funcionario
CREATE TABLE Projeto.Table_EncomendaFornecedor(
	id				 INT						NOT NULL IDENTITY(1,1),
	funcionario_nome VARCHAR(50)				NOT NULL,
	funcionario_id	 INT						NOT NULL,
	data_in			 DATE					NOT NULL,
	data_out		 DATE					NOT NULL,
	preco			 INT						NOT NULL,
	descrição		 VARCHAR(500)			NOT NULL,
	estado_entrega	 VARCHAR(100)			NOT NULL,
	estado_pag		 VARCHAR(100)			NOT NULL,
	FOREIGN KEY (funcionario_id) REFERENCES Projeto.Table_Funcionario(id),
	PRIMARY KEY (id)
);
--drop TABLE Projeto.Table_EncomendaFornecedor
--Done
--Tabela mostra as encomendas dos clientes realizadas pelos funcionarios 
CREATE TABLE Projeto.Table_ConstroiEncomenda(
	id_enc_cliente	INT						NOT NULL,
	func_id			INT						NOT NULL,
	FOREIGN KEY (id_enc_cliente) REFERENCES Projeto.Table_EncomendaCliente(id),
	FOREIGN KEY (func_id) REFERENCES Projeto.Table_Funcionario(id),
	PRIMARY KEY (id_enc_cliente,func_id)
);
--drop  TABLE Projeto.Table_ConstroiEncomenda
--Done
--Tabela mostra as matérias primas fornecidas à carpintaria por um fornecedor
CREATE TABLE Projeto.Table_MateriaFornecida(
	materia_id		INT						NOT NULL,
	fornecedor_id	INT						NOT NULL,
	FOREIGN KEY (materia_id) REFERENCES Projeto.Table_MateriaPrima(id),
	FOREIGN KEY (fornecedor_id) REFERENCES Projeto.Table_Fornecedores(id),
	PRIMARY KEY (materia_id,fornecedor_id)
);
--drop TABLE Projeto.Table_MateriaFornecida
--Done
--Tabela mostra a matéria prima necessária para construir um artigo
CREATE TABLE Projeto.Table_MateriaPrecisa(
	artigo_id		INT						NOT NULL,
	materia_id		INT						NOT NULL,
	FOREIGN KEY (materia_id) REFERENCES Projeto.Table_MateriaPrima(id),
	FOREIGN KEY (artigo_id) REFERENCES Projeto.Table_Artigo(id),
	PRIMARY KEY(artigo_id,materia_id)
);
--drop TABLE Projeto.Table_MateriaPrecisa
--Done
--Tabela mostra a lista de encomendas feitas ao Fornecedor
CREATE TABLE Projeto.Table_EncFeitaFornecedor(
	encomenda_id	INT						NOT NULL,
	fornecedor_id	INT						NOT NULL,
	FOREIGN KEY(encomenda_id) REFERENCES Projeto.Table_EncomendaFornecedor(id),
	FOREIGN KEY (fornecedor_id) REFERENCES Projeto.Table_Fornecedores(id),
	PRIMARY KEY(encomenda_id,fornecedor_id)
);
--drop TABLE Projeto.Table_EncFeitaFornecedor
--Done
--Tabela mostra os tipos de artigos contidos numa encomenda
CREATE TABLE Projeto.Table_ContemEncomendaCliente(
	artigo_id		INT						NOT NULL,
	encomenda_id	INT						NOT NULL,
	FOREIGN KEY (artigo_id) REFERENCES Projeto.Table_Artigo(id),
	FOREIGN KEY (encomenda_id) REFERENCES Projeto.Table_EncomendaCliente(id),
	PRIMARY KEY (encomenda_id,artigo_id)
);
--drop TABLE Projeto.Table_ContemEncomendaCliente
*/

/*
ALTER TABLE Projeto.Table_EncomendaCliente
DROP COLUMN cliente_nome;

ALTER TABLE Projeto.Table_EncomendaFornecedor
DROP COLUMN funcionario_nome;
*/

/*
ALTER TABLE Projeto.Table_EncomendaCliente
ADD cliente_nome VARCHAR(50);

ALTER TABLE Projeto.Table_EncomendaFornecedor
ADD funcionario_nome VARCHAR(50);
*/