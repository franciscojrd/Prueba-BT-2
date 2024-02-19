-- tablas

--tabla ciudad
CREATE TABLE Ciudad(
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[CodigoPostal] [varchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
-- insert
INSERT INTO Ciudad (ID, Nombre, CodigoPostal) VALUES
(1, 'Barranquilla', 'CP001'),
(2, 'Bogotá', 'CP002'),
(3, 'Medellín', 'CP003');


 ---talba localidades
CREATE TABLE Localidades(
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[Direccion] [varchar](200) NOT NULL,
	[Descripcion] [varchar](200) NOT NULL,
	[IdCiudad] [int] NULL,
	[Disponible] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Localidades]  WITH CHECK ADD FOREIGN KEY([IdCiudad])
REFERENCES [dbo].[Ciudad] ([ID])
GO

--insert
INSERT INTO Localidades (Nombre, Direccion, Descripcion, IdCiudad, Disponible) VALUES
('Localidad Norte', 'Dirección 1', 'Esta ubicado al norte de la ciudad de Barranquilla', 1, 1),
('Localidad Aereopuerto', 'Dirección 2', 'Esta ubicado en el aeropuerto de la ciudad de Barranquilla', 1, 1),
('Localidad este', 'Dirección 3', 'Esta ubicado al este de la ciudad de Barranquilla', 1, 1),
('Localidad Norte', 'Dirección 1', 'Esta ubicado al norte de la ciudad de Bogotá', 2, 1),
('Localidad Aereopuerto', 'Dirección 2', 'Esta ubicado en el aeropuerto de la ciudad de Bogotá', 2, 1),
('Localidad este', 'Dirección 3', 'Esta ubicado al este de la ciudad de Bogotá', 2, 1),
('Localidad Norte', 'Dirección 1', 'Esta ubicado al norte de la ciudad de Medellín', 3, 1),
('Localidad Aereopuerto', 'Dirección 2', 'Esta ubicado en el aeropuerto de la ciudad de Medellín', 3, 1),
('Localidad este', 'Dirección 3', 'Esta ubicado al este de la ciudad de Medellín', 3, 1);


--tabla transmision
CREATE TABLE Trasmision(
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

--insert
INSERT INTO Trasmision (Tipo) VALUES
('Mecanica'),
('Automatica');


--tabla tamaño
CREATE TABLE Tamaño(
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
--insert

INSERT INTO Tamaño (Tipo) VALUES
('Pequeño'),
('Mediano'),
('Grande'),
('Vans'),
('Camioneta');


--tabla Clase
CREATE TABLE Clase(
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Tipo] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
-- insert
INSERT INTO Clase (Tipo) VALUES
('Basico'),
('Lujo'),
('Deportivo');
 
--tabla vehiculo

CREATE TABLE [dbo].[Vehiculo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Marca] [varchar](100) NOT NULL,
	[Modelo] [varchar](100) NOT NULL,
	[Año] [int] NOT NULL,
	[TrasmisionID] [int] NULL,
	[TamañoID] [int] NULL,
	[ClaseID] [int] NULL,
	[TieneAire] [bit] NOT NULL,
	[Precio] [float] NOT NULL,
	[Disponible] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Vehiculo]  WITH CHECK ADD FOREIGN KEY([ClaseID])
REFERENCES [dbo].[Clase] ([ID])
GO

ALTER TABLE [dbo].[Vehiculo]  WITH CHECK ADD FOREIGN KEY([TamañoID])
REFERENCES [dbo].[Tamaño] ([ID])
GO

ALTER TABLE [dbo].[Vehiculo]  WITH CHECK ADD FOREIGN KEY([TrasmisionID])
REFERENCES [dbo].[Trasmision] ([ID])
GO

--insert
INSERT INTO Vehiculo (Marca, Modelo, Año, TrasmisionID, TamañoID, ClaseID, TieneAire, Precio, Disponible) VALUES
('Toyota', 'Corolla', 2022, 1, 1, 1, 1, 20000, 1),
('Toyota', 'Prado', 2023, 2, 3, 2, 1, 40000, 1),
('Mazda', 'Mazda 3', 2021, 2, 3, 2, 1, 20000, 1),
('Toyota', 'Hilux', 2020, 1, 3, 2, 1, 30000, 1),
('Toyota', 'Yaris', 2023, 2, 3, 2, 1, 40000, 1),
('Mazda', 'Mazda CX5', 2021, 2, 3, 2, 1, 20000, 1),
('Kia', 'Picanto', 2020, 1, 3, 2, 1, 30000, 1),
('Hyundai', 'Elantra', 2021, 1, 3, 2, 1, 30000, 1);

-- tabla VehiculosLocalidad esta tabla me relaciona los vehiculos con las localidades
CREATE TABLE VehiculosLocalidad(
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[VehiculoID] [int] NULL,
	[LocalidadID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[VehiculosLocalidad]  WITH CHECK ADD FOREIGN KEY([LocalidadID])
REFERENCES [dbo].[Localidades] ([ID])
GO

ALTER TABLE [dbo].[VehiculosLocalidad]  WITH CHECK ADD FOREIGN KEY([VehiculoID])
REFERENCES [dbo].[Vehiculo] ([Id])
GO

--insert
INSERT INTO VehiculosLocalidad (VehiculoID, LocalidadID) VALUES
(1, 2),
(2, 3),
(3, 4),
(4, 5),
(5, 2),
(6, 6),
(7, 7),
(8, 7);


--tabla LocalidadesCovenio esta tabla me relaciona los convenios que tienen entre localidades para que los vehiculos puedan ser entregados
CREATE TABLE LocalidadesCovenio(
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[LocalidadID] [int] NULL,
	[LocalidadEntregaID] [int] NULL,
	[Disponible] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[LocalidadesCovenio]  WITH CHECK ADD FOREIGN KEY([LocalidadID])
REFERENCES [dbo].[Localidades] ([ID])
GO

ALTER TABLE [dbo].[LocalidadesCovenio]  WITH CHECK ADD FOREIGN KEY([LocalidadEntregaID])
REFERENCES [dbo].[Localidades] ([ID])
GO

--insert 
INSERT INTO LocalidadesConvenio (ID, LocalidadID, LocalidadEntregaID, Disponible) VALUES
(1, 2, 3, 1),
(2, 2, 4, 1),
(3, 2, 5, 1),
(4, 3, 2, 1),
(5, 4, 3, 1),
(6, 4, 2, 1);