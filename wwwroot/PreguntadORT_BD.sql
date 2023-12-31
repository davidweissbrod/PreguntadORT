USE [master]
GO
/****** Object:  Database [PreguntadORT]    Script Date: 10/8/2023 08:25:43 ******/
CREATE DATABASE [PreguntadORT]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'PreguntadORT', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PreguntadORT.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'PreguntadORT_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\PreguntadORT_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [PreguntadORT] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [PreguntadORT].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [PreguntadORT] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PreguntadORT] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PreguntadORT] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PreguntadORT] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PreguntadORT] SET ARITHABORT OFF 
GO
ALTER DATABASE [PreguntadORT] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PreguntadORT] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PreguntadORT] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PreguntadORT] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PreguntadORT] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PreguntadORT] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PreguntadORT] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PreguntadORT] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PreguntadORT] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PreguntadORT] SET  DISABLE_BROKER 
GO
ALTER DATABASE [PreguntadORT] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PreguntadORT] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PreguntadORT] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PreguntadORT] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PreguntadORT] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PreguntadORT] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PreguntadORT] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PreguntadORT] SET RECOVERY FULL 
GO
ALTER DATABASE [PreguntadORT] SET  MULTI_USER 
GO
ALTER DATABASE [PreguntadORT] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PreguntadORT] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PreguntadORT] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PreguntadORT] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PreguntadORT] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'PreguntadORT', N'ON'
GO
ALTER DATABASE [PreguntadORT] SET QUERY_STORE = OFF
GO
USE [PreguntadORT]
GO
/****** Object:  User [alumno]    Script Date: 10/8/2023 08:25:43 ******/
CREATE USER [alumno] FOR LOGIN [alumno] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Categorias]    Script Date: 10/8/2023 08:25:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categorias](
	[IdCategoria] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Categorias] PRIMARY KEY CLUSTERED 
(
	[IdCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dificultades]    Script Date: 10/8/2023 08:25:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dificultades](
	[IdDificultad] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Dificultades] PRIMARY KEY CLUSTERED 
(
	[IdDificultad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Preguntas]    Script Date: 10/8/2023 08:25:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Preguntas](
	[IdPregunta] [int] IDENTITY(1,1) NOT NULL,
	[IdCategoria] [int] NOT NULL,
	[IdDificultad] [int] NOT NULL,
	[Enunciado] [varchar](200) NOT NULL,
 CONSTRAINT [PK_Preguntas] PRIMARY KEY CLUSTERED 
(
	[IdPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Respuestas]    Script Date: 10/8/2023 08:25:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Respuestas](
	[IdRespuestas] [int] IDENTITY(1,1) NOT NULL,
	[IdPregunta] [int] NOT NULL,
	[Opcion] [int] NOT NULL,
	[Contenido] [varchar](200) NOT NULL,
	[Correcta] [bit] NOT NULL,
 CONSTRAINT [PK_Respuestas] PRIMARY KEY CLUSTERED 
(
	[IdRespuestas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categorias] ON 

INSERT [dbo].[Categorias] ([IdCategoria], [Nombre]) VALUES (1, N'Cultura General')
INSERT [dbo].[Categorias] ([IdCategoria], [Nombre]) VALUES (2, N'Historia')
SET IDENTITY_INSERT [dbo].[Categorias] OFF
GO
INSERT [dbo].[Dificultades] ([IdDificultad], [Nombre]) VALUES (1, N'Facil')
INSERT [dbo].[Dificultades] ([IdDificultad], [Nombre]) VALUES (2, N'Normal')
INSERT [dbo].[Dificultades] ([IdDificultad], [Nombre]) VALUES (3, N'Dificil')
GO
SET IDENTITY_INSERT [dbo].[Preguntas] ON 

INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (1, 1, 1, N'¿Cuando se celebra el día nacional de los Estados Unidos?
')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (2, 1, 1, N'¿Cuántos continentes hay?
')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (4, 1, 1, N'¿Capital de Brasil?
')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (6, 1, 2, N'¿El órgano más grande del cuerpo humano?
')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (7, 1, 2, N'¿Cuál es la velocidad de la luz?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (8, 1, 2, N'¿Cuántas películas de Harry Potter hay?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (9, 1, 2, N'¿Con cuántos países limita argentina?
')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (10, 1, 2, N'¿Cuántas provincias tiene argentina?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (12, 1, 3, N'¿Que significa SAME?
')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (13, 1, 3, N'¿Nombre del aeropuerto más importante de Buenos Aires?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (14, 1, 3, N'¿Quien fue el Che Guevara?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (15, 1, 3, N'¿Quien creo el primer auto?
')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (16, 1, 3, N'¿Dónde se creo el papel?
')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (17, 2, 1, N'¿Quien lideró a la unión soviética durante la ww2?
')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (20, 2, 1, N'¿Quien fue el presidente desde 2015 hasta 2019 en argentina?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (21, 2, 1, N'¿Cuáles son los dos partidos más importantes de estados unidos?
')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (22, 2, 1, N'¿Quien es el principal ideólogo del comunismo?
')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (23, 2, 1, N'¿De que país era Napoleon?
')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (24, 2, 2, N'¿Quien era la mano derecha de Hitler y su futuro sucesor?
')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (28, 2, 2, N'¿Durante la guerra civil de estados unidos quienes pelearon?
')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (30, 2, 2, N'¿Quien derrotó a Napoleon?
')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (31, 2, 2, N'¿En qué año se funda el imperio alemán?
')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (33, 2, 2, N'¿Quien ganó la guerra civil china?
')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (38, 2, 3, N'¿Quien unifico a alemania? 
')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (39, 2, 3, N'¿Después de la ww2 se crea la OTAN por el lado de estados unidos y la unión soviética crea un pacto, pero como se llamaba?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (40, 2, 3, N'¿Quien lideró la unión cívica nacional?')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (41, 2, 3, N'¿Cuantas coaliciones hubo entre Francia E Inglaterra?
')
INSERT [dbo].[Preguntas] ([IdPregunta], [IdCategoria], [IdDificultad], [Enunciado]) VALUES (42, 2, 3, N'¿Quien fue el último líder de la unión soviética?
')
SET IDENTITY_INSERT [dbo].[Preguntas] OFF
GO
SET IDENTITY_INSERT [dbo].[Respuestas] ON 

INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (1, 1, 2, N'4/06- 4/07 - 4/08 - 4/05
', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (3, 2, 1, N'1789-1790-1788-1791
', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (5, 4, 3, N'6-7-5-4
', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (6, 6, 1, N'7-5-6-8
', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (8, 7, 4, N'Rio de Janeiro - Sao Paulo - Porto alegre- Brasilia', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (10, 8, 3, N'Corazon- Cerebro- Piel- Estomago
', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (12, 9, 3, N'250.000 - 275.000- 300.000 - 305.000
', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (13, 10, 2, N'7-8-9-10
', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (15, 12, 3, N'3-4-5-6
', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (18, 13, 4, N'21-22-23-24
', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (19, 14, 3, N'Ministro- presidente- revolucionario - gobernador
', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (20, 15, 2, N'Henry Ford-Carl Benz-enzo ferrari - Lamborghini 
', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (21, 16, 4, N'Armenia-japon-israel-china
', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (22, 17, 2, N'Lenin-stalin-trotsky-breznev', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (23, 20, 3, N'Cristina-alberto-macri-nestor
', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (24, 21, 4, N'Republicano y nacional - nacional y democrata - democrata y comunista - democrata y republicano
', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (25, 22, 3, N'Lenin-stalin-karl marx- Fidel castro', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (26, 23, 3, N'Italia-españa-francia-alemania
', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (27, 24, 2, N'Goebbels-goering-himmler-hess
', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (28, 28, 3, N'Inglaterra vs Estados Unidos - Inglaterra vs  estados confederados - estados confederados vs estados unidos - tribus vs estados unidos
', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (29, 30, 2, N'Rey jorge V - almirante nelson - reina victoria - reina isabel I', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (30, 31, 3, N'1771-1872-1871-1873', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (31, 33, 3, N'Democratas-nacionalistas-comunistas-fascistas
', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (32, 38, 4, N'Guillermo I - Guillermo II - Hitler - Bismarck ', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (33, 39, 2, N'Internacional - pacto de Varsovia - pacto soviético - pacto comunista 
', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (35, 40, 3, N'alem-roca-mitre-justo', 1)
INSERT [dbo].[Respuestas] ([IdRespuestas], [IdPregunta], [Opcion], [Contenido], [Correcta]) VALUES (36, 41, 1, N'5-6-7-8', 1)
SET IDENTITY_INSERT [dbo].[Respuestas] OFF
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Categorias] FOREIGN KEY([IdCategoria])
REFERENCES [dbo].[Categorias] ([IdCategoria])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Categorias]
GO
ALTER TABLE [dbo].[Preguntas]  WITH CHECK ADD  CONSTRAINT [FK_Preguntas_Dificultades] FOREIGN KEY([IdDificultad])
REFERENCES [dbo].[Dificultades] ([IdDificultad])
GO
ALTER TABLE [dbo].[Preguntas] CHECK CONSTRAINT [FK_Preguntas_Dificultades]
GO
ALTER TABLE [dbo].[Respuestas]  WITH CHECK ADD  CONSTRAINT [FK_Respuestas_Preguntas] FOREIGN KEY([IdPregunta])
REFERENCES [dbo].[Preguntas] ([IdPregunta])
GO
ALTER TABLE [dbo].[Respuestas] CHECK CONSTRAINT [FK_Respuestas_Preguntas]
GO
USE [master]
GO
ALTER DATABASE [PreguntadORT] SET  READ_WRITE 
GO
