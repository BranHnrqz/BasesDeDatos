create database Hospital;
USE [Hospital]
GO

CREATE TABLE [dbo].[Pacientes](
	[Num_SeguridadSocial] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Num_HistorialClinico] [int] IDENTITY (100,1) NOT NULL UNIQUE,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[Domicilio] [varchar](30) NOT NULL,
	[Sexo] [varchar](15) NOT NULL,
	[Provincia] [varchar](30) NOT NULL,
	[CodigoPostal] [varchar](30) NOT NULL,
	[Observaciones] [varchar](30) NOT NULL,
	)
GO

CREATE TABLE [dbo].[Medicos](
	[IdMedico] [int] IDENTITY(10000,1) NOT NULL PRIMARY KEY,
	[Nombre] [varchar](50) NOT NULL,
	[Apellido] [varchar](50) NOT NULL,
	[NumColegiado] [varchar](30) NOT NULL UNIQUE,
	[Observaciones] [varchar](30) NOT NULL,
	)
GO

CREATE TABLE [dbo].[Ingresos](
	[IdIngresos] [int] IDENTITY(1000,1) NOT NULL PRIMARY KEY,
	[Procedencia] [varchar](50) NOT NULL,
	[FechaIngreso] [date] NOT NULL,
	[NumPlanta] [int] NOT NULL,
	[NumCama] [int] NOT NULL,
	[Observaciones] [varchar](30) NOT NULL,
	[Num_SeguridadSocial] [int] FOREIGN KEY (Num_SeguridadSocial) REFERENCES [dbo].[Pacientes](Num_SeguridadSocial),
	[IdMedico] [int] FOREIGN KEY (IdMedico) REFERENCES [dbo].[Medicos](IdMedico),
	)
GO


/* Tabla creada para guardar diversos números telefónicos...(Los pacientes pueden tener más de un número). */
CREATE TABLE [dbo].[Contacto](
	[IdContacto] [int] IDENTITY(200,1) NOT NULL PRIMARY KEY,
	[NumTelefono] [int],
	)
GO

/* Tabla creada para determinar las posibles especialidades que pueden tener los médicos */
CREATE TABLE [dbo].[Especialidades](
	[IdEspecialidad] [int] IDENTITY(200,1) NOT NULL PRIMARY KEY,
	[Nombre] [varchar] (50) NOT NULL,
	)
GO

/* Tabla creada para hacer las relaciones entre la tabla "Médicos" con la tabla "Especialidades" */
CREATE TABLE [dbo].[EspecialidadesMedicos](
	[IdEspecialidadMedico] [int] IDENTITY(300,1) NOT NULL PRIMARY KEY,
	[IdEspecialidad] [int] FOREIGN KEY (IdEspecialidad) REFERENCES [dbo].[Especialidades](IdEspecialidad),
	[IdMedico] [int] FOREIGN KEY (IdMedico) REFERENCES [dbo].[Medicos] (IdMedico),
	)
GO

/*

