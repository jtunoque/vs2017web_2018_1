USE [dbComercio]
GO
/****** Object:  Table [dbo].[Categoria]    Script Date: 20/01/2019 13:47:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categoria](
	[CategoriaID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Descripcion] [nvarchar](100) NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Categoria] PRIMARY KEY CLUSTERED 
(
	[CategoriaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Marca]    Script Date: 20/01/2019 13:47:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Marca](
	[MarcaID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[Descripcion] [nvarchar](100) NULL,
	[Estado] [bit] NOT NULL,
 CONSTRAINT [PK_Marca] PRIMARY KEY CLUSTERED 
(
	[MarcaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Producto]    Script Date: 20/01/2019 13:47:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[ProductoID] [int] IDENTITY(1,1) NOT NULL,
	[ProductoCode] [nvarchar](50) NOT NULL,
	[Nombre] [nvarchar](100) NOT NULL,
	[CategoriaID] [int] NOT NULL,
	[MarcaID] [int] NOT NULL,
	[UnidadMedidaID] [int] NOT NULL,
	[PrecioMayor] [decimal](18, 2) NOT NULL,
	[PrecioMenor] [decimal](18, 2) NOT NULL,
	[StockActual] [decimal](18, 2) NOT NULL,
	[StockMinimo] [decimal](18, 2) NOT NULL,
	[Estado] [bit] NOT NULL,
	[UsuarioCreador] [uniqueidentifier] NOT NULL,
	[FechaCreacion] [datetime] NOT NULL,
	[UsuarioModificador] [uniqueidentifier] NULL,
	[FechaModificacion] [datetime] NULL,
 CONSTRAINT [PK_Producto] PRIMARY KEY CLUSTERED 
(
	[ProductoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UnidadMedida]    Script Date: 20/01/2019 13:47:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UnidadMedida](
	[UnidadMedidaID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UnidadMedida] PRIMARY KEY CLUSTERED 
(
	[UnidadMedidaID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Categoria] FOREIGN KEY([CategoriaID])
REFERENCES [dbo].[Categoria] ([CategoriaID])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Categoria]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_Marca] FOREIGN KEY([MarcaID])
REFERENCES [dbo].[Marca] ([MarcaID])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_Marca]
GO
ALTER TABLE [dbo].[Producto]  WITH CHECK ADD  CONSTRAINT [FK_Producto_UnidadMedida] FOREIGN KEY([UnidadMedidaID])
REFERENCES [dbo].[UnidadMedida] ([UnidadMedidaID])
GO
ALTER TABLE [dbo].[Producto] CHECK CONSTRAINT [FK_Producto_UnidadMedida]
GO
