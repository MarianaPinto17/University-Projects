-- PROJETO DE CARPINTARIA
-- Realizado para a disciplina de Base de Dados
-- Mariana Pinto, nmec 84792
-- Gonçalo Arieiro, nmec 80130

--USE Carpintaria
--GO


--- Index----
---Fornecedores---

CREATE UNIQUE INDEX IxNIFF ON Projeto.Table_Fornecedores(nif)
GO

---Cliente---

CREATE UNIQUE INDEX IxNIFF ON Projeto.Table_Cliente(nif)
GO

---Funcionario---

CREATE UNIQUE INDEX IxNIFF ON Projeto.Table_Funcionario(nif)
GO

CREATE UNIQUE INDEX IxID ON Projeto.Table_Funcionario(id)
GO

---Matéria Prima---

CREATE UNIQUE INDEX IxTIPO ON Projeto.Table_MateriaPrima(tipo)
GO

---Artigo---

CREATE UNIQUE INDEX IxNOME ON Projeto.Table_Artigo(nome)
GO

---Encomenda Cliente---

CREATE INDEX IxPAGAMENTO ON Projeto.Table_EncomendaCliente(estado_paga)
GO

---Encomenda Fornecedor---

CREATE UNIQUE INDEX IxID ON Projeto.Table_EncomendaFornecedor(id)
GO


CREATE UNIQUE INDEX IxPAGA_FORN ON Projeto.Table_EncomendaFornecedor(estado_pag)
GO