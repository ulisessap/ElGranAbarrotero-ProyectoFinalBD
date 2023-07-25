
DROP SCHEMA IF EXISTS public cascade;
CREATE SCHEMA public;
-- Tabla sucursal
CREATE TABLE sucursal(
    idSucursal INT,
    nombre VARCHAR(50),
    municipio VARCHAR(50),
    cp INT,
    ciudad VARCHAR(30),
    calle VARCHAR(30),
    numero INT,
    colonia VARCHAR(30),
    fechaApertura DATE
);

--Restricciones de dominio
ALTER TABLE sucursal ALTER COLUMN idSucursal SET NOT NULL;
ALTER TABLE sucursal ADD CONSTRAINT sunombreD1 CHECK(nombre <> '');
ALTER TABLE sucursal ADD CONSTRAINT sumunicipioD1 CHECK(municipio <> '');
ALTER TABLE sucursal ALTER COLUMN cp SET NOT NULL;
ALTER TABLE sucursal ADD CONSTRAINT suciudadD1 CHECK(ciudad <> '');
ALTER TABLE sucursal ADD CONSTRAINT sucalleD1 CHECK(calle <> '');
ALTER TABLE sucursal ALTER COLUMN numero SET NOT NULL;
ALTER TABLE sucursal ADD CONSTRAINT suColD1 CHECK(colonia <> '');
ALTER TABLE sucursal ALTER COLUMN fechaApertura SET NOT NULL;

-- Restricciones de entidad
ALTER TABLE sucursal ADD CONSTRAINT suIdSucursalD1 UNIQUE(IdSucursal);
ALTER TABLE sucursal ADD CONSTRAINT sucursal_pkey PRIMARY KEY (IdSucursal);

COMMENT ON TABLE sucursal IS 'Tabla que contiene la informacion de las sucursales del El Gran Abarrotero';
COMMENT ON COLUMN sucursal.IdSucursal IS 'Identificador de la sucursal';
COMMENT ON COLUMN sucursal.nombre IS 'Nombre de la sucursal';
COMMENT ON COLUMN sucursal.municipio IS 'Municipio donde se encuentra localizada';
COMMENT ON COLUMN sucursal.cp IS 'Codigo postal de donde se encuentra localizada';
COMMENT ON COLUMN sucursal.ciudad  IS 'Ciudad donde se encuentra localizada';
COMMENT ON COLUMN sucursal.calle IS 'Calle donde se encuentra localizada';
COMMENT ON COLUMN sucursal.numero IS 'Numero de donde se encuentra localizada';
COMMENT ON COLUMN sucursal.colonia IS 'Colonia donde se encuentra localizada';
COMMENT ON COLUMN sucursal.fechaApertura IS 'Fecha en la que se hizo la apertura de la sucursal';

COMMENT ON CONSTRAINT sunombreD1 ON sucursal IS 'Restriccion check el cual nos asegura que nombre no sea la cadena vacia';
COMMENT ON CONSTRAINT sumunicipioD1 ON sucursal IS 'Restriccion check el cual nos asegura que el municipio no sea la cadena vacia';
COMMENT ON CONSTRAINT suciudadD1 ON sucursal IS 'Restriccion check el cual nos asegura que la ciudad no sea la cadena vacia';
COMMENT ON CONSTRAINT sucalleD1 ON sucursal IS 'Restriccion check el cual nos asegura que la calle no sea la cadena vacia';
COMMENT ON CONSTRAINT suColD1 ON sucursal IS 'Restriccion check el cual nos asegura que la colonia no sea la cadena vacia';
COMMENT ON CONSTRAINT suIdSucursalD1 ON sucursal IS 'Restriccion unique para el atributo identificador';
COMMENT ON CONSTRAINT sucursal_pkey ON sucursal IS 'Restriccion para establecer IdSucursal como la llave primaria';

-- Tabla Cliente
CREATE TABLE cliente(
    idPersona INT,
    nombre VARCHAR(30),
    aPaterno VARCHAR(30),
    aMaterno VARCHAR(30),
    fechaNacimiento DATE,
    cp INT,
    ciudad VARCHAR(30),
    calle VARCHAR(30),
    numero INT,
    genero CHAR(1)
);
-- Restricciones de dominio
ALTER TABLE cliente ALTER COLUMN idPersona SET NOT NULL;
ALTER TABLE cliente ADD CONSTRAINT clnombreD1 CHECK(nombre <> '');
ALTER TABLE cliente ADD CONSTRAINT claPaternoD1 CHECK(aPaterno <> '');
ALTER TABLE cliente ADD CONSTRAINT claMaternoD1 CHECK(aMaterno <> '');
ALTER TABLE cliente ALTER COLUMN fechaNacimiento SET NOT NULL;
ALTER TABLE cliente ALTER COLUMN cp SET NOT NULL;
ALTER TABLE cliente ADD CONSTRAINT clciudadD1 CHECK(ciudad <> '');
ALTER TABLE cliente ADD CONSTRAINT clcalleD1 CHECK(calle <> '');
ALTER TABLE cliente ALTER COLUMN numero SET NOT NULL;
ALTER TABLE cliente ADD CONSTRAINT clgeneroD1 CHECK(genero = 'M' or genero = 'F');

-- Restricciones de entidad
ALTER TABLE cliente ADD CONSTRAINT clIdPersonaD1 UNIQUE(IdPersona);
ALTER TABLE cliente ADD CONSTRAINT cliente_pkey PRIMARY KEY (IdPersona);

--Comentarios
COMMENT ON TABLE cliente IS 'Tabla que contiene la informacion de cliente';
COMMENT ON COLUMN cliente.idPersona IS 'Identificador del cliente';
COMMENT ON COLUMN cliente.nombre IS 'Nombre del cliente';
COMMENT ON COLUMN cliente.aPaterno IS 'Apellido paterno de cliente';
COMMENT ON COLUMN cliente.aMaterno IS 'Apellido materno de cliente';
COMMENT ON COLUMN cliente.fechaNacimiento IS 'Fecha de nacimiento de cliente';
COMMENT ON COLUMN cliente.cp IS 'Cp de cliente';
COMMENT ON COLUMN cliente.ciudad IS 'Ciudad de cliente';
COMMENT ON COLUMN cliente.calle IS 'Calle de cliente';
COMMENT ON COLUMN cliente.numero IS 'Numero de cliente';
COMMENT ON COLUMN cliente.genero IS 'Genero de cliente';


COMMENT ON CONSTRAINT clnombreD1 ON cliente IS 'Restriccion check el cual nos asegura que nombre no sea la cadena vacia';
COMMENT ON CONSTRAINT claPaternoD1 ON cliente IS 'Restriccion check el cual nos asegura que apellido paterno no sea la cadena vacia';
COMMENT ON CONSTRAINT claMaternoD1 ON cliente IS 'Restriccion check el cual nos asegura que apellido materno no sea la cadena vacia';
COMMENT ON CONSTRAINT clciudadD1 ON cliente IS 'Restriccion check el cual nos asegura que ciudad no sea la cadena vacia';
COMMENT ON CONSTRAINT clcalleD1 ON cliente IS 'Restriccion check el cual nos asegura que calle no sea la cadena vacia';
COMMENT ON CONSTRAINT clgeneroD1 ON cliente IS 'Restriccion check el cual nos asegura que genero no sea M o F';
COMMENT ON CONSTRAINT clIdPersonaD1 ON cliente IS 'Restriccion unique para el atributo identificador';
COMMENT ON CONSTRAINT cliente_pkey ON cliente IS 'Restriccion para establecer IdPersona como la llave primaria';


CREATE TABLE perecedero(
    idProducto INT,
    nombre VARCHAR(30),
    marca VARCHAR(30),
    precio INT,
    presentacion VARCHAR(10),
    fechaPreparacion date,
    fechaCaducidad date
);

-- Restricciones de dominio 
ALTER TABLE perecedero ALTER COLUMN idProducto SET NOT NULL;
ALTER TABLE perecedero ADD CONSTRAINT perNombre CHECK(nombre <> '');
ALTER TABLE perecedero ADD CONSTRAINT perMarca CHECK(marca <> '');
ALTER TABLE perecedero ALTER COLUMN precio SET NOT NULL;
ALTER TABLE perecedero ADD CONSTRAINT perPresentacion CHECK(presentacion <> '');
ALTER TABLE perecedero ADD CONSTRAINT perFechaPreparacion CHECK(fechaPreparacion >= '2000-01-01');
ALTER TABLE perecedero ADD CONSTRAINT perfechaCaducidad CHECK(fechaCaducidad >= '2023-01-01');

-- Restricciones de entidad
ALTER TABLE perecedero ADD CONSTRAINT perecederounique UNIQUE(idProducto);
ALTER TABLE perecedero ADD CONSTRAINT perecederopkey PRIMARY KEY(idProducto);

--comentarios
COMMENT ON TABLE perecedero IS 'Tabla que contiene la informacion de los productos perecederos';
COMMENT ON COLUMN perecedero.IdProducto IS 'Identificador del producto perecedero';
COMMENT ON COLUMN perecedero.nombre IS 'Nombre del producto perecedero';
COMMENT ON COLUMN perecedero.precio IS 'Precio del producto perecedero';
COMMENT ON COLUMN perecedero.marca  IS 'Nombre de la marca del producto perecedero';
COMMENT ON COLUMN perecedero.presentacion IS 'Presentacion del producto';
COMMENT ON COLUMN perecedero.fechaPreparacion IS 'Fecha de preparacion del producto';
COMMENT ON COLUMN perecedero.fechaCaducidad IS 'Fecha de caducidad del producto';


COMMENT ON CONSTRAINT perNombre ON perecedero IS 'Restriccion check el cual nos asegura que nombre no sea la cadena vacia';
COMMENT ON CONSTRAINT perMarca ON perecedero IS 'Restriccion check el cual nos asegura que nombre no sea la cadena vacia';
COMMENT ON CONSTRAINT perPresentacion ON perecedero IS 'Restriccion check el cual nos asegura que la presentacion no sea la cadena vacia';
COMMENT ON CONSTRAINT perFechaPreparacion ON perecedero IS 'Restriccion check el cual nos asegura que la fecha sea mayor a 2000-01-01';
COMMENT ON CONSTRAINT perPresentacion ON perecedero IS 'Restriccion check el cual nos asegura que la fecha sea mayor a 2023-01-01';
COMMENT ON CONSTRAINT perecederounique ON perecedero IS 'Se establece el atributo idProducto como unique';
COMMENT ON CONSTRAINT perecederopkey ON perecedero IS 'Restriccion para seleccinar el atributo idProducto como llave primaria';
-- Tabla noPerecedero
CREATE TABLE noPerecedero(
    idProducto INT,
    nombre VARCHAR(30),
    marca VARCHAR(30),
    precio INT,
    presentacion VARCHAR(10),
    fechaPreparacion date
);

-- Restricciones de dominio
ALTER TABLE noPerecedero ALTER COLUMN idProducto SET NOT NULL;
ALTER TABLE noPerecedero ADD CONSTRAINT noPerNombre CHECK(nombre <> '');
ALTER TABLE noPerecedero ADD CONSTRAINT noPerMarca CHECK(marca <> '');
ALTER TABLE noPerecedero ALTER COLUMN precio SET NOT NULL;
ALTER TABLE noPerecedero ADD CONSTRAINT noPerPresentacion CHECK(presentacion <> '');
ALTER TABLE noPerecedero ADD CONSTRAINT noPerFechaPreparacion CHECK(fechaPreparacion >= '2000-01-01');
-- Restricciones de entidad
ALTER TABLE noPerecedero ADD CONSTRAINT noPerunique UNIQUE(idProducto);
ALTER TABLE noPerecedero ADD CONSTRAINT noPerpkey PRIMARY KEY(idProducto);

--Comentarios
COMMENT ON TABLE noPerecedero IS 'Tabla que contiene la informacion de los productos no perecederos';
COMMENT ON COLUMN noPerecedero.IdProducto IS 'Identificador del producto no perecedero';
COMMENT ON COLUMN noPerecedero.nombre IS 'Nombre del producto no perecedero';
COMMENT ON COLUMN noPerecedero.precio IS 'Precio del producto no perecedero';
COMMENT ON COLUMN noPerecedero.marca IS 'Nombre de la marca del producto no perecedero';
COMMENT ON COLUMN noPerecedero.presentacion IS 'Presentacion del producto';
COMMENT ON COLUMN noPerecedero.fechaPreparacion IS 'Fecha de preparacion del producto';


COMMENT ON CONSTRAINT noPerNombre ON noPerecedero IS 'Restriccion check el cual nos asegura que nombre no sea la cadena vacia';
COMMENT ON CONSTRAINT noPerMarca ON noPerecedero IS 'Restriccion check el cual nos asegura que nombre no sea la cadena vacia';
COMMENT ON CONSTRAINT noPerPresentacion ON noPerecedero IS 'Restriccion check el cual nos asegura que la presentacion no sea la cadena vacia';
COMMENT ON CONSTRAINT noPerFechaPreparacion ON noPerecedero IS 'Restriccion check el cual nos asegura que la fecha sea mayor a 2000-01-01';
COMMENT ON CONSTRAINT noPerPresentacion ON noPerecedero IS 'Restriccion check el cual nos asegura que la fecha sea mayor a 2023-01-01';
COMMENT ON CONSTRAINT noPerunique ON noPerecedero IS 'Se establece el atributo idProducto como unique';
COMMENT ON CONSTRAINT noPerpkey ON noPerecedero IS 'Restriccion para seleccinar el atributo idProducto como llave primaria';



-- Tabla eletrónica 
CREATE TABLE electronica(
    idProducto INT,
    nombre VARCHAR(30),
    marca VARCHAR(30),
    precio INT,
    descripcion VARCHAR(30),
    categoria VARCHAR(20),
    consumoElectrico INT
);
-- Restricciones de dominio
ALTER TABLE electronica ALTER COLUMN idProducto SET NOT NULL;
ALTER TABLE electronica ADD CONSTRAINT elecNombre CHECK(nombre <> '');
ALTER TABLE electronica ADD CONSTRAINT elecMarca CHECK(marca <> '');
ALTER TABLE electronica ALTER COLUMN precio SET NOT NULL;
ALTER TABLE electronica ADD CONSTRAINT elecDescrip CHECK(descripcion <> '');
ALTER TABLE electronica ADD CONSTRAINT elecCategoria CHECK(categoria <> '');
ALTER TABLE electronica ALTER COLUMN consumoElectrico SET NOT NULL;

-- Restricciones de entidad
ALTER TABLE electronica ADD CONSTRAINT elecUnique UNIQUE(idProducto);
ALTER TABLE electronica ADD CONSTRAINT elecpkey PRIMARY KEY(idProducto);

--Comentarios
COMMENT ON TABLE electronica IS 'Tabla que contiene la informacion de los productos de electronica';
COMMENT ON COLUMN electronica.IdProducto IS 'Identificador del producto de elctronica';
COMMENT ON COLUMN electronica.nombre IS 'Nombre del producto de electronica';
COMMENT ON COLUMN electronica.marca  IS 'Nombre de la marca del producto de electronica';
COMMENT ON COLUMN electronica.precio IS 'Precio del producto de electronica';
COMMENT ON COLUMN electronica.descripcion IS 'Descripcion del producto de electronica';
COMMENT ON COLUMN electronica.categoria IS 'Categoria del producto';
COMMENT ON COLUMN electronica.consumoElectrico IS 'Consumo electrico del producto de electronica';

COMMENT ON CONSTRAINT elecnombre ON electronica IS 'Restriccion check el cual nos asegura que nombre no sea la cadena vacia';
COMMENT ON CONSTRAINT elecMarca ON electronica IS 'Restriccion check el cual nos asegura que marca no sea la cadena vacia';
COMMENT ON CONSTRAINT elecDescrip ON electronica IS 'Restriccion check el cual nos asegura que descripcion no sea la cadena vacia';
COMMENT ON CONSTRAINT elecCategoria ON electronica IS 'Restriccion check el cual nos asegura que categoria no sea la cadena vacia';
COMMENT ON CONSTRAINT elecUnique ON electronica IS 'Se establece el atributo idProducto como unique';
COMMENT ON CONSTRAINT elecpkey ON electronica IS 'Restriccion para seleccinar el atributo idProducto como llave primaria';
-- Tabla Encargado
CREATE TABLE encargado(
    idPersona INT,
    idSucursal INT,
    nombre varChar(30),
    aPaterno varChar(15),
    aMaterno varChar(15),
    fechaNacimiento date,
    ciudad varChar(15),
    cp int,
    calle varChar(15),
    numero int,
    genero char(1),
    salario int,
    fechaContratacion date,
    escolaridad varChar(15)
);

--Restricciones de Dominio 

ALTER TABLE encargado ALTER COLUMN idPersona SET NOT NULL;
ALTER TABLE encargado ALTER COLUMN idSucursal SET NOT NULL;
ALTER TABLE encargado ADD CONSTRAINT encargadoNombre CHECK(nombre <> '');
ALTER TABLE encargado ADD CONSTRAINT encargadoaPaterno CHECK(aPaterno <> '');
ALTER TABLE encargado ADD CONSTRAINT encargadoaMaterno CHECK(aMaterno <> '');
ALTER TABLE encargado ADD CONSTRAINT encargadofechaNacimiento CHECK(fechaNacimiento >= '1960-01-01');
ALTER TABLE encargado ADD CONSTRAINT encargadociudad CHECK (ciudad <> '');
ALTER TABLE encargado ADD CONSTRAINT encargadocp CHECK (cp between 10000 and 99999);
ALTER TABLE encargado ADD CONSTRAINT encargadocalle CHECK (calle <> '');
ALTER TABLE encargado ALTER COLUMN numero SET NOT NULL;
ALTER TABLE encargado ADD CONSTRAINT encargadogenero CHECK(genero = 'M' or genero = 'F');
ALTER TABLE encargado ALTER COLUMN salario SET NOT NULL;
ALTER TABLE encargado ADD CONSTRAINT encargadoFechaContratacion CHECK(fechaContratacion >= '2000-01-01');
ALTER TABLE encargado ADD CONSTRAINT encargadoEscolaridad CHECK(escolaridad <> '');

--Restricciones de Entidad 
ALTER TABLE encargado ADD CONSTRAINT encargadouniquep UNIQUE(idPersona);
ALTER TABLE encargado ADD CONSTRAINT encargado_pkey PRIMARY KEY(idPersona);
--Referencial
ALTER TABLE encargado ADD CONSTRAINT encargado_fkey FOREIGN KEY (idSucursal)
REFERENCES sucursal(idSucursal) 
ON UPDATE CASCADE ON DELETE CASCADE;


-- Comentarios 
COMMENT ON TABLE encargado IS 'Tabla que contiene la información correspondiente a los encargados de la sucursal';
COMMENT ON COLUMN encargado.idPersona IS 'Identificador de los encargados';
COMMENT ON COLUMN encargado.idSucursal IS 'Identificador de las sucursales';
COMMENT ON COLUMN encargado.nombre IS 'Nombre del encargado';
COMMENT ON COLUMN encargado.aPaterno IS 'Apellido paterno del encargado';
COMMENT ON COLUMN encargado.aMaterno IS 'Apellido materno del encargado';
COMMENT ON COLUMN encargado.fechaNacimiento IS 'Fecha de nacimiento del encargado';
COMMENT ON COLUMN encargado.ciudad IS 'Ciudad donde vive el encargado';
COMMENT ON COLUMN encargado.cp IS 'Código Postal donde vive el encargado';
COMMENT ON COLUMN encargado.calle IS 'Calle en donde vive el encargado';
COMMENT ON COLUMN encargado.numero IS 'Número en donde vive el encargado';
COMMENT ON COLUMN encargado.genero IS 'Género del encargado';
COMMENT ON COLUMN encargado.salario IS 'Salario del encargado';
COMMENT ON COLUMN encargado.fechaContratacion IS 'Fecha de contratación del encargado';
COMMENT ON COLUMN encargado.escolaridad IS 'Escolaridad del encargado';

COMMENT ON CONSTRAINT encargadoNombre ON encargado IS 'Restricción Check que se asegura que el nombre del encargado no sea una cadena vacía';
COMMENT ON CONSTRAINT encargadoaPaterno ON encargado IS 'Restricción Check que se asegura que el apellido paterno del encargado no sea una caena vacía';
COMMENT ON CONSTRAINT encargadoaMaterno ON encargado IS 'Restricción Check que se asegura que el apellido materno del encargado no sea una cadena vacía';
COMMENT ON CONSTRAINT encargadofechaNacimiento ON encargado IS 'Restricción Check que se asegura que sea mayor a 1970';
COMMENT ON CONSTRAINT encargadoCiudad ON encargado IS 'Restricción Check que se asegura que la cadena ciudad no sea vacía';
COMMENT ON CONSTRAINT encargadocp ON encargado IS 'Restriccion Check que se asegura que la cadena CP no sea vacía';
COMMENT ON CONSTRAINT encargadocalle ON encargado IS 'Restriccion Check que se asegura que la cadena calle no sea vacía';
COMMENT ON CONSTRAINT encargadogenero ON encargado IS 'Restriccion Check que se asegura que la cadena solo tome alguno de los dos valores disponibles';
COMMENT ON CONSTRAINT encargadofechaContratacion ON encargado IS 'Restriccion Check que se asegura que la fecha de Contratación sea después al 2000';
COMMENT ON CONSTRAINT encargadoEscolaridad ON encargado IS 'Restriccion Check que se asegura que la cadena Escolaridad no sea vacía';
COMMENT ON CONSTRAINT encargadouniquep ON encargado IS 'Restricción unique que evita que existan IDs repetidos';
COMMENT ON CONSTRAINT encargado_pkey ON encargado IS 'Restricción que vuelve llave primaria a idPersona';
COMMENT ON CONSTRAINT encargado_fkey ON encargado IS 'Restricción que vuelve llave secundaria a idSucursal';


-- Tabla Gerente
CREATE TABLE gerente(
    idPersona INT,
    idSucursal INT,
    nombre varChar(30),
    aPaterno varChar(15),
    aMaterno varChar(15),
    fechaNacimiento date,
    ciudad varChar(15),
    cp int,
    calle varChar(15),
    numero int,
    genero char(1),
    salario int,
    fechaContratacion date,
    escolaridad varChar(15)
);

--Restricciones de dominio
ALTER TABLE gerente ALTER COLUMN idPersona SET NOT NULL;
ALTER TABLE gerente ALTER COLUMN idSucursal SET NOT NULL;
ALTER TABLE gerente ADD CONSTRAINT gerentenombre CHECK(nombre <> '');
ALTER TABLE gerente ADD CONSTRAINT gerenteaPaterno CHECK(aPaterno <> '');
ALTER TABLE gerente ADD CONSTRAINT gerenteaMaterno CHECK(aMaterno <> '');
ALTER TABLE gerente ADD CONSTRAINT gerentefechaNacimiento CHECK(fechaNacimiento >= '1960-01-01');
ALTER TABLE gerente ADD CONSTRAINT gerenteciudad CHECK (ciudad <> '');
ALTER TABLE gerente ADD CONSTRAINT gerentecp CHECK (cp between 10000 and 99999);
ALTER TABLE gerente ADD CONSTRAINT gerentecalle CHECK (calle <> '');
ALTER TABLE gerente ALTER COLUMN numero SET NOT NULL;
ALTER TABLE gerente ADD CONSTRAINT gerentegenero CHECK(genero = 'M' or genero = 'F');
ALTER TABLE gerente ALTER COLUMN salario SET NOT NULL;
ALTER TABLE gerente ADD CONSTRAINT gerenteFechaContratacion CHECK(fechaContratacion >= '2000-01-01');
ALTER TABLE gerente ADD CONSTRAINT gerenteEscolaridad CHECK(escolaridad <> '');

--Restricciones de Entidad 
ALTER TABLE gerente ADD CONSTRAINT gerenteuniquep UNIQUE(idPersona);
ALTER TABLE gerente ADD CONSTRAINT gerente_pkey PRIMARY KEY(idPersona);
--Referencial
ALTER TABLE gerente ADD CONSTRAINT gerente_fkey FOREIGN KEY (idSucursal)
REFERENCES sucursal(idSucursal)
ON UPDATE CASCADE ON DELETE CASCADE;

-- Comentarios
COMMENT ON TABLE gerente IS 'Tabla que contiene la información correspondiente a los gerentes de la sucursal';
COMMENT ON COLUMN gerente.idPersona IS 'Identificador de los gerentes';
COMMENT ON COLUMN gerente.idSucursal IS 'Identificador de las sucursales';
COMMENT ON COLUMN gerente.nombre IS 'Nombre del gerente';
COMMENT ON COLUMN gerente.aPaterno IS 'Apellido paterno del gerente';
COMMENT ON COLUMN gerente.aMaterno IS 'Apellido materno del gerente';
COMMENT ON COLUMN gerente.fechaNacimiento IS 'Fecha de nacimiento del gerente';
COMMENT ON COLUMN gerente.ciudad IS 'Ciudad donde vive el gerente';
COMMENT ON COLUMN gerente.cp IS 'Código Postal donde vive el gerente';
COMMENT ON COLUMN gerente.calle IS 'Calle en donde vive el gerente';
COMMENT ON COLUMN gerente.numero IS 'Número en donde vive el gerente';
COMMENT ON COLUMN gerente.genero IS 'Género del gerente';
COMMENT ON COLUMN gerente.salario IS 'Salario del gerente';
COMMENT ON COLUMN gerente.fechaContratacion IS 'Fecha de contratación del gerente';
COMMENT ON COLUMN gerente.escolaridad IS 'Escolaridad del gerente';

COMMENT ON CONSTRAINT gerentenombre ON gerente IS 'Restricción Check que se asegura que el nombre del gerente no sea una cadena vacía';
COMMENT ON CONSTRAINT gerenteaPaterno ON gerente IS 'Restricción Check que se asegura que el apellido paterno del gerente no sea una caena vacía';
COMMENT ON CONSTRAINT gerenteaMaterno ON gerente IS 'Restricción Check que se asegura que el apellido materno del gerente no sea una cadena vacía';
COMMENT ON CONSTRAINT gerentefechaNacimiento ON gerente IS 'Restricción Check que se asegura que sea mayor a 1970';
COMMENT ON CONSTRAINT gerenteCiudad ON gerente IS 'Restricción Check que se asegura que la cadena ciudad no sea vacía';
COMMENT ON CONSTRAINT gerentecp ON gerente IS 'Restriccion Check que se asegura que la cadena CP no sea vacía';
COMMENT ON CONSTRAINT gerentecalle ON gerente IS 'Restriccion Check que se asegura que la cadena calle no sea vacía';
COMMENT ON CONSTRAINT gerentegenero ON gerente IS 'Restriccion Check que se asegura que la cadena solo tome alguno de los dos valores disponibles';
COMMENT ON CONSTRAINT gerentefechaContratacion ON gerente IS 'Restriccion Check que se asegura que la fecha de Contratación sea después al 2000';
COMMENT ON CONSTRAINT gerenteEscolaridad ON gerente IS 'Restriccion Check que se asegura que la cadena Escolaridad no sea vacía';
COMMENT ON CONSTRAINT gerenteuniquep ON gerente IS 'Restricción unique que evita que existan IDs repetidos';
COMMENT ON CONSTRAINT gerente_pkey ON gerente IS 'Restricción que vuelve llave primaria a idPersona';
COMMENT ON CONSTRAINT gerente_fkey ON gerente IS 'Restricción que vuelve llave secundaria a idSucursal';


-- Tabla cajero

CREATE TABLE cajero(
    idPersona INT,
    idSucursal INT,
    nombre varChar(30),
    aPaterno varChar(30),
    aMaterno varChar(30),
    fechaNacimiento date,
    ciudad varChar(30),
    cp int,
    calle varChar(30),
    numero int,
    genero varChar(30),
    salario int,
    fechaContratacion date,
    escolaridad varChar(30)
);


--Restricciones de dominio
ALTER TABLE cajero ALTER COLUMN idPersona SET NOT NULL;
ALTER TABLE cajero ALTER COLUMN idSucursal SET NOT NULL;
ALTER TABLE cajero ADD CONSTRAINT cajeronombre CHECK(nombre <> '');
ALTER TABLE cajero ADD CONSTRAINT cajeroaPaterno CHECK(aPaterno <> '');
ALTER TABLE cajero ADD CONSTRAINT cajeroaMaterno CHECK(aMaterno <> '');
ALTER TABLE cajero ADD CONSTRAINT cajerofechaNacimiento CHECK(fechaNacimiento >= '1960-01-01');
ALTER TABLE cajero ADD CONSTRAINT cajerociudad CHECK (ciudad <> '');
ALTER TABLE cajero ADD CONSTRAINT cajerocp CHECK (cp between 10000 and 99999);
ALTER TABLE cajero ADD CONSTRAINT cajerocalle CHECK (calle <> '');
ALTER TABLE cajero ALTER COLUMN numero SET NOT NULL;
ALTER TABLE cajero ADD CONSTRAINT cajerogenero CHECK(genero = 'M' or genero = 'F');
ALTER TABLE cajero ALTER COLUMN salario SET NOT NULL;
ALTER TABLE cajero ADD CONSTRAINT cajerofechaContratacion CHECK(fechaContratacion >= '2023-01-01');
ALTER TABLE cajero ADD CONSTRAINT cajeroEscolaridad CHECK(escolaridad <> '');

--Restricciones de Entidad 
ALTER TABLE cajero ADD CONSTRAINT cajerouniquep UNIQUE(idPersona);
ALTER TABLE cajero ADD CONSTRAINT cajero_pkey PRIMARY KEY(idPersona);
--Referencial
ALTER TABLE cajero ADD CONSTRAINT cajero_fkey FOREIGN KEY (idSucursal)
REFERENCES sucursal(idSucursal)
ON UPDATE CASCADE ON DELETE SET NULL;

-- Comentarios
COMMENT ON TABLE cajero IS 'Tabla que contiene la información correspondiente a los cajeros de la sucursal';
COMMENT ON COLUMN cajero.idPersona IS 'Identificador de los cajeros';
COMMENT ON COLUMN cajero.idSucursal IS 'Identificador de las sucursales';
COMMENT ON COLUMN cajero.nombre IS 'Nombre del cajero';
COMMENT ON COLUMN cajero.aPaterno IS 'Apellido paterno del cajero';
COMMENT ON COLUMN cajero.aMaterno IS 'Apellido materno del cajero';
COMMENT ON COLUMN cajero.fechaNacimiento IS 'Fecha de nacimiento del cajero';
COMMENT ON COLUMN cajero.ciudad IS 'Ciudad donde vive el cajero';
COMMENT ON COLUMN cajero.cp IS 'Código Postal donde vive el cajero';
COMMENT ON COLUMN cajero.calle IS 'Calle en donde vive el cajero';
COMMENT ON COLUMN cajero.numero IS 'Número en donde vive el cajero';
COMMENT ON COLUMN cajero.genero IS 'Género del cajero';
COMMENT ON COLUMN cajero.salario IS 'Salario del cajero';
COMMENT ON COLUMN cajero.fechaContratacion IS 'Fecha de contratación del cajero';
COMMENT ON COLUMN cajero.escolaridad IS 'Escolaridad del cajero';

COMMENT ON CONSTRAINT cajeronombre ON cajero IS 'Restricción Check que se asegura que el nombre del cajero no sea una cadena vacía';
COMMENT ON CONSTRAINT cajeroaPaterno ON cajero IS 'Restricción Check que se asegura que el apellido paterno del cajero no sea una caena vacía';
COMMENT ON CONSTRAINT cajeroaMaterno ON cajero IS 'Restricción Check que se asegura que el apellido materno del cajero no sea una cadena vacía';
COMMENT ON CONSTRAINT cajerofechaNacimiento ON cajero IS 'Restricción Check que se asegura que sea mayor a 1970';
COMMENT ON CONSTRAINT cajerociudad ON cajero IS 'Restricción Check que se asegura que la cadena ciudad no sea vacía';
COMMENT ON CONSTRAINT cajerocp ON cajero IS 'Restriccion Check que se asegura que la cadena CP no sea vacía';
COMMENT ON CONSTRAINT cajerocalle ON cajero IS 'Restriccion Check que se asegura que la cadena calle no sea vacía';
COMMENT ON CONSTRAINT cajerogenero ON cajero IS 'Restriccion Check que se asegura que la cadena solo tome alguno de los dos valores disponibles';
COMMENT ON CONSTRAINT cajerofechaContratacion ON cajero IS 'Restriccion Check que se asegura que la fecha de Contratación sea después al 2000';
COMMENT ON CONSTRAINT cajeroEscolaridad ON cajero IS 'Restriccion Check que se asegura que la cadena Escolaridad no sea vacía';
COMMENT ON CONSTRAINT cajerouniquep ON cajero IS 'Restricción unique que evita que existan IDs repetidos';
COMMENT ON CONSTRAINT cajero_pkey ON cajero IS 'Restricción que vuelve llave primaria a idPersona';
COMMENT ON CONSTRAINT cajero_fkey ON cajero IS 'Restricción que vuelve llave secundaria a idSucursal';


--Tabla telefonoSucursal
CREATE TABLE telefonoSucursal(
    idSucursal INT,
    telefono BIGINT
);

--Restricciones de dominio

ALTER TABLE telefonoSucursal ALTER COLUMN idSucursal SET NOT NULL;
ALTER TABLE telefonoSucursal ALTER COLUMN telefono SET NOT NULL;

--Restricciones de Entidad 
ALTER TABLE telefonoSucursal ADD CONSTRAINT telefonoSucursaluniquep UNIQUE(telefono);
ALTER TABLE telefonoSucursal ADD CONSTRAINT telefonoSucursal_pkey PRIMARY KEY(idSucursal, telefono);
--Referencial
ALTER TABLE telefonoSucursal ADD CONSTRAINT telefonoSucursal_fkey FOREIGN KEY (idSucursal)
REFERENCES sucursal(idSucursal)
ON UPDATE CASCADE ON DELETE CASCADE;

COMMENT ON TABLE telefonoSucursal IS 'Tabla que contiene la informacion de los telefonos de las sucursales del El Gran Abarrotero';
COMMENT ON COLUMN telefonoSucursal.IdSucursal IS 'Identificador de la sucursal';
COMMENT ON COLUMN telefonoSucursal.telefono IS 'Telefono de la sucursal';

COMMENT ON CONSTRAINT telefonoSucursaluniquep ON telefonoSucursal IS 'Restriccion unique para el atributo identificador';
COMMENT ON CONSTRAINT telefonoSucursal_pkey ON telefonoSucursal IS 'Restriccion para establecer la llave primaria, la cual es compuesta';
COMMENT ON CONSTRAINT telefonoSucursal_fkey ON telefonoSucursal IS 'Restriccion establecer la llave foranea';


--Tabla telefonoCliente
CREATE TABLE telefonoCliente(
    idPersona INT,
    telefono BIGINT
);
--Restricciones de dominio

ALTER TABLE telefonoCliente ALTER COLUMN idPersona SET NOT NULL;
ALTER TABLE telefonoCliente ALTER COLUMN telefono SET NOT NULL;

--Restricciones de entidad
--Restricciones de Entidad 
ALTER TABLE telefonoCliente ADD CONSTRAINT telefonoClienteuniquep UNIQUE(telefono);
ALTER TABLE telefonoCliente ADD CONSTRAINT telefonoCliente_pkey PRIMARY KEY(idPersona,telefono);
--Referencial
ALTER TABLE telefonoCliente ADD CONSTRAINT telefonoCliente_fkey FOREIGN KEY (idPersona)
REFERENCES cliente(idPersona)
ON UPDATE CASCADE ON DELETE CASCADE;
-- Comentarios
COMMENT ON TABLE telefonoCliente IS 'Tabla que contiene la informacion de los telefonos de los clientes';
COMMENT ON COLUMN telefonoCliente.idPersona IS 'Identificador del cliente';
COMMENT ON COLUMN telefonoCliente.telefono IS 'Telefono del cliente';

COMMENT ON CONSTRAINT telefonoClienteuniquep ON telefonoCliente IS 'Restriccion unique para el atributo identificador';
COMMENT ON CONSTRAINT telefonoCliente_pkey ON telefonoCliente IS 'Restriccion para establecer la llave primaria, la cual es compuesta';
COMMENT ON CONSTRAINT telefonoCliente_fkey ON telefonoCliente IS 'Restriccion para establecer la llave foranea con la tabla cliente';

--Tabla telefonoEncargado
CREATE TABLE telefonoEncargado(
    idPersona INT,
    telefono BIGINT
);

--Restricciones de dominio

ALTER TABLE telefonoEncargado ALTER COLUMN idPersona SET NOT NULL;
ALTER TABLE telefonoEncargado ALTER COLUMN telefono SET NOT NULL;

--Restricciones de Entidad 
ALTER TABLE telefonoEncargado ADD CONSTRAINT telefonoEncargadouniquep UNIQUE(telefono);
ALTER TABLE telefonoEncargado ADD CONSTRAINT telefonoEncargado_pkey PRIMARY KEY(idPersona,telefono);
--Referencial
ALTER TABLE telefonoEncargado ADD CONSTRAINT telefonoEncargado_fkey FOREIGN KEY (idPersona)
REFERENCES encargado(idPersona)
ON UPDATE CASCADE ON DELETE CASCADE;
-- Comentarios
COMMENT ON TABLE telefonoEncargado IS 'Tabla que contiene la informacion de los telefonos de los encargados';
COMMENT ON COLUMN telefonoEncargado.idPersona IS 'Identificador del encargado';
COMMENT ON COLUMN telefonoEncargado.telefono IS 'Telefono del encargado';

COMMENT ON CONSTRAINT telefonoEncargadouniquep ON telefonoEncargado IS 'Restriccion unique para el atributo identificador';
COMMENT ON CONSTRAINT telefonoEncargado_pkey ON telefonoEncargado IS 'Restriccion para establecer la llave primaria, la cual es compuesta';
COMMENT ON CONSTRAINT telefonoEncargado_fkey ON telefonoEncargado IS 'Restriccion para establecer la llave foranea con la tabla encargado';

--Tabla telefonoGerente
CREATE TABLE telefonoGerente(
    idPersona INT,
    telefono BIGINT
);

--Restricciones de dominio

ALTER TABLE telefonoGerente ALTER COLUMN idPersona SET NOT NULL;
ALTER TABLE telefonoGerente ALTER COLUMN telefono SET NOT NULL;

--Restricciones de Entidad 
ALTER TABLE telefonoGerente ADD CONSTRAINT telefonoGerenteuniquep UNIQUE(telefono);
ALTER TABLE telefonoGerente ADD CONSTRAINT telefonoGerente_pkey PRIMARY KEY(idPersona,telefono);
--Referencial
ALTER TABLE telefonoGerente ADD CONSTRAINT telefonoGerente_fkey FOREIGN KEY (idPersona)
REFERENCES gerente(idPersona)
ON UPDATE CASCADE ON DELETE CASCADE;
-- Comentarios
COMMENT ON TABLE telefonoGerente IS 'Tabla que contiene la informacion de los telefonos de los gerentes';
COMMENT ON COLUMN telefonoGerente.idPersona IS 'Identificador del gerente';
COMMENT ON COLUMN telefonoGerente.telefono IS 'Telefono del gerente';

COMMENT ON CONSTRAINT telefonoGerenteuniquep ON telefonoGerente IS 'Restriccion unique para el atributo identificador';
COMMENT ON CONSTRAINT telefonoGerente_pkey ON telefonoGerente IS 'Restriccion para establecer la llave primaria, la cual es compuesta';
COMMENT ON CONSTRAINT telefonoGerente_fkey ON telefonoGerente IS 'Restriccion para establecer la llave foranea con la tabla gerente';


--Tabla telefonoCajero
CREATE TABLE telefonoCajero(
    idPersona INT,
    telefono BIGINT
);

--Restricciones de dominio

ALTER TABLE telefonoCajero ALTER COLUMN idPersona SET NOT NULL;
ALTER TABLE telefonoCajero ALTER COLUMN telefono SET NOT NULL;

--Restricciones de Entidad 
ALTER TABLE telefonoCajero ADD CONSTRAINT telefonoCajerouniquep UNIQUE(telefono);
ALTER TABLE telefonoCajero ADD CONSTRAINT telefonoCajero_pkey PRIMARY KEY(idPersona,telefono);
--Referencial
ALTER TABLE telefonoCajero ADD CONSTRAINT telefonoCajero_fkey FOREIGN KEY (idPersona)
REFERENCES cajero(idPersona)
ON UPDATE CASCADE ON DELETE CASCADE;
-- Comentarios
COMMENT ON TABLE telefonoCajero IS 'Tabla que contiene la informacion de los telefonos de los cajero';
COMMENT ON COLUMN telefonoCajero.idPersona IS 'Identificador del cajero';
COMMENT ON COLUMN telefonoCajero.telefono IS 'Telefono del cajero';

COMMENT ON CONSTRAINT telefonoCajerouniquep ON telefonoCajero IS 'Restriccion unique para el atributo identificador';
COMMENT ON CONSTRAINT telefonoCajero_pkey ON telefonoCajero IS 'Restriccion para establecer la llave primaria, la cual es compuesta';
COMMENT ON CONSTRAINT telefonoCajero_fkey ON telefonoCajero IS 'Restriccion para establecer la llave foranea con la tabla cajero';


--Tabla correoCliente
CREATE TABLE correoCliente(
    idPersona INT,
    correo VARCHAR(30)
);

--Restricciones de dominio
ALTER TABLE correoCliente ALTER COLUMN idPersona SET NOT NULL;
ALTER TABLE correoCliente ADD CONSTRAINT correoClientecorreo CHECK(correo <> '');;

--Restricciones de Entidad 
ALTER TABLE correoCliente ADD CONSTRAINT correoClienteuniquep UNIQUE(correo);
ALTER TABLE correoCliente ADD CONSTRAINT correoCliente_pkey PRIMARY KEY(idPersona,correo);

--Referencial
ALTER TABLE correoCliente ADD CONSTRAINT correoCliente_fkey FOREIGN KEY (idPersona)
REFERENCES cliente(idPersona)
ON UPDATE CASCADE ON DELETE CASCADE;

COMMENT ON TABLE correoCliente IS 'Tabla que guarda la información de los correos de los clientes';
COMMENT ON COLUMN correoCliente.idPersona IS 'Identificador que permite enlazar el correo al cliente correspondiente';
COMMENT ON COLUMN correoCliente.correo IS 'Correos pertenecientes al cliente';

COMMENT ON CONSTRAINT correoClientecorreo ON correoCliente IS 'Restriccion check la cual nos asegura que el correo no sea la cadena vacia';
COMMENT ON CONSTRAINT correoClienteuniquep ON correoCliente IS 'Restricción que permite que cada correo sea único';
COMMENT ON CONSTRAINT correoCliente_pkey ON correoCliente IS 'Restricción que marca como llave primaria compuesta al idPersona y correo';
COMMENT ON CONSTRAINT correoCliente_fkey ON correoCliente IS 'Restricción que marca como llave oránea al idPersona';


--Tabla correoEncargado
CREATE TABLE correoEncargado(
    idPersona INT,
    correo VARCHAR(30)
);
--Restricciones de dominio

ALTER TABLE correoEncargado ALTER COLUMN idPersona SET NOT NULL;
ALTER TABLE correoEncargado ADD CONSTRAINT correoEncargadocorreo CHECK(correo <> '');

--Restricciones de Entidad 
ALTER TABLE correoEncargado ADD CONSTRAINT correoEncargadouniquep UNIQUE(correo);
ALTER TABLE correoEncargado ADD CONSTRAINT correoEncargado_pkey PRIMARY KEY(idPersona,correo);
--Referencial
ALTER TABLE correoEncargado ADD CONSTRAINT correoEncargado_fkey FOREIGN KEY (idPersona)
REFERENCES encargado(idPersona)
ON UPDATE CASCADE ON DELETE CASCADE;

-- Comentarios
COMMENT ON TABLE correoEncargado IS 'Tabla que guarda la información de los correos de los encargados';
COMMENT ON COLUMN correoEncargado.idPersona IS 'Identificador que permite enlazar el correo al encargado correspondiente';
COMMENT ON COLUMN correoEncargado.correo IS 'Correos pertenecientes al encargado';

COMMENT ON CONSTRAINT correoEncargadocorreo ON correoEncargado IS 'Restriccion check la cual nos asegura que el correo no sea la cadena vacia';
COMMENT ON CONSTRAINT correoEncargadouniquep ON correoEncargado IS 'Restricción que permite que cada correo sea único';
COMMENT ON CONSTRAINT correoEncargado_pkey ON correoEncargado IS 'Restricción que marca como llave primaria compuesta al idPersona y correo';
COMMENT ON CONSTRAINT correoEncargado_fkey ON correoEncargado IS 'Restricción que marca como llave foránea al idPersona';


--Tabla correoGerente
CREATE TABLE correoGerente(
    idPersona INT,
    correo VARCHAR(30)
);

--Restricciones de dominio

ALTER TABLE correoGerente ALTER COLUMN idPersona SET NOT NULL;
ALTER TABLE correoGerente ADD CONSTRAINT correoGerentecorreo CHECK(correo <> '');

--Restricciones de Entidad 
ALTER TABLE correoGerente ADD CONSTRAINT correoGerenteuniquep UNIQUE(correo);
ALTER TABLE correoGerente ADD CONSTRAINT correoGerente_pkey PRIMARY KEY(idPersona,correo);
--Referencial
ALTER TABLE correoGerente ADD CONSTRAINT correoGerente_fkey FOREIGN KEY (idPersona)
REFERENCES gerente(idPersona)
ON UPDATE CASCADE ON DELETE CASCADE;

COMMENT ON TABLE correoGerente IS 'Tabla que contiene el correo del gerente';
COMMENT ON COLUMN correoGerente.idPersona IS 'Identificador del correo del gerente';
COMMENT ON COLUMN correoGerente.correo IS 'Correo del gerente';

COMMENT ON CONSTRAINT correoGerentecorreo ON correoGerente IS 'Restriccion check la cual nos asegura que el correo no sea la cadena vacia';
COMMENT ON CONSTRAINT correoGerenteuniquep ON correoGerente IS 'Restriccion unique para el atributo identificador' ;
COMMENT ON CONSTRAINT correoGerente_pkey ON correoGerente IS 'Restriccion para establecer la llave compuesta IdPersona y correo como la llave primaria' ;
COMMENT ON CONSTRAINT correoGerente_fkey ON correoGerente IS 'Restriccion para establecer la llave foranea' ;


--Tabla correoCajero
CREATE TABLE correoCajero(
    idPersona INT,
    correo VARCHAR(30)
);

--Restricciones de dominio

ALTER TABLE correoCajero ALTER COLUMN idPersona SET NOT NULL;
ALTER TABLE correoCajero ADD CONSTRAINT correoCajerocorreo CHECK(correo <> '');

--Restricciones de Entidad 
ALTER TABLE correoCajero ADD CONSTRAINT correoCajerouniquep UNIQUE(correo);
ALTER TABLE correoCajero ADD CONSTRAINT correoCajero_pkey PRIMARY KEY(idPersona,correo);
--Referencial
ALTER TABLE correoCajero ADD CONSTRAINT correoCajero_fkey FOREIGN KEY (idPersona)
REFERENCES cajero(idPersona)
ON UPDATE CASCADE ON DELETE CASCADE;


COMMENT ON TABLE correoCajero IS 'Tabla que contiene el correo del cajero';
COMMENT ON COLUMN correoCajero.idPersona IS 'Identificador del correo del cajero';
COMMENT ON COLUMN correoCajero.correo IS 'Correo del cajero';

COMMENT ON CONSTRAINT correoCajerocorreo ON correoCajero IS 'Restriccion check la cual nos asegura que el correo no sea la cadena vacia';
COMMENT ON CONSTRAINT correoCajerouniquep ON correoCajero IS 'Restriccion unique para el atributo identificador' ;
COMMENT ON CONSTRAINT correoCajero_pkey ON correoCajero IS 'Restricción que marca como llave primaria compuesta al idPersona y correo';
COMMENT ON CONSTRAINT correoCajero_fkey ON correoCajero IS 'Restriccion para establecer la llave foranea'; 



--Tabla contarPerecedero
CREATE TABLE contarPerecedero(
    idSucursal INT,
    idProducto INT,
    cantidad INT
);

--Restricciones de dominio

ALTER TABLE contarPerecedero ALTER COLUMN idSucursal SET NOT NULL;
ALTER TABLE contarPerecedero ALTER COLUMN idProducto SET NOT NULL;
ALTER TABLE contarPerecedero ALTER COLUMN cantidad SET NOT NULL;

--Referencial
ALTER TABLE contarPerecedero ADD CONSTRAINT contarPerecedero_fkey FOREIGN KEY (idSucursal)
REFERENCES sucursal(idSucursal)
ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE contarPerecedero ADD CONSTRAINT contarPerecedero_fkey2 FOREIGN KEY (idProducto)
REFERENCES perecedero(idProducto)
ON UPDATE CASCADE ON DELETE RESTRICT;


COMMENT ON TABLE contarPerecedero IS 'Tabla que contiene la cantidad de perecedero';
COMMENT ON COLUMN contarPerecedero.idSucursal IS 'Identificador de Sucursal';
COMMENT ON COLUMN contarPerecedero.idProducto IS 'Identificador de Producto';
COMMENT ON COLUMN contarPerecedero.cantidad IS 'Cantidad de productos perecederos';

COMMENT ON CONSTRAINT contarPerecedero_fkey ON contarPerecedero IS 'Restriccion para establecer la llave foranea' ;
COMMENT ON CONSTRAINT contarPerecedero_fkey2 ON contarPerecedero IS 'Restriccion para establecer la segunda llave foranea' ;

--Tabla contarElectronica
CREATE TABLE contarElectronica(
    idSucursal INT,
    idProducto INT,
    cantidad INT
);

--Restricciones de dominio

ALTER TABLE contarElectronica ALTER COLUMN idSucursal SET NOT NULL;
ALTER TABLE contarElectronica ALTER COLUMN idProducto SET NOT NULL;
ALTER TABLE contarElectronica ALTER COLUMN cantidad SET NOT NULL;

--Referencial
ALTER TABLE contarElectronica ADD CONSTRAINT contarElectronica_fkey FOREIGN KEY (idSucursal)
REFERENCES sucursal(idSucursal)
ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE contarElectronica ADD CONSTRAINT contarElectronica_fkey2 FOREIGN KEY (idProducto)
REFERENCES electronica(idProducto)
ON UPDATE CASCADE ON DELETE RESTRICT;

 
COMMENT ON TABLE contarElectronica IS 'Tabla que contiene la cantidad de productos de electronica';
COMMENT ON COLUMN contarElectronica.idSucursal IS 'Identificador de Sucursal';
COMMENT ON COLUMN contarElectronica.idProducto IS 'Identificador de Producto';
COMMENT ON COLUMN contarElectronica.cantidad IS 'Cantidad de electronicos';

COMMENT ON CONSTRAINT contarElectronica_fkey ON contarElectronica IS 'Restriccion para establecer la llave foranea' ;
COMMENT ON CONSTRAINT contarElectronica_fkey2 ON contarElectronica IS 'Restriccion para establecer la segunda llave foranea'; 

--Tabla contarNoPerecedero
CREATE TABLE contarNoPerecedero(
    idSucursal INT,
    idProducto INT,
    cantidad INT
);
--Restricciones de dominio

ALTER TABLE contarNoPerecedero ALTER COLUMN idSucursal SET NOT NULL;
ALTER TABLE contarNoPerecedero ALTER COLUMN idProducto SET NOT NULL;
ALTER TABLE contarNoPerecedero ALTER COLUMN cantidad SET NOT NULL;

--Referencial
ALTER TABLE contarNoPerecedero ADD CONSTRAINT contarNoPerecedero_fkey FOREIGN KEY (idSucursal)
REFERENCES sucursal(idSucursal)
ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE contarNoPerecedero ADD CONSTRAINT contarNoPerecedero_fkey2 FOREIGN KEY (idProducto)
REFERENCES noPerecedero(idProducto)
ON UPDATE CASCADE ON DELETE RESTRICT;


COMMENT ON TABLE contarNoPerecedero IS 'Tabla que contiene la cantidad productos no perecederos';
COMMENT ON COLUMN contarNoPerecedero.idSucursal IS 'Identificador de Sucursal';
COMMENT ON COLUMN contarNoPerecedero.idProducto IS 'Identificador de Producto';
COMMENT ON COLUMN contarNoPerecedero.cantidad IS 'Cantidad de productos no perecederos';

COMMENT ON CONSTRAINT contarNoPerecedero_fkey ON contarNoPerecedero IS 'Restriccion para establecer la llave foranea'; 
COMMENT ON CONSTRAINT contarNoPerecedero_fkey2 ON contarNoPerecedero IS 'Restriccion para establecer la segunda llave foranea' ;



CREATE TABLE venta(
    idVenta INT,
    idSucursal INT,
    idCliente INT,
    idCajero INT,
    formaPago VARCHAR(30)
);
--Restricciones de dominio

ALTER TABLE venta ALTER COLUMN idVenta SET NOT NULL;
ALTER TABLE venta ALTER COLUMN idSucursal SET NOT NULL;
ALTER TABLE venta ALTER COLUMN idCliente SET NOT NULL;
ALTER TABLE venta ALTER COLUMN idCajero SET NOT NULL;
ALTER TABLE venta ADD CONSTRAINT ventaFormaPago CHECK(formaPago <> '');;

--Restricciones de Entidad 
ALTER TABLE venta ADD CONSTRAINT ventaUniquep UNIQUE(idVenta);
ALTER TABLE venta ADD CONSTRAINT venta_pkey PRIMARY KEY(idVenta);
--Referencial
ALTER TABLE venta ADD CONSTRAINT venta_fkey FOREIGN KEY (idSucursal)
REFERENCES sucursal(idSucursal)
ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE venta ADD CONSTRAINT venta_fkey2 FOREIGN KEY (idCliente)
REFERENCES cliente(idPersona)
ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE venta ADD CONSTRAINT venta_fkey3 FOREIGN KEY (idCajero)
REFERENCES cajero(idPersona)
ON UPDATE CASCADE ON DELETE RESTRICT;


COMMENT ON TABLE venta IS 'Ventas registradas';
COMMENT ON COLUMN venta.idVenta IS 'Identificador de la venta';
COMMENT ON COLUMN venta.idSucursal IS 'Numero de sucursal';
COMMENT ON COLUMN venta.idCliente IS 'Numero de Cliente';
COMMENT ON COLUMN venta.idCajero IS 'Numero de Cajero';
COMMENT ON COLUMN venta.formaPago IS 'Forma de pago';

COMMENT ON CONSTRAINT ventaFormaPago ON venta IS 'Restriccion check la cual nos asegura que la forma de pago no sea la cadena vacia';
COMMENT ON CONSTRAINT ventaUniquep ON venta IS 'Restriccion unique para el atributo idVenta';
COMMENT ON CONSTRAINT venta_pkey ON venta IS 'Restriccion de llave primaria';
COMMENT ON CONSTRAINT venta_fkey ON venta IS 'Restriccion de llave foranea';
COMMENT ON CONSTRAINT venta_fkey2 ON venta IS 'Restriccion de llave foranea';
COMMENT ON CONSTRAINT venta_fkey3 ON venta IS 'Restriccion de llave foranea';


--Table contenerPerecedero
CREATE TABLE contenerPerecedero(
    idVenta INT,
    idProducto INT,
    cantidad INT
);

ALTER TABLE contenerPerecedero ALTER COLUMN idProducto SET NOT NULL;
ALTER TABLE contenerPerecedero ALTER COLUMN cantidad SET NOT NULL;



--Referencial
ALTER TABLE contenerPerecedero ADD CONSTRAINT contenerPerecedero_fkey FOREIGN KEY (idVenta)
REFERENCES venta(idVenta)
ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE contenerPerecedero ADD CONSTRAINT contenerPerecedero_fkey2 FOREIGN KEY (idProducto)
REFERENCES perecedero(idProducto)
ON UPDATE CASCADE ON DELETE RESTRICT;

--Comentarios

COMMENT ON TABLE contenerPerecedero IS 'Alimentos perecederos vendidos';
COMMENT ON COLUMN contenerPerecedero.idVenta IS 'Identificador de la venta';
COMMENT ON COLUMN contenerPerecedero.idProducto IS 'Identificador del producto';
COMMENT ON COLUMN contenerPerecedero.cantidad IS 'Cantidad vendida';

COMMENT ON CONSTRAINT contenerPerecedero_fkey ON contenerPerecedero IS 'Restriccion de llave foranea';
COMMENT ON CONSTRAINT contenerPerecedero_fkey2 ON contenerPerecedero IS 'Restriccion de llave foranea';

--Tabla contenerElectronica
CREATE TABLE contenerElectronica(
    idVenta INT,
    idProducto INT,
    cantidad INT
);

--Restricciones de dominio

ALTER TABLE contenerElectronica ALTER COLUMN idVenta SET NOT NULL;
ALTER TABLE contenerElectronica ALTER COLUMN idProducto SET NOT NULL;
ALTER TABLE contenerElectronica ALTER COLUMN cantidad SET NOT NULL;


--Referencial
ALTER TABLE contenerElectronica ADD CONSTRAINT contenerElectronica_fkey FOREIGN KEY (idVenta)
REFERENCES venta(idVenta)
ON UPDATE CASCADE ON DELETE RESTRICT;

ALTER TABLE contenerElectronica ADD CONSTRAINT contenerElectronica_fkey2 FOREIGN KEY (idProducto)
REFERENCES electronica(idProducto)
ON UPDATE CASCADE ON DELETE RESTRICT;
COMMENT ON TABLE contenerElectronica IS 'Productos electronicos vendidos';
COMMENT ON COLUMN contenerElectronica.idVenta IS 'Identificador de la venta';
COMMENT ON COLUMN contenerElectronica.idProducto IS 'Identificador del producto';
COMMENT ON COLUMN contenerElectronica.cantidad IS 'Cantidad vendida';

COMMENT ON CONSTRAINT contenerElectronica_fkey ON contenerElectronica IS 'Restriccion de llave foranea';
COMMENT ON CONSTRAINT contenerElectronica_fkey2 ON contenerElectronica IS 'Restriccion de llave foranea';


--Tabla contenerNoPerecedero
CREATE TABLE contenerNoPerecedero(
    idVenta INT,
    idProducto INT,
    cantidad INT
);


--Restricciones de dominio

ALTER TABLE contenerNoPerecedero ALTER COLUMN idVenta SET NOT NULL;
ALTER TABLE contenerNoPerecedero ALTER COLUMN idProducto SET NOT NULL;
ALTER TABLE contenerNoPerecedero ALTER COLUMN cantidad SET NOT NULL;


--Referencial
ALTER TABLE contenerNoPerecedero ADD CONSTRAINT contenerNoPerecedero_fkey FOREIGN KEY (idVenta)
REFERENCES venta(idVenta)
ON UPDATE CASCADE ON DELETE RESTRICT;
ALTER TABLE contenerNoPerecedero ADD CONSTRAINT contenerNoPerecedero_fkey2 FOREIGN KEY (idProducto)
REFERENCES noPerecedero(idProducto)
ON UPDATE CASCADE ON DELETE RESTRICT;

COMMENT ON TABLE contenerNoPerecedero IS 'Alimentos no perecederos vendidos';
COMMENT ON COLUMN contenerNoPerecedero.idVenta IS 'Identificador de la venta';
COMMENT ON COLUMN contenerNoPerecedero.idProducto IS 'Identificador del producto';
COMMENT ON COLUMN contenerNoPerecedero.cantidad IS 'Cantidad vendida';

COMMENT ON CONSTRAINT contenerNoPerecedero_fkey ON contenerNoPerecedero IS 'Restriccion de llave foranea';
COMMENT ON CONSTRAINT contenerNoPerecedero_fkey2 ON contenerNoPerecedero IS 'Restriccion de llave foranea';


-- Modificaciones al DDL:
-- Modificaciones a la tabla Encargado
ALTER TABLE encargado ALTER COLUMN ciudad TYPE character varying(30);
ALTER TABLE encargado ALTER COLUMN calle TYPE character varying(30);
-- Modificaciones a la tabla correoEncargado
ALTER TABLE correoEncargado ALTER COLUMN correo TYPE character varying(50);

-- Modificaciones a la tabla gerente
ALTER TABLE gerente ALTER COLUMN aMaterno TYPE character varying(30);
ALTER TABLE gerente ALTER COLUMN ciudad TYPE character varying(30);

-- Modificaciones a la tabla correoGerente
ALTER TABLE correoGerente ALTER COLUMN correo TYPE character varying(50);

-- Modificaciones a la tabla correoCajero
ALTER TABLE correoCajero ALTER COLUMN correo TYPE character varying(50);
-- Modificaciones a la tabla correoCliente
ALTER TABLE correoCliente ALTER COLUMN correo TYPE character varying(50);

--Modificaciones tabla perecedero
alter table perecedero  alter column nombre type character varying(50);
alter table perecedero  alter column marca type character varying(50);
alter table perecedero  alter column presentacion type character varying(30);

--Modificaciones tabla noPerecedero
alter table noPerecedero alter column nombre type character varying(50);
alter table noPerecedero alter column marca type character varying(50);
alter table noPerecedero alter column presentacion type character varying(30);

--Modificaciones tabla electronica
alter table electronica alter column nombre type VARCHAR(70);
alter table electronica alter column categoria type VARCHAR(30);
