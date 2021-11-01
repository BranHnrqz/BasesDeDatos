create database Hospital;
USE [Hospital]
GO

CREATE TABLE [dbo].[Pacientes](
	[Num_SeguridadSocial] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Num_HistorialClinico] [int] NOT NULL UNIQUE,
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

/* Tabla creada para Relacionar la tabla "Contactos" con la tabla "Pacientes" */
CREATE TABLE [dbo].[ContactoPaciente](
	[IdContactoPaciente] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[IdContacto] [int] FOREIGN KEY (IdContacto) REFERENCES [dbo].[Contacto](IdContacto),
	[Num_SeguridadSocial] [int] FOREIGN KEY (Num_SeguridadSocial) REFERENCES [dbo].[Pacientes](Num_SeguridadSocial),
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

/* Tabla para determinar los posibles Cargos que tendrá el personal */ 
CREATE TABLE [dbo].[Cargos](
	[IdCargo] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[Nombre] [varchar] (50) NOT NULL,
	[Descripcion] [varchar] (50) NOT NULL,
	)
GO

/* Tabla para especificar los Cargos que se ejecutarán, relacionando la tabla "Cargos" y la tabla "Médicos" */
CREATE TABLE [dbo].[CargosMedicos](
	[IdCargoMedico] [int] IDENTITY(1,1) NOT NULL PRIMARY KEY,
	[IdMedico] [int] FOREIGN KEY (IdMedico) REFERENCES [dbo].[Medicos](IdMedico),
	[IdCargo] [int] FOREIGN KEY (IdCargo) REFERENCES [dbo].[Cargos](IdCargo),
	)
GO


/* Insertando Datos */ 


/* Tabla "Cargos" */
Insert into Cargos(Nombre, Descripcion)
Values ('Atención de Emergencias','Encargados de antender nuevos ingresos(emergencia)')

Insert into Cargos(Nombre, Descripcion)
Values ('Médicos de Planta','Encargados de atender ingresos y citas')

/* Tabla "Especialidades" */

Insert into Especialidades(Nombre)
Values ('Pediatría')

Insert into Especialidades(Nombre)
Values ('Neurología')

Insert into Especialidades(Nombre)
Values ('Cardiología')

Insert into Especialidades(Nombre)
Values ('Ginecología')

Insert into Especialidades(Nombre)
Values ('Gastroenterología')

Insert into Especialidades(Nombre)
Values ('Otorrinolaringología')

/* Tabla "Medicos" */
Insert into Medicos(Nombre, Apellido, NumColegiado, Observaciones)
Values ('Julissa', 'Cardoza', 'M0001', 'Ninguna')

Insert into Medicos(Nombre, Apellido, NumColegiado, Observaciones)
Values ('Catherine', 'Villeda', 'M0002', 'Ninguna')

Insert into Medicos(Nombre, Apellido, NumColegiado, Observaciones)
Values ('Gabriela', 'Orellana', 'M0003', 'Ninguna')

Insert into Medicos(Nombre, Apellido, NumColegiado, Observaciones)
Values ('Brandon', 'Henríquez', 'M0004', 'Ninguna')

Insert into Medicos(Nombre, Apellido, NumColegiado, Observaciones)
Values ('Alessandra', 'Villeda', 'M0005', 'Ninguna')

Insert into Medicos(Nombre, Apellido, NumColegiado, Observaciones)
Values ('Jessica', 'Mendez', 'M0006', 'Ninguna')

/* Tabla "CargosMedicos" */

Insert into CargosMedicos (IdMedico, IdCargo)
Values (10000,1)

Insert into CargosMedicos (IdMedico, IdCargo)
Values (10001,2)

Insert into CargosMedicos (IdMedico, IdCargo)
Values (10002,2)

Insert into CargosMedicos (IdMedico, IdCargo)
Values (10003,2)

Insert into CargosMedicos (IdMedico, IdCargo)
Values (10004,2)

Insert into CargosMedicos (IdMedico, IdCargo)
Values (10005,1)

/* Tabla "EspecialidadesMedicos" */

Insert into EspecialidadesMedicos (IdEspecialidad,IdMedico)
Values (200,10000)

Insert into EspecialidadesMedicos (IdEspecialidad,IdMedico)
Values (201,10001)

Insert into EspecialidadesMedicos (IdEspecialidad,IdMedico)
Values (202,10002)

Insert into EspecialidadesMedicos (IdEspecialidad,IdMedico)
Values (203,10003)

Insert into EspecialidadesMedicos (IdEspecialidad,IdMedico)
Values (204,10004)

Insert into EspecialidadesMedicos (IdEspecialidad,IdMedico)
Values (205,10005)

/* Tabla "Pacientes" */

Insert into Pacientes (Num_HistorialClinico,Nombre,Apellido,Domicilio,Sexo,Provincia,CodigoPostal,Observaciones)
Values (101001,'Satoru','Iwata','Av. Oriental','M','Japón','0041','Dolor de Cabeza y Mareos')

Insert into Pacientes (Num_HistorialClinico,Nombre,Apellido,Domicilio,Sexo,Provincia,CodigoPostal,Observaciones)
Values (101002,'Shigeru','Miyamoto','Calle Kyoto #5','M','Japón','0041','Nauceas y Dolor de Estomago')

Insert into Pacientes (Num_HistorialClinico,Nombre,Apellido,Domicilio,Sexo,Provincia,CodigoPostal,Observaciones)
Values (101003,'Emma','Watson','Av. Hollywood','F','California','0060','Embarazo de Riesgo')

Insert into Pacientes (Num_HistorialClinico,Nombre,Apellido,Domicilio,Sexo,Provincia,CodigoPostal,Observaciones)
Values (101004,'Harry','Potter','Condado Gryffindor','M','Howards','0089','Intoxicacion por Sobredosis')

Insert into Pacientes (Num_HistorialClinico,Nombre,Apellido,Domicilio,Sexo,Provincia,CodigoPostal,Observaciones)
Values (101005,'Ibai','Llanos','Calle a Andorra','M','Andaluz','0917','Obesidad Morbida')

Insert into Pacientes (Num_HistorialClinico,Nombre,Apellido,Domicilio,Sexo,Provincia,CodigoPostal,Observaciones)
Values (101006,'Sara','Bejean','Av. España','F','Valencia','0827','Falta de Apetito')

Insert into Pacientes (Num_HistorialClinico,Nombre,Apellido,Domicilio,Sexo,Provincia,CodigoPostal,Observaciones)
Values (101007,'Cristinini','Napoles','Av. Bernal','F','Asturias','4082','Bulimia Cronica')

Insert into Pacientes (Num_HistorialClinico,Nombre,Apellido,Domicilio,Sexo,Provincia,CodigoPostal,Observaciones)
Values (101008,'Nayib','Bukele','Zona Rosa','M','San Salvador','0189','Gripe y Neumonia')

Insert into Pacientes (Num_HistorialClinico,Nombre,Apellido,Domicilio,Sexo,Provincia,CodigoPostal,Observaciones)
Values (101009,'King','Flip','Pasaje los Romeros','M','Morazan','0801','Hambre excesiva')

Insert into Pacientes (Num_HistorialClinico,Nombre,Apellido,Domicilio,Sexo,Provincia,CodigoPostal,Observaciones)
Values (101010,'Tenchis','Celiber','Av. Roshmort','F','San Salvador','0189','Dolor de Pecho')


/* Tabla "Contacto" */

Insert into Contacto (NumTelefono)
Values (78496283)

Insert into Contacto (NumTelefono)
Values (79267425)

Insert into Contacto (NumTelefono)
Values (77268742)

Insert into Contacto (NumTelefono)
Values (71226845)

Insert into Contacto (NumTelefono)
Values (71369851)

Insert into Contacto (NumTelefono)
Values (75983468)

Insert into Contacto (NumTelefono)
Values (69248531)

Insert into Contacto (NumTelefono)
Values (76913587)

Insert into Contacto (NumTelefono)
Values (73298752)

Insert into Contacto (NumTelefono)
Values (68924762)

/* Tabla "ContactoPaciente" */

Insert into ContactoPaciente (IdContacto,Num_SeguridadSocial)
Values (200,1)

Insert into ContactoPaciente (IdContacto,Num_SeguridadSocial)
Values (201,2)

Insert into ContactoPaciente (IdContacto,Num_SeguridadSocial)
Values (202,3)

Insert into ContactoPaciente (IdContacto,Num_SeguridadSocial)
Values (203,4)

Insert into ContactoPaciente (IdContacto,Num_SeguridadSocial)
Values (204,5)

Insert into ContactoPaciente (IdContacto,Num_SeguridadSocial)
Values (205,6)

Insert into ContactoPaciente (IdContacto,Num_SeguridadSocial)
Values (206,7)

Insert into ContactoPaciente (IdContacto,Num_SeguridadSocial)
Values (207,8)

Insert into ContactoPaciente (IdContacto,Num_SeguridadSocial)
Values (208,9)

Insert into ContactoPaciente (IdContacto,Num_SeguridadSocial)
Values (209,10)

/* Tabla "Ingresos" */

Insert into Ingresos (Procedencia,FechaIngreso,NumPlanta,NumCama,Observaciones,Num_SeguridadSocial,IdMedico)
Values ('La Palma', '2021-11-1',4,469,'Crítico',1,10000)

Insert into Ingresos (Procedencia,FechaIngreso,NumPlanta,NumCama,Observaciones,Num_SeguridadSocial,IdMedico)
Values ('Chalatenango', '2021-10-26',3,16,'Estable',2,10001)

Insert into Ingresos (Procedencia,FechaIngreso,NumPlanta,NumCama,Observaciones,Num_SeguridadSocial,IdMedico)
Values ('Nueva Concepcion', '2021-10-17',4,350,'Moderado',3,10002)

Insert into Ingresos (Procedencia,FechaIngreso,NumPlanta,NumCama,Observaciones,Num_SeguridadSocial,IdMedico)
Values ('San Ignacio', '2021-10-6',1,46,'Crítico',4,10003)

Insert into Ingresos (Procedencia,FechaIngreso,NumPlanta,NumCama,Observaciones,Num_SeguridadSocial,IdMedico)
Values ('Santa Rita', '2021-10-25',3,150,'Crítico',5,10004)

Insert into Ingresos (Procedencia,FechaIngreso,NumPlanta,NumCama,Observaciones,Num_SeguridadSocial,IdMedico)
Values ('Metapan', '2021-09-2',2,34,'Moderado',6,10005)

Insert into Ingresos (Procedencia,FechaIngreso,NumPlanta,NumCama,Observaciones,Num_SeguridadSocial,IdMedico)
Values ('Metapan', '2021-11-1',1,13,'Estable',7,10001)

Insert into Ingresos (Procedencia,FechaIngreso,NumPlanta,NumCama,Observaciones,Num_SeguridadSocial,IdMedico)
Values ('San Ignacio', '2021-10-30',2,81,'Estable',8,10001)

Insert into Ingresos (Procedencia,FechaIngreso,NumPlanta,NumCama,Observaciones,Num_SeguridadSocial,IdMedico)
Values ('El Paraiso', '2021-08-7',2,68,'Moderado',9,10004)

Insert into Ingresos (Procedencia,FechaIngreso,NumPlanta,NumCama,Observaciones,Num_SeguridadSocial,IdMedico)
Values ('Nueva Concepcion', '2021-08-3',1,7,'Moderado',10,10001)

Insert into Ingresos (Procedencia,FechaIngreso,NumPlanta,NumCama,Observaciones,Num_SeguridadSocial,IdMedico)
Values ('Tejutla', '2021-11-1',4,419,'Crítico',2,10003)

Insert into Ingresos (Procedencia,FechaIngreso,NumPlanta,NumCama,Observaciones,Num_SeguridadSocial,IdMedico)
Values ('La Palma', '2021-07-3',1,3,'Crítico',4,10003)

Insert into Ingresos (Procedencia,FechaIngreso,NumPlanta,NumCama,Observaciones,Num_SeguridadSocial,IdMedico)
Values ('Tejutla', '2021-11-1',1,214,'Crítico',8,10005)

Insert into Ingresos (Procedencia,FechaIngreso,NumPlanta,NumCama,Observaciones,Num_SeguridadSocial,IdMedico)
Values ('Reubicacion', '2021-10-19',4,246,'Estable',1,10005)

Insert into Ingresos (Procedencia,FechaIngreso,NumPlanta,NumCama,Observaciones,Num_SeguridadSocial,IdMedico)
Values ('Metapan', '2021-06-16',2,14,'Moderado',4,10003)

Insert into Ingresos (Procedencia,FechaIngreso,NumPlanta,NumCama,Observaciones,Num_SeguridadSocial,IdMedico)
Values ('Santa Rosa', '2021-10-5',4,464,'Moderado',6,10004)

Insert into Ingresos (Procedencia,FechaIngreso,NumPlanta,NumCama,Observaciones,Num_SeguridadSocial,IdMedico)
Values ('Chalatenango', '2021-09-10',2,55,'Estable',7,10001)

