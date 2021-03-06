USE [master]
GO
/****** Object:  Database [dbcantina]    Script Date: 17/03/2016 01:19:00 ******/
CREATE DATABASE [dbcantina]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'dbcantina', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\dbcantina.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'dbcantina_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\dbcantina_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [dbcantina] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [dbcantina].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [dbcantina] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [dbcantina] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [dbcantina] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [dbcantina] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [dbcantina] SET ARITHABORT OFF 
GO
ALTER DATABASE [dbcantina] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [dbcantina] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [dbcantina] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [dbcantina] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [dbcantina] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [dbcantina] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [dbcantina] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [dbcantina] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [dbcantina] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [dbcantina] SET  DISABLE_BROKER 
GO
ALTER DATABASE [dbcantina] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [dbcantina] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [dbcantina] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [dbcantina] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [dbcantina] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [dbcantina] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [dbcantina] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [dbcantina] SET RECOVERY FULL 
GO
ALTER DATABASE [dbcantina] SET  MULTI_USER 
GO
ALTER DATABASE [dbcantina] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [dbcantina] SET DB_CHAINING OFF 
GO
ALTER DATABASE [dbcantina] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [dbcantina] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [dbcantina] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'dbcantina', N'ON'
GO
USE [dbcantina]
GO
/****** Object:  Table [dbo].[tbl_cliente]    Script Date: 17/03/2016 01:19:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_cliente](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[nome_cliente] [varchar](max) NULL,
	[telefone_cliente] [varchar](20) NULL,
 CONSTRAINT [PK_tbl_cliente] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_conta]    Script Date: 17/03/2016 01:19:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_conta](
	[id_conta] [int] IDENTITY(1,1) NOT NULL,
	[id_cliente] [int] NULL,
	[limite] [money] NULL,
 CONSTRAINT [PK_tbl_conta] PRIMARY KEY CLUSTERED 
(
	[id_conta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_funcionario]    Script Date: 17/03/2016 01:19:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_funcionario](
	[id_funcionario] [int] IDENTITY(1,1) NOT NULL,
	[nome_funcionario] [varchar](max) NULL,
	[matricula_funcionario] [varchar](10) NULL,
 CONSTRAINT [PK_tbl_funcionario] PRIMARY KEY CLUSTERED 
(
	[id_funcionario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_pagamento]    Script Date: 17/03/2016 01:19:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_pagamento](
	[id_pagamento] [int] IDENTITY(1,1) NOT NULL,
	[data_pagamento] [date] NULL,
	[valor_pagamento] [money] NULL,
	[id_conta] [int] NULL,
 CONSTRAINT [PK_tbl_pagamento] PRIMARY KEY CLUSTERED 
(
	[id_pagamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_produto]    Script Date: 17/03/2016 01:19:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_produto](
	[id_produto] [int] IDENTITY(1,1) NOT NULL,
	[descricao_produto] [varchar](max) NULL,
	[preco_unitario] [money] NULL,
 CONSTRAINT [PK_tbl_produto] PRIMARY KEY CLUSTERED 
(
	[id_produto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tbl_venda]    Script Date: 17/03/2016 01:19:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_venda](
	[id_venda] [int] IDENTITY(1,1) NOT NULL,
	[data_venda] [date] NULL,
	[id_cliente] [int] NULL,
	[id_funcionario] [int] NULL,
 CONSTRAINT [PK_tbl_venda] PRIMARY KEY CLUSTERED 
(
	[id_venda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_venda_produto]    Script Date: 17/03/2016 01:19:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_venda_produto](
	[id_venda] [int] NOT NULL,
	[id_produto] [int] NOT NULL,
	[quantidade] [int] NULL,
 CONSTRAINT [PK_tbl_venda_produto] PRIMARY KEY CLUSTERED 
(
	[id_venda] ASC,
	[id_produto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[tbl_conta]  WITH CHECK ADD  CONSTRAINT [FK_tbl_conta_tbl_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[tbl_cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[tbl_conta] CHECK CONSTRAINT [FK_tbl_conta_tbl_cliente]
GO
ALTER TABLE [dbo].[tbl_pagamento]  WITH CHECK ADD  CONSTRAINT [FK_tbl_pagamento_tbl_conta] FOREIGN KEY([id_conta])
REFERENCES [dbo].[tbl_conta] ([id_conta])
GO
ALTER TABLE [dbo].[tbl_pagamento] CHECK CONSTRAINT [FK_tbl_pagamento_tbl_conta]
GO
ALTER TABLE [dbo].[tbl_venda]  WITH CHECK ADD  CONSTRAINT [FK_tbl_venda_tbl_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[tbl_cliente] ([id_cliente])
GO
ALTER TABLE [dbo].[tbl_venda] CHECK CONSTRAINT [FK_tbl_venda_tbl_cliente]
GO
ALTER TABLE [dbo].[tbl_venda]  WITH CHECK ADD  CONSTRAINT [FK_tbl_venda_tbl_funcionario] FOREIGN KEY([id_funcionario])
REFERENCES [dbo].[tbl_funcionario] ([id_funcionario])
GO
ALTER TABLE [dbo].[tbl_venda] CHECK CONSTRAINT [FK_tbl_venda_tbl_funcionario]
GO
ALTER TABLE [dbo].[tbl_venda_produto]  WITH CHECK ADD  CONSTRAINT [FK_tbl_venda_produto_tbl_produto] FOREIGN KEY([id_produto])
REFERENCES [dbo].[tbl_produto] ([id_produto])
GO
ALTER TABLE [dbo].[tbl_venda_produto] CHECK CONSTRAINT [FK_tbl_venda_produto_tbl_produto]
GO
ALTER TABLE [dbo].[tbl_venda_produto]  WITH CHECK ADD  CONSTRAINT [FK_tbl_venda_produto_tbl_venda] FOREIGN KEY([id_venda])
REFERENCES [dbo].[tbl_venda] ([id_venda])
GO
ALTER TABLE [dbo].[tbl_venda_produto] CHECK CONSTRAINT [FK_tbl_venda_produto_tbl_venda]
GO

CREATE TRIGGER [dbo].[criaconta] 
   ON  [dbo].[tbl_cliente]
   FOR INSERT
AS 
BEGIN
declare 
@idcliente int
select @idcliente=id_cliente  from inserted
insert into tbl_conta (id_cliente,limite) values (@idcliente,0)

END


USE [master]
GO
ALTER DATABASE [dbcantina] SET  READ_WRITE 
GO
