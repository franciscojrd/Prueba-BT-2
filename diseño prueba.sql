
select * from Localidades
select * from Ciudad
select * from Trasmision
select * from Tama�o
select * from Clase
select * from Vehiculo 
select * from VehiculosLocalidad
select * from LocalidadesCovenio
 
 
 --Localidad de Recogida: Los clientes podr�n especificar la localidad desde donde desean recoger el veh�culo. Esta informaci�n ser� fundamental para determinar la disponibilidad de veh�culos en esa ubicaci�n
--Consulta localidad recogida

select l.ID, l.Nombre, l.Direccion, l.Descripcion, c.Nombre Ciudad from Localidades l
inner join Ciudad c on c.ID = l.IdCiudad 
where l.Disponible = 1


--. Localidad de Devoluci�n: Adem�s de la localidad de recogida, los usuarios podr�n indicar la localidad donde desean devolver el veh�culo. Esto permitir� calcular la disponibilidad y opciones de devoluci�n en
--funci�n de la ubicaci�n deseada.

--la LOCALIDAD SELECCIONADA ME VA A FILTRAR LAS LOCALIDADES EN CONVENIO CON LA MISMA
select l.ID, l.Nombre, l.Direccion, l.Descripcion, c.Nombre Ciudad from Localidades l
inner join LocalidadesCovenio lc on lc.LocalidadEntregaID = l.ID 
inner join Ciudad c on c.ID = l.IdCiudad 
where lc.LocalidadID  = 2 and l.Disponible = 1 and lc.Disponible = 1
 

--Carros Disponibles para este Mercado: El sistema tomar� en cuenta tanto la localidad de recogida como la ubicaci�n del cliente para definir el mercado correspondiente. En base a este mercado, 
--se mostrar�n �nicamente los veh�culos disponibles y adecuados para esa �rea espec�fica.
--MOSTRARA LOS VEHICULOS DE ACUERDO A LA CIUDAD DE LA LOCALIDAD DONDE ESTA EL CLIENTE
select v.Id, v.Marca, v.Modelo, t.Tipo Transmision, ta.Tipo Tama�o, cl.Tipo Clase, v.TieneAire, l.Nombre Localidad, c.Nombre Ciudad from VehiculosLocalidad vl
inner join Vehiculo v on v.Id = vl.VehiculoID 
inner join Localidades l on l.ID = vl.LocalidadID 
inner join Ciudad c on c.ID = l.IdCiudad 
inner join Trasmision t on t.ID = v.TrasmisionID 
inner join Tama�o ta on ta.ID = v.Tama�oID
inner join Clase cl on cl.ID = v.ClaseID 
where v.Disponible = 1 and l.ID = 2 and l.IdCiudad = 1 and l.Disponible = 1


execute Sp_LocalidadesVehiculos @operacion = 0

execute Sp_LocalidadesVehiculos @IdLocalidad = 2, @operacion = 1

execute Sp_LocalidadesVehiculos @IdLocalidad = 2, @IdCiudad = 1, @operacion = 2