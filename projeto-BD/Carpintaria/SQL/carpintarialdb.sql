USE [master]
GO
/****** Object:  Database [Carpintaria]    Script Date: 12/06/2020 22:03:32 ******/
CREATE DATABASE [Carpintaria]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Carpintaria', FILENAME = N'C:\Users\Mariana Pinto\Carpintaria.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Carpintaria_log', FILENAME = N'C:\Users\Mariana Pinto\Carpintaria_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Carpintaria] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Carpintaria].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Carpintaria] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Carpintaria] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Carpintaria] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Carpintaria] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Carpintaria] SET ARITHABORT OFF 
GO
ALTER DATABASE [Carpintaria] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Carpintaria] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Carpintaria] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Carpintaria] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Carpintaria] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Carpintaria] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Carpintaria] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Carpintaria] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Carpintaria] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Carpintaria] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Carpintaria] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Carpintaria] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Carpintaria] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Carpintaria] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Carpintaria] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Carpintaria] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Carpintaria] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Carpintaria] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Carpintaria] SET  MULTI_USER 
GO
ALTER DATABASE [Carpintaria] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Carpintaria] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Carpintaria] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Carpintaria] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Carpintaria] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Carpintaria] SET QUERY_STORE = OFF
GO
USE [Carpintaria]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [Carpintaria]
GO
/****** Object:  Schema [Projeto]    Script Date: 12/06/2020 22:03:32 ******/
CREATE SCHEMA [Projeto]
GO
/****** Object:  Table [Projeto].[Table_Fornecedores]    Script Date: 12/06/2020 22:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Projeto].[Table_Fornecedores](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[nif] [char](9) NOT NULL,
	[tel] [char](9) NOT NULL,
	[mail] [varchar](70) NULL,
	[morada] [varchar](100) NOT NULL,
	[metodo_pag] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [Projeto].[getFornecedorByname]    Script Date: 12/06/2020 22:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-------UDF's------

--get Fornecedor by name
CREATE FUNCTION [Projeto].[getFornecedorByname] (@forn_nome VARCHAR(50))
RETURNS TABLE

RETURN (
		SELECT *
FROM Projeto.Table_Fornecedores
WHERE nome = @forn_nome
		);
GO
/****** Object:  UserDefinedFunction [Projeto].[getFornecedorBynif]    Script Date: 12/06/2020 22:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--get Fornecedor by nif
CREATE FUNCTION [Projeto].[getFornecedorBynif] (@forn_nif CHAR(9))
RETURNS TABLE

RETURN (
		SELECT *
FROM Projeto.Table_Fornecedores
WHERE nif = @forn_nif
		);
GO
/****** Object:  UserDefinedFunction [Projeto].[getFornecedorBymail]    Script Date: 12/06/2020 22:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--get Fornecedor by mail
CREATE FUNCTION [Projeto].[getFornecedorBymail] (@forn_mail VARCHAR(70))
RETURNS TABLE

RETURN (
		SELECT *
FROM Projeto.Table_Fornecedores
WHERE mail = @forn_mail
		);
GO
/****** Object:  UserDefinedFunction [Projeto].[getFornecedorBytel]    Script Date: 12/06/2020 22:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--get Fornecedor by tel
CREATE FUNCTION [Projeto].[getFornecedorBytel] (@forn_tel CHAR(9))
RETURNS TABLE

RETURN (
		SELECT *
FROM Projeto.Table_Fornecedores
WHERE tel = @forn_tel
		);
GO
/****** Object:  Table [Projeto].[Table_Cliente]    Script Date: 12/06/2020 22:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Projeto].[Table_Cliente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[nif] [char](9) NOT NULL,
	[tel] [char](9) NOT NULL,
	[mail] [varchar](70) NULL,
	[morada] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [Projeto].[getClienteByname]    Script Date: 12/06/2020 22:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--get Cliente by name
CREATE FUNCTION [Projeto].[getClienteByname] (@client_nome VARCHAR(50))
RETURNS TABLE

RETURN (
		SELECT *
FROM Projeto.Table_Cliente
WHERE nome = @client_nome
		);
GO
/****** Object:  UserDefinedFunction [Projeto].[getClienteBynif]    Script Date: 12/06/2020 22:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--get Cliente by nif
CREATE FUNCTION [Projeto].[getClienteBynif] (@client_nif CHAR(9))
RETURNS TABLE

RETURN (
		SELECT *
FROM Projeto.Table_Cliente
WHERE nif = @client_nif
		);
GO
/****** Object:  UserDefinedFunction [Projeto].[getClienteBymail]    Script Date: 12/06/2020 22:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--get Cliente by mail
CREATE FUNCTION [Projeto].[getClienteBymail] (@client_mail VARCHAR(70))
RETURNS TABLE

RETURN (
		SELECT *
FROM Projeto.Table_Cliente
WHERE mail = @client_mail
		);
GO
/****** Object:  UserDefinedFunction [Projeto].[getClienteBytel]    Script Date: 12/06/2020 22:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--get Cliente by tel
CREATE FUNCTION [Projeto].[getClienteBytel] (@client_tel CHAR(9))
RETURNS TABLE

RETURN (
		SELECT *
FROM Projeto.Table_Cliente
WHERE tel = @client_tel
		);
GO
/****** Object:  Table [Projeto].[Table_Funcionario]    Script Date: 12/06/2020 22:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Projeto].[Table_Funcionario](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[nif] [char](9) NOT NULL,
	[tel] [char](9) NOT NULL,
	[mail] [varchar](70) NULL,
	[morada] [varchar](100) NOT NULL,
	[salario] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [Projeto].[getFuncionarioByname]    Script Date: 12/06/2020 22:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--get Funcionario by name
CREATE FUNCTION [Projeto].[getFuncionarioByname] (@funcionario_nome VARCHAR(50))
RETURNS TABLE

RETURN (
		SELECT *
FROM Projeto.Table_Funcionario
WHERE nome = @funcionario_nome
		);
GO
/****** Object:  UserDefinedFunction [Projeto].[getFuncionarioBynif]    Script Date: 12/06/2020 22:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--get Funcionario by nif
CREATE FUNCTION [Projeto].[getFuncionarioBynif] (@funcionario_nif CHAR(9))
RETURNS TABLE

RETURN (
		SELECT *
FROM Projeto.Table_Funcionario
WHERE nif = @funcionario_nif
		);
GO
/****** Object:  UserDefinedFunction [Projeto].[getFuncionarioBymail]    Script Date: 12/06/2020 22:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--get Funcionario by mail
CREATE FUNCTION [Projeto].[getFuncionarioBymail] (@funcionario_mail VARCHAR(70))
RETURNS TABLE

RETURN (
		SELECT *
FROM Projeto.Table_Funcionario
WHERE mail = @funcionario_mail
		);
GO
/****** Object:  UserDefinedFunction [Projeto].[getFuncionarioBytel]    Script Date: 12/06/2020 22:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--get Funcionario by tel
CREATE FUNCTION [Projeto].[getFuncionarioBytel] (@funcionario_tel CHAR(9))
RETURNS TABLE

RETURN (
		SELECT *
FROM Projeto.Table_Funcionario
WHERE tel = @funcionario_tel
		);
GO
/****** Object:  Table [Projeto].[Table_MateriaPrima]    Script Date: 12/06/2020 22:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Projeto].[Table_MateriaPrima](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[tipo] [varchar](50) NOT NULL,
	[quantidade] [int] NOT NULL,
	[preco] [int] NOT NULL,
	[tamanho] [varchar](50) NULL,
	[tempo_seca] [int] NULL,
	[marca] [varchar](50) NOT NULL,
	[cor] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [Projeto].[getMateriaPrimaBytipo]    Script Date: 12/06/2020 22:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--get MateriaPrima by tipo
CREATE FUNCTION [Projeto].[getMateriaPrimaBytipo] (@materia_tipo VARCHAR(50))
RETURNS TABLE

RETURN (
		SELECT *
FROM Projeto.Table_MateriaPrima
WHERE tipo = @materia_tipo
		);
GO
/****** Object:  Table [Projeto].[Table_Artigo]    Script Date: 12/06/2020 22:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Projeto].[Table_Artigo](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[nome] [varchar](50) NOT NULL,
	[preco] [int] NOT NULL,
	[quantidade] [int] NOT NULL,
	[descricao] [varchar](500) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [Projeto].[getArtigoBynome]    Script Date: 12/06/2020 22:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--get Artigo by nome
CREATE FUNCTION [Projeto].[getArtigoBynome] (@artigo_nome VARCHAR(50))
RETURNS TABLE

RETURN (
		SELECT *
FROM Projeto.Table_Artigo
WHERE nome = @artigo_nome
		);
GO
/****** Object:  Table [Projeto].[Table_EncomendaCliente]    Script Date: 12/06/2020 22:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Projeto].[Table_EncomendaCliente](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[cliente_id] [int] NOT NULL,
	[data_in] [date] NOT NULL,
	[data_out] [date] NOT NULL,
	[descricao] [varchar](500) NOT NULL,
	[estado_prod] [varchar](100) NOT NULL,
	[estado_paga] [varchar](100) NOT NULL,
	[preco] [int] NOT NULL,
	[cliente_nome] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [Projeto].[getClienteEncomendaBynome]    Script Date: 12/06/2020 22:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--get ClienteEncomenda by mome
CREATE FUNCTION [Projeto].[getClienteEncomendaBynome] (@nome VARCHAR(50))
RETURNS TABLE

RETURN (
		SELECT *
FROM Projeto.Table_EncomendaCliente
WHERE cliente_nome = @nome
		);
GO
/****** Object:  UserDefinedFunction [Projeto].[getClienteEncomendaBypagamento]    Script Date: 12/06/2020 22:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--get ClienteEncomenda by Estado de Pagamento
CREATE FUNCTION [Projeto].[getClienteEncomendaBypagamento] (@pagamento VARCHAR(50))
RETURNS TABLE

RETURN (
		SELECT *
FROM Projeto.Table_EncomendaCliente
WHERE estado_paga = @pagamento
		);
GO
/****** Object:  Table [Projeto].[Table_EncomendaFornecedor]    Script Date: 12/06/2020 22:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Projeto].[Table_EncomendaFornecedor](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[funcionario_id] [int] NOT NULL,
	[data_in] [date] NOT NULL,
	[data_out] [date] NOT NULL,
	[preco] [int] NOT NULL,
	[descrição] [varchar](500) NOT NULL,
	[estado_entrega] [varchar](100) NOT NULL,
	[estado_pag] [varchar](100) NOT NULL,
	[funcionario_nome] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [Projeto].[getEncomendaFornecedorBynome]    Script Date: 12/06/2020 22:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--get EncomendaFornecedor by nome funcionario
CREATE FUNCTION [Projeto].[getEncomendaFornecedorBynome] (@nome VARCHAR(50))
RETURNS TABLE

RETURN (
		SELECT *
FROM Projeto.Table_EncomendaFornecedor
WHERE funcionario_nome = @nome
		);
GO
/****** Object:  UserDefinedFunction [Projeto].[getEncomendaFornecedorByidfunc]    Script Date: 12/06/2020 22:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--get EncomendaFornecedor by id funcionario
CREATE FUNCTION [Projeto].[getEncomendaFornecedorByidfunc] (@id INT)
RETURNS TABLE

RETURN (
		SELECT *
FROM Projeto.Table_EncomendaFornecedor
WHERE funcionario_id = @id
		);
GO
/****** Object:  UserDefinedFunction [Projeto].[getEncomendaFornecedorBypagamento]    Script Date: 12/06/2020 22:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--get EncomendaFornecedor by estado de pagamento
CREATE FUNCTION [Projeto].[getEncomendaFornecedorBypagamento] (@pagamento VARCHAR(50))
RETURNS TABLE

RETURN (
		SELECT *
FROM Projeto.Table_EncomendaFornecedor
WHERE estado_pag = @pagamento
		);
GO
/****** Object:  UserDefinedFunction [Projeto].[getEncomendaFornecedorByentrega]    Script Date: 12/06/2020 22:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--get EncomendaFornecedor by estado entrega
CREATE FUNCTION [Projeto].[getEncomendaFornecedorByentrega] (@entrega VARCHAR(50))
RETURNS TABLE

RETURN (
		SELECT *
FROM Projeto.Table_EncomendaFornecedor
WHERE estado_entrega = @entrega
		);
GO
/****** Object:  Table [Projeto].[Table_Carpintaria]    Script Date: 12/06/2020 22:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Projeto].[Table_Carpintaria](
	[nome] [varchar](50) NOT NULL,
	[nif] [char](9) NOT NULL,
	[tel] [char](9) NOT NULL,
	[mail] [varchar](70) NOT NULL,
	[morada] [varchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[nif] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Projeto].[Table_ConstroiEncomenda]    Script Date: 12/06/2020 22:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Projeto].[Table_ConstroiEncomenda](
	[id_enc_cliente] [int] NOT NULL,
	[func_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id_enc_cliente] ASC,
	[func_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Projeto].[Table_ContemEncomendaCliente]    Script Date: 12/06/2020 22:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Projeto].[Table_ContemEncomendaCliente](
	[artigo_id] [int] NOT NULL,
	[encomenda_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[encomenda_id] ASC,
	[artigo_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Projeto].[Table_EncFeitaFornecedor]    Script Date: 12/06/2020 22:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Projeto].[Table_EncFeitaFornecedor](
	[encomenda_id] [int] NOT NULL,
	[fornecedor_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[encomenda_id] ASC,
	[fornecedor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Projeto].[Table_LogIn]    Script Date: 12/06/2020 22:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Projeto].[Table_LogIn](
	[username] [varchar](50) NOT NULL,
	[password] [varchar](10) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Projeto].[Table_MateriaFornecida]    Script Date: 12/06/2020 22:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Projeto].[Table_MateriaFornecida](
	[materia_id] [int] NOT NULL,
	[fornecedor_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[materia_id] ASC,
	[fornecedor_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Projeto].[Table_MateriaPrecisa]    Script Date: 12/06/2020 22:03:32 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Projeto].[Table_MateriaPrecisa](
	[artigo_id] [int] NOT NULL,
	[materia_id] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[artigo_id] ASC,
	[materia_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [Projeto].[Table_Artigo] ON 

INSERT [Projeto].[Table_Artigo] ([id], [nome], [preco], [quantidade], [descricao]) VALUES (2, N'Mesa', 70, 1, N'mesa de mardeira de carvalho')
INSERT [Projeto].[Table_Artigo] ([id], [nome], [preco], [quantidade], [descricao]) VALUES (3, N'Porta', 40, 2, N'Porta de mardeira de carvalho')
SET IDENTITY_INSERT [Projeto].[Table_Artigo] OFF
SET IDENTITY_INSERT [Projeto].[Table_Cliente] ON 

INSERT [Projeto].[Table_Cliente] ([id], [nome], [nif], [tel], [mail], [morada]) VALUES (1, N'Manuel', N'123456789', N'123456666', N'manuel@ua.pt', N'Rua da Alegria')
INSERT [Projeto].[Table_Cliente] ([id], [nome], [nif], [tel], [mail], [morada]) VALUES (2, N'Antonio', N'123776789', N'987654321', N'antonio@ua.pt', N'Rua do Porto')
INSERT [Projeto].[Table_Cliente] ([id], [nome], [nif], [tel], [mail], [morada]) VALUES (3, N'Pedro', N'123456777', N'111111111', N'pedro@ua.pt', N'Rua da Vista')
INSERT [Projeto].[Table_Cliente] ([id], [nome], [nif], [tel], [mail], [morada]) VALUES (4, N'Ana', N'123456111', N'237777790', N'ana@ua.pt', N'Rua da Alo')
INSERT [Projeto].[Table_Cliente] ([id], [nome], [nif], [tel], [mail], [morada]) VALUES (5, N'Maria', N'123452222', N'234555555', N'maria@ua.pt', N'Rua da Alegre')
SET IDENTITY_INSERT [Projeto].[Table_Cliente] OFF
SET IDENTITY_INSERT [Projeto].[Table_EncomendaCliente] ON 

INSERT [Projeto].[Table_EncomendaCliente] ([id], [cliente_id], [data_in], [data_out], [descricao], [estado_prod], [estado_paga], [preco], [cliente_nome]) VALUES (1, 1, CAST(N'2020-06-12' AS Date), CAST(N'2020-06-19' AS Date), N'6 CADEIRAS', N'produzidas', N'por pagar', 30, NULL)
INSERT [Projeto].[Table_EncomendaCliente] ([id], [cliente_id], [data_in], [data_out], [descricao], [estado_prod], [estado_paga], [preco], [cliente_nome]) VALUES (2, 3, CAST(N'2020-06-12' AS Date), CAST(N'2020-06-19' AS Date), N'7 CADEIRAS', N'produzidas', N'pagas', 35, NULL)
INSERT [Projeto].[Table_EncomendaCliente] ([id], [cliente_id], [data_in], [data_out], [descricao], [estado_prod], [estado_paga], [preco], [cliente_nome]) VALUES (3, 4, CAST(N'2020-06-12' AS Date), CAST(N'2020-06-19' AS Date), N'8 CADEIRAS', N'produzidas', N'pagas', 40, NULL)
INSERT [Projeto].[Table_EncomendaCliente] ([id], [cliente_id], [data_in], [data_out], [descricao], [estado_prod], [estado_paga], [preco], [cliente_nome]) VALUES (4, 2, CAST(N'2020-06-12' AS Date), CAST(N'2020-06-19' AS Date), N'9 CADEIRAS', N'por produzir', N'pagas', 45, NULL)
SET IDENTITY_INSERT [Projeto].[Table_EncomendaCliente] OFF
SET IDENTITY_INSERT [Projeto].[Table_Fornecedores] ON 

INSERT [Projeto].[Table_Fornecedores] ([id], [nome], [nif], [tel], [mail], [morada], [metodo_pag]) VALUES (1, N'Forne1', N'987546120', N'123456879', N'forn1l@ua.pt', N'Rua da Alegria', N'10 dias')
INSERT [Projeto].[Table_Fornecedores] ([id], [nome], [nif], [tel], [mail], [morada], [metodo_pag]) VALUES (2, N'Forne2', N'456123987', N'564687983', N'forn2@ua.pt', N'Rua do Porto', N'na hora')
INSERT [Projeto].[Table_Fornecedores] ([id], [nome], [nif], [tel], [mail], [morada], [metodo_pag]) VALUES (3, N'Forn3', N'098547187', N'555555555', N'forn3@ua.pt', N'Rua da Vista', N'na hora')
INSERT [Projeto].[Table_Fornecedores] ([id], [nome], [nif], [tel], [mail], [morada], [metodo_pag]) VALUES (4, N'Forn4', N'125487789', N'666666666', N'forn4@ua.pt', N'Rua da Alo', N'na hora')
INSERT [Projeto].[Table_Fornecedores] ([id], [nome], [nif], [tel], [mail], [morada], [metodo_pag]) VALUES (5, N'Forn5', N'123452442', N'454545454', N'forn5@ua.pt', N'Rua da Alegre', N'na hora')
SET IDENTITY_INSERT [Projeto].[Table_Fornecedores] OFF
SET IDENTITY_INSERT [Projeto].[Table_Funcionario] ON 

INSERT [Projeto].[Table_Funcionario] ([id], [nome], [nif], [tel], [mail], [morada], [salario]) VALUES (1, N'Manuela', N'321456781', N'123456666', N'manuel@ua.pt', N'Rua da Alegria', 100)
INSERT [Projeto].[Table_Funcionario] ([id], [nome], [nif], [tel], [mail], [morada], [salario]) VALUES (2, N'Antonia', N'123556789', N'987654321', N'antonio@ua.pt', N'Rua do Porto', 100)
INSERT [Projeto].[Table_Funcionario] ([id], [nome], [nif], [tel], [mail], [morada], [salario]) VALUES (3, N'Afonso', N'123456744', N'111111111', N'pedro@ua.pt', N'Rua da Vista', 100)
INSERT [Projeto].[Table_Funcionario] ([id], [nome], [nif], [tel], [mail], [morada], [salario]) VALUES (4, N'Anabela', N'123456441', N'237777790', N'ana@ua.pt', N'Rua da Alo', 100)
INSERT [Projeto].[Table_Funcionario] ([id], [nome], [nif], [tel], [mail], [morada], [salario]) VALUES (5, N'Mariana', N'123452442', N'234555555', N'maria@ua.pt', N'Rua da Alegre', 100)
SET IDENTITY_INSERT [Projeto].[Table_Funcionario] OFF
SET ANSI_PADDING ON
GO
/****** Object:  Index [IxNOME]    Script Date: 12/06/2020 22:03:33 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IxNOME] ON [Projeto].[Table_Artigo]
(
	[nome] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Table_Ca__DF97D0F2FAA88403]    Script Date: 12/06/2020 22:03:33 ******/
ALTER TABLE [Projeto].[Table_Carpintaria] ADD UNIQUE NONCLUSTERED 
(
	[nif] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Table_Cl__DF97D0F29A4C5B9B]    Script Date: 12/06/2020 22:03:33 ******/
ALTER TABLE [Projeto].[Table_Cliente] ADD UNIQUE NONCLUSTERED 
(
	[nif] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IxNIFF]    Script Date: 12/06/2020 22:03:33 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IxNIFF] ON [Projeto].[Table_Cliente]
(
	[nif] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IxPAGAMENTO]    Script Date: 12/06/2020 22:03:33 ******/
CREATE NONCLUSTERED INDEX [IxPAGAMENTO] ON [Projeto].[Table_EncomendaCliente]
(
	[estado_paga] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IxID]    Script Date: 12/06/2020 22:03:33 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IxID] ON [Projeto].[Table_EncomendaFornecedor]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IxPAGA_FORN]    Script Date: 12/06/2020 22:03:33 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IxPAGA_FORN] ON [Projeto].[Table_EncomendaFornecedor]
(
	[estado_pag] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Table_Fo__DF97D0F21BCBC710]    Script Date: 12/06/2020 22:03:33 ******/
ALTER TABLE [Projeto].[Table_Fornecedores] ADD UNIQUE NONCLUSTERED 
(
	[nif] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IxNIFF]    Script Date: 12/06/2020 22:03:33 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IxNIFF] ON [Projeto].[Table_Fornecedores]
(
	[nif] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Table_Fu__DF97D0F2FDF3A781]    Script Date: 12/06/2020 22:03:33 ******/
ALTER TABLE [Projeto].[Table_Funcionario] ADD UNIQUE NONCLUSTERED 
(
	[nif] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IxID]    Script Date: 12/06/2020 22:03:33 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IxID] ON [Projeto].[Table_Funcionario]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IxNIFF]    Script Date: 12/06/2020 22:03:33 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IxNIFF] ON [Projeto].[Table_Funcionario]
(
	[nif] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IxTIPO]    Script Date: 12/06/2020 22:03:33 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IxTIPO] ON [Projeto].[Table_MateriaPrima]
(
	[tipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Projeto].[Table_ConstroiEncomenda]  WITH CHECK ADD FOREIGN KEY([func_id])
REFERENCES [Projeto].[Table_Funcionario] ([id])
GO
ALTER TABLE [Projeto].[Table_ConstroiEncomenda]  WITH CHECK ADD FOREIGN KEY([id_enc_cliente])
REFERENCES [Projeto].[Table_EncomendaCliente] ([id])
GO
ALTER TABLE [Projeto].[Table_ContemEncomendaCliente]  WITH CHECK ADD FOREIGN KEY([artigo_id])
REFERENCES [Projeto].[Table_Artigo] ([id])
GO
ALTER TABLE [Projeto].[Table_ContemEncomendaCliente]  WITH CHECK ADD FOREIGN KEY([encomenda_id])
REFERENCES [Projeto].[Table_EncomendaCliente] ([id])
GO
ALTER TABLE [Projeto].[Table_EncFeitaFornecedor]  WITH CHECK ADD FOREIGN KEY([encomenda_id])
REFERENCES [Projeto].[Table_EncomendaFornecedor] ([id])
GO
ALTER TABLE [Projeto].[Table_EncFeitaFornecedor]  WITH CHECK ADD FOREIGN KEY([fornecedor_id])
REFERENCES [Projeto].[Table_Fornecedores] ([id])
GO
ALTER TABLE [Projeto].[Table_EncomendaCliente]  WITH CHECK ADD FOREIGN KEY([cliente_id])
REFERENCES [Projeto].[Table_Cliente] ([id])
GO
ALTER TABLE [Projeto].[Table_EncomendaFornecedor]  WITH CHECK ADD FOREIGN KEY([funcionario_id])
REFERENCES [Projeto].[Table_Funcionario] ([id])
GO
ALTER TABLE [Projeto].[Table_MateriaFornecida]  WITH CHECK ADD FOREIGN KEY([fornecedor_id])
REFERENCES [Projeto].[Table_Fornecedores] ([id])
GO
ALTER TABLE [Projeto].[Table_MateriaFornecida]  WITH CHECK ADD FOREIGN KEY([materia_id])
REFERENCES [Projeto].[Table_MateriaPrima] ([id])
GO
ALTER TABLE [Projeto].[Table_MateriaPrecisa]  WITH CHECK ADD FOREIGN KEY([artigo_id])
REFERENCES [Projeto].[Table_Artigo] ([id])
GO
ALTER TABLE [Projeto].[Table_MateriaPrecisa]  WITH CHECK ADD FOREIGN KEY([materia_id])
REFERENCES [Projeto].[Table_MateriaPrima] ([id])
GO
/****** Object:  StoredProcedure [Projeto].[getArtigo]    Script Date: 12/06/2020 22:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- getArtigo
CREATE PROCEDURE [Projeto].[getArtigo]
AS
SELECT *
FROM Projeto.Table_Artigo
GO
/****** Object:  StoredProcedure [Projeto].[getCarpintaria]    Script Date: 12/06/2020 22:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

---Procedures----
--getCarpintaria
CREATE PROCEDURE [Projeto].[getCarpintaria]
AS
SELECT *
FROM Projeto.Table_Carpintaria
GO
/****** Object:  StoredProcedure [Projeto].[getCliente]    Script Date: 12/06/2020 22:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- getClientes
CREATE PROCEDURE [Projeto].[getCliente]
AS
SELECT *
FROM Projeto.Table_Cliente
GO
/****** Object:  StoredProcedure [Projeto].[getConstroiEncomenda]    Script Date: 12/06/2020 22:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- getConstroiEncomenda
CREATE PROCEDURE [Projeto].[getConstroiEncomenda]
AS
SELECT *
FROM Projeto.Table_ConstroiEncomenda
GO
/****** Object:  StoredProcedure [Projeto].[getContemEncomenda]    Script Date: 12/06/2020 22:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--getContemEncomendaCliente
CREATE PROCEDURE [Projeto].[getContemEncomenda]
AS
SELECT *
FROM Projeto.Table_ContemEncomendaCliente
GO
/****** Object:  StoredProcedure [Projeto].[getEncFeitaFornecedor]    Script Date: 12/06/2020 22:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--getEncFeitaFornecedor
CREATE PROCEDURE [Projeto].[getEncFeitaFornecedor]
AS
SELECT *
FROM Projeto.Table_EncFeitaFornecedor
GO
/****** Object:  StoredProcedure [Projeto].[getEncomendaCliente]    Script Date: 12/06/2020 22:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- getEncomendaCliente
CREATE PROCEDURE [Projeto].[getEncomendaCliente]
AS
SELECT *
FROM Projeto.Table_EncomendaCliente
GO
/****** Object:  StoredProcedure [Projeto].[getEncomendaFornecedor]    Script Date: 12/06/2020 22:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- getEncomendaFornecedor
CREATE PROCEDURE [Projeto].[getEncomendaFornecedor]
AS
SELECT *
FROM Projeto.Table_EncomendaFornecedor
GO
/****** Object:  StoredProcedure [Projeto].[getFornecedor]    Script Date: 12/06/2020 22:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec Projeto.getLogIn

--getFornecedores
CREATE PROCEDURE [Projeto].[getFornecedor]
AS
SELECT *
FROM Projeto.Table_Fornecedores
GO
/****** Object:  StoredProcedure [Projeto].[getFuncionario]    Script Date: 12/06/2020 22:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--getFuncionário
CREATE PROCEDURE [Projeto].[getFuncionario]
AS
SELECT *
FROM Projeto.Table_Funcionario
GO
/****** Object:  StoredProcedure [Projeto].[getLogIn]    Script Date: 12/06/2020 22:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec Projeto.getCarpintaria

--getLogIn
CREATE PROCEDURE [Projeto].[getLogIn]
AS
SELECT *
FROM Projeto.Table_LogIn
GO
/****** Object:  StoredProcedure [Projeto].[getMateriaFornececida]    Script Date: 12/06/2020 22:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--getMateriaFornececida
CREATE PROCEDURE [Projeto].[getMateriaFornececida]
AS
SELECT *
FROM Projeto.Table_MateriaFornecida
GO
/****** Object:  StoredProcedure [Projeto].[getMateriaPrecisa]    Script Date: 12/06/2020 22:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--getMateriaPrecisa
CREATE PROCEDURE [Projeto].[getMateriaPrecisa]
AS
SELECT *
FROM Projeto.Table_MateriaPrecisa
GO
/****** Object:  StoredProcedure [Projeto].[getMateriaPrima]    Script Date: 12/06/2020 22:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- getMateriaPrima
CREATE PROCEDURE [Projeto].[getMateriaPrima]
AS
SELECT *
FROM Projeto.Table_MateriaPrima
GO
/****** Object:  StoredProcedure [Projeto].[InsertArtigo]    Script Date: 12/06/2020 22:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--insertArtigo

--exec Projeto.InsertArtigo
--	@nome = 'Cadeira',  
--	@preço = 100,
--	@quantidade =  1,
--	@descricao = 'Mesa de sala(200x200), castanho escura';

--Done 100%
CREATE PROCEDURE [Projeto].[InsertArtigo]
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
/****** Object:  StoredProcedure [Projeto].[InsertCliente]    Script Date: 12/06/2020 22:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--InsertCliente

--EXEC Projeto.InsertCliente
--	@nome = 'Pedro Afonso',
--	@nif = '123456780',
--	@tel = '967744324',
--	@mail = 'costa@ua.pt',
--	@morada = 'Rua do Teste';

--Done 100%
CREATE PROCEDURE [Projeto].[InsertCliente]
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
/****** Object:  StoredProcedure [Projeto].[InsertConstroiEncomenda]    Script Date: 12/06/2020 22:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--InsertConstroiEncomenda
--EXEC Projeto.InsertConstroiEncomenda
--	@id_enc_cliente = 3,
--	@func_id = 5;

--Done 100%
CREATE PROCEDURE [Projeto].[InsertConstroiEncomenda] 
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
/****** Object:  StoredProcedure [Projeto].[InsertContemEncomendaCliente]    Script Date: 12/06/2020 22:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--InsertContemEncomendaCliente

--EXEC Projeto.InsertContemEncomendaCliente
--	@artigo_id = 3,
--	@encomenda_id = 3;
	
--Done 100%
CREATE PROCEDURE [Projeto].[InsertContemEncomendaCliente]
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
/****** Object:  StoredProcedure [Projeto].[InsertEncFeitaFornecedor]    Script Date: 12/06/2020 22:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--insertEncFeitaFornecedor

--EXEC Projeto.InsertEncFeitaFornecedor
--	@encomenda_id = 5,
--	@fornecedor_id = 1;
	
--Done 100%
CREATE PROCEDURE [Projeto].[InsertEncFeitaFornecedor]
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
/****** Object:  StoredProcedure [Projeto].[InsertEncomendaCliente]    Script Date: 12/06/2020 22:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
CREATE PROCEDURE [Projeto].[InsertEncomendaCliente]
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
/****** Object:  StoredProcedure [Projeto].[InsertFornecedor]    Script Date: 12/06/2020 22:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
CREATE PROCEDURE [Projeto].[InsertFornecedor]
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
/****** Object:  StoredProcedure [Projeto].[InsertFuncionario]    Script Date: 12/06/2020 22:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
CREATE PROCEDURE [Projeto].[InsertFuncionario]
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
/****** Object:  StoredProcedure [Projeto].[InsertMateriaFornececida]    Script Date: 12/06/2020 22:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--InsertMateriaFornececida

--EXEC Projeto.InsertMateriaFornececida
--	@materia_id = 5,
--	@fornecedor_id = 1;
	
--Done 100%
CREATE PROCEDURE [Projeto].[InsertMateriaFornececida]
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
/****** Object:  StoredProcedure [Projeto].[InsertMateriaPrecisa]    Script Date: 12/06/2020 22:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--InsertMateriaPrecisa

--EXEC Projeto.InsertMateriaPrecisa
--	@artigo_id = 3,
--	@materia_id = 3;

--Done 100%
CREATE PROCEDURE [Projeto].[InsertMateriaPrecisa]
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
/****** Object:  StoredProcedure [Projeto].[InsertMateriaPrima]    Script Date: 12/06/2020 22:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
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
CREATE PROCEDURE [Projeto].[InsertMateriaPrima]
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
/****** Object:  StoredProcedure [Projeto].[RemoveArtigo]    Script Date: 12/06/2020 22:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC Projeto.RemoveMateriaPrima @id = 1;

--Artigo
CREATE PROCEDURE [Projeto].[RemoveArtigo](@id int)
AS
BEGIN TRAN
   DELETE FROM Projeto.Table_Artigo WHERE id = @id 
COMMIT TRAN
GO
/****** Object:  StoredProcedure [Projeto].[RemoveCliente]    Script Date: 12/06/2020 22:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC Projeto.RemoveFornecedor @id = 1;

--RemoveCliente
CREATE PROCEDURE [Projeto].[RemoveCliente](@id int)
AS
BEGIN TRAN
   DELETE FROM Projeto.Table_Cliente WHERE id = @id 
COMMIT TRAN
GO
/****** Object:  StoredProcedure [Projeto].[RemoveEncomendaCliente]    Script Date: 12/06/2020 22:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC Projeto.RemoveArtigo @id = 1;

--EncomendaCliente
CREATE PROCEDURE [Projeto].[RemoveEncomendaCliente](@id int)
AS
BEGIN TRAN
   DELETE FROM Projeto.Table_EncomendaCliente WHERE id = @id 
COMMIT TRAN
GO
/****** Object:  StoredProcedure [Projeto].[RemoveEncomendaFornecedor]    Script Date: 12/06/2020 22:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--EXEC Projeto.RemoveEncomendaCliente @id = 3;

--EncomendaFornecedor
CREATE PROCEDURE [Projeto].[RemoveEncomendaFornecedor](@id int)
AS
BEGIN TRAN
   DELETE FROM Projeto.Table_EncomendaFornecedor WHERE id = @id 
COMMIT TRAN
GO
/****** Object:  StoredProcedure [Projeto].[RemoveFornecedor]    Script Date: 12/06/2020 22:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----Removes----

--RemoveFornecedor
CREATE PROCEDURE [Projeto].[RemoveFornecedor](@id int)
AS
BEGIN TRAN
   DELETE FROM Projeto.Table_Fornecedores WHERE id = @id 
COMMIT TRAN
GO
/****** Object:  StoredProcedure [Projeto].[RemoveFuncionario]    Script Date: 12/06/2020 22:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC Projeto.RemoveCliente @id = 1;

--RemoveFuncionario
CREATE PROCEDURE [Projeto].[RemoveFuncionario](@id int)
AS
BEGIN TRAN
   DELETE FROM Projeto.Table_Funcionario WHERE id = @id 
COMMIT TRAN
GO
/****** Object:  StoredProcedure [Projeto].[RemoveMateriaPrima]    Script Date: 12/06/2020 22:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--EXEC Projeto.RemoveFuncionario @id = 1;

--RemoveMateriaPrima
CREATE PROCEDURE [Projeto].[RemoveMateriaPrima](@id int)
AS
BEGIN TRAN
   DELETE FROM Projeto.Table_MateriaPrima WHERE id = @id 
COMMIT TRAN
GO
/****** Object:  StoredProcedure [Projeto].[UpdateCliente]    Script Date: 12/06/2020 22:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--updateCliente
--100% Done
CREATE PROCEDURE [Projeto].[UpdateCliente]
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
/****** Object:  StoredProcedure [Projeto].[UpdateEncomendaCliente]    Script Date: 12/06/2020 22:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--updateEncomendaCliente
--EXEC Projeto.UpdateEncomendaCliente @ids = 5, @nif = '999999999', @data_in = '2020-06-15',
--	@data_out = '2020-06-16', @descricao = 'Moveis teste', @estado_prod = 'Teste', @estado_paga = 'pago', @preco = 6
--GO
--100% Done
CREATE PROCEDURE [Projeto].[UpdateEncomendaCliente]
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
/****** Object:  StoredProcedure [Projeto].[UpdateEncomendaFornecedor]    Script Date: 12/06/2020 22:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--updateEncomendaFornecedor
--EXEC Projeto.UpdateEncomendaFornecedor @ids = 5, @nif = '123556789', @data_in = '2020-06-15',
--	@data_out = '2020-06-18', @descrição = 'Moveis castanhos e mesa da cozinha', @estado_entrega = 'Teste', @estado_pag = 'pago', @preco = 8
--	GO
--100% Done
CREATE PROCEDURE [Projeto].[UpdateEncomendaFornecedor]
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
/****** Object:  StoredProcedure [Projeto].[UpdateFornecedor]    Script Date: 12/06/2020 22:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--updateFornecedor
--100% Done
CREATE PROCEDURE [Projeto].[UpdateFornecedor]
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
/****** Object:  StoredProcedure [Projeto].[UpdateFuncionario]    Script Date: 12/06/2020 22:03:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

----Updates----

--updateFuncionario
--100% Done
CREATE PROCEDURE [Projeto].[UpdateFuncionario]
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
USE [master]
GO
ALTER DATABASE [Carpintaria] SET  READ_WRITE 
GO
