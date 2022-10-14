USE [master]
GO
/****** Object:  Database [DB_TRABAJO]    Script Date: 14/10/2022 2:07:22 a. m. ******/
CREATE DATABASE [DB_TRABAJO]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DB_TRABAJO', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DB_TRABAJO.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DB_TRABAJO_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\DB_TRABAJO_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [DB_TRABAJO] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DB_TRABAJO].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DB_TRABAJO] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DB_TRABAJO] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DB_TRABAJO] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DB_TRABAJO] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DB_TRABAJO] SET ARITHABORT OFF 
GO
ALTER DATABASE [DB_TRABAJO] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [DB_TRABAJO] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DB_TRABAJO] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DB_TRABAJO] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DB_TRABAJO] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DB_TRABAJO] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DB_TRABAJO] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DB_TRABAJO] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DB_TRABAJO] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DB_TRABAJO] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DB_TRABAJO] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DB_TRABAJO] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DB_TRABAJO] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DB_TRABAJO] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DB_TRABAJO] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DB_TRABAJO] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DB_TRABAJO] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DB_TRABAJO] SET RECOVERY FULL 
GO
ALTER DATABASE [DB_TRABAJO] SET  MULTI_USER 
GO
ALTER DATABASE [DB_TRABAJO] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DB_TRABAJO] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DB_TRABAJO] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DB_TRABAJO] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DB_TRABAJO] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DB_TRABAJO] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'DB_TRABAJO', N'ON'
GO
ALTER DATABASE [DB_TRABAJO] SET QUERY_STORE = OFF
GO
USE [DB_TRABAJO]
GO
/****** Object:  Table [dbo].[USUARIO]    Script Date: 14/10/2022 2:07:23 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[USUARIO](
	[ID_USUARIO] [int] IDENTITY(1,1) NOT NULL,
	[CEDULA] [varchar](60) NULL,
	[NOMBRES] [varchar](60) NULL,
	[APELLIDOS] [varchar](60) NULL,
	[TELEFONO] [varchar](60) NULL,
	[CORREO] [varchar](60) NULL,
	[CIUDAD] [varchar](60) NULL,
	[FECHA_REGISTRO] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_USUARIO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[USUARIO] ON 
GO
INSERT [dbo].[USUARIO] ([ID_USUARIO], [CEDULA], [NOMBRES], [APELLIDOS], [TELEFONO], [CORREO], [CIUDAD], [FECHA_REGISTRO]) VALUES (1, N'40229705880', N'JEREMY', N'ENCARNACION BASILIO', N'829-722-31118', N'JEREMYEB002@GMAIL.COM', N'STO.DGO.NORTE', CAST(N'2022-10-07T12:02:57.923' AS DateTime))
GO
INSERT [dbo].[USUARIO] ([ID_USUARIO], [CEDULA], [NOMBRES], [APELLIDOS], [TELEFONO], [CORREO], [CIUDAD], [FECHA_REGISTRO]) VALUES (2012, N'111-1111111-1', N'ERIMER', N'CASTILLO ENCARNACION', N'829-915-0930', N'000-000000-0', N'Av.Jacobo Majluta', CAST(N'2022-10-14T01:09:47.517' AS DateTime))
GO
INSERT [dbo].[USUARIO] ([ID_USUARIO], [CEDULA], [NOMBRES], [APELLIDOS], [TELEFONO], [CORREO], [CIUDAD], [FECHA_REGISTRO]) VALUES (2013, N'111-1111111-1', N'Fulanos', N'De tal', N'000-000-0000', N'Fulanuski', N'Sabana Perdida', CAST(N'2022-10-14T01:59:01.223' AS DateTime))
GO
INSERT [dbo].[USUARIO] ([ID_USUARIO], [CEDULA], [NOMBRES], [APELLIDOS], [TELEFONO], [CORREO], [CIUDAD], [FECHA_REGISTRO]) VALUES (2014, N'222-222222-2', N'Ileana', N'Sanchez', N'809-000-0000', N'IleanaSanchez@example.com.do', N'Naco', CAST(N'2022-10-14T02:00:08.660' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[USUARIO] OFF
GO
ALTER TABLE [dbo].[USUARIO] ADD  DEFAULT (getdate()) FOR [FECHA_REGISTRO]
GO
/****** Object:  StoredProcedure [dbo].[usp_eliminar]    Script Date: 14/10/2022 2:07:23 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_eliminar](
@id_usuario int
)
as
begin

DELETE FROM USUARIO WHERE ID_USUARIO = @id_usuario

END

GO
/****** Object:  StoredProcedure [dbo].[usp_listar]    Script Date: 14/10/2022 2:07:23 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_listar]
as
begin

select * from USUARIO
end

GO
/****** Object:  StoredProcedure [dbo].[usp_modificar]    Script Date: 14/10/2022 2:07:23 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[usp_modificar](
@ID_USUARIO int,
@cedula VARCHAR(60),
@nombres VARCHAR(60),
@apellidos VARCHAR(60),
@telefono VARCHAR(60),
@correo VARCHAR(60),
@ciudad VARCHAR(60)
)
AS
BEGIN

update USUARIO set
CEDULA = @cedula,
NOMBRES = @nombres,
APELLIDOS = @apellidos,
TELEFONO = @telefono,
CORREO = @correo,
CIUDAD = @ciudad
where ID_USUARIO = @id_usuario

END

GO
/****** Object:  StoredProcedure [dbo].[usp_obtener]    Script Date: 14/10/2022 2:07:23 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[usp_obtener](@id_usuario int)
as
begin

SELECT * FROM USUARIO WHERE ID_USUARIO = @id_usuario
END

GO
/****** Object:  StoredProcedure [dbo].[usp_registrar]    Script Date: 14/10/2022 2:07:23 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--******************PROCEDIMIENTOS*******************--

CREATE PROCEDURE [dbo].[usp_registrar](
@cedula VARCHAR(60),
@nombres VARCHAR(60),
@apellidos VARCHAR(60),
@telefono VARCHAR(60),
@correo VARCHAR(60),
@ciudad VARCHAR(60)
)
AS
BEGIN

INSERT INTO USUARIO(CEDULA, NOMBRES, APELLIDOS, TELEFONO, CORREO, CIUDAD)
VALUES(
@cedula,
@nombres,
@apellidos,
@telefono,
@correo,
@ciudad
)

END

GO
USE [master]
GO
ALTER DATABASE [DB_TRABAJO] SET  READ_WRITE 
GO
