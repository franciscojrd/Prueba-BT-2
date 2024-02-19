
select * from Localidades
select * from Ciudad
select * from Trasmision
select * from Tamaño
select * from Clase
select * from Vehiculo 
select * from VehiculosLocalidad
select * from LocalidadesCovenio
 
 
 --Localidad de Recogida: Los clientes podrán especificar la localidad desde donde desean recoger el vehículo. Esta información será fundamental para determinar la disponibilidad de vehículos en esa ubicación
--Consulta localidad recogida

select l.ID, l.Nombre, l.Direccion, l.Descripcion, c.Nombre Ciudad from Localidades l
inner join Ciudad c on c.ID = l.IdCiudad 
where l.Disponible = 1


--. Localidad de Devolución: Además de la localidad de recogida, los usuarios podrán indicar la localidad donde desean devolver el vehículo. Esto permitirá calcular la disponibilidad y opciones de devolución en
--función de la ubicación deseada.

--la LOCALIDAD SELECCIONADA ME VA A FILTRAR LAS LOCALIDADES EN CONVENIO CON LA MISMA
select l.ID, l.Nombre, l.Direccion, l.Descripcion, c.Nombre Ciudad from Localidades l
inner join LocalidadesCovenio lc on lc.LocalidadEntregaID = l.ID 
inner join Ciudad c on c.ID = l.IdCiudad 
where lc.LocalidadID  = 2 and l.Disponible = 1 and lc.Disponible = 1
 

--Carros Disponibles para este Mercado: El sistema tomará en cuenta tanto la localidad de recogida como la ubicación del cliente para definir el mercado correspondiente. En base a este mercado, 
--se mostrarán únicamente los vehículos disponibles y adecuados para esa área específica.
--MOSTRARA LOS VEHICULOS DE ACUERDO A LA CIUDAD DE LA LOCALIDAD DONDE ESTA EL CLIENTE
select v.Id, v.Marca, v.Modelo, t.Tipo Transmision, ta.Tipo Tamaño, cl.Tipo Clase, v.TieneAire, l.Nombre Localidad, c.Nombre Ciudad from VehiculosLocalidad vl
inner join Vehiculo v on v.Id = vl.VehiculoID 
inner join Localidades l on l.ID = vl.LocalidadID 
inner join Ciudad c on c.ID = l.IdCiudad 
inner join Trasmision t on t.ID = v.TrasmisionID 
inner join Tamaño ta on ta.ID = v.TamañoID
inner join Clase cl on cl.ID = v.ClaseID 
where v.Disponible = 1 and l.ID = 2 and l.IdCiudad = 1 and l.Disponible = 1


execute Sp_LocalidadesVehiculos @operacion = 0

execute Sp_LocalidadesVehiculos @IdLocalidad = 2, @operacion = 1

execute Sp_LocalidadesVehiculos @IdLocalidad = 2, @IdCiudad = 1, @operacion = 2