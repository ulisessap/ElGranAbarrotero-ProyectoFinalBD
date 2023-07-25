-- QUERIES ALPHA

-- 1. Empleados cuyo nombre empiece con la letra C.
select * 
from cajero
where nombre like 'C%';

-- 2. Clientes que hayan nacido en el mes de Junio.
select *
from cliente
where to_char(fechanacimiento,'YYYY-MM-DD') like '%-06-%';

-- 3. Productos cuya fecha de caducidad este entre el 1 de enero del 2023 y del 7 de mayo del 2023.
select * 
from perecedero
where fechacaducidad >= '2023-01-01' AND fechacaducidad  <=  '2023-05-15';

-- 4. Productos cuya presentación sea en lata.
select *
from perecedero 
where presentacion = 'Lata';

-- 5. Todos los Clientes registrados en El Gran Abarrotero.
select * 
from cliente; 

-- 6. Consultar quienes son los gerentes que fueron contratados entre marzo y junio de 2016
select nombre,ciudad,fechaNacimiento,fechaContratacion
from gerente
where fechaContratacion between '2016-03-01' and '2016-06-30';

-- 7. Lista de productos perecederos más vendidos en todas las sucursales ordenados de 
-- forma descendente
select perecedero.idproducto, perecedero.nombre, count(contarperecedero.idproducto) 
as total_ventas
from perecedero
join contarperecedero on perecedero.idproducto = contarperecedero.idproducto
join venta on contarperecedero.idproducto = venta.idventa
where venta.idsucursal between 1 and 15
group by perecedero.idproducto, perecedero.nombre
order by total_ventas desc;
 

-- 8. Los clientes cuyo apellido paterno inicie con F y sean mujeres
select nombre,aPaterno,aMaterno 
from cliente
where aPaterno like 'F%' and genero = 'F';

-- 9. Nombre y marca de productos cuya presentación sea en caja, de precio mayor
-- o igual a 200 y que se caduquen antes del 30 de mayo del 2023
select nombre,marca
from perecedero
where presentacion = 'Caja' and precio >= 200 and fechaCaducidad < '2023-05-30';

--10. Gerentes con salario entre 15,000 y 60,000 pesos y que sean de las sucursales 2,6 o 12
select *
from gerente
where salario between 15000 and 60000 and idSucursal in (6,2,12);

--11. Encargados con salario mayor a 10,000 pesos y que hayan sido contratados en
-- el primer trimestre de 2023
select *
from encargado
where salario >= 10000 and fechaContratacion >= '2023-01-01' and fechaContratacion <= '2023-01-31';

--12.Clientes que sean de Monterrey, Aguascalientes, Acapulco o Morelia y cuya 
-- fecha de nacimiento sea mayor a 1990
select *
from cliente
where ciudad = 'Monterrey' or ciudad = 'Aguascalientes' or ciudad = 'Acapulco' or
      ciudad = 'Morelia' or fechaNacimiento >= '1990-01-01';
	   
-- 13.Ventas en efectivo efectuadas por cajeros que tengan sueldo menor o igual a 
-- 12,000 pesos y sean de las sucursales 5,8 o 15
select *
from cajero natural join venta
where salario<= 12000 and formaPago = 'Efectivo' and genero ='F' and idSucursal in (5,8,15) ;

--14. Toda la informacion de los clientes que tengan al menos dos compras
select *
from cliente
where idPersona in (
    select idCliente
    from venta
    group by idCliente
    having count(*) >= 2
);

-- 15. Obtener los 100 cajeros que más ventas ha realizado
select idpersona,idsucursal,concat(nombre,' ', apaterno,' ',amaterno) as nombre,		
		to_char(fechanacimiento, 'Mon dd yyyy') as fechanacimiento,
		to_char(fechacontratacion, 'Mon dd yyyy') as fechaContratacion,
		escolaridad,count( idpersona) as numVentas
from cajero c natural join venta v
group by idpersona
order by numventas desc
limit 100;		

-- 16. Productos de caja que vendieron más de 15 unidades 
select idsucursal,idproducto,nombre, marca, presentacion, to_char(precio, 'LFM999'),
		max(cantidad) as cantidad
from (perecedero natural join contenerperecedero) natural join venta
where presentacion = 'Caja' 
group by idsucursal,idproducto
having max(cantidad) > 15  
order by cantidad desc;

-- 17. Los Gerentes con menor sueldo de cada sucursal
select idpersona, concat(nombre,' ', apaterno,' ',amaterno) as nombre,
       gerente.idsucursal, to_char(salario,'LFM999,999') as salario,
       to_char(fechacontratacion, 'Mon dd yyyy') as fechaContratacion, genero 
from (select idsucursal, min(salario) as minimo
	  from gerente g 
      group by idsucursal) as saldosMinSucursal, gerente
where concat(saldosMinSucursal.idsucursal,saldosMinSucursal.minimo) = 
	  concat(gerente.idsucursal,gerente.salario)  
order by idsucursal;   

--18. Obtener nombre, ciudad y fechaNacimiento de los clientes
-- que hayan nacido entre el 21 de febrero de 1961 y el 24 de sept de 1987
select nombre,ciudad,fechanacimiento
from cliente
where fechanacimiento > '1961-02-20' and fechanacimiento < '1987-09-25';

--19. Clientes cuyo nombre inicie con L y vivan en alguna ciudad que comience con C
select *
from cliente
where nombre ilike 'L%' and 
      (ciudad ilike 'C%');

-- 20. La compra de mayor valor de cada cliente
select nombre, apaterno, amaterno, maxima from (select idcliente, max(cantidad*precio) as maxima 
from contenerperecedero natural join perecedero natural join venta group by idcliente)
as maximos join cliente on cliente.idpersona = maximos.idcliente order by maximos.maxima desc;

-- 21. Número de veces que ha comprado cada cliente en El Gran Abarrotero
select cliente.nombre, cliente.apaterno, cliente.idpersona, count(idventa) as veces from venta join cliente 
on cliente.idpersona = venta.idcliente group by cliente.idpersona order by cliente.idpersona;

-- 22. Número de cajeros que han sido contratados durante el mes de mayo en alguna sucursal en
-- orden descendente
select contratados from (
    select cajero.idsucursal, count(idpersona) as contratados
    from cajero
    join sucursal on cajero.idsucursal = sucursal.idsucursal
    where cajero.fechacontratacion between DATE '2023-05-01' and DATE '2023-05-31'
    group by cajero.idsucursal
) as contrataciones
order by contratados desc;

-- 23. Promedio del sueldo de los cajeros por sucursal
select promedio from (
    select sucursal.idsucursal, avg(cajero.salario) as promedio
    from cajero
    join sucursal on cajero.idsucursal = sucursal.idsucursal
    group by sucursal.idsucursal
) as promedios;

-- 24. Número de ventas por sucursal.
select idsucursal, count(idventa) as ventas from venta natural join sucursal 
group by idsucursal order by idsucursal ;




