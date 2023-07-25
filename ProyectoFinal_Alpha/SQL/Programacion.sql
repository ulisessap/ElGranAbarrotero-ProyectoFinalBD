-- DISPARADORES 

-- 1. Disparador que cambia las inserciones cuando se escribe 'Ciudad de México' a 'CDMX'
-- Crear el trigger
CREATE OR REPLACE FUNCTION actualizar_ciudad_cliente()
  RETURNS TRIGGER AS $$
BEGIN
  IF NEW.ciudad = 'Ciudad de México' THEN
    NEW.ciudad := 'CDMX';
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Asociar el trigger a la tabla "cliente"
CREATE TRIGGER actualizar_ciudad_cliente_disp
BEFORE INSERT OR UPDATE ON cliente
FOR EACH ROW
EXECUTE FUNCTION actualizar_ciudad_cliente();

-- Ejemplo de como funciona
INSERT INTO cliente(idPersona,nombre,aPaterno,aMaterno,fechaNacimiento,cp,ciudad,calle,numero,genero) VALUES (4001,'Harriot','Fallis','Piet','1969-09-22',68286,'Ciudad de México','Waubesa',92,'F');

SELECT * 
FROM cliente
WHERE idPersona=4001;



-- 2. Disparador que verifica que el salario mínimo sea de 2000.00
CREATE OR REPLACE FUNCTION verificaSalarioLic() RETURNS TRIGGER 
AS $$
DECLARE 
	esco varchar(20);
BEGIN
	IF(TG_OP = 'INSERT' or TG_OP = 'UPDATE') THEN
		SELECT escolaridad INTO esco FROM cajero
		WHERE idpersona = new.idpersona;
		IF (esco = 'Licenciatura' AND new.salario < 2000) THEN
			RAISE EXCEPTION 'El saldo minimo en % debe ser $2,000.00', esco;
		END IF;		
	END IF;
	RETURN null;
END;
$$
LANGUAGE plpgsql; 

-- Asociamos el trigger a la tabla cajero
CREATE TRIGGER saldoLicenciado
AFTER INSERT OR UPDATE ON cajero
FOR EACH ROW 
EXECUTE PROCEDURE verificaSalarioLic(); 

-- Probamos el trigger 
-- Intentamos insertar un cajero con un sueldo de 1900 para que sea visible el eror
INSERT INTO cajero(idPersona,idSucursal,nombre,aPaterno,aMaterno,fechaNacimiento,ciudad,cp,calle,numero,genero,salario,fechaContratacion,escolaridad) VALUES (4002,15,'Dag','Surridge','Beveridge','1968-09-20','Kizhinga',15276,'Fieldstone',51,'M',1900,'2023-12-17','Licenciatura');

-- FUNCIONES
-- 1. Función que devuelve el id,nombre y apellidos de los cajeros
-- que se llamen de cierta forma en determinada sucursal.
CREATE OR REPLACE FUNCTION trabajadores(nom varchar, num bigint) RETURNS
    TABLE(nombre varchar(70), materno varchar(70), paterno varchar(70), id bigint)
AS
$$
   	SELECT cajero.nombre, apaterno, amaterno, idpersona
   	FROM cajero JOIN sucursal ON cajero.idsucursal = sucursal.idsucursal 
   	WHERE num = sucursal.idsucursal
   	GROUP BY cajero.nombre, apaterno, amaterno, idpersona
   	HAVING cajero.nombre LIKE nom; 
$$
LANGUAGE SQL; 

-- Ejemplos de la ejecución de la función
select * from trabajadores('Berty%',5);




-- 2. Función que verifica la existencia de algún productO
CREATE OR REPLACE FUNCTION existenciaProducto(text,int) RETURNS SETOF "record"
AS $$
DECLARE 
	r record;
	tabla text := $1;
BEGIN
	for r in execute 'select nombre,idsucursal, idproducto, cantidad 
					  from contar'|| tabla ||' natural join '|| tabla || ' where idproducto = '|| $2
		loop
			return next r;
		end loop;
	return;
END;
$$
LANGUAGE plpgsql;

-- Ejemplos de la ejecución de la función 
SELECT * FROM existenciaProducto('perecedero',228) as ( nombre varchar,idsucursal int, idproducto int, cantidad int);
SELECT * FROM existenciaProducto('electronica',2104) as (nombre varchar,idsucursal int, idproducto int, cantidad int);
SELECT * FROM existenciaProducto('noperecedero',1073) as (nombre varchar,idsucursal int, idproducto int, cantidad int);
