-- PROJETO DE CARPINTARIA
-- Realizado para a disciplina de Base de Dados
-- Mariana Pinto, nmec 84792
-- Gonçalo Arieiro, nmec 80130

------------------geral-------------------------------------------------------

--USE Carpintaria
--GO
/*
INSERT INTO Projeto.Table_Cliente VALUES 
	('Manuel','123456789','123456666','manuel@ua.pt','Rua da Alegria'),
	('Antonio','123776789','987654321','antonio@ua.pt','Rua do Porto'),
	('Pedro','123456777','111111111','pedro@ua.pt','Rua da Vista'),
	('Ana','123456111','237777790','ana@ua.pt','Rua da Alo'),
	('Maria','123452222','234555555','maria@ua.pt','Rua da Alegre');
SELECT *FROM Projeto.Table_Cliente
GO

INSERT INTO Projeto.Table_Funcionario VALUES 
	('Manuela','321456781','123456666','manuel@ua.pt','Rua da Alegria',100),
	('Antonia','123556789','987654321','antonio@ua.pt','Rua do Porto',100),
	('Afonso','123456744','111111111','pedro@ua.pt','Rua da Vista',100),
	('Anabela','123456441','237777790','ana@ua.pt','Rua da Alo',100),
	('Mariana','123452442','234555555','maria@ua.pt','Rua da Alegre',100);
SELECT *FROM Projeto.Table_Funcionario
GO

INSERT INTO Projeto.Table_Fornecedores VALUES 
	('Forne1','987546120','123456879','forn1l@ua.pt','Rua da Alegria','10 dias'),
	('Forne2','456123987','564687983','forn2@ua.pt','Rua do Porto','na hora'),
	('Forn3','098547187','555555555','forn3@ua.pt','Rua da Vista','na hora'),
	('Forn4','125487789','666666666','forn4@ua.pt','Rua da Alo','na hora'),
	('Forn5','123452442','454545454','forn5@ua.pt','Rua da Alegre','na hora');
SELECT *FROM Projeto.Table_Fornecedores
GO

INSERT INTO Projeto.Table_Artigo VALUES 
	('Cadeira',50.00,12,'cadeira de mardeira de carvalho'),
	('Mesa',70.00,1,'mesa de mardeira de carvalho'),
	('Porta',40.00,2,'Porta de mardeira de carvalho');
SELECT *FROM Projeto.Table_Artigo
GO

INSERT INTO Projeto.Table_MateriaPrima VALUES
	('Prego',50,0.12,0.2,null,'cabeça achatada',null),
	('Parafuso',50,0.12,0.2,null,'cabeça estrela',null),
	('Parafuso',50,0.12,0.2,null,'cabeça normal',null),
	('Madeira',50,0.12,0.2,null,'carvalho',null);
SELECT * FROM Projeto.Table_MateriaPrima
GO

INSERT INTO Projeto.Table_EncomendaFornecedor VALUES
(1,'2020-06-12','2020-06-19',12,'30 pregos de 0.20 m','não entregues','por pagar',null),
(3,'2020-06-12','2020-06-19',12,'30 parafusos de 0.20 m','entregues','pagas',null),
(2,'2020-06-12','2020-06-19',12,'30 parafusos de 0.20 m','entregues','pagas',null);
SELECT * FROM Projeto.Table_EncomendaCliente
GO


-- YYYYMMDD

INSERT INTO Projeto.Table_EncomendaCliente VALUES
(1,'2020-06-12','2020-06-19','6 CADEIRAS','produzidas','por pagar',30,null),
(3,'2020-06-12','2020-06-19','7 CADEIRAS','produzidas','pagas',35,null),
(4,'2020-06-12','2020-06-19','8 CADEIRAS','produzidas','pagas',40,null),
(2,'2020-06-12','2020-06-19','9 CADEIRAS','por produzir','pagas',45,null);
SELECT * FROM Projeto.Table_EncomendaCliente
GO

--INSERT INTO Projeto.Table_EncomendaCliente (Projeto.Table_EncomendaCliente.cliente_nome)
--SELECT Projeto.Table_Cliente.nome FROM Projeto.Table_Cliente;

INSERT INTO Projeto.Table_ConstroiEncomenda VALUES
(4,1),
(2,2),
(3,3);
SELECT * FROM Projeto.Table_ConstroiEncomenda
GO

INSERT INTO Projeto.Table_ContemEncomendaCliente VALUES
(1,4),
(2,2),
(3,3);
SELECT * FROM Projeto.Table_ContemEncomendaCliente
GO

INSERT INTO Projeto.Table_EncFeitaFornecedor VALUES
(1,1),
(1,2),
(2,2),
(3,3);
SELECT * FROM Projeto.Table_EncFeitaFornecedor
GO

INSERT INTO Projeto.Table_MateriaPrecisa VALUES
(1,1),
(1,2),
(2,2),
(3,3);
SELECT * FROM Projeto.Table_MateriaPrecisa
GO

INSERT INTO Projeto.Table_MateriaFornecida VALUES
(1,1),
(1,2),
(2,2),
(3,3);
SELECT * FROM Projeto.Table_MateriaFornecida
GO
*/
--------------------------------SELEÇÃO DE DADOS-----------------------------------------------
/*
-- Selecionar todos os tuplos das Tabelas
SELECT * FROM Projeto.Table_Artigo;
SELECT * FROM Projeto.Table_Carpintaria;
SELECT * FROM Projeto.Table_Cliente;
SELECT * FROM Projeto.Table_ConstroiEncomenda;
SELECT * FROM Projeto.Table_ContemEncomendaCliente;
SELECT * FROM Projeto.Table_EncFeitaFornecedor;
SELECT * FROM Projeto.Table_EncomendaCliente;
SELECT * FROM Projeto.Table_EncomendaFornecedor;
SELECT * FROM Projeto.Table_Fornecedores;
SELECT * FROM Projeto.Table_Funcionario;
SELECT * FROM Projeto.Table_LogIn;
SELECT * FROM Projeto.Table_MateriaFornecida;
SELECT * FROM Projeto.Table_MateriaPrecisa;
SELECT * FROM Projeto.Table_MateriaPrima;

-- Selecionar apenas os ID'S das tabelas
SELECT id FROM Projeto.Table_Artigo;
SELECT id FROM Projeto.Table_Cliente;
SELECT id FROM Projeto.Table_EncomendaCliente;
SELECT id FROM Projeto.Table_EncomendaFornecedor;
SELECT id FROM Projeto.Table_Fornecedores;
SELECT id FROM Projeto.Table_Funcionario;
SELECT id FROM Projeto.Table_MateriaPrima;

-- Selecionar os nomes das Tabelas
SELECT nome FROM Projeto.Table_Artigo;
SELECT nome FROM Projeto.Table_Carpintaria;
SELECT nome FROM Projeto.Table_Cliente;
SELECT nome FROM Projeto.Table_Fornecedores;
SELECT nome FROM Projeto.Table_Funcionario;

-- Selecionar o nome, nif e o telefone dos clientes, fornecedores, funcionarios 
SELECT nome,nif,tel FROM Projeto.Table_Cliente;
SELECT nome,nif,tel FROM Projeto.Table_Fornecedores;
SELECT nome,nif,tel FROM Projeto.Table_Funcionario;

-- Ordenar nome, nif e o telefone por ordem Alfabetica do nome
SELECT nome,nif,tel FROM Projeto.Table_Cliente ORDER BY nome;
SELECT nome,nif,tel FROM Projeto.Table_Fornecedores ORDER BY nome;
SELECT nome,nif,tel FROM Projeto.Table_Funcionario ORDER BY nome;

-- Ordenar nome, nif e o telefone por ordem de nifs
SELECT nome,nif,tel FROM Projeto.Table_Cliente ORDER BY nif;
SELECT nome,nif,tel FROM Projeto.Table_Fornecedores ORDER BY nif;
SELECT nome,nif,tel FROM Projeto.Table_Funcionario ORDER BY nif;

----------------------Tabela Fornecedores------------------------------------------

--Ordenar Fornecedores por método de pagamento
SELECT * FROM Projeto.Table_Fornecedores ORDER BY metodo_pag;

--Ordenar Fornecedores por nome
SELECT * FROM Projeto.Table_Fornecedores ORDER BY nome;

--Ordenar Fornecedores por nif
SELECT * FROM Projeto.Table_Fornecedores ORDER BY nif;

----------------------Tabela Funcionarios------------------------------------------

--Ordenar funcionarios por salario
SELECT * FROM Projeto.Table_Funcionario ORDER BY salario;

--Ordenar funcionarios por nome
SELECT * FROM Projeto.Table_Funcionario ORDER BY nome;

--Ordenar funcionarios por nif
SELECT * FROM Projeto.Table_Funcionario ORDER BY nif;
 
--Soma dos salarios de todos os funcionarios
SELECT SUM(salario) as Total_Salario FROM Projeto.Table_Funcionario;


----------------------Tabela Materia Prima------------------------------------------

--Ordenar Materia Prima por tipo
SELECT * FROM Projeto.Table_MateriaPrima ORDER BY tipo;

--Ordenar Materia Prima por quantidade
SELECT * FROM Projeto.Table_MateriaPrima ORDER BY quantidade;

--Ordenar Materia Prima por preço
SELECT * FROM Projeto.Table_MateriaPrima ORDER BY preco;

--Ordenar Materia Prima por tipo e preco
SELECT * FROM Projeto.Table_MateriaPrima ORDER BY tipo,preco;

--Ordenar materia prima por tipo, marca e preço
SELECT * FROM Projeto.Table_MateriaPrima ORDER BY tipo,marca,preco;

----------------------Tabela Artigo-------------------------------------------------

--Ordenar artigo por nome
SELECT * FROM Projeto.Table_Artigo ORDER BY nome;

--Ordenar artigo por quantidade
SELECT * FROM Projeto.Table_Artigo ORDER BY quantidade;

--Ordenar artigo por preço
SELECT * FROM Projeto.Table_Artigo ORDER BY preco;

--Ordenar artigo por nome e preco
SELECT * FROM Projeto.Table_Artigo ORDER BY nome,preco;

----------------------Encomendas dos Clientes---------------------------------------

--Selecionar nome do cliente pelo id e ordenar pelo nome do cliente
SELECT Projeto.Table_EncomendaCliente.id, Projeto.Table_Cliente.nome AS cliente_nome , Projeto.Table_EncomendaCliente.data_in, Projeto.Table_EncomendaCliente.data_out, Projeto.Table_EncomendaCliente.descricao, Projeto.Table_EncomendaCliente.estado_paga, Projeto.Table_EncomendaCliente.estado_prod, Projeto.Table_EncomendaCliente.preco
FROM Projeto.Table_Cliente
INNER JOIN Projeto.Table_EncomendaCliente
ON (Projeto.Table_Cliente.id = Projeto.Table_EncomendaCliente.id)
ORDER BY nome;

-- Ordenar Encomendas dos clientes por cliente_id
SELECT Projeto.Table_EncomendaCliente.id, Projeto.Table_Cliente.nome AS cliente_nome , Projeto.Table_EncomendaCliente.data_in, Projeto.Table_EncomendaCliente.data_out, Projeto.Table_EncomendaCliente.descricao, Projeto.Table_EncomendaCliente.estado_paga, Projeto.Table_EncomendaCliente.estado_prod, Projeto.Table_EncomendaCliente.preco
FROM Projeto.Table_Cliente
INNER JOIN Projeto.Table_EncomendaCliente
ON (Projeto.Table_Cliente.id = Projeto.Table_EncomendaCliente.id)
ORDER BY cliente_id;

-- Ordenar Encomendas dos clientes por data de entrada na carpintaria
SELECT Projeto.Table_EncomendaCliente.id, Projeto.Table_Cliente.nome AS cliente_nome , Projeto.Table_EncomendaCliente.data_in, Projeto.Table_EncomendaCliente.data_out, Projeto.Table_EncomendaCliente.descricao, Projeto.Table_EncomendaCliente.estado_paga, Projeto.Table_EncomendaCliente.estado_prod, Projeto.Table_EncomendaCliente.preco
FROM Projeto.Table_Cliente
INNER JOIN Projeto.Table_EncomendaCliente
ON (Projeto.Table_Cliente.id = Projeto.Table_EncomendaCliente.id)
ORDER BY data_in;

--Ordenar Encomendas dos clientes por data de saída da carpintaria
SELECT Projeto.Table_EncomendaCliente.id, Projeto.Table_Cliente.nome AS cliente_nome , Projeto.Table_EncomendaCliente.data_in, Projeto.Table_EncomendaCliente.data_out, Projeto.Table_EncomendaCliente.descricao, Projeto.Table_EncomendaCliente.estado_paga, Projeto.Table_EncomendaCliente.estado_prod, Projeto.Table_EncomendaCliente.preco
FROM Projeto.Table_Cliente
INNER JOIN Projeto.Table_EncomendaCliente
ON (Projeto.Table_Cliente.id = Projeto.Table_EncomendaCliente.id)
ORDER BY data_out;

--Ordenar Encomendas dos Clientes por estado produçao
SELECT Projeto.Table_EncomendaCliente.id, Projeto.Table_Cliente.nome AS cliente_nome , Projeto.Table_EncomendaCliente.data_in, Projeto.Table_EncomendaCliente.data_out, Projeto.Table_EncomendaCliente.descricao, Projeto.Table_EncomendaCliente.estado_paga, Projeto.Table_EncomendaCliente.estado_prod, Projeto.Table_EncomendaCliente.preco
FROM Projeto.Table_Cliente
INNER JOIN Projeto.Table_EncomendaCliente
ON (Projeto.Table_Cliente.id = Projeto.Table_EncomendaCliente.id)
ORDER BY estado_prod;

--Ordenar Encomendas dos Clientes por estado pagamento
SELECT Projeto.Table_EncomendaCliente.id, Projeto.Table_Cliente.nome AS cliente_nome , Projeto.Table_EncomendaCliente.data_in, Projeto.Table_EncomendaCliente.data_out, Projeto.Table_EncomendaCliente.descricao, Projeto.Table_EncomendaCliente.estado_paga, Projeto.Table_EncomendaCliente.estado_prod, Projeto.Table_EncomendaCliente.preco
FROM Projeto.Table_Cliente
INNER JOIN Projeto.Table_EncomendaCliente
ON (Projeto.Table_Cliente.id = Projeto.Table_EncomendaCliente.id)
ORDER BY estado_paga;

----------------------Encomendas aos fornecedores-----------------------------------

--Ordenar Encomendas aos fornecedores por nome funcionario
SELECT Projeto.Table_EncomendaFornecedor.id, Projeto.Table_Funcionario.nome AS funcionario_nome, Projeto.Table_EncomendaFornecedor.data_in, Projeto.Table_EncomendaFornecedor.data_out, Projeto.Table_EncomendaFornecedor.preco, Projeto.Table_EncomendaFornecedor.descrição, Projeto.Table_EncomendaFornecedor.estado_entrega, Projeto.Table_EncomendaFornecedor.estado_pag 
FROM Projeto.Table_EncomendaFornecedor 
INNER JOIN Projeto.Table_Funcionario ON Projeto.Table_EncomendaFornecedor.id=Projeto.Table_Funcionario.id
ORDER BY nome;

--Ordenar Encomendas aos fornecedores por data realização
SELECT Projeto.Table_EncomendaFornecedor.id, Projeto.Table_Funcionario.nome AS funcionario_nome, Projeto.Table_EncomendaFornecedor.data_in, Projeto.Table_EncomendaFornecedor.data_out, Projeto.Table_EncomendaFornecedor.preco, Projeto.Table_EncomendaFornecedor.descrição, Projeto.Table_EncomendaFornecedor.estado_entrega, Projeto.Table_EncomendaFornecedor.estado_pag 
FROM Projeto.Table_EncomendaFornecedor 
INNER JOIN Projeto.Table_Funcionario ON Projeto.Table_EncomendaFornecedor.id=Projeto.Table_Funcionario.id
ORDER BY data_in;


--Ordenar Encomendas aos fornecedores por data prevista para a chegada à carpintaria
SELECT Projeto.Table_EncomendaFornecedor.id, Projeto.Table_Funcionario.nome AS funcionario_nome, Projeto.Table_EncomendaFornecedor.data_in, Projeto.Table_EncomendaFornecedor.data_out, Projeto.Table_EncomendaFornecedor.preco, Projeto.Table_EncomendaFornecedor.descrição, Projeto.Table_EncomendaFornecedor.estado_entrega, Projeto.Table_EncomendaFornecedor.estado_pag 
FROM Projeto.Table_EncomendaFornecedor 
INNER JOIN Projeto.Table_Funcionario ON Projeto.Table_EncomendaFornecedor.id=Projeto.Table_Funcionario.id
ORDER BY data_out;

--Ordenar Encomendar aos fornecedores por estado de entrega
SELECT Projeto.Table_EncomendaFornecedor.id, Projeto.Table_Funcionario.nome AS funcionario_nome, Projeto.Table_EncomendaFornecedor.data_in, Projeto.Table_EncomendaFornecedor.data_out, Projeto.Table_EncomendaFornecedor.preco, Projeto.Table_EncomendaFornecedor.descrição, Projeto.Table_EncomendaFornecedor.estado_entrega, Projeto.Table_EncomendaFornecedor.estado_pag 
FROM Projeto.Table_EncomendaFornecedor 
INNER JOIN Projeto.Table_Funcionario ON Projeto.Table_EncomendaFornecedor.id=Projeto.Table_Funcionario.id
ORDER BY estado_entrega;

--Ordenar Encomendas aos fornecedores por estado pagamento
SELECT Projeto.Table_EncomendaFornecedor.id, Projeto.Table_Funcionario.nome AS funcionario_nome, Projeto.Table_EncomendaFornecedor.data_in, Projeto.Table_EncomendaFornecedor.data_out, Projeto.Table_EncomendaFornecedor.preco, Projeto.Table_EncomendaFornecedor.descrição, Projeto.Table_EncomendaFornecedor.estado_entrega, Projeto.Table_EncomendaFornecedor.estado_pag 
FROM Projeto.Table_EncomendaFornecedor 
INNER JOIN Projeto.Table_Funcionario ON Projeto.Table_EncomendaFornecedor.id=Projeto.Table_Funcionario.id
ORDER BY estado_pag;

---------------------Encomendas Construidas pelos funcionarios----------------------

--Ordenar encomendas por id's de funcionarios
SELECT * FROM Projeto.Table_ConstroiEncomenda ORDER BY func_id;

--ordenar encomendas por nomes de funcionarios
SELECT Projeto.Table_ConstroiEncomenda.id_enc_cliente, Projeto.Table_Funcionario.nome
FROM Projeto.Table_ConstroiEncomenda
INNER JOIN Projeto.Table_Funcionario ON Projeto.Table_ConstroiEncomenda.id_enc_cliente=Projeto.Table_Funcionario.id
ORDER BY nome;

--Ordenar encomendas por id de encomendas
SELECT Projeto.Table_ConstroiEncomenda.id_enc_cliente, Projeto.Table_ConstroiEncomenda.func_id
FROM Projeto.Table_ConstroiEncomenda
INNER JOIN Projeto.Table_EncomendaCliente ON Projeto.Table_ConstroiEncomenda.id_enc_cliente=Projeto.Table_EncomendaCliente.id
ORDER BY id_enc_cliente;


--Ordenar encomendas por id de encomendas de clientes
SELECT * FROM Projeto.Table_ConstroiEncomenda ORDER BY id_enc_cliente;

--------------------Materias primas fornecidas por um fornecedor--------------------

--Ordenar materia por nome de fornecedores
SELECT Projeto.Table_MateriaFornecida.materia_id, Projeto.Table_Fornecedores.nome AS fornecedor_nome
FROM Projeto.Table_Fornecedores
INNER JOIN Projeto.Table_MateriaFornecida ON Projeto.Table_Fornecedores.id=Projeto.Table_MateriaFornecida.fornecedor_id
ORDER BY fornecedor_id;

--Ordenar materia por id's de fornecedores
SELECT * FROM Projeto.Table_MateriaFornecida ORDER BY fornecedor_id;

--Ordenar materia por tipo
SELECT Projeto.Table_MateriaFornecida.fornecedor_id, Projeto.Table_MateriaPrima.tipo AS tipo_materia
FROM Projeto.Table_MateriaPrima
INNER JOIN Projeto.Table_MateriaFornecida ON Projeto.Table_MateriaPrima.id=Projeto.Table_MateriaFornecida.materia_id
ORDER BY tipo_materia;

--------------------------Materia Precisa para construir------------------------------

-- Ordenar por tipo de materia precsa ID
SELECT * FROM Projeto.Table_MateriaPrecisa ORDER BY materia_id;

-- Ordenar por artigo_id
SELECT * FROM Projeto.Table_MateriaPrecisa ORDER BY artigo_id;

----------------------Encomenda feita ao fornecedor----------------------------------

--Ordenar por id de fornecedor
SELECT * FROM Projeto.Table_EncFeitaFornecedor ORDER BY fornecedor_id;

--Ordenar por encomenda
SELECT * FROM Projeto.Table_EncFeitaFornecedor ORDER BY encomenda_id;

-----------------------Artigos da encomenda cliente----------------------------------

--Ordenar por id de artigo
SELECT * FROM Projeto.Table_ContemEncomendaCliente ORDER BY artigo_id;

--Ordenar por id encomenda
SELECT * FROM Projeto.Table_ContemEncomendaCliente ORDER BY encomenda_id;
*/
--------------------------------DELETE-------------------------------------
/*
DELETE FROM Projeto.Table_ContemEncomendaCliente WHERE encomenda_id=1;
DELETE FROM Projeto.Table_ContemEncomendaCliente WHERE artigo_id=1;
DELETE FROM Projeto.Table_ContemEncomendaCliente;
DELETE FROM Projeto.Table_EncFeitaFornecedor;
DELETE FROM Projeto.Table_ConstroiEncomenda;
DELETE FROM Projeto.Table_EncomendaFornecedor;
DELETE FROM Projeto.Table_MateriaPrecisa;
DELETE FROM Projeto.Table_MateriaFornecida;
DELETE FROM Projeto.Table_MateriaPrima;
DELETE FROM Projeto.Table_Artigo WHERE id=1;
*/
