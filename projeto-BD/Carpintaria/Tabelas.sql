-- PROJETO DE CARPINTARIA
-- Realizado para a disciplina de Base de Dados
-- Mariana Pinto, nmec84792
-- Gonçalo Arieiro, nmec 80130

-- CTRL + SHIFT + R TO CLEAN CACHE
/*
CREATE SCHEMA Projeto
GO

--DROP SCHEMA Projeto
--GO

--Done
--Tabela que mostra os dados da carpintaria 
CREATE TABLE Projeto.Table_Carpintaria (
	nome			VARCHAR(50)				NOT NULL,
	nif				CHAR(9)					NOT NULL,
	tel				CHAR(9)					NOT NULL,
	mail			VARCHAR(70)				NOT NULL,
	morada			VARCHAR(100)			NOT NULL,
	PRIMARY KEY (nif)
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
	PRIMARY KEY (id)
);

--Done
--Tabela que mostra os clientes da Carpintaria
CREATE TABLE Projeto.Table_Cliente (
	id				INT						NOT NULL IDENTITY(1,1),
	nome			VARCHAR(50)				NOT NULL,
	nif				CHAR(9)					NOT NULL,
	tel				CHAR(9)					NOT NULL,
	mail			VARCHAR(70),
	morada			VARCHAR(100)			NOT NULL,
	PRIMARY KEY (id)
);

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
	PRIMARY KEY (id)
);

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

--Done
--Tabela que mostra os artigos disponiveis na carpintaria
CREATE TABLE Projeto.Table_Artigo(
	Id				INT						NOT NULL IDENTITY(1,1),
	nome			VARCHAR(50)				NOT NULL,
	preco			INT						NOT NULL,
	quantidade		INT						NOT NULL,
	descricao		VARCHAR(500)			NOT NULL,
	PRIMARY KEY (Id)
);

--Done
--Tabela que mostra as encomendas dos clientes a carpintaria
CREATE TABLE Projeto.Table_EncomendaCliente(
	id				INT						NOT NULL IDENTITY(1,1),
	nome			VARCHAR(50)				NOT NULL,
	cliente_id		INT						NOT NULL,
	cliente_nome	VARCHAR(50)				NOT NULL,
	data_in			DATE					NOT NULL,
	data_out		DATE					NOT NULL,
	descricao		VARCHAR(500)			NOT NULL,
	estado_prod		VARCHAR(100)			NOT NULL,
	estado_paga		VARCHAR(100)			NOT NULL,
	preco			INT						NOT NULL,
	FOREIGN KEY (cliente_id) REFERENCES Projeto.Table_Cliente(id),
	PRIMARY KEY (id,cliente_id)
);

--Done
--Tabela mostra as encomendas feitas ao Fornecedor por um funcionario
CREATE TABLE Projeto.Table_EncomendaFornecedor(
	id				INT						NOT NULL IDENTITY(1,1),
	nome			VARCHAR(50)				NOT NULL,
	funcionario_id	INT						NOT NULL,
	func_nome		VARCHAR(50)				NOT NULL,
	cliente_id		INT						NOT NULL,
	data_in			DATE					NOT NULL,
	data_out		DATE					NOT NULL,
	preco			INT						NOT NULL,
	descrição		VARCHAR(500)			NOT NULL,
	estado_entrega	VARCHAR(100)			NOT NULL,
	estado_pag		VARCHAR(100)			NOT NULL,
	FOREIGN KEY (funcionario_id) REFERENCES Projeto.Table_Funcionario(id),
	PRIMARY KEY (id,funcionario_id)
);

--Done
--Tabela mostra as encomendas dos clientes realizadas pelos funcionarios 
CREATE TABLE Projeto.Table_Constroi_Encomenda(
	id_enc_cliente	INT						NOT NULL,
	cliente_id		INT						NOT NULL,
	cliente_nome	VARCHAR(50)				NOT NULL,
	func_nome		VARCHAR(50)				NOT NULL,
	func_id			INT						NOT NULL,
	FOREIGN KEY (id_enc_cliente,cliente_id) REFERENCES Projeto.Table_EncomendaCliente(id,cliente_id),
	FOREIGN KEY (func_id) REFERENCES Projeto.Table_Funcionario(id),
	PRIMARY KEY (id_enc_cliente,cliente_id,func_id)
);

--Done
--Tabela mostra as matérias primas fornecidas à carpintaria por um fornecedor
CREATE TABLE Projeto.Table_Materia_Fornecida(
	materia_id		INT						NOT NULL,
	materia_tipo	VARCHAR(50)				NOT NULL,
	fornecedor_id	INT						NOT NULL,
	nome_fornecedor	VARCHAR(50)				NOT NULL,
	FOREIGN KEY (materia_id) REFERENCES Projeto.Table_MateriaPrima(id),
	FOREIGN KEY (fornecedor_id) REFERENCES Projeto.Table_Fornecedores(Id),
	PRIMARY KEY (materia_id,materia_tipo,fornecedor_id)
);

--Done
--Tabela mostra a matéria prima necessária para construir um artigo
CREATE TABLE Projeto.Table_Materia_Precisa(
	artigo_id		INT						NOT NULL,
	artigo_nome		VARCHAR(50)				NOT NULL,
	materia_id		INT						NOT NULL,
	materia_tipo	VARCHAR(50)				NOT NULL,
	FOREIGN KEY (materia_id) REFERENCES Projeto.Table_MateriaPrima(id),
	FOREIGN KEY (artigo_id) REFERENCES Projeto.Table_Artigo(id),
	PRIMARY KEY(artigo_id, materia_id)
);

--Done
--Tabela mostra a lista de encomendas feitas ao Fornecedor
CREATE TABLE Projeto.Table_Enc_Feita_Fornecedor(
	encomenda_id	INT						NOT NULL,
	func_nome		VARCHAR(50)				NOT NULL,
	func_id			INT						NOT NULL,
	fornecedor_id	INT						NOT NULL,
	nome_fornecedor	VARCHAR(50)				NOT NULL,
	FOREIGN KEY(encomenda_id,func_id) REFERENCES Projeto.Table_EncomendaFornecedor(id,funcionario_id),
	FOREIGN KEY (fornecedor_id) REFERENCES Projeto.Table_Fornecedores(id),
	PRIMARY KEY(encomenda_ID,func_ID,fornecedor_ID)
);

--Done
--Tabela mostra os tipos de artigos contidos numa encomenda
CREATE TABLE Projeto.Table_Contem_Encomenda_Cliente(
	artigo_id		INT						NOT NULL,
	artigo_nome		VARCHAR(50)				NOT NULL,
	cliente_id		INT						NOT NULL,
	cliente_nome	VARCHAR(50)				NOT NULL,
	encomenda_id	INT						NOT NULL,
	FOREIGN KEY (artigo_id) REFERENCES Projeto.Table_Artigo(id),
	FOREIGN KEY (encomenda_id,cliente_id) REFERENCES Projeto.Table_EncomendaCliente(id,cliente_id),
	PRIMARY KEY (encomenda_id,cliente_id)
);
*/

-- inserir valores na carpintaria
INSERT INTO Projeto.Table_Carpintaria (nome,nif,tel,mail,morada)
VALUES ('Carpintaria',123456789,987654321,'carpintaria@ua.pt','rua carpintaria, nº 2131312, 4580-327 porto');


