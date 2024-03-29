﻿USE [SaludIPS]
GO
/****** Object:  StoredProcedure [Sp_LocalidadesVehiculos]    Script Date: 02/18/2024 5:31:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/***********************************************************************************
Fecha		:	2024 febrero 17
Autor		:	Francisco Rdorguez
Entradas	:
 	-- @IdLocalidad INT,
	-- @IdCiudad INT,
	-- @Operacion INT,


******************************************************************************************************************/
alter PROCEDURE [Sp_LocalidadesVehiculos]
(
	@IdLocalidad			INT				= NULL OUT,
	@IdCiudad				INT				= NULL,
	@Operacion				TINYINT			= 0
)
AS
BEGIN
	SET NOCOUNT ON
	
	DECLARE 
			@LIdLocalidad				INT				= @IdLocalidad,
			@LIdCiudad					INT				= @IdCiudad,
			@LOperacion					TINYINT			= @Operacion,
			@LENTRO BIT = 0

-------------------------------------------------------------
--	Consulta localidad recogida
-------------------------------------------------------------
	IF @LOPERACION = 0

	BEGIN
		SET @LENTRO = 1
		
		select l.ID, l.Nombre, l.Direccion, l.Descripcion, c.ID IdCiudad, c.Nombre Ciudad from Localidades l
		inner join Ciudad c on c.ID = l.IdCiudad 
		where l.Disponible = 1

		RETURN 0		
	END
-------------------------------------------------------------
--	LOCALIDAD SELECCIONADA ME VA A FILTRAR LAS LOCALIDADES EN CONVENIO CON LA MISMA
-------------------------------------------------------------
	IF @LOPERACION = 1

	BEGIN
		SET @LENTRO = 1
		
		select l.ID, l.Nombre, l.Direccion, l.Descripcion, c.ID IdCiudad, c.Nombre Ciudad from Localidades l
		inner join LocalidadesCovenio lc on lc.LocalidadEntregaID = l.ID 
		inner join Ciudad c on c.ID = l.IdCiudad 
		where lc.LocalidadID  = @LIdLocalidad and l.Disponible = 1 and lc.Disponible = 1

		RETURN 0		
	END

-------------------------------------------------------------
--	--MOSTRARA LOS VEHICULOS DE ACUERDO A LA CIUDAD DE LA LOCALIDAD DONDE ESTA EL CLIENTE
-------------------------------------------------------------
	IF @LOPERACION = 2

	BEGIN
		SET @LENTRO = 1
		
		
		select v.Id, v.Marca, v.Modelo, t.Tipo Transmision, ta.Tipo Tamaño, cl.Tipo Clase, v.TieneAire, l.Nombre Localidad, c.Nombre Ciudad from VehiculosLocalidad vl
		inner join Vehiculo v on v.Id = vl.VehiculoID 
		inner join Localidades l on l.ID = vl.LocalidadID 
		inner join Ciudad c on c.ID = l.IdCiudad 
		inner join Trasmision t on t.ID = v.TrasmisionID 
		inner join Tamaño ta on ta.ID = v.TamañoID
		inner join Clase cl on cl.ID = v.ClaseID 
		where v.Disponible = 1 and l.ID = @LIdLocalidad and l.IdCiudad = @LIdCiudad and l.Disponible = 1

		RETURN 0		
	END


	IF @LENTRO = 0	
		RAISERROR (888001,16,1, 'La operacion no es soportada por este procedimiento.');
	ELSE
		RETURN 0

END
