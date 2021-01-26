-- PROJETO DE CARPINTARIA
-- Realizado para a disciplina de Base de Dados
-- Mariana Pinto, nmec 84792
-- Gonçalo Arieiro, nmec 80130

------------------geral-------------------------------------------------------

-- Selecionar todos os tuplos das Tabelas
SELECT * FROM Projeto.Table_Artigo;
SELECT * FROM Projeto.Table_Carpintaria;
SELECT * FROM Projeto.Table_Cliente;
SELECT * FROM Projeto.Table_Constroi_Encomenda;
SELECT * FROM Projeto.Table_Contem_Encomenda_Cliente;
SELECT * FROM Projeto.Table_Enc_Feita_Fornecedor;
SELECT * FROM Projeto.Table_EncomendaCliente;
SELECT * FROM Projeto.Table_EncomendaFornecedor;
SELECT * FROM Projeto.Table_Fornecedores;
SELECT * FROM Projeto.Table_Funcionario;
SELECT * FROM Projeto.Table_LogIn;
SELECT * FROM Projeto.Table_Materia_Fornecida;
SELECT * FROM Projeto.Table_Materia_Precisa;
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
SELECT nome FROM Projeto.Table_EncomendaCliente;
SELECT nome FROM Projeto.Table_EncomendaFornecedor;

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

-- Ordenar Encomendas dos clientes por nome
SELECT * FROM Projeto.Table_EncomendaCliente ORDER BY nome;

-- Ordenar Encomendas dos clientes por cliente_id
SELECT * FROM Projeto.Table_EncomendaCliente ORDER BY cliente_id;

-- Ordenar Encomendas dos clientes por cliente_nome e cliente_id
SELECT * FROM Projeto.Table_EncomendaCliente ORDER BY cliente_nome, cliente_id;

-- Ordenar Encomendas dos clientes por data de entrada na carpintaria
SELECT * FROM Projeto.Table_EncomendaCliente ORDER BY data_in;

--Ordenar Encomendas dos clientes por data de saída da carpintaria
SELECT * FROM Projeto.Table_EncomendaCliente ORDER BY data_out;

--Ordenar Encomendas dos Clientes por estado produçao
SELECT * FROM Projeto.Table_EncomendaCliente ORDER BY estado_prod;

--Ordenar Encomendas dos Clientes por estado pagamento
SELECT * FROM Projeto.Table_EncomendaCliente ORDER BY estado_paga;

----------------------Encomendas aos fornecedores-----------------------------------

-- Ordenar Encomendas aos fornecedores por nome
SELECT * FROM Projeto.Table_EncomendaFornecedor ORDER BY nome;

--Ordenar Encomendas aos fornecedores por data realização
SELECT * FROM Projeto.Table_EncomendaFornecedor ORDER BY data_in;

--Ordenar Encomendas aos fornecedores por data prevista para a chegada à carpintaria
SELECT * FROM Projeto.Table_EncomendaFornecedor ORDER BY data_in;

--Ordenar Encomendar aos fornecedores por estado de entrega
SELECT * FROM Projeto.Table_EncomendaFornecedor ORDER BY estado_entrega;

--Ordenar Encomendas aos fornecedores por estado pagamento
SELECT * FROM Projeto.Table_EncomendaFornecedor ORDER BY estado_pag;

---------------------Encomendas Construidas pelos funcionarios----------------------

--Ordenar encomendas por nomes de funcionarios
SELECT * FROM Projeto.Table_Constroi_Encomenda ORDER BY func_nome;

--Ordenar encomendas por id's de funcionarios
SELECT * FROM Projeto.Table_Constroi_Encomenda ORDER BY func_id;

--Ordenar encomendas por nomes e id's de funcionarios
SELECT * FROM Projeto.Table_Constroi_Encomenda ORDER BY func_nome, func_id;

--Ordenar encomendas por nomes de funcionarios e nomes de clientes
SELECT * FROM Projeto.Table_Constroi_Encomenda ORDER BY func_nome,cliente_nome;

--Ordenar encomendas por nomes de funcionarios
SELECT * FROM Projeto.Table_Constroi_Encomenda ORDER BY func_nome;

--Ordenar encomendas por id de encomendas de clientes
SELECT * FROM Projeto.Table_Constroi_Encomenda ORDER BY id_enc_cliente;

--------------------Materias primas fornecidas por um fornecedor--------------------

--Ordenar materia por fornecedores
SELECT * FROM Projeto.Table_Materia_Fornecida ORDER BY nome_fornecedor;

--Ordenar materia por id's de fornecedores
SELECT * FROM Projeto.Table_Materia_Fornecida ORDER BY fornecedor_id;

--Ordenar materia por nomes e id's de fornecedores
SELECT * FROM Projeto.Table_Materia_Fornecida ORDER BY nome_fornecedor, fornecedor_id;

--Ordenar materia por tipo
SELECT * FROM Projeto.Table_Materia_Fornecida ORDER BY materia_tipo;

--Ordenar materia por tipo e id
SELECT * FROM Projeto.Table_Materia_Fornecida ORDER BY materia_tipo, materia_id;

--Ordenar encomendas por nome fornecedor e materia_tipo
SELECT * FROM Projeto.Table_Materia_Fornecida ORDER BY nome_fornecedor,materia_tipo;

--------------------------Materia Precisa para construir------------------------------

-- Ordenar por tipo de materia precisa 
SELECT * FROM Projeto.Table_Materia_Precisa ORDER BY materia_tipo;

-- Ordenar por tipo de materia precsa ID
SELECT * FROM Projeto.Table_Materia_Precisa ORDER BY materia_id;

-- Ordenar por artigo_id
SELECT * FROM Projeto.Table_Materia_Precisa ORDER BY artigo_id;

--Ordenar por artigo_nome
SELECT * FROM Projeto.Table_Materia_Precisa ORDER BY artigo_nome;

--Ordenar por nome artigo e tipo materia
SELECT * FROM Projeto.Table_Materia_Precisa ORDER BY artigo_nome, materia_tipo;

----------------------Encomenda feita ao fornecedor----------------------------------

--Ordenar por nome de funcionario
SELECT * FROM Projeto.Table_Enc_Feita_Fornecedor ORDER BY func_nome;

--Ordenar por id de funcionario
SELECT * FROM Projeto.Table_Enc_Feita_Fornecedor ORDER BY func_id;

--Ordenar por encomenda
SELECT * FROM Projeto.Table_Enc_Feita_Fornecedor ORDER BY encomenda_id;

--Ordenar por nome de fornecedor
SELECT * FROM Projeto.Table_Enc_Feita_Fornecedor ORDER BY nome_fornecedor;

--Ordenar por id de fornecedor
SELECT * FROM Projeto.Table_Enc_Feita_Fornecedor ORDER BY fornecedor_id;

--Ordenar por nome funcionario, nome fornecedor, id encomenda
SELECT * FROM Projeto.Table_Enc_Feita_Fornecedor ORDER BY func_nome,nome_fornecedor,encomenda_id;

-----------------------Artigos da encomenda cliente----------------------------------

--Ordenar por nome de cliente
SELECT * FROM Projeto.Table_Contem_Encomenda_Cliente ORDER BY cliente_nome;

--Ordenar por id de cliente
SELECT * FROM Projeto.Table_Contem_Encomenda_Cliente ORDER BY cliente_id;

--Ordenar por nome de artigo
SELECT * FROM Projeto.Table_Contem_Encomenda_Cliente ORDER BY artigo_nome;

--Ordenar por id de artigo
SELECT * FROM Projeto.Table_Contem_Encomenda_Cliente ORDER BY artigo_id;

--Ordenar por id encomenda
SELECT * FROM Projeto.Table_Contem_Encomenda_Cliente ORDER BY encomenda_id;

--Ordenar por nome cliente, id encomeda, nome artigo
SELECT * FROM Projeto.Table_Contem_Encomenda_Cliente ORDER BY cliente_nome,encomenda_id, artigo_nome;

--