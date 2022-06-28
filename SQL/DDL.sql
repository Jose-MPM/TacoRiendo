DROP SCHEMA IF EXISTS public CASCADE;
CREATE SCHEMA public;

SET DATESTYLE TO 'European';

CREATE TABLE persona(
  curp VARCHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) < 19) UNIQUE,
  noSucursal INT NOT NULL CHECK(noSucursal > 0),
  nombre VARCHAR(50) CHECK(nombre <> ''),
  paterno VARCHAR(50) CHECK(paterno <> ''),
  materno VARCHAR(50) CHECK(materno <> ''),
  nacimiento DATE NOT NULL,
  genero VARCHAR(20) NOT NULL CHECK(genero <> ''),
  email VARCHAR(50) CHECK(email <> ''),
  telefono CHAR(10) NOT NULL CHECK(telefono SIMILAR TO '[0-9]*'),
  cp CHAR(5) NOT NULL CHECK(cp SIMILAR TO '[0-9]{5}'),
  estado VARCHAR(20) NOT NULL CHECK(estado <> ''),
  calle VARCHAR(20) NOT NULL CHECK(calle <> ''),
  numero INT NOT NULL CHECK(numero > 0),
  esCliente BOOLEAN NOT NULL,
  esEmpleado BOOLEAN NOT NULL
);

COMMENT ON TABLE persona IS 'Tabla que contiene a las personas de la taqueria TacoRiendo';
COMMENT ON COLUMN persona.curp IS 'CURP que identifica a la persona';
COMMENT ON COLUMN persona.nombre IS 'Nombre de la persona';
COMMENT ON COLUMN persona.noSucursal IS 'Numero de sucursal';
COMMENT ON COLUMN persona.paterno IS 'Apellido paterno de la persona';
COMMENT ON COLUMN persona.materno IS 'Apellido materno de la persona';
COMMENT ON COLUMN persona.nacimiento IS 'Fecha de nacimiento de la persona';
COMMENT ON COLUMN persona.genero IS 'Genero de la persona';
COMMENT ON COLUMN persona.email IS 'Direccion de correo electronico de la persona';
COMMENT ON COLUMN persona.telefono IS 'Telefono para comunicarse con la persona';
COMMENT ON COLUMN persona.cp IS 'Codigo postal de la direccion de la persona';
COMMENT ON COLUMN persona.estado IS 'Estado de la direccion de la persona';
COMMENT ON COLUMN persona.calle IS 'Nombre de la calle de la direccion de la persona';
COMMENT ON COLUMN persona.numero IS 'Numero de la direccion de la persona';
COMMENT ON COLUMN persona.esCliente IS 'Indicador si la persona es cliente';
COMMENT ON COLUMN persona.esEmpleado IS 'Indicador si la persona es empleado';

CREATE TABLE repartidor(
  curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18) UNIQUE,
  noSucursal INT NOT NULL CHECK(noSucursal > 0),
  rfc CHAR(13) NOT NULL CHECK(CHAR_LENGTH(rfc) = 13),
  nomina CHAR(9) NOT NULL CHECK(CHAR_LENGTH(nomina) = 9),
  fechaIngreso DATE NOT NULL,
  noSS CHAR(9) NOT NULL CHECK(CHAR_LENGTH(noSS) = 9),
  noLicencia CHAR(9) NOT NULL CHECK(noLicencia SIMILAR TO '[0-9]*')
);

COMMENT ON TABLE repartidor IS 'Tabla que contiene a los repartidores de la taqueria';
COMMENT ON COLUMN repartidor.curp IS 'CURP que identifica al repartidor';
COMMENT ON COLUMN repartidor.rfc IS 'RFC del repartidor de la taqueria';
COMMENT ON COLUMN repartidor.noSucursal IS 'Numero de sucursal';
COMMENT ON COLUMN repartidor.nomina IS 'Nomina del repartidor';
COMMENT ON COLUMN repartidor.fechaIngreso IS 'Fecha de ingreso laboral del repartidor';
COMMENT ON COLUMN repartidor.noSS IS 'Numero de seguro social del repartidor';
COMMENT ON COLUMN repartidor.noLicencia IS 'Numero de licencia de conducir del repartidor, si tienen null en otro caso';

CREATE TABLE mesero(
  curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18) UNIQUE,
  noSucursal INT NOT NULL CHECK(noSucursal > 0),
  rfc CHAR(13) NOT NULL CHECK(CHAR_LENGTH(rfc) = 13),
  nomina CHAR(9) NOT NULL CHECK(CHAR_LENGTH(nomina) = 9),
  fechaIngreso DATE NOT NULL,
  noSS CHAR(9) NOT NULL CHECK(CHAR_LENGTH(noSS) = 9)
);

COMMENT ON TABLE mesero IS 'Tabla que contiene a los meseros de la taqueria';
COMMENT ON COLUMN mesero.curp IS 'CURP que identifica al mesero';
COMMENT ON COLUMN mesero.noSucursal IS 'Numero de sucursal';
COMMENT ON COLUMN mesero.rfc IS 'RFC del mesero de la taqueria';
COMMENT ON COLUMN mesero.nomina IS 'Nomina del mesero';
COMMENT ON COLUMN mesero.fechaIngreso IS 'Fecha de ingreso laboral del mesero';
COMMENT ON COLUMN mesero.noSS IS 'Numero de seguro social del mesero';

CREATE TABLE cajero(
  curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18) UNIQUE,
  noSucursal INT NOT NULL CHECK(noSucursal > 0),
  rfc CHAR(13) NOT NULL CHECK(CHAR_LENGTH(rfc) = 13),
  nomina CHAR(9) NOT NULL CHECK(CHAR_LENGTH(nomina) = 9),
  fechaIngreso DATE NOT NULL,
  noSS CHAR(9) NOT NULL CHECK(CHAR_LENGTH(noSS) = 9)
);

COMMENT ON TABLE cajero IS 'Tabla que contiene a los cajeros de la taqueria';
COMMENT ON COLUMN cajero.curp IS 'CURP que identifica al cajero';
COMMENT ON COLUMN cajero.noSucursal IS 'Numero de sucursal';
COMMENT ON COLUMN cajero.rfc IS 'RFC del cajero de la taqueria';
COMMENT ON COLUMN cajero.nomina IS 'Nomina del cajero';
COMMENT ON COLUMN cajero.fechaIngreso IS 'Fecha de ingreso laboral del cajero';
COMMENT ON COLUMN cajero.noSS IS 'Numero de seguro social del cajero';

CREATE TABLE parrillero(
  curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18) UNIQUE,
  noSucursal INT NOT NULL CHECK(noSucursal > 0),
  rfc CHAR(13) NOT NULL CHECK(CHAR_LENGTH(rfc) = 13),
  nomina CHAR(9) NOT NULL CHECK(CHAR_LENGTH(nomina) = 9),
  fechaIngreso DATE NOT NULL,
  noSS CHAR(9) NOT NULL CHECK(CHAR_LENGTH(noSS) = 9)
);

COMMENT ON TABLE parrillero IS 'Tabla que contiene a los parrilleros de la taqueria';
COMMENT ON COLUMN parrillero.curp IS 'CURP que identifica al parrillero';
COMMENT ON COLUMN parrillero.noSucursal IS 'Numero de sucursal';
COMMENT ON COLUMN parrillero.rfc IS 'RFC del parrillero del parrillero';
COMMENT ON COLUMN parrillero.nomina IS 'Nomina del parrillero';
COMMENT ON COLUMN parrillero.fechaIngreso IS 'Fecha de ingreso laboral del parrillero';
COMMENT ON COLUMN parrillero.noSS IS 'Numero de seguro social del parrillero';

CREATE TABLE tortillero(
  curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18) UNIQUE,
  noSucursal INT NOT NULL CHECK(noSucursal > 0),
  rfc CHAR(13) NOT NULL CHECK(CHAR_LENGTH(rfc) = 13),
  nomina CHAR(9) NOT NULL CHECK(CHAR_LENGTH(nomina) = 9),
  fechaIngreso DATE NOT NULL,
  noSS CHAR(9) NOT NULL CHECK(CHAR_LENGTH(noSS) = 9)
);

COMMENT ON TABLE tortillero IS 'Tabla que contiene a los parrilleros de la taqueria';
COMMENT ON COLUMN tortillero.curp IS 'CURP que identifica al tortillero';
COMMENT ON COLUMN tortillero.noSucursal IS 'Numero de sucursal';
COMMENT ON COLUMN tortillero.rfc IS 'RFC del tortillero';
COMMENT ON COLUMN tortillero.nomina IS 'Nomina del tortillero';
COMMENT ON COLUMN tortillero.fechaIngreso IS 'Fecha de ingreso laboral del tortillero';
COMMENT ON COLUMN tortillero.noSS IS 'Numero de seguro social del tortillero';

CREATE TABLE taquero(
  curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18) UNIQUE,
  noSucursal INT NOT NULL CHECK(noSucursal > 0),
  rfc CHAR(13) NOT NULL CHECK(CHAR_LENGTH(rfc) = 13),
  nomina CHAR(9) NOT NULL CHECK(CHAR_LENGTH(nomina) = 9),
  fechaIngreso DATE NOT NULL,
  noSS CHAR(9) NOT NULL CHECK(CHAR_LENGTH(noSS) = 9)
);

COMMENT ON TABLE taquero IS 'Tabla que contiene a los taqueros de la taqueria';
COMMENT ON COLUMN taquero.curp IS 'CURP que identifica al taquero';
COMMENT ON COLUMN taquero.noSucursal IS 'Numero de sucursal';
COMMENT ON COLUMN taquero.rfc IS 'RFC del parrillero de la taquero';
COMMENT ON COLUMN taquero.nomina IS 'Nomina del taquero';
COMMENT ON COLUMN taquero.fechaIngreso IS 'Fecha de ingreso laboral del taquero';
COMMENT ON COLUMN taquero.noSS IS 'Numero de seguro social del taquero';

CREATE TABLE nominaR(
  curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18),
  noNomina INT NOT NULL CHECK(noNomina > 0),
  salario INT NOT NULL CHECK(salario > 0),
  bonos INT CHECK(bonos > 0),
  UNIQUE(curp, noNomina)
);

COMMENT ON TABLE nominaR IS 'Tabla que contiene a la nomina del empleado';
COMMENT ON COLUMN nominaR.curp IS 'CURP que identifica al empleado';
COMMENT ON COLUMN nominaR.noNomina IS 'Identificador del registro de nomina';
COMMENT ON COLUMN nominaR.salario IS 'Salario del empleado';
COMMENT ON COLUMN nominaR.bonos IS 'Bono al salario del empleado';

CREATE TABLE nominaT(
  curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18),
  noNomina INT NOT NULL CHECK(noNomina > 0),
  salario INT NOT NULL CHECK(salario > 0),
  bonos INT CHECK(bonos > 0),
  UNIQUE(curp, noNomina)
);

COMMENT ON TABLE nominaT IS 'Tabla que contiene a la nomina del empleado';
COMMENT ON COLUMN nominaT.curp IS 'CURP que identifica al empleado';
COMMENT ON COLUMN nominaT.noNomina IS 'Identificador del registro de nomina';
COMMENT ON COLUMN nominaT.salario IS 'Salario del empleado';
COMMENT ON COLUMN nominaT.bonos IS 'Bono al salario del empleado';

CREATE TABLE nominaTT(
  curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18),
  noNomina INT NOT NULL CHECK(noNomina > 0),
  salario INT NOT NULL CHECK(salario > 0),
  bonos INT CHECK (bonos > 0),
  UNIQUE(curp, noNomina)
);

COMMENT ON TABLE nominaTT IS 'Tabla que contiene a la nomina del empleado';
COMMENT ON COLUMN nominaTT.curp IS 'CURP que identifica al empleado';
COMMENT ON COLUMN nominaTT.noNomina IS 'Identificador del registro de nomina';
COMMENT ON COLUMN nominaTT.salario IS 'Salario del empleado';
COMMENT ON COLUMN nominaTT.bonos IS 'Bono al salario del empleado';

CREATE TABLE nominaP(
  curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18),
  noNomina INT NOT NULL CHECK(noNomina > 0),
  salario INT NOT NULL CHECK(salario > 0),
  bonos INT CHECK(bonos > 0),
  UNIQUE(curp, noNomina)
);

COMMENT ON TABLE nominaP IS 'Tabla que contiene a la nomina del empleado';
COMMENT ON COLUMN nominaP.curp IS 'CURP que identifica al empleado';
COMMENT ON COLUMN nominaP.noNomina IS 'Identificador del registro de nomina';
COMMENT ON COLUMN nominaP.salario IS 'Salario del empleado';
COMMENT ON COLUMN nominaP.bonos IS 'Bono al salario del empleado';

CREATE TABLE nominaC(
  curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18),
  noNomina INT NOT NULL CHECK(noNomina > 0),
  salario INT NOT NULL CHECK(salario > 0),
  bonos INT CHECK(bonos > 0),
  UNIQUE(curp, noNomina)
);

COMMENT ON TABLE nominaC IS 'Tabla que contiene a la nomina del empleado';
COMMENT ON COLUMN nominaC.curp IS 'CURP que identifica al empleado';
COMMENT ON COLUMN nominaC.noNomina IS 'Identificador del registro de nomina';
COMMENT ON COLUMN nominaC.salario IS 'Salario del empleado';
COMMENT ON COLUMN nominaC.bonos IS 'Bono al salario del empleado';

CREATE TABLE nominaM(
  curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18),
  noNomina INT NOT NULL CHECK(noNomina > 0),
  salario INT NOT NULL CHECK(salario > 0),
  bonos INT CHECK(bonos > 0),
  UNIQUE(curp, noNomina)
);

COMMENT ON TABLE nominaM IS 'Tabla que contiene a la nomina del empleado';
COMMENT ON COLUMN nominaM.curp IS 'CURP que identifica al empleado';
COMMENT ON COLUMN nominaM.noNomina IS 'Identificador del registro de nomina';
COMMENT ON COLUMN nominaM.salario IS 'Salario del empleado';
COMMENT ON COLUMN nominaM.bonos IS 'Bono al salario del empleado';

CREATE TABLE proveedor(
  idProveedor INT NOT NULL UNIQUE CHECK(idProveedor > 0),
  nombre VARCHAR(50) NOT NULL CHECK(nombre <> ''),
  telefono CHAR(10) NOT NULL CHECK(telefono SIMILAR TO '[0-9]*'),
  email VARCHAR(50) NOT NULL CHECK(email <> '')
);

COMMENT ON TABLE proveedor IS 'Tabla que contiene a los proveedores de las sucursales';
COMMENT ON COLUMN proveedor.idProveedor IS 'Identificador del proveedor';
COMMENT ON COLUMN proveedor.nombre IS 'Nombre del proveedor';
COMMENT ON COLUMN proveedor.telefono IS 'Telefono de contacto del proveedor';
COMMENT ON COLUMN proveedor.email IS 'Correo electronico del proveedor';

CREATE TABLE plato(
  idProducto INT NOT NULL UNIQUE CHECK(idProducto > 0),
  idProveedor INT NOT NULL CHECK(idProveedor > 0),
  noSucursal INT NOT NULL CHECK(noSucursal > 0),
  marca VARCHAR(50) NOT NULL CHECK(marca <> ''),
  cantidad INT NOT NULL CHECK(cantidad > 0),
  diaCompra DATE NOT NULL,
  precio DECIMAL(9,2) NOT NULL CHECK(precio >= 0.00)
);

COMMENT ON TABLE plato IS 'Tabla que contiene los platos proporcionados por el proveedor';
COMMENT ON COLUMN plato.idProducto IS 'Identificador del producto';
COMMENT ON COLUMN plato.idProveedor IS 'Identificador del proveedor';
COMMENT ON COLUMN plato.noSucursal IS 'Numero de sucursal';
COMMENT ON COLUMN plato.marca IS 'Nombre de la marca del producto';
COMMENT ON COLUMN plato.cantidad IS 'Cantidad del producto proporcionada';
COMMENT ON COLUMN plato.diaCompra IS 'Fecha de compra del producto';
COMMENT ON COLUMN plato.precio IS 'Precio del producto';

CREATE TABLE mesa(
  idProducto INT NOT NULL UNIQUE CHECK(idProducto > 0),
  idProveedor INT NOT NULL CHECK(idProveedor > 0),
  noSucursal INT NOT NULL CHECK(noSucursal > 0),
  marca VARCHAR(50) NOT NULL CHECK(marca <> ''),
  cantidad INT NOT NULL CHECK(cantidad > 0),
  diaCompra DATE NOT NULL,
  precio DECIMAL(9,2) NOT NULL CHECK(precio >= 0.00)
);

COMMENT ON TABLE mesa IS 'Tabla que contiene las mesas proporcionadas por el proveedor';
COMMENT ON COLUMN mesa.idProducto IS 'Identificador del producto';
COMMENT ON COLUMN mesa.idProveedor IS 'Identificador del proveedor';
COMMENT ON COLUMN mesa.noSucursal IS 'Numero de sucursal';
COMMENT ON COLUMN mesa.marca IS 'Nombre de la marca del producto';
COMMENT ON COLUMN mesa.cantidad IS 'Cantidad del producto proporcionada';
COMMENT ON COLUMN mesa.diaCompra IS 'Fecha de compra del producto';
COMMENT ON COLUMN mesa.precio IS 'Precio del producto';

CREATE TABLE banco(
  idProducto INT NOT NULL UNIQUE CHECK(idProducto > 0),
  idProveedor INT NOT NULL CHECK(idProveedor > 0),
  noSucursal INT NOT NULL CHECK(noSucursal > 0),
  marca VARCHAR(50) NOT NULL CHECK(marca <> ''),
  cantidad INT NOT NULL CHECK(cantidad > 0),
  diaCompra DATE NOT NULL,
  precio DECIMAL(9,2) NOT NULL CHECK(precio >= 0.00)
);

COMMENT ON TABLE banco IS 'Tabla que contiene los bancos proporcionados por el proveedor';
COMMENT ON COLUMN banco.idProducto IS 'Identificador del producto';
COMMENT ON COLUMN banco.idProveedor IS 'Identificador del proveedor';
COMMENT ON COLUMN banco.noSucursal IS 'Numero de sucursal';
COMMENT ON COLUMN banco.marca IS 'Nombre de la marca del producto';
COMMENT ON COLUMN banco.cantidad IS 'Cantidad del producto proporcionada';
COMMENT ON COLUMN banco.diaCompra IS 'Fecha de compra del producto';
COMMENT ON COLUMN banco.precio IS 'Precio del producto';

CREATE TABLE silla(
  idProducto INT NOT NULL UNIQUE CHECK(idProducto > 0),
  idProveedor INT NOT NULL CHECK(idProveedor > 0),
  noSucursal INT NOT NULL CHECK(noSucursal > 0),
  marca VARCHAR(50) NOT NULL CHECK(marca <> ''),
  cantidad INT NOT NULL CHECK(cantidad > 0),
  diaCompra DATE NOT NULL,
  precio DECIMAL(9,2) NOT NULL CHECK(precio >= 0.00)
);

COMMENT ON TABLE silla IS 'Tabla que contiene las sillas proporcionadas por el proveedor';
COMMENT ON COLUMN silla.idProducto IS 'Identificador del producto';
COMMENT ON COLUMN silla.idProveedor IS 'Identificador del proveedor';
COMMENT ON COLUMN silla.noSucursal IS 'Numero de sucursal';
COMMENT ON COLUMN silla.marca IS 'Nombre de la marca del producto';
COMMENT ON COLUMN silla.cantidad IS 'Cantidad del producto proporcionada';
COMMENT ON COLUMN silla.diaCompra IS 'Fecha de compra del producto';
COMMENT ON COLUMN silla.precio IS 'Precio del producto';

CREATE TABLE servilletero(
  idProducto INT NOT NULL UNIQUE CHECK(idProducto > 0),
  idProveedor INT NOT NULL CHECK(idProveedor > 0),
  noSucursal INT NOT NULL CHECK(noSucursal > 0),
  marca VARCHAR(50) NOT NULL CHECK(marca <> ''),
  cantidad INT NOT NULL CHECK(cantidad > 0),
  diaCompra DATE NOT NULL,
  precio DECIMAL(9,2) NOT NULL CHECK(precio >= 0.00)
);

COMMENT ON TABLE servilletero IS 'Tabla que contiene los servilleteros proporcionados por el proveedor';
COMMENT ON COLUMN servilletero.idProducto IS 'Identificador del producto';
COMMENT ON COLUMN servilletero.idProveedor IS 'Identificador del proveedor';
COMMENT ON COLUMN servilletero.noSucursal IS 'Numero de sucursal';
COMMENT ON COLUMN servilletero.marca IS 'Nombre de la marca del producto';
COMMENT ON COLUMN servilletero.cantidad IS 'Cantidad del producto proporcionada';
COMMENT ON COLUMN servilletero.diaCompra IS 'Fecha de compra del producto';
COMMENT ON COLUMN servilletero.precio IS 'Precio del producto';

CREATE TABLE ingrediente(
  idProducto INT NOT NULL UNIQUE CHECK(idProducto > 0),
  idProveedor INT NOT NULL CHECK(idProveedor > 0),
  noSucursal INT NOT NULL CHECK(noSucursal > 0),
  marca VARCHAR(50) NOT NULL CHECK(marca <> ''),
  cantidad INT NOT NULL CHECK(cantidad > 0),
  diaCompra DATE NOT NULL,
  precio DECIMAL(7,2) NOT NULL CHECK(precio >= 0.00),
  caducidad DATE NOT NULL, CHECK(caducidad > diaCompra),
  tipo VARCHAR(50) NOT NULL  CHECK(tipo <> '')
);

COMMENT ON TABLE ingrediente IS 'Tabla que contiene los ingredientes proporcionados por el proveedor';
COMMENT ON COLUMN ingrediente.idProducto IS 'Identificador del producto';
COMMENT ON COLUMN ingrediente.idProveedor IS 'Identificador del proveedor';
COMMENT ON COLUMN ingrediente.noSucursal IS 'Numero de sucursal';
COMMENT ON COLUMN ingrediente.marca IS 'Nombre de la marca del producto';
COMMENT ON COLUMN ingrediente.cantidad IS 'Cantidad del producto proporcionada';
COMMENT ON COLUMN ingrediente.diaCompra IS 'Fecha de compra del producto';
COMMENT ON COLUMN ingrediente.precio IS 'Precio del producto';
COMMENT ON COLUMN ingrediente.caducidad IS 'Fecha de caducidad del producto';
COMMENT ON COLUMN ingrediente.tipo IS 'Tipo de ingrediente';

CREATE TABLE registroI(
  idProducto INT NOT NULL CHECK(idProducto > 0),
  fecha DATE NOT NULL,
  precioAnterior DECIMAL(9,2) NOT NULL CHECK(precioAnterior >= 0.00),
  precioNuevo DECIMAL(9,2) NOT NULL CHECK(precioNuevo >= 0.00),
UNIQUE(idProducto, fecha)
);

COMMENT ON TABLE registroI is 'Tabla que contiene el cambio de precio de los ingredientes';
COMMENT ON COLUMN registroI.idProducto IS 'Identificador del producto que cambio de precio';
COMMENT ON COLUMN registroI.fecha IS 'Fecha de cambio de precio del platillo';
COMMENT ON COLUMN registroI.precioAnterior IS 'Precio anterior del platillo';
COMMENT ON COLUMN registroI.precioNuevo IS 'Precio nuevo del platillo';

CREATE TABLE contenerM(
  idPlatillo INT NOT NULL CHECK(idPlatillo > 0),
  noSucursal INT NOT NULL CHECK(noSucursal > 0),
  idProducto INT NOT NULL CHECK(idProducto > 0),
  porcion DECIMAL(5,2) NOT NULL CHECK(porcion >= 0.00)
);

COMMENT ON TABLE contenerM is 'Tabla que contiene los ingredientes de los platillos mexicanos';
COMMENT ON COLUMN contenerM.noSucursal IS 'Numero de sucursal';
COMMENT ON COLUMN contenerM.idPlatillo IS 'Identificador del platillo mexicano';
COMMENT ON COLUMN contenerM.idProducto IS 'Identificador del ingrediente';
COMMENT ON COLUMN contenerM.porcion IS 'Porcion necesaria de producto para el platillo';

CREATE TABLE contenerG(
  idPlatillo INT NOT NULL CHECK(idPlatillo > 0),
  noSucursal INT NOT NULL CHECK(noSucursal > 0),
  idProducto INT NOT NULL CHECK(idProducto > 0),
  porcion DECIMAL(5,2) NOT NULL CHECK(porcion >= 0.00)
);

COMMENT ON TABLE contenerG is 'Tabla que contiene los ingredientes de las gringas';
COMMENT ON COLUMN contenerG.noSucursal IS 'Numero de sucursal';
COMMENT ON COLUMN contenerG.idPlatillo IS 'Identificador de la gringa';
COMMENT ON COLUMN contenerG.idProducto IS 'Identificador del ingrediente';
COMMENT ON COLUMN contenerG.porcion IS 'Porcion necesaria de producto para el platillo';

CREATE TABLE contenerT(
  idPlatillo INT NOT NULL CHECK(idPlatillo > 0),
  noSucursal INT NOT NULL CHECK(noSucursal > 0),
  idProducto INT NOT NULL CHECK(idProducto > 0),
  porcion DECIMAL(5,2) NOT NULL CHECK(porcion >= 0.00)
);

COMMENT ON TABLE contenerT is 'Tabla que contiene los ingredientes de los tacos';
COMMENT ON COLUMN contenerT.noSucursal IS 'Numero de sucursal';
COMMENT ON COLUMN contenerT.idPlatillo IS 'Identificador del taco';
COMMENT ON COLUMN contenerT.idProducto IS 'Identificador del ingrediente';
COMMENT ON COLUMN contenerT.porcion IS 'Porcion necesaria de producto para el platillo';

CREATE TABLE contenerTT(
  idPlatillo INT NOT NULL CHECK(idPlatillo > 0),
  noSucursal INT NOT NULL CHECK(noSucursal > 0),
  idProducto INT NOT NULL CHECK(idProducto > 0),
  porcion DECIMAL(5,2) NOT NULL CHECK(porcion >= 0.00)
);

COMMENT ON TABLE contenerTT is 'Tabla que contiene los ingredientes de las tortas';
COMMENT ON COLUMN contenerTT.noSucursal IS 'Numero de sucursal';
COMMENT ON COLUMN contenerTT.idPlatillo IS 'Identificador de la torta';
COMMENT ON COLUMN contenerTT.idProducto IS 'Identificador del ingrediente';
COMMENT ON COLUMN contenerTT.porcion IS 'Porcion necesaria de producto para el platillo';

CREATE TABLE contenerB(
  idPlatillo INT NOT NULL CHECK(idPlatillo > 0),
  noSucursal INT NOT NULL CHECK(noSucursal > 0),
  idProducto INT NOT NULL CHECK(idProducto > 0),
  porcion DECIMAL(5,2) NOT NULL CHECK(porcion >= 0.00)
);

COMMENT ON TABLE contenerB is 'Tabla que contiene los ingredientes de los burritos';
COMMENT ON COLUMN contenerB.noSucursal IS 'Numero de sucursal';
COMMENT ON COLUMN contenerB.idPlatillo IS 'Identificador del burrito';
COMMENT ON COLUMN contenerB.idProducto IS 'Identificador del ingrediente';
COMMENT ON COLUMN contenerB.porcion IS 'Porcion necesaria de producto para el platillo';

CREATE TABLE contenerS(
  idPlatillo INT NOT NULL CHECK(idPlatillo > 0),
  noSucursal INT NOT NULL CHECK(noSucursal > 0),
  idProducto INT NOT NULL CHECK(idProducto > 0),
  porcion DECIMAL(5,2) NOT NULL CHECK(porcion >= 0.00)
);

COMMENT ON TABLE contenerS is 'Tabla que contiene los ingredientes de las salsas';
COMMENT ON COLUMN contenerS.noSucursal IS 'Numero de sucursal';
COMMENT ON COLUMN contenerS.idPlatillo IS 'Identificador de la salsa';
COMMENT ON COLUMN contenerS.idProducto IS 'Identificador del ingrediente';
COMMENT ON COLUMN contenerS.porcion IS 'Porcion necesaria de producto para el platillo';

CREATE TABLE contenerBB(
  idPlatillo INT NOT NULL CHECK(idPlatillo > 0),
  noSucursal INT NOT NULL CHECK(noSucursal > 0),
  idProducto INT NOT NULL CHECK(idProducto > 0),
  porcion DECIMAL(5,2) NOT NULL CHECK(porcion >= 0.00)
);

COMMENT ON TABLE contenerBB is 'Tabla que contiene los ingredientes de las bebidas';
COMMENT ON COLUMN contenerBB.noSucursal IS 'Numero de sucursal';
COMMENT ON COLUMN contenerBB.idPlatillo IS 'Identificador de la bebida';
COMMENT ON COLUMN contenerBB.idProducto IS 'Identificador del ingrediente';
COMMENT ON COLUMN contenerBB.porcion IS 'Porcion necesaria de producto para el platillo';

CREATE TABLE contenerQ(
  idPlatillo INT NOT NULL CHECK(idPlatillo > 0),
  noSucursal INT NOT NULL CHECK(noSucursal > 0),
  idProducto INT NOT NULL CHECK(idProducto > 0),
  porcion DECIMAL(5,2) NOT NULL CHECK(porcion >= 0.00)
);

COMMENT ON TABLE contenerQ is 'Tabla que contiene los ingredientes de las quesadillas';
COMMENT ON COLUMN contenerQ.noSucursal IS 'Numero de sucursal';
COMMENT ON COLUMN contenerQ.idPlatillo IS 'Identificador de la quesadilla';
COMMENT ON COLUMN contenerQ.idProducto IS 'Identificador del ingrediente';
COMMENT ON COLUMN contenerQ.porcion IS 'Porcion necesaria de producto para el platillo';

CREATE TABLE registroM(
  idPlatillo INT NOT NULL CHECK(idPlatillo > 0),
  noSucursal INT NOT NULL CHECK(noSucursal > 0),
  fecha DATE NOT NULL,
  precioAnterior DECIMAL(7,2) NOT NULL CHECK(precioAnterior >= 0.00),
  precioNuevo DECIMAL(7,2) NOT NULL CHECK(precioNuevo >= 0.00),
UNIQUE(idPlatillo, noSucursal, fecha)
);

COMMENT ON TABLE registroM is 'Tabla que contiene el cambio de precio de los platillos mexicanos';
COMMENT ON COLUMN registroM.noSucursal IS 'Numero de sucursal';
COMMENT ON COLUMN registroM.idPlatillo IS 'Identificador del platillo mexicano que cambio de precio';
COMMENT ON COLUMN registroM.fecha IS 'Fecha de cambio de precio del platillo';
COMMENT ON COLUMN registroM.precioAnterior IS 'Precio anterior del platillo';
COMMENT ON COLUMN registroM.precioNuevo IS 'Precio nuevo del platillo';

CREATE TABLE registroG(
  idPlatillo INT NOT NULL CHECK(idPlatillo > 0),
  noSucursal INT NOT NULL CHECK(noSucursal > 0),
  fecha DATE NOT NULL,
  precioAnterior DECIMAL(7,2) NOT NULL CHECK(precioAnterior >= 0.00),
  precioNuevo DECIMAL(7,2) NOT NULL CHECK(precioNuevo >= 0.00),
UNIQUE(idPlatillo, noSucursal, fecha)
);

COMMENT ON TABLE registroG is 'Tabla que contiene el cambio de precio de las gringas';
COMMENT ON COLUMN registroG.idPlatillo IS 'Identificador de la gringa que cambio de precio';
COMMENT ON COLUMN registroG.noSucursal IS 'Numero de sucursal';
COMMENT ON COLUMN registroG.fecha IS 'Fecha de cambio de precio del platillo';
COMMENT ON COLUMN registroG.precioAnterior IS 'Precio anterior del platillo';
COMMENT ON COLUMN registroG.precioNuevo IS 'Precio nuevo del platillo';

CREATE TABLE registroT(
  idPlatillo INT NOT NULL CHECK(idPlatillo > 0),
  noSucursal INT NOT NULL CHECK(noSucursal > 0),
  fecha DATE NOT NULL,
  precioAnterior DECIMAL(7,2) NOT NULL CHECK(precioAnterior >= 0.00),
  precioNuevo DECIMAL(7,2) NOT NULL CHECK(precioNuevo >= 0.00),
UNIQUE(idPlatillo, noSucursal, fecha)
);

COMMENT ON TABLE registroT is 'Tabla que contiene el cambio de precio de los tacos';
COMMENT ON COLUMN registroT.idPlatillo IS 'Identificador del taco que cambio de precio';
COMMENT ON COLUMN registroT.noSucursal IS 'Numero de sucursal';
COMMENT ON COLUMN registroT.fecha IS 'Fecha de cambio de precio del platillo';
COMMENT ON COLUMN registroT.precioAnterior IS 'Precio anterior del platillo';
COMMENT ON COLUMN registroT.precioNuevo IS 'Precio nuevo del platillo';

CREATE TABLE registroTT(
  idPlatillo INT NOT NULL CHECK(idPlatillo > 0),
  noSucursal INT NOT NULL CHECK(noSucursal > 0),
  fecha DATE NOT NULL,
  precioAnterior DECIMAL(7,2) NOT NULL CHECK(precioAnterior >= 0.00),
  precioNuevo DECIMAL(7,2) NOT NULL CHECK(precioNuevo >= 0.00),
UNIQUE(idPlatillo, noSucursal, fecha)
);

COMMENT ON TABLE registroTT is 'Tabla que contiene el cambio de precio de las tortas';
COMMENT ON COLUMN registroTT.idPlatillo IS 'Identificador de la torta que cambio de precio';
COMMENT ON COLUMN registroTT.noSucursal IS 'Numero de sucursal';
COMMENT ON COLUMN registroTT.fecha IS 'Fecha de cambio de precio del platillo';
COMMENT ON COLUMN registroTT.precioAnterior IS 'Precio anterior del platillo';
COMMENT ON COLUMN registroTT.precioNuevo IS 'Precio nuevo del platillo';

CREATE TABLE registroB(
  idPlatillo INT NOT NULL CHECK(idPlatillo > 0),
  noSucursal INT NOT NULL CHECK(noSucursal > 0),
  fecha DATE NOT NULL,
  precioAnterior DECIMAL(7,2) NOT NULL CHECK(precioAnterior >= 0.00),
  precioNuevo DECIMAL(7,2) NOT NULL CHECK(precioNuevo >= 0.00),
UNIQUE(idPlatillo, noSucursal, fecha)
);

COMMENT ON TABLE registroB is 'Tabla que contiene el cambio de precio de los burritos';
COMMENT ON COLUMN registroB.idPlatillo IS 'Identificador del burrito que cambio de precio';  
COMMENT ON COLUMN registroB.noSucursal IS 'Numero de sucursal';
COMMENT ON COLUMN registroB.fecha IS 'Fecha de cambio de precio del platillo';
COMMENT ON COLUMN registroB.precioAnterior IS 'Precio anterior del platillo';
COMMENT ON COLUMN registroB.precioNuevo IS 'Precio nuevo del platillo';

CREATE TABLE registroS(
  idPlatillo INT NOT NULL CHECK(idPlatillo > 0),
  noSucursal INT NOT NULL CHECK(noSucursal > 0),
  fecha DATE NOT NULL,
  precioAnterior DECIMAL(7,2) NOT NULL CHECK(precioAnterior >= 0.00),
  precioNuevo DECIMAL(7,2) NOT NULL CHECK(precioNuevo >= 0.00),
UNIQUE(idPlatillo, noSucursal, fecha)
);

COMMENT ON TABLE registroS is 'Tabla que contiene el cambio de precio de las salsas';
COMMENT ON COLUMN registroS.idPlatillo IS 'Identificador de la salsa que cambio de precio';
COMMENT ON COLUMN registroS.noSucursal IS 'Numero de sucursal';
COMMENT ON COLUMN registroS.fecha IS 'Fecha de cambio de precio del platillo';
COMMENT ON COLUMN registroS.precioAnterior IS 'Precio anterior del platillo';
COMMENT ON COLUMN registroS.precioNuevo IS 'Precio nuevo del platillo';

CREATE TABLE registroBB(
  idPlatillo INT NOT NULL CHECK(idPlatillo > 0),
  noSucursal INT NOT NULL CHECK(noSucursal > 0),
  fecha DATE NOT NULL,
  precioAnterior DECIMAL(7,2) NOT NULL CHECK(precioAnterior >= 0.00),
  precioNuevo DECIMAL(7,2) NOT NULL CHECK(precioNuevo >= 0.00),
UNIQUE(idPlatillo, noSucursal, fecha)
);

COMMENT ON TABLE registroBB is 'Tabla que contiene el cambio de precio de las bebidas';
COMMENT ON COLUMN registroBB.idPlatillo IS 'Identificador de la bebida que cambio de precio';
COMMENT ON COLUMN registroBB.noSucursal IS 'Numero de sucursal';
COMMENT ON COLUMN registroBB.fecha IS 'Fecha de cambio de precio del platillo';
COMMENT ON COLUMN registroBB.precioAnterior IS 'Precio anterior del platillo';
COMMENT ON COLUMN registroBB.precioNuevo IS 'Precio nuevo del platillo';

CREATE TABLE registroQ(
  idPlatillo INT NOT NULL CHECK(idPlatillo > 0),
  noSucursal INT NOT NULL CHECK(noSucursal > 0),
  fecha DATE NOT NULL,
  precioAnterior DECIMAL(7,2) NOT NULL CHECK(precioAnterior >= 0.00),
  precioNuevo DECIMAL(7,2) NOT NULL CHECK(precioNuevo >= 0.00),
  UNIQUE(idPlatillo, noSucursal, fecha)
);

COMMENT ON TABLE registroQ is 'Tabla que contiene el cambio de precio de las quesadillas';
COMMENT ON COLUMN registroQ.idPlatillo IS 'Identificador de la quesadilla que cambio de precio';
COMMENT ON COLUMN registroQ.noSucursal IS 'Numero de sucursal';
COMMENT ON COLUMN registroQ.fecha IS 'Fecha de cambio de precio del platillo';
COMMENT ON COLUMN registroQ.precioAnterior IS 'Precio anterior del platillo';
COMMENT ON COLUMN registroQ.precioNuevo IS 'Precio nuevo del platillo';

CREATE TABLE sucursal(
  noSucursal INT NOT NULL UNIQUE CHECk(noSucursal > 0),
  nombre VARCHAR(50) NOT NULL CHECK(nombre <> ''),
  numero INT NOT NULL CHECK(numero > 0),
  calle VARCHAR(20) NOT NULL CHECK(calle <> ''),
  estado VARCHAR(20) NOT NULL CHECK(estado <> ''),
  cp CHAR(5) NOT NULL CHECK(cp SIMILAR TO '[0-9]{5}'),
  telefono CHAR(10) NOT NULL CHECK(telefono SIMILAR TO '[0-9]*'),
  rfc CHAR(12) NOT NULL CHECK(CHAR_LENGTH(rfc) = 12),	
  horaApertura TIME(4) NOT NULL,
  horaCierre TIME(4) NOT NULL CHECK(horaApertura < horaCierre),
  email VARCHAR(50) NOT NULL 
);

COMMENT ON TABLE sucursal IS 'Tabla que contiene a las sucursales';
COMMENT ON COLUMN sucursal.noSucursal IS 'Identificador de la sucursal';
COMMENT ON COLUMN sucursal.nombre IS 'Nombre de la sucursal';
COMMENT ON COLUMN sucursal.numero IS 'Numero de la direccion de la sucursal';
COMMENT ON COLUMN sucursal.calle IS 'Calle de la direccion de la sucursal';
COMMENT ON COLUMN sucursal.estado IS 'Estado de la direccion de la sucursal';
COMMENT ON COLUMN sucursal.cp IS 'CP de la sucursal';
COMMENT ON COLUMN sucursal.telefono IS 'Telefono de la sucursal';
COMMENT ON COLUMN sucursal.rfc IS 'RFC de la sucursal';
COMMENT ON COLUMN sucursal.horaCierre IS 'Hora de cierre de la sucursal';
COMMENT ON COLUMN sucursal.horaApertura IS 'Hora de apertura de la sucursal';
COMMENT ON COLUMN sucursal.email IS 'Correo electronico de la sucursal';

CREATE TABLE promocion(
  idPromocion INT NOT NULL CHECK(idPromocion > 0),
  noSucursal INT NOT NULL CHECK(noSucursal > 0),
  nombre VARCHAR(31) NOT NULL CHECK(nombre = 'Viernes de tortuga' OR nombre = 'Taco Chinito' OR nombre = 'Lunes de 2x1 en tacos al pastor'),
  descripcion VARCHAR(50) NOT NULL CHECK(nombre <> ''),
  dia VARCHAR(9) NOT NULL CHECK(dia = 'Viernes' OR dia = 'Miercoles' OR dia = 'Lunes'),
  UNIQUE (idPromocion, noSucursal)
);

COMMENT ON TABLE promocion IS 'Tabla que contiene a las promociones';
COMMENT ON COLUMN promocion.idPromocion IS 'Identificador de la promocion';
COMMENT ON COLUMN promocion.noSucursal IS 'Numero de la sucursal de la promocion';
COMMENT ON COLUMN promocion.nombre IS 'Nombre de la promocion';
COMMENT ON COLUMN promocion.descripcion IS 'Descripcion de la promocion';
COMMENT ON COLUMN promocion.dia IS 'Dia de la promocion';

CREATE TABLE pedidoD(
  noPedidoD INT NOT NULL CHECK(noPedidoD > 0),
  curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18),
  curpRepartidor CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curpRepartidor) = 18),
  folio VARCHAR(30) NOT NULL CHECK(folio SIMILAR TO '[0-9]*'),
  totalP INT,
  UNIQUE(noPedidoD, curp, curpRepartidor)
);  

COMMENT ON TABLE pedidoD IS 'Tabla que contiene a los pedidos a domicilio';
COMMENT ON COLUMN pedidoD.noPedidoD IS 'Numero del pedido';
COMMENT ON COLUMN pedidoD.curp IS 'CURP de la persona que solicito el pedido a domicilio';
COMMENT ON COLUMN pedidoD.curpRepartidor IS 'CURP del repartidor';
COMMENT ON COLUMN pedidoD.folio IS 'Folio del ticket correspondiente';

CREATE TABLE pedidoN(
  noPedidoN INT NOT NULL CHECK(noPedidoN > 0),
  curp CHAR(18) NOT NULL CHECK (CHAR_LENGTH(curp) = 18),
  folio VARCHAR(30) NOT NULL CHECK(folio SIMILAR TO '[0-9]*'),
  totalP INT,
  UNIQUE(noPedidoN, curp)
);

COMMENT ON TABLE pedidoN IS 'Tabla que contiene a los pedidos';
COMMENT ON COLUMN pedidoN.noPedidoN IS 'Numero del pedido';
COMMENT ON COLUMN pedidoN.curp IS 'CURP de la persona que solicito el pedido';
COMMENT ON COLUMN pedidoN.folio IS 'Folio del ticket correspondiente';

CREATE TABLE efectivo(
  idMetodo INT NOT NULL  CHECK(idMetodo > 0),
  curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18),
  UNIQUE(curp, idMetodo)
);

COMMENT ON TABLE efectivo IS 'Tabla que contiene a los metodos de pago a traves de efectivo';
COMMENT ON COLUMN efectivo.idMetodo IS 'Identificador del metodo efectivo';
COMMENT ON COLUMN efectivo.curp IS 'CURP de la persona vinculada al metodo efectivo';

CREATE TABLE pagarConE(
  folio VARCHAR(30) NOT NULL CHECK(folio SIMILAR TO '[0-9]*'),
  idMetodo INT NOT NULL CHECK(idMetodo > 0),
  curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18),
  esDom BOOLEAN NOT NULL
);

COMMENT ON TABLE pagarConE IS 'Tabla que contiene a los clientes que pagaron en efectivo';
COMMENT ON COLUMN pagarConE.idMetodo IS 'Identificador del metodo';
COMMENT ON COLUMN pagarConE.curp IS 'CURP del cliente';
COMMENT ON COLUMN pagarConE.esDom IS 'Indicador de pedido a domicilio';

CREATE TABLE puntos(
  idMetodo INT NOT NULL CHECK(idMetodo > 0),
  curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18),
  puntosT DECIMAL(9,2) NOT NULL CHECK(puntosT >= 0.00),
  UNIQUE(curp,idMetodo)
);

COMMENT ON TABLE puntos IS 'Tabla que contiene a los metodos de pago a traves de puntos';
COMMENT ON COLUMN puntos.idMetodo IS 'Identificador del metodo puntos';
COMMENT ON COLUMN puntos.curp IS 'CURP de la persona vinculada al metodo puntos';
COMMENT ON COLUMN puntos.puntosT IS 'Puntos totales de la persona vinculada al metodo puntos';

CREATE TABLE pagarConP(
  folio VARCHAR(30) NOT NULL CHECK(folio SIMILAR TO '[0-9]*'),
  idMetodo INT NOT NULL CHECK(idMetodo > 0),
  curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18),
  esDom BOOLEAN NOT NULL
);

COMMENT ON TABLE pagarConP IS 'Tabla que contiene a los clientes que pagaron con puntos';
COMMENT ON COLUMN pagarConP.idMetodo IS 'Identificador del metodo';
COMMENT ON COLUMN pagarConP.curp IS 'CURP del cliente';
COMMENT ON COLUMN pagarConP.esDom IS 'Indicador de pedido a domicilio';

CREATE TABLE tarjeta(
  idMetodo INT NOT NULL CHECK(idMetodo > 0),
  curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18),
  noTarjeta VARCHAR(18) NOT NULL CHECK(noTarjeta SIMILAR TO '[0-9]*'),
  vencimiento DATE NOT NULL, 
  cvv CHAR(3) NOT NULL CHECK(cvv SIMILAR TO '[0-9]*'),
  UNIQUE(curp,idMetodo)
);

COMMENT ON TABLE tarjeta IS 'Tabla que contiene a los metodos de pago a traves  de tarjeta';
COMMENT ON COLUMN tarjeta.idMetodo IS 'Identificador del metodo tarjeta';
COMMENT ON COLUMN tarjeta.curp IS 'CURP de la persona vinculada a la tarjeta';
COMMENT ON COLUMN tarjeta.noTarjeta IS 'Numero de la tarjeta de la persona vinculada al metodo tarjeta';
COMMENT ON COLUMN tarjeta.vencimiento IS 'Vencimiento de la tarjeta de la persona vinculada al metodo tarjeta';
COMMENT ON COLUMN tarjeta.cvv IS 'cvv de la tarjeta de la persona vinculada al metodo tarjeta';

CREATE TABLE pagarConT(
  folio VARCHAR(30) NOT NULL CHECK(folio SIMILAR TO '[0-9]*'),
  idMetodo INT NOT NULL CHECK(idMetodo > 0),
  curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18),
  esDom BOOLEAN NOT NULL
);

COMMENT ON TABLE pagarConT IS 'Tabla que contiene a los clientes que pagaron con tarjeta';
COMMENT ON COLUMN pagarConT.idMetodo IS 'Identificador del metodo';
COMMENT ON COLUMN pagarConT.curp IS 'CURP del cliente';
COMMENT ON COLUMN pagarConT.esDom IS 'Indicador de pedido a domicilio';

CREATE TABLE mex(
  idPlatillo INT NOT NULL CHECK(idPlatillo > 0),
  noSucursal INT NOT NULL CHECK(noSucursal > 0), 
  precio INT NOT NULL CHECK(precio > 0), 
  tipo varchar(50) CHECK(tipo <> ''),
  UNIQUE(idPlatillo, noSucursal)
);

COMMENT ON TABLE mex IS 'Tabla que contiene a los platillos mexicanos';
COMMENT ON COLUMN mex.idPlatillo IS 'Identificador del platillo mexicano';
COMMENT ON COLUMN mex.noSucursal IS 'Numero de la sucursal';
COMMENT ON COLUMN mex.precio IS 'Precio del platillo';
COMMENT ON COLUMN mex.tipo IS 'Tipo del platillo';

CREATE TABLE gringa(
  idPlatillo INT NOT NULL CHECK(idPlatillo > 0),
  noSucursal INT NOT NULL CHECK(noSucursal > 0), 
  precio INT NOT NULL CHECK(precio > 0), 
  tipo varchar(50) CHECK(tipo <> ''),
  UNIQUE(idPlatillo, noSucursal)
);

COMMENT ON TABLE gringa IS 'Tabla que contiene a los platillos de gringas';
COMMENT ON COLUMN gringa.idPlatillo IS 'Identificador del platillo gringa';
COMMENT ON COLUMN gringa.noSucursal IS 'Numero de la sucursal';
COMMENT ON COLUMN gringa.precio IS 'Precio del platillo';
COMMENT ON COLUMN gringa.tipo IS 'Tipo del platillo';

CREATE TABLE tacos(
  idPlatillo INT NOT NULL CHECK(idPlatillo > 0),
  noSucursal INT NOT NULL CHECK(noSucursal > 0), 
  precio INT NOT NULL CHECK(precio > 0), 
  tipo varchar(50) CHECK(tipo <> ''),
  UNIQUE(idPlatillo, noSucursal)
);

COMMENT ON TABLE tacos IS 'Tabla que contiene a los platillos de tacos';
COMMENT ON COLUMN tacos.idPlatillo IS 'Identificador del platillo tacos';
COMMENT ON COLUMN tacos.noSucursal IS 'Numero de la sucursal';
COMMENT ON COLUMN tacos.precio IS 'Precio del tplatiloaco';
COMMENT ON COLUMN tacos.tipo IS 'Tipo del platilo';

CREATE TABLE torta(
  idPlatillo INT NOT NULL CHECK(idPlatillo > 0),
  noSucursal INT NOT NULL CHECK(noSucursal > 0),   
  precio INT NOT NULL CHECK(precio > 0), 
  tipo varchar(50) CHECK(tipo <> ''),
  UNIQUE(idPlatillo, noSucursal)
);

COMMENT ON TABLE torta IS 'Tabla que contiene a los platillos de torta';
COMMENT ON COLUMN torta.idPlatillo IS 'Identificador del platillo torta';
COMMENT ON COLUMN torta.noSucursal IS 'Numero de la sucursal';
COMMENT ON COLUMN torta.precio IS 'Precio del platillo';
COMMENT ON COLUMN torta.tipo IS 'Tipo del platillo';

CREATE TABLE burrito(
  idPlatillo INT NOT NULL CHECK(idPlatillo > 0),
  noSucursal INT NOT NULL CHECK(noSucursal > 0), 
  precio INT NOT NULL CHECK(precio > 0), 
  tipo varchar(50) CHECK(tipo <> ''),
  UNIQUE(idPlatillo, noSucursal)
);

COMMENT ON TABLE burrito IS 'Tabla que contiene a los platillos de burrito';
COMMENT ON COLUMN burrito.idPlatillo IS 'Identificador del platillo burrito';
COMMENT ON COLUMN burrito.noSucursal IS 'Numero de la sucursal';
COMMENT ON COLUMN burrito.precio IS 'Precio del platillo';
COMMENT ON COLUMN burrito.tipo IS 'Tipo del platillo';

CREATE TABLE salsa(
  idPlatillo INT NOT NULL CHECK(idPlatillo > 0),
  noSucursal INT NOT NULL CHECK(noSucursal > 0), 
  precio INT NOT NULL CHECK(precio > 0), 
  tipo varchar(50) CHECK(tipo <> ''),
  picor varchar(8) CHECK(picor = 'dulce' OR picor = 'bajo' OR picor = 'medio' OR picor = 'alto' OR picor = 'extremo'),
  recomendacion varchar(100) CHECK(tipo <> ''),
  presentacion varchar(5) CHECK(presentacion = '250mg' OR presentacion = 'medio' OR presentacion = 'litro'),
  UNIQUE(idPlatillo, noSucursal)
);

COMMENT ON TABLE salsa IS 'Tabla que contiene a las salsas';
COMMENT ON COLUMN salsa.idPlatillo IS 'Identificador del platillo salsa';
COMMENT ON COLUMN salsa.noSucursal IS 'Numero de la sucursal';
COMMENT ON COLUMN salsa.precio IS 'Precio del platillo';
COMMENT ON COLUMN salsa.tipo IS 'Tipo del platillo';
COMMENT ON COLUMN salsa.picor IS 'Nivel de picante de las salsas';
COMMENT ON COLUMN salsa.recomendacion IS 'Recomendación de consumo de las salsas';
COMMENT ON COLUMN salsa.presentacion IS 'Presentacion de tamaño de las salsas';

CREATE TABLE bebida(
  idPlatillo INT NOT NULL CHECK(idPlatillo > 0),
  noSucursal INT NOT NULL CHECK(noSucursal > 0), 
  precio INT NOT NULL CHECK(precio > 0), 
  tipo varchar(50) CHECK(tipo <> ''),
  UNIQUE(idPlatillo, noSucursal)
);

COMMENT ON TABLE bebida IS 'Tabla que contiene a las bebidas';
COMMENT ON COLUMN bebida.idPlatillo IS 'Identificador del platillo bebida';
COMMENT ON COLUMN bebida.noSucursal IS 'Numero de la sucursal';
COMMENT ON COLUMN bebida.precio IS 'Precio del platillo';
COMMENT ON COLUMN bebida.tipo IS 'Tipo del platillo';

CREATE TABLE quesadilla(
  idPlatillo INT NOT NULL CHECK(idPlatillo > 0),
  noSucursal INT NOT NULL CHECK(noSucursal > 0),  
  precio INT NOT NULL CHECK(precio > 0), 
  tipo varchar(50) CHECK(tipo <> ''),
  UNIQUE(idPlatillo, noSucursal)
);

COMMENT ON TABLE quesadilla IS 'Tabla que contiene a los platillos de quesadilla';
COMMENT ON COLUMN quesadilla.idPlatillo IS 'Identificador del platillo quesadilla';
COMMENT ON COLUMN quesadilla.noSucursal IS 'Numero de la sucursal';
COMMENT ON COLUMN quesadilla.precio IS 'Precio del platillo';
COMMENT ON COLUMN quesadilla.tipo IS 'Tipo del platillo';

CREATE TABLE transporte(
  matricula CHAR(20) NOT NULL UNIQUE CHECK(CHAR_LENGTH(matricula) = 20),
  curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18),
  marca VARCHAR(20) NOT NULL CHECK(marca <> ''),
  modelo VARCHAR(20) NOT NULL CHECK(modelo <> ''),
  tipo VARCHAR(20) NOT NULL CHECK(tipo <> '')
);

COMMENT ON TABLE transporte IS 'Tabla que contiene a los transportes del repartidor';
COMMENT ON COLUMN transporte.matricula IS 'Matricula del transporte';
COMMENT ON COLUMN transporte.curp IS 'CURP del conductor';
COMMENT ON COLUMN transporte.marca IS 'Marca del transporte';
COMMENT ON COLUMN transporte.modelo IS 'Modelo del transporte';
COMMENT ON COLUMN transporte.tipo IS 'Tipo de transporte';

CREATE TABLE ticket(
  folio VARCHAR(30) NOT NULL CHECK(folio SIMILAR TO '[0-9]*') UNIQUE,
  noSucursal INT NOT NULL CHECk(noSucursal > 0),
  idPromocion INT NOT NULL CHECK(idPromocion > 0),
  curpMesero CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curpMesero) = 18),
  detalles VARCHAR(100) NOT NULL CHECK(detalles <> ''),
  total DECIMAL(9,2) NOT NULL CHECK(total >= 0.00),
  fecha DATE NOT NULL,
  tipo VARCHAR(30) CHECK(tipo = 'comensal' OR tipo = 'mesa' OR tipo = 'domicilio')
);

COMMENT ON TABLE ticket IS 'Tabla que contiene a los tickets generados';
COMMENT ON COLUMN ticket.folio IS 'Folio del ticket';
COMMENT ON COLUMN ticket.noSucursal IS 'Numero de la sucursal donde se genero';
COMMENT ON COLUMN ticket.curpMesero IS 'CURP del mesero';
COMMENT ON COLUMN ticket.detalles IS 'Detalles del ticket';
COMMENT ON COLUMN ticket.total IS 'Total a pagar';
COMMENT ON COLUMN ticket.fecha IS 'Fecha de emision';
COMMENT ON COLUMN ticket.tipo IS 'Tipo de pago';

CREATE TABLE agregarDM(
  idPlatillo INT NOT NULL CHECK(idPlatillo > 0),
  noSucursal INT NOT NULL CHECk(noSucursal > 0),
  noPedidoD INT NOT NULL CHECK(noPedidoD > 0),
  curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18),
  curpRepartidor CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curpRepartidor) = 18),
  cantidad INT NOT NULL CHECK(cantidad > 0),
  subtotal INT
);

COMMENT ON TABLE agregarDM IS 'Tabla que contiene los registros del platillo y el pedidoD';
COMMENT ON COLUMN agregarDM.idPlatillo IS 'Identificador del platillo';
COMMENT ON COLUMN agregarDM.noSucursal IS 'Numero de la sucursal';
COMMENT ON COLUMN agregarDM.noPedidoD IS 'Numero de pedido a domicilio';
COMMENT ON COLUMN agregarDM.curp IS 'CURP del cliente';
COMMENT ON COLUMN agregarDM.curpRepartidor IS 'CURP del repartidor';
COMMENT ON COLUMN agregarDM.cantidad IS 'Numero de platillos que que el cliente ordeno';

CREATE TABLE agregarDG(
  idPlatillo INT NOT NULL CHECK(idPlatillo > 0),
  noSucursal INT NOT NULL CHECk(noSucursal > 0),
  noPedidoD INT NOT NULL CHECK(noPedidoD > 0),
  curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18),
  curpRepartidor CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curpRepartidor) = 18),
  cantidad INT NOT NULL CHECK(cantidad > 0),
  subtotal INT
);

COMMENT ON TABLE agregarDG IS 'Tabla que contiene los registros del platillo y el pedidoD';
COMMENT ON COLUMN agregarDG.idPlatillo IS 'Identificador del platillo';
COMMENT ON COLUMN agregarDG.noSucursal IS 'Numero de la sucursal';
COMMENT ON COLUMN agregarDG.noPedidoD IS 'Numero de pedido a domicilio';
COMMENT ON COLUMN agregarDG.curp IS 'CURP del cliente';
COMMENT ON COLUMN agregarDG.curpRepartidor IS 'CURP del repartidor';
COMMENT ON COLUMN agregarDG.cantidad IS 'Numero de platillos que que el cliente ordeno';

CREATE TABLE agregarDT(
  idPlatillo INT NOT NULL CHECK(idPlatillo > 0),
  noSucursal INT NOT NULL CHECk(noSucursal > 0),
  noPedidoD INT NOT NULL CHECK(noPedidoD > 0),
  curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18),
  curpRepartidor CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curpRepartidor) = 18),
  cantidad INT NOT NULL CHECK(cantidad > 0),
  subtotal INT
);

COMMENT ON TABLE agregarDT IS 'Tabla que contiene los registros de torta y pedidoD';
COMMENT ON COLUMN agregarDT.idPlatillo IS 'Identificador del platillo';
COMMENT ON COLUMN agregarDT.noSucursal IS 'Numero de la sucursal';
COMMENT ON COLUMN agregarDT.noPedidoD IS 'Numero de pedido a domicilio';
COMMENT ON COLUMN agregarDT.curp IS 'CURP del cliente';
COMMENT ON COLUMN agregarDT.curpRepartidor IS 'CURP del repartidor';
COMMENT ON COLUMN agregarDT.cantidad IS 'Numero de platillos que que el cliente ordeno';

CREATE TABLE agregarDTT(
  idPlatillo INT NOT NULL CHECK(idPlatillo > 0),
  noSucursal INT NOT NULL CHECk(noSucursal > 0),
  noPedidoD INT NOT NULL CHECK(noPedidoD > 0),
  curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18),
  curpRepartidor CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curpRepartidor) = 18),
  cantidad INT NOT NULL,
  subtotal INT
);

COMMENT ON TABLE agregarDTT IS 'Tabla que contiene los registros del platillo y el pedidoD';
COMMENT ON COLUMN agregarDTT.idPlatillo IS 'Identificador del platillo';
COMMENT ON COLUMN agregarDTT.noSucursal IS 'Numero de la sucursal';
COMMENT ON COLUMN agregarDTT.noPedidoD IS 'Numero de pedido a domicilio';
COMMENT ON COLUMN agregarDTT.curp IS 'CURP del cliente';
COMMENT ON COLUMN agregarDTT.curpRepartidor IS 'CURP del repartidor';
COMMENT ON COLUMN agregarDTT.cantidad IS 'Numero de platillos que que el cliente ordeno';

CREATE TABLE agregarDB(
  idPlatillo INT NOT NULL CHECK(idPlatillo > 0),
  noSucursal INT NOT NULL CHECk(noSucursal > 0),
  noPedidoD INT NOT NULL CHECK(noPedidoD > 0),
  curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18),
  curpRepartidor CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curpRepartidor) = 18),
  cantidad INT NOT NULL CHECK(cantidad > 0),
  subtotal INT
);

COMMENT ON TABLE agregarDB IS 'Tabla que contiene los registros del platillo y el pedidoD';
COMMENT ON COLUMN agregarDB.idPlatillo IS 'Identificador del platillo';
COMMENT ON COLUMN agregarDB.noSucursal IS 'Numero de la sucursal';
COMMENT ON COLUMN agregarDB.noPedidoD IS 'Numero de pedido a domicilio';
COMMENT ON COLUMN agregarDB.curp IS 'CURP del cliente';
COMMENT ON COLUMN agregarDB.curpRepartidor IS 'CURP del repartidor';
COMMENT ON COLUMN agregarDB.cantidad IS 'Numero de platillos que que el cliente ordeno';

CREATE TABLE agregarDS(
  idPlatillo INT NOT NULL CHECK(idPlatillo > 0),
  noSucursal INT NOT NULL CHECk(noSucursal > 0),
  noPedidoD INT NOT NULL CHECK(noPedidoD > 0),
  curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18),
  curpRepartidor CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curpRepartidor) = 18),
  cantidad INT NOT NULL CHECK(cantidad > 0),
  subtotal INT
);

COMMENT ON TABLE agregarDS IS 'Tabla que contiene los registros del platillo y el pedidoD';
COMMENT ON COLUMN agregarDS.idPlatillo IS 'Identificador del platillo';
COMMENT ON COLUMN agregarDS.noSucursal IS 'Numero de la sucursal';
COMMENT ON COLUMN agregarDS.noPedidoD IS 'Numero de pedido a domicilio';
COMMENT ON COLUMN agregarDS.curp IS 'CURP del cliente';
COMMENT ON COLUMN agregarDS.curpRepartidor IS 'CURP del repartidor';
COMMENT ON COLUMN agregarDS.cantidad IS 'Numero de platillos que que el cliente ordeno';

CREATE TABLE agregarDBB(
  idPlatillo INT NOT NULL CHECK(idPlatillo > 0),
  noSucursal INT NOT NULL CHECk(noSucursal > 0),
  noPedidoD INT NOT NULL CHECK(noPedidoD > 0),
  curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18),
  curpRepartidor CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curpRepartidor) = 18),
  cantidad INT NOT NULL CHECK(cantidad > 0),
  subtotal INT
);

COMMENT ON TABLE agregarDBB IS 'Tabla que contiene los registros de gringa y pedidoD';
COMMENT ON COLUMN agregarDBB.idPlatillo IS 'Identificador del platillo';
COMMENT ON COLUMN agregarDBB.noSucursal IS 'Numero de la sucursal';
COMMENT ON COLUMN agregarDBB.noPedidoD IS 'Numero de pedido a domicilio';
COMMENT ON COLUMN agregarDBB.curp IS 'CURP del cliente';
COMMENT ON COLUMN agregarDBB.curpRepartidor IS 'CURP del repartidor';
COMMENT ON COLUMN agregarDBB.cantidad IS 'Numero de platillos que que el cliente ordeno';

CREATE TABLE agregarDQ(
  idPlatillo INT NOT NULL CHECK(idPlatillo > 0),
  noSucursal INT NOT NULL CHECk(noSucursal > 0),
  noPedidoD INT NOT NULL CHECK(noPedidoD > 0),
  curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18),
  curpRepartidor CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curpRepartidor) = 18),
  cantidad INT NOT NULL CHECK(cantidad > 0),
  subtotal INT
);

COMMENT ON TABLE agregarDQ IS 'Tabla que contiene los registros de quesadillas y pedidoD';
COMMENT ON COLUMN agregarDQ.idPlatillo IS 'Identificador del platillo';
COMMENT ON COLUMN agregarDQ.noSucursal IS 'Numero de la sucursal';
COMMENT ON COLUMN agregarDQ.noPedidoD IS 'Numero de pedido a domicilio';
COMMENT ON COLUMN agregarDQ.curp IS 'CURP del cliente';
COMMENT ON COLUMN agregarDQ.curpRepartidor IS 'CURP del repartidor';
COMMENT ON COLUMN agregarDQ.cantidad IS 'Numero de platillos que que el cliente ordeno';

CREATE TABLE agregarNM(
  idPlatillo INT NOT NULL CHECK(idPlatillo > 0),
  noSucursal INT NOT NULL CHECk(noSucursal > 0),
  noPedidoN INT NOT NULL CHECK(noPedidoN > 0),
  curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18),
  cantidad INT NOT NULL CHECK(cantidad > 0),
  subtotal INT
);

COMMENT ON TABLE agregarNM IS 'Tabla que contiene los registros del platillo y el pedidoN';
COMMENT ON COLUMN agregarNM.idPlatillo IS 'Identificador del platillo';
COMMENT ON COLUMN agregarNM.noSucursal IS 'Numero de la sucursal';
COMMENT ON COLUMN agregarNM.noPedidoN IS 'Numero de pedido';
COMMENT ON COLUMN agregarNM.curp IS 'CURP del cliente';
COMMENT ON COLUMN agregarNM.cantidad IS 'Numero de platillos que que el cliente ordeno';

CREATE TABLE agregarNG(
  idPlatillo INT NOT NULL CHECK(idPlatillo > 0),
  noSucursal INT NOT NULL CHECk(noSucursal > 0),
  noPedidoN INT NOT NULL CHECK(noPedidoN > 0),
  curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18),
  cantidad INT NOT NULL CHECK(cantidad > 0),
  subtotal INT
);

COMMENT ON TABLE agregarNG IS 'Tabla que contiene los registros del platillo y el pedidoN';
COMMENT ON COLUMN agregarNG.idPlatillo IS 'Identificador del platillo';
COMMENT ON COLUMN agregarNG.noSucursal IS 'Numero de la sucursal';
COMMENT ON COLUMN agregarNG.noPedidoN IS 'Numero de pedido';
COMMENT ON COLUMN agregarNG.curp IS 'CURP del cliente';
COMMENT ON COLUMN agregarNG.cantidad IS 'Numero de platillos que que el cliente ordeno';

CREATE TABLE agregarNT(
  idPlatillo INT NOT NULL CHECK(idPlatillo > 0),
  noSucursal INT NOT NULL CHECk(noSucursal > 0),
  noPedidoN INT NOT NULL CHECK(noPedidoN > 0),
  curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18),
  cantidad INT NOT NULL CHECK(cantidad > 0),
  subtotal INT
);

COMMENT ON TABLE agregarNT IS 'Tabla que contiene los registros de torta y pedidoN';
COMMENT ON COLUMN agregarNT.idPlatillo IS 'Identificador del platillo';
COMMENT ON COLUMN agregarNT.noSucursal IS 'Numero de la sucursal';
COMMENT ON COLUMN agregarNT.noPedidoN IS 'Numero de pedido';
COMMENT ON COLUMN agregarNT.curp IS 'CURP del cliente';
COMMENT ON COLUMN agregarNT.cantidad IS 'Numero de platillos que que el cliente ordeno';

CREATE TABLE agregarNTT(
  idPlatillo INT NOT NULL CHECK(idPlatillo > 0),
  noSucursal INT NOT NULL CHECk(noSucursal > 0),
  noPedidoN INT NOT NULL CHECK(noPedidoN > 0),
  curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18),
  cantidad INT NOT NULL CHECK(cantidad > 0),
  subtotal INT
);

COMMENT ON TABLE agregarNTT IS 'Tabla que contiene los registros del platillo y el pedidoN';
COMMENT ON COLUMN agregarNTT.idPlatillo IS 'Identificador del platillo';
COMMENT ON COLUMN agregarNTT.noSucursal IS 'Numero de la sucursal';
COMMENT ON COLUMN agregarNTT.noPedidoN IS 'Numero de pedido';
COMMENT ON COLUMN agregarNTT.curp IS 'CURP del cliente';
COMMENT ON COLUMN agregarNTT.cantidad IS 'Numero de platillos que que el cliente ordeno';

CREATE TABLE agregarNB(
  idPlatillo INT NOT NULL CHECK(idPlatillo > 0),
  noSucursal INT NOT NULL CHECk(noSucursal > 0),
  noPedidoN INT NOT NULL CHECK(noPedidoN > 0),
  curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18),
  cantidad INT NOT NULL CHECK(cantidad > 0),
  subtotal INT
);

COMMENT ON TABLE agregarNB IS 'Tabla que contiene los registros del platillo y el pedidoN';
COMMENT ON COLUMN agregarNB.idPlatillo IS 'Identificador del platillo';
COMMENT ON COLUMN agregarNB.noSucursal IS 'Numero de la sucursal';
COMMENT ON COLUMN agregarNB.noPedidoN IS 'Numero de pedido';
COMMENT ON COLUMN agregarNB.curp IS 'CURP del cliente';
COMMENT ON COLUMN agregarNB.cantidad IS 'Numero de platillos que que el cliente ordeno';

CREATE TABLE agregarNS(
  idPlatillo INT NOT NULL CHECK(idPlatillo > 0),
  noSucursal INT NOT NULL CHECk(noSucursal > 0),
  noPedidoN INT NOT NULL CHECK(noPedidoN > 0),
  curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18),
  cantidad INT NOT NULL CHECK(cantidad > 0),
  subtotal INT
);

COMMENT ON TABLE agregarNS IS 'Tabla que contiene los registros del platillo y el pedidoN';
COMMENT ON COLUMN agregarNS.idPlatillo IS 'Identificador del platillo';
COMMENT ON COLUMN agregarNS.noSucursal IS 'Numero de la sucursal';
COMMENT ON COLUMN agregarNS.noPedidoN IS 'Numero de pedido';
COMMENT ON COLUMN agregarNS.curp IS 'CURP del cliente';
COMMENT ON COLUMN agregarNS.cantidad IS 'Numero de platillos que que el cliente ordeno';

CREATE TABLE agregarNBB(
  idPlatillo INT NOT NULL CHECK(idPlatillo > 0),
  noSucursal INT NOT NULL CHECk(noSucursal > 0),
  noPedidoN INT NOT NULL CHECK(noPedidoN > 0),
  curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18),
  cantidad INT NOT NULL CHECK(cantidad > 0),
  subtotal INT
);

COMMENT ON TABLE agregarNBB IS 'Tabla que contiene los registros de gringa y pedidoN';
COMMENT ON COLUMN agregarNBB.idPlatillo IS 'Identificador del platillo';
COMMENT ON COLUMN agregarNBB.noSucursal IS 'Numero de la sucursal';
COMMENT ON COLUMN agregarNBB.noPedidoN IS 'Numero de pedido';
COMMENT ON COLUMN agregarNBB.curp IS 'CURP del cliente';
COMMENT ON COLUMN agregarNBB.cantidad IS 'Numero de platillos que que el cliente ordeno';

CREATE TABLE agregarNQ(
  idPlatillo INT NOT NULL CHECK(idPlatillo > 0),
  noSucursal INT NOT NULL CHECk(noSucursal > 0),
  noPedidoN INT NOT NULL CHECK(noPedidoN > 0),
  curp CHAR(18) NOT NULL CHECK(CHAR_LENGTH(curp) = 18),
  cantidad INT NOT NULL CHECK(cantidad > 0),
  subtotal INT
);

COMMENT ON TABLE agregarNQ IS 'Tabla que contiene los registros de quesadillas y pedidoN';
COMMENT ON COLUMN agregarNQ.idPlatillo IS 'Identificador del platillo';
COMMENT ON COLUMN agregarNQ.noSucursal IS 'Numero de la sucursal';
COMMENT ON COLUMN agregarNQ.noPedidoN IS 'Numero de pedido';
COMMENT ON COLUMN agregarNQ.curp IS 'CURP del cliente';
COMMENT ON COLUMN agregarNQ.cantidad IS 'Numero de platillos que que el cliente ordeno';

/*
Integridad referencial
*/

-- Llaves primarias

-- PK sucursal
ALTER TABLE sucursal ADD CONSTRAINT sucursal_pkey PRIMARY KEY(noSucursal);
COMMENT ON CONSTRAINT sucursal_pkey ON sucursal IS 'La llave primaria de la tabla sucursal';

-- PK promocion
ALTER TABLE promocion ADD CONSTRAINT promocion_pkey PRIMARY KEY(idPromocion, noSucursal);
COMMENT ON CONSTRAINT sucursal_pkey ON sucursal IS 'La llave primaria de la tabla promocion';

-- PK persona 
ALTER TABLE persona ADD CONSTRAINT persona_pkey PRIMARY KEY(curp);
COMMENT ON CONSTRAINT persona_pkey ON persona IS 'La llave primaria de la tabla persona';

-- PK repartidor
ALTER TABLE repartidor ADD CONSTRAINT repartidor_pkey PRIMARY KEY(curp);
COMMENT ON CONSTRAINT repartidor_pkey ON repartidor IS 'La llave primaria de la tabla repartidor';

-- PK mesero
ALTER TABLE mesero ADD CONSTRAINT mesero_pkey PRIMARY KEY(curp);
COMMENT ON CONSTRAINT mesero_pkey ON mesero IS 'La llave primaria de la tabla mesero';

-- PK cajero
ALTER TABLE cajero ADD CONSTRAINT cajero_pkey PRIMARY KEY(curp);
COMMENT ON CONSTRAINT cajero_pkey ON cajero IS 'La llave primaria de la tabla cajero';

-- PK tortillero
ALTER TABLE tortillero ADD CONSTRAINT tortillero_pkey PRIMARY KEY(curp);
COMMENT ON CONSTRAINT tortillero_pkey ON tortillero IS 'La llave primaria de la tabla tortillero';

-- PK parrillero
ALTER TABLE parrillero ADD CONSTRAINT parrillero_pkey PRIMARY KEY(curp);
COMMENT ON CONSTRAINT parrillero_pkey ON parrillero IS 'La llave primaria de la tabla parrillero';

-- PK taquero
ALTER TABLE taquero ADD CONSTRAINT taquero_pkey PRIMARY KEY(curp);
COMMENT ON CONSTRAINT taquero_pkey ON taquero IS 'La llave primaria de la tabla taquero';

-- PK proveedor
ALTER TABLE proveedor ADD CONSTRAINT proveedor_pkey PRIMARY KEY(idProveedor);
COMMENT ON CONSTRAINT proveedor_pkey ON proveedor IS 'La llave primaria de la tabla proveedor';

-- PK plato
ALTER TABLE plato ADD CONSTRAINT plato_pkey PRIMARY KEY(idProducto);
COMMENT ON CONSTRAINT plato_pkey ON plato IS 'La llave primaria de la tabla plato';

-- PK mesa
ALTER TABLE mesa ADD CONSTRAINT mesa_pkey PRIMARY KEY(idProducto);
COMMENT ON CONSTRAINT mesa_pkey ON mesa IS 'La llave primaria de la tabla mesa';

-- PK banco
ALTER TABLE banco ADD CONSTRAINT banco_pkey PRIMARY KEY(idProducto);
COMMENT ON CONSTRAINT banco_pkey ON banco IS 'La llave primaria de la tabla banco';

-- PK silla
ALTER TABLE silla ADD CONSTRAINT silla_pkey PRIMARY KEY(idProducto);
COMMENT ON CONSTRAINT silla_pkey ON silla IS 'La llave primaria de la tabla silla';

-- PK servilletero
ALTER TABLE servilletero ADD CONSTRAINT servilletero_pkey PRIMARY KEY(idProducto);
COMMENT ON CONSTRAINT servilletero_pkey ON servilletero IS 'La llave primaria de la tabla servilletero';

-- PK ingrediente
ALTER TABLE ingrediente ADD CONSTRAINT ingrediente_pkey PRIMARY KEY(idProducto);
COMMENT ON CONSTRAINT ingrediente_pkey ON ingrediente IS 'La llave primaria de la tabla ingrediente';

-- PK ticket
ALTER TABLE ticket ADD CONSTRAINT ticket_pkey PRIMARY KEY(folio);
COMMENT ON CONSTRAINT ticket_pkey ON ticket IS 'La llave primaria de la tabla ticket';

-- Llaves compuestas

-- PK nominaR
ALTER TABLE nominaR ADD CONSTRAINT nominaR_pkey PRIMARY KEY(noNomina, curp);
COMMENT ON CONSTRAINT nominaR_pkey ON nominaR IS 'La llave primaria compuesta de la tabla nominaR';
-- curp
ALTER TABLE nominaR ADD CONSTRAINT nominaR_fkey FOREIGN KEY(curp)
REFERENCES repartidor(curp) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT nominaR_fkey ON nominaR IS 'La referencia de la tabla nominaR a repartidor';

-- PK nominaT
ALTER TABLE nominaT ADD CONSTRAINT nominaT_pkey PRIMARY KEY(noNomina, curp);
COMMENT ON CONSTRAINT nominaT_pkey ON nominaT IS 'La llave primaria compuesta de la tabla nominaT';
-- curp
ALTER TABLE nominaT ADD CONSTRAINT nominaT_fkey FOREIGN KEY(curp)
REFERENCES taquero(curp) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT nominaT_fkey ON nominaT IS 'La referencia de la tabla nominaT a taquero';

-- PK nominaTT
ALTER TABLE nominaTT ADD CONSTRAINT nominaTT_pkey PRIMARY KEY(noNomina, curp);
COMMENT ON CONSTRAINT nominaTT_pkey ON nominaTT IS 'La llave primaria compuesta de la tabla nominaTT';
-- curp
ALTER TABLE nominaTT ADD CONSTRAINT nominaTT_fkey FOREIGN KEY(curp)
REFERENCES tortillero(curp) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT nominaTT_fkey ON nominaTT IS 'La referencia de la tabla nominaTT a tortillero';

-- PK nominaP
ALTER TABLE nominaP ADD CONSTRAINT nominaP_pkey PRIMARY KEY(noNomina, curp);
COMMENT ON CONSTRAINT nominaP_pkey ON nominaP IS 'La llave primaria compuesta de la tabla nominaP';
-- curp
ALTER TABLE nominaP ADD CONSTRAINT nominaP_fkey FOREIGN KEY(curp)
REFERENCES parrillero(curp) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT nominaP_fkey ON nominaP IS 'La referencia de la tabla nominaP a parrillero';

-- PK nominaC
ALTER TABLE nominaC ADD CONSTRAINT nominaC_pkey PRIMARY KEY(noNomina, curp);
COMMENT ON CONSTRAINT nominaC_pkey ON nominaC IS 'La llave primaria compuesta de la tabla nominaC';
-- curp
ALTER TABLE nominaC ADD CONSTRAINT nominaC_fkey FOREIGN KEY(curp)
REFERENCES cajero(curp) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT nominaC_fkey ON nominaC IS 'La referencia de la tabla nominaC a cajero';

-- PK nominaM
ALTER TABLE nominaM ADD CONSTRAINT nominaM_pkey PRIMARY KEY(noNomina, curp);
COMMENT ON CONSTRAINT nominaM_pkey ON nominaM IS 'La llave primaria compuesta de la tabla nominaM';
-- curp
ALTER TABLE nominaM ADD CONSTRAINT nominaM_fkey FOREIGN KEY(curp)
REFERENCES mesero(curp) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT nominaM_fkey ON nominaM IS 'La referencia de la tabla nominaM a mesero';

-- PK pedidoD
ALTER TABLE pedidoD ADD CONSTRAINT pedidoD_pkey PRIMARY KEY(noPedidoD, curp, curpRepartidor);
COMMENT ON CONSTRAINT pedidoD_pkey ON pedidoD IS 'La llave primaria compuesta de la tabla pedidoD';
-- curp
ALTER TABLE pedidoD ADD CONSTRAINT pedidoD_fkey1 FOREIGN KEY(curp)
REFERENCES persona(curp) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT pedidoD_fkey1 ON pedidoD IS 'La llave foranea de la tabla pedidoD que referencia a persona';
-- curp_repartidor
ALTER TABLE pedidoD ADD CONSTRAINT pedidoD_fkey2 FOREIGN KEY(curpRepartidor)
REFERENCES repartidor(curp) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT pedidoD_fkey2 ON pedidoD IS 'La llave foranea de la tabla pedidoD que referencia a repartidor';

-- PK pedidoN
ALTER TABLE pedidoN ADD CONSTRAINT pedidoN_pkey PRIMARY KEY(noPedidoN, curp);
COMMENT ON CONSTRAINT pedidoN_pkey ON pedidoN IS 'La llave primaria compuesta de la tabla pedidoN';
-- curp
ALTER TABLE pedidoN ADD CONSTRAINT pedidoN_fkey1 FOREIGN KEY(curp)
REFERENCES persona(curp) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT pedidoN_fkey1 ON pedidoN IS 'La llave foranea de la tabla pedidoN que referencia a persona';

-- PK efectivo
ALTER TABLE efectivo ADD CONSTRAINT efectivo_pkey PRIMARY KEY(idMetodo, curp);
COMMENT ON CONSTRAINT efectivo_pkey ON efectivo IS 'La llave primaria compuesta de la tabla efectivo';
-- curp
ALTER TABLE efectivo ADD CONSTRAINT efectivo_fkey FOREIGN KEY(curp)
REFERENCES persona(curp) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT efectivo_fkey ON efectivo IS 'La referencia de la tabla efectivo a persona';

-- PK puntos
ALTER TABLE puntos ADD CONSTRAINT puntos_pkey PRIMARY KEY(idMetodo, curp);
COMMENT ON CONSTRAINT puntos_pkey ON puntos IS 'La llave primaria compuesta de la tabla puntos';
-- curp
ALTER TABLE puntos ADD CONSTRAINT puntos_fkey FOREIGN KEY(curp)
REFERENCES persona(curp) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT puntos_fkey ON puntos IS 'La referencia de la tabla puntos a persona';

-- PK tarjeta
ALTER TABLE tarjeta ADD CONSTRAINT tarjeta_pkey PRIMARY KEY(idMetodo, curp);
COMMENT ON CONSTRAINT tarjeta_pkey ON tarjeta IS 'La llave primaria compuesta de la tabla tarjeta';
-- curp
ALTER TABLE tarjeta ADD CONSTRAINT tarjeta_fkey FOREIGN KEY(curp)
REFERENCES persona(curp) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT tarjeta_fkey ON tarjeta IS 'La referencia de la tabla tarjeta a persona';

-- PK mex
ALTER TABLE mex ADD CONSTRAINT mex_pkey PRIMARY KEY(idPlatillo, noSucursal);
COMMENT ON CONSTRAINT mex_pkey ON mex IS 'La llave primaria compuesta de la tabla mex';
ALTER TABLE mex ADD CONSTRAINT mex_fkey FOREIGN KEY(noSucursal)
REFERENCES sucursal(noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT mex_fkey ON mex IS 'La referencia de la tabla mex a sucursal';

-- PK gringa
ALTER TABLE gringa ADD CONSTRAINT gringa_pkey PRIMARY KEY(idPlatillo, noSucursal);
COMMENT ON CONSTRAINT gringa_pkey ON gringa IS 'La llave primaria compuesta de la tabla gringa';
ALTER TABLE gringa ADD CONSTRAINT gringa_fkey FOREIGN KEY(noSucursal)
REFERENCES sucursal(noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT gringa_fkey ON gringa IS 'La referencia de la tabla gringa a sucursal';

-- PK tacos
ALTER TABLE tacos ADD CONSTRAINT tacos_pkey PRIMARY KEY(idPlatillo, noSucursal);
COMMENT ON CONSTRAINT tacos_pkey ON tacos IS 'La llave primaria compuesta de la tabla tacos';
ALTER TABLE tacos ADD CONSTRAINT tacos_fkey FOREIGN KEY(noSucursal)
REFERENCES sucursal(noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT tacos_fkey ON tacos IS 'La referencia de la tabla tacos a sucursal';

-- PK torta
ALTER TABLE torta ADD CONSTRAINT torta_pkey PRIMARY KEY(idPlatillo, noSucursal);
COMMENT ON CONSTRAINT torta_pkey ON torta IS 'La llave primaria compuesta de la tabla torta';
ALTER TABLE torta ADD CONSTRAINT torta_fkey FOREIGN KEY(noSucursal)
REFERENCES sucursal(noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT torta_fkey ON torta IS 'La referencia de la tabla torta a sucursal';

-- PK burrito
ALTER TABLE burrito ADD CONSTRAINT burrito_pkey PRIMARY KEY(idPlatillo, noSucursal);
COMMENT ON CONSTRAINT burrito_pkey ON burrito IS 'La llave primaria compuesta de la tabla burrito';
ALTER TABLE burrito ADD CONSTRAINT burrito_fkey FOREIGN KEY(noSucursal)
REFERENCES sucursal(noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT burrito_fkey ON burrito IS 'La referencia de la tabla burrito a sucursal';

-- PK salsa
ALTER TABLE salsa ADD CONSTRAINT salsa_pkey PRIMARY KEY(idPlatillo, noSucursal);
COMMENT ON CONSTRAINT salsa_pkey ON salsa IS 'La llave primaria compuesta de la tabla salsa';
ALTER TABLE salsa ADD CONSTRAINT salsa_fkey FOREIGN KEY(noSucursal)
REFERENCES sucursal(noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT salsa_fkey ON salsa IS 'La referencia de la tabla salsa a sucursal';

-- PK bebida
ALTER TABLE bebida ADD CONSTRAINT bebida_pkey PRIMARY KEY(idPlatillo, noSucursal);
COMMENT ON CONSTRAINT bebida_pkey ON bebida IS 'La llave primaria compuesta de la tabla bebida';
ALTER TABLE bebida ADD CONSTRAINT bebida_fkey FOREIGN KEY(noSucursal)
REFERENCES sucursal(noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT bebida_fkey ON bebida IS 'La referencia de la tabla bebida a sucursal';

-- PK quesadilla
ALTER TABLE quesadilla ADD CONSTRAINT quesadilla_pkey PRIMARY KEY(idPlatillo, noSucursal);
COMMENT ON CONSTRAINT quesadilla_pkey ON quesadilla IS 'La llave primaria compuesta de la tabla quesadilla';
ALTER TABLE quesadilla ADD CONSTRAINT quesadilla_fkey FOREIGN KEY(noSucursal)
REFERENCES sucursal(noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT quesadilla_fkey ON quesadilla IS 'La referencia de la tabla quesadilla a sucursal';

-- PK registroI
ALTER TABLE registroI ADD CONSTRAINT registroI_pkey PRIMARY KEY(idProducto, fecha);
COMMENT ON CONSTRAINT registroI_pkey ON registroI IS 'La llave primaria de la tabla registroI';
ALTER TABLE registroI ADD CONSTRAINT registroI_fkey FOREIGN KEY(idProducto)
REFERENCES ingrediente(idProducto) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT registroI_fkey ON registroI IS 'La referencia de la tabla registroI a ingrediente';

-- PK registroM
ALTER TABLE registroM ADD CONSTRAINT registroM_pkey PRIMARY KEY(idPlatillo, noSucursal, fecha);
COMMENT ON CONSTRAINT registroM_pkey ON registroM IS 'La llave primaria compuesta de la tabla registroM';
ALTER TABLE registroM ADD CONSTRAINT registroM_fkey FOREIGN KEY(idPlatillo, noSucursal)
REFERENCES mex(idPlatillo, noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT registroM_fkey ON registroM IS 'La referencia de la tabla registroM a mex';

-- PK registroG
ALTER TABLE registroG ADD CONSTRAINT registroG_pkey PRIMARY KEY(idPlatillo, noSucursal, fecha);
COMMENT ON CONSTRAINT registroG_pkey ON registroG IS 'La llave primaria compuesta de la tabla registroG';
ALTER TABLE registroG ADD CONSTRAINT registroG_fkey FOREIGN KEY(idPlatillo, noSucursal)
REFERENCES gringa(idPlatillo, noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT registroG_fkey ON registroG IS 'La referencia de la tabla registroG a gringa';

-- PK registroT
ALTER TABLE registroT ADD CONSTRAINT registroT_pkey PRIMARY KEY(idPlatillo, noSucursal, fecha);
COMMENT ON CONSTRAINT registroT_pkey ON registroT IS 'La llave primaria compuesta de la tabla registroT';
ALTER TABLE registroT ADD CONSTRAINT registroT_fkey FOREIGN KEY(idPlatillo, noSucursal)
REFERENCES tacos(idPlatillo, noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT registroT_fkey ON registroT IS 'La referencia de la tabla registroT a tacos';

-- PK registroTT
ALTER TABLE registroTT ADD CONSTRAINT registroTT_pkey PRIMARY KEY(idPlatillo, noSucursal, fecha);
COMMENT ON CONSTRAINT registroTT_pkey ON registroTT IS 'La llave primaria compuesta de la tabla registroTT';
ALTER TABLE registroTT ADD CONSTRAINT registroTT_fkey FOREIGN KEY(idPlatillo, noSucursal)
REFERENCES torta(idPlatillo, noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT registroTT_fkey ON registroTT IS 'La referencia de la tabla registroTT a torta';

-- PK registroB
ALTER TABLE registroB ADD CONSTRAINT registroB_pkey PRIMARY KEY(idPlatillo, noSucursal, fecha);
COMMENT ON CONSTRAINT registroB_pkey ON registroB IS 'La llave primaria compuesta de la tabla registroB';
ALTER TABLE registroB ADD CONSTRAINT registroB_fkey FOREIGN KEY(idPlatillo, noSucursal)
REFERENCES burrito(idPlatillo, noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT registroB_fkey ON registroB IS 'La referencia de la tabla registroB a burrito';

-- PK registroS
ALTER TABLE registroS ADD CONSTRAINT registroS_pkey PRIMARY KEY(idPlatillo, noSucursal, fecha);
COMMENT ON CONSTRAINT registroS_pkey ON registroS IS 'La llave primaria compuesta de la tabla registroS';
ALTER TABLE registroS ADD CONSTRAINT registroS_fkey FOREIGN KEY(idPlatillo, noSucursal)
REFERENCES salsa(idPlatillo, noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT registroS_fkey ON registroS IS 'La referencia de la tabla registroS a salsa';

-- PK registroBB
ALTER TABLE registroBB ADD CONSTRAINT registroBB_pkey PRIMARY KEY(idPlatillo, noSucursal, fecha);
COMMENT ON CONSTRAINT registroBB_pkey ON registroBB IS 'La llave primaria compuesta de la tabla registroBB';
ALTER TABLE registroBB ADD CONSTRAINT registroBB_fkey FOREIGN KEY(idPlatillo, noSucursal)
REFERENCES bebida(idPlatillo, noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT registroBB_fkey ON registroBB IS 'La referencia de la tabla registroBB a bebida';

-- PK registroQ
ALTER TABLE registroQ ADD CONSTRAINT registroQ_pkey PRIMARY KEY(idPlatillo, noSucursal, fecha);
COMMENT ON CONSTRAINT registroQ_pkey ON registroQ IS 'La llave primaria compuesta de la tabla registroQ';
ALTER TABLE registroQ ADD CONSTRAINT registroQ_fkey FOREIGN KEY(idPlatillo, noSucursal)
REFERENCES quesadilla(idPlatillo, noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT registroQ_fkey ON registroQ IS 'La referencia de la tabla registroQ a quesadilla';

-- Llaves foraneas

-- FK promocion
ALTER TABLE promocion ADD CONSTRAINT promocion_fkey FOREIGN KEY(noSucursal)
REFERENCES sucursal(noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT promocion_fkey ON promocion IS 'La llave foranea de la tabla promocion que referencia a sucursal';

-- FK persona
ALTER TABLE persona ADD CONSTRAINT persona_fkey1 FOREIGN KEY(noSucursal) 
REFERENCES sucursal(noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT persona_fkey1 ON persona IS 'La llave foranea de persona que hace referencia a la tabla sucursal';

-- FK repartidor
ALTER TABLE repartidor ADD CONSTRAINT repartidor_fkey1 FOREIGN KEY(noSucursal) 
REFERENCES sucursal(noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT repartidor_fkey1 ON repartidor IS 'La llave foranea de repartidor que hace referencia a la tabla sucursal';

-- FK mesero
ALTER TABLE mesero ADD CONSTRAINT mesero_fkey1 FOREIGN KEY(noSucursal) 
REFERENCES sucursal(noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT mesero_fkey1 ON mesero IS 'La llave foranea de mesero que hace referencia a la tabla sucursal';

-- FK cajero
ALTER TABLE cajero ADD CONSTRAINT cajero_fkey1 FOREIGN KEY(noSucursal) 
REFERENCES sucursal(noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT cajero_fkey1 ON cajero IS 'La llave foranea de cajero que hace referencia a la tabla sucursal';

-- FK tortillero
ALTER TABLE tortillero ADD CONSTRAINT tortillero_fkey1 FOREIGN KEY(noSucursal) 
REFERENCES sucursal(noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT tortillero_fkey1 ON tortillero IS 'La llave foranea de tortillero que hace referencia a la tabla sucursal';

-- FK parrillero
ALTER TABLE parrillero ADD CONSTRAINT parrillero_fkey1 FOREIGN KEY(noSucursal) 
REFERENCES sucursal(noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT parrillero_fkey1 ON parrillero IS 'La llave foranea de parrillero que hace referencia a la tabla sucursal';

-- FK taquero
ALTER TABLE taquero ADD CONSTRAINT taquero_fkey1 FOREIGN KEY(noSucursal) 
REFERENCES sucursal(noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT taquero_fkey1 ON taquero IS 'La llave foranea de taquero que hace referencia a la tabla sucursal';

-- FK pedidoD
ALTER TABLE pedidoD ADD CONSTRAINT pedidoD_fkey FOREIGN KEY(folio)
REFERENCES ticket(folio) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT pedidoD_fkey ON pedidoD IS 'La llave foranea de la tabla pedidoD que referencia a folio';

-- FK pedidoN
ALTER TABLE pedidoN ADD CONSTRAINT pedidoN_fkey FOREIGN KEY(folio)
REFERENCES ticket(folio) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT pedidoN_fkey ON pedidoN IS 'La llave foranea de la tabla pedidoN que referencia a folio';

-- FK plato
ALTER TABLE plato ADD CONSTRAINT plato_fkey1 FOREIGN KEY(idProveedor)
REFERENCES proveedor(idProveedor) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT plato_fkey1 ON plato IS 'La llave foranea de la tabla plato que referencia a proveedor';
ALTER TABLE plato ADD CONSTRAINT plato_fkey2 FOREIGN KEY(noSucursal)
REFERENCES sucursal(noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT plato_fkey2 ON plato IS 'La llave foranea de la tabla plato que referencia a sucursal';

-- FK mesa
ALTER TABLE mesa ADD CONSTRAINT mesa_fkey1 FOREIGN KEY(idProveedor)
REFERENCES proveedor(idProveedor) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT mesa_fkey1 ON mesa IS 'La llave foranea de la tabla mesa que referencia a proveedor';
ALTER TABLE mesa ADD CONSTRAINT mesa_fkey2 FOREIGN KEY(noSucursal)
REFERENCES sucursal(noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT mesa_fkey2 ON mesa IS 'La llave foranea de la tabla mesa que referencia a sucursal';

-- FK banco
ALTER TABLE banco ADD CONSTRAINT banco_fkey1 FOREIGN KEY(idProveedor)
REFERENCES proveedor(idProveedor) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT banco_fkey1 ON banco IS 'La llave foranea de la tabla banco que referencia a proveedor';
ALTER TABLE banco ADD CONSTRAINT banco_fkey2 FOREIGN KEY(noSucursal)
REFERENCES sucursal(noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT banco_fkey2 ON banco IS 'La llave foranea de la tabla banco que referencia a sucursal';

-- FK silla
ALTER TABLE silla ADD CONSTRAINT silla_fkey1 FOREIGN KEY(idProveedor)
REFERENCES proveedor(idProveedor) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT silla_fkey1 ON silla IS 'La llave foranea de la tabla silla que referencia a proveedor';
ALTER TABLE silla ADD CONSTRAINT silla_fkey2 FOREIGN KEY(noSucursal)
REFERENCES sucursal(noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT silla_fkey2 ON silla IS 'La llave foranea de la tabla silla que referencia a sucursal';

-- FK servilletero
ALTER TABLE servilletero ADD CONSTRAINT servilletero_fkey FOREIGN KEY(idProveedor)
REFERENCES proveedor(idProveedor) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT servilletero_fkey ON servilletero IS 'La llave foranea de la tabla servilletero que referencia a proveedor';
ALTER TABLE servilletero ADD CONSTRAINT servilletero_fkey2 FOREIGN KEY(noSucursal)
REFERENCES sucursal(noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT servilletero_fkey2 ON servilletero IS 'La llave foranea de la tabla servilletero que referencia a proveedor';

-- FK ingrediente
ALTER TABLE ingrediente ADD CONSTRAINT ingrediente_fkey1 FOREIGN KEY(idProveedor)
REFERENCES proveedor(idProveedor) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT ingrediente_fkey1 ON ingrediente IS 'La llave foranea de la tabla ingrediente que referencia a proveedor';
ALTER TABLE ingrediente ADD CONSTRAINT ingrediente_fkey2 FOREIGN KEY(noSucursal)
REFERENCES sucursal(noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT ingrediente_fkey2 ON ingrediente IS 'La llave foranea de la tabla ingrediente que referencia a sucursal';

-- FK ticket
ALTER TABLE ticket ADD CONSTRAINT ticket_fkey1 FOREIGN KEY(noSucursal) 
REFERENCES sucursal(noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT ticket_fkey1 ON ticket IS 'La llave foranea de ticket que hace referencia a la tabla sucursal';
ALTER TABLE ticket ADD CONSTRAINT ticket_fkey2 FOREIGN KEY(idPromocion, noSucursal) 
REFERENCES promocion(idPromocion, noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT ticket_fkey2 ON ticket IS 'La llave foranea de ticket que hace referencia a la tabla promocion';
ALTER TABLE ticket ADD CONSTRAINT ticket_fkey3 FOREIGN KEY(curpMesero) 
REFERENCES mesero(curp) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT ticket_fkey3 ON ticket IS 'La llave foranea de ticket que hace referencia a la tabla mesero';

-- Lllaves foraneas de Relaciones M:M

-- FK pagarConE
ALTER TABLE pagarConE ADD CONSTRAINT pagarConE_fkey1 FOREIGN KEY(folio)
REFERENCES ticket(folio) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT pagarConE_fkey1 ON pagarConE IS 'La referencia de la tabla pagarConE a ticket';
ALTER TABLE pagarConE ADD CONSTRAINT pagarConE_fkey2 FOREIGN KEY(idMetodo, curp)
REFERENCES efectivo(idMetodo, curp) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT pagarConE_fkey2 ON pagarConE IS 'La referencia de la tabla pagarConE a efectivo';

-- FK pagarConT
ALTER TABLE pagarConT ADD CONSTRAINT pagarConT_fkey1 FOREIGN KEY(folio)
REFERENCES ticket(folio) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT pagarConT_fkey1 ON pagarConT IS 'La referencia de la tabla pagarConT a ticket';
ALTER TABLE pagarConT ADD CONSTRAINT pagarConT_fkey2 FOREIGN KEY(idMetodo, curp)
REFERENCES tarjeta(idMetodo, curp) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT pagarConT_fkey2 ON pagarConT IS 'La referencia de la tabla pagarConT a tarjeta';

-- FK pagarConP
ALTER TABLE pagarConP ADD CONSTRAINT pagarConP_fkey1 FOREIGN KEY(folio)
REFERENCES ticket(folio) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT pagarConP_fkey1 ON pagarConP IS 'La referencia de la tabla pagarConP a ticket';
ALTER TABLE pagarConP ADD CONSTRAINT pagarConP_fkey2 FOREIGN KEY(idMetodo, curp)
REFERENCES puntos(idMetodo, curp) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT pagarConP_fkey2 ON pagarConP IS 'La referencia de la tabla pagarConP a puntos';

-- FK agregarDM
ALTER TABLE agregarDM ADD CONSTRAINT agregarDM_fkey1 FOREIGN KEY(idPlatillo, noSucursal)
REFERENCES mex(idPlatillo, noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT agregarDM_fkey1 ON agregarDM IS 'La referencia de la tabla agregarDM a mex';
ALTER TABLE agregarDM ADD CONSTRAINT agregarDM_fkey2 FOREIGN KEY(noPedidoD, curp, curpRepartidor)
REFERENCES pedidoD(noPedidoD, curp, curpRepartidor) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT agregarDM_fkey2 ON agregarDM IS 'La referencia de la tabla agregarDM a pedidoD';

-- FK agregarDG
ALTER TABLE agregarDG ADD CONSTRAINT agregarDG_fkey1 FOREIGN KEY(idPlatillo, noSucursal)
REFERENCES gringa(idPlatillo, noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT agregarDG_fkey1 ON agregarDG IS 'La referencia de la tabla agregarDG a gringa';
ALTER TABLE agregarDG ADD CONSTRAINT agregarDG_fkey2 FOREIGN KEY(noPedidoD, curp, curpRepartidor)
REFERENCES pedidoD(noPedidoD, curp, curpRepartidor) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT agregarDG_fkey2 ON agregarDG IS 'La referencia de la tabla agregarDG a pedidoD';

-- FK agregarDT
ALTER TABLE agregarDT ADD CONSTRAINT agregarDT_fkey1 FOREIGN KEY(idPlatillo, noSucursal)
REFERENCES tacos(idPlatillo, noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT agregarDT_fkey1 ON agregarDT IS 'La referencia de la tabla agregarDT a tacos';
ALTER TABLE agregarDT ADD CONSTRAINT agregarDT_fkey2 FOREIGN KEY(noPedidoD, curp, curpRepartidor)
REFERENCES pedidoD(noPedidoD, curp, curpRepartidor) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT agregarDT_fkey2 ON agregarDT IS 'La referencia de la tabla agregarDT a pedidoD';

-- FK agregarDTT
ALTER TABLE agregarDTT ADD CONSTRAINT agregarDTT_fkey1 FOREIGN KEY(idPlatillo, noSucursal)
REFERENCES torta(idPlatillo, noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT agregarDTT_fkey1 ON agregarDTT IS 'La referencia de la tabla agregarDTT a torta';
ALTER TABLE agregarDTT ADD CONSTRAINT agregarDTT_fkey2 FOREIGN KEY(noPedidoD, curp, curpRepartidor)
REFERENCES pedidoD(noPedidoD, curp, curpRepartidor) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT agregarDTT_fkey2 ON agregarDTT IS 'La referencia de la tabla agregarDTT a pedidoD';

-- FK agregarDB
ALTER TABLE agregarDB ADD CONSTRAINT agregarDB_fkey1 FOREIGN KEY(idPlatillo, noSucursal)
REFERENCES burrito(idPlatillo, noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT agregarDB_fkey1 ON agregarDB IS 'La referencia de la tabla agregarDB a burrito';
ALTER TABLE agregarDB ADD CONSTRAINT agregarDB_fkey2 FOREIGN KEY(noPedidoD, curp, curpRepartidor)
REFERENCES pedidoD(noPedidoD, curp, curpRepartidor) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT agregarDB_fkey2 ON agregarDB IS 'La referencia de la tabla agregarDB a pedidoD';

-- FK agregarDS
ALTER TABLE agregarDS ADD CONSTRAINT agregarDS_fkey1 FOREIGN KEY(idPlatillo, noSucursal)
REFERENCES salsa(idPlatillo, noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT agregarDS_fkey1 ON agregarDS IS 'La referencia de la tabla agregarDS a salsa';
ALTER TABLE agregarDS ADD CONSTRAINT agregarDS_fkey2 FOREIGN KEY(noPedidoD, curp, curpRepartidor)
REFERENCES pedidoD(noPedidoD, curp, curpRepartidor) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT agregarDS_fkey2 ON agregarDS IS 'La referencia de la tabla agregarDS a pedidoD';

-- FK agregarDBB
ALTER TABLE agregarDBB ADD CONSTRAINT agregarDBB_fkey1 FOREIGN KEY(idPlatillo, noSucursal)
REFERENCES bebida(idPlatillo, noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT agregarDBB_fkey1 ON agregarDBB IS 'La referencia de la tabla agregarDBB a bebida';
ALTER TABLE agregarDBB ADD CONSTRAINT agregarDBB_fkey2 FOREIGN KEY(noPedidoD, curp, curpRepartidor)
REFERENCES pedidoD(noPedidoD, curp, curpRepartidor) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT agregarDBB_fkey2 ON agregarDBB IS 'La referencia de la tabla agregarDBB a pedidoD';

-- FK agregarDQ
ALTER TABLE agregarDQ ADD CONSTRAINT agregarDQ_fkey1 FOREIGN KEY(idPlatillo, noSucursal)
REFERENCES quesadilla(idPlatillo, noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT agregarDQ_fkey1 ON agregarDQ IS 'La referencia de la tabla agregarDQ a quesadilla';
ALTER TABLE agregarDQ ADD CONSTRAINT agregarDQ_fkey2 FOREIGN KEY(noPedidoD, curp, curpRepartidor)
REFERENCES pedidoD(noPedidoD, curp, curpRepartidor) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT agregarDQ_fkey2 ON agregarDQ IS 'La referencia de la tabla agregarDQ a pedidoD';

-- FK agregarNM
ALTER TABLE agregarNM ADD CONSTRAINT agregarNM_fkey1 FOREIGN KEY(idPlatillo, noSucursal)
REFERENCES mex(idPlatillo, noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT agregarNM_fkey1 ON agregarNM IS 'La referencia de la tabla agregarNM a mex';
ALTER TABLE agregarNM ADD CONSTRAINT agregarNM_fkey2 FOREIGN KEY(noPedidoN, curp)
REFERENCES pedidoN(noPedidoN, curp) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT agregarNM_fkey2 ON agregarNM IS 'La referencia de la tabla agregarNM a pedidoN';

-- FK agregarNG
ALTER TABLE agregarNG ADD CONSTRAINT agregarNG_fkey1 FOREIGN KEY(idPlatillo, noSucursal)
REFERENCES gringa(idPlatillo, noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT agregarNG_fkey1 ON agregarNG IS 'La referencia de la tabla agregarNG a gringa';
ALTER TABLE agregarNG ADD CONSTRAINT agregarNG_fkey2 FOREIGN KEY(noPedidoN, curp)
REFERENCES pedidoN(noPedidoN, curp) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT agregarNG_fkey2 ON agregarNG IS 'La referencia de la tabla agregarNG a pedidoN';

-- FK agregarNT
ALTER TABLE agregarNT ADD CONSTRAINT agregarNT_fkey1 FOREIGN KEY(idPlatillo, noSucursal)
REFERENCES tacos(idPlatillo, noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT agregarNT_fkey1 ON agregarNT IS 'La referencia de la tabla agregarNT a tacos';
ALTER TABLE agregarNT ADD CONSTRAINT agregarNT_fkey2 FOREIGN KEY(noPedidoN, curp)
REFERENCES pedidoN(noPedidoN, curp) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT agregarNT_fkey2 ON agregarNT IS 'La referencia de la tabla agregarNT a pedidoN';

-- FK agregarNTT
ALTER TABLE agregarNTT ADD CONSTRAINT agregarNTT_fkey1 FOREIGN KEY(idPlatillo, noSucursal)
REFERENCES torta(idPlatillo, noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT agregarNTT_fkey1 ON agregarNTT IS 'La referencia de la tabla agregarNTT a torta';
ALTER TABLE agregarNTT ADD CONSTRAINT agregarNTT_fkey2 FOREIGN KEY(noPedidoN, curp)
REFERENCES pedidoN(noPedidoN, curp) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT agregarNTT_fkey2 ON agregarNTT IS 'La referencia de la tabla agregarNTT a pedidoN';

-- FK agregarNB
ALTER TABLE agregarNB ADD CONSTRAINT agregarNB_fkey1 FOREIGN KEY(idPlatillo, noSucursal)
REFERENCES burrito(idPlatillo, noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT agregarNB_fkey1 ON agregarNB IS 'La referencia de la tabla agregarNB a burrito';
ALTER TABLE agregarNB ADD CONSTRAINT agregarNB_fkey2 FOREIGN KEY(noPedidoN, curp)
REFERENCES pedidoN(noPedidoN, curp) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT agregarNB_fkey2 ON agregarNB IS 'La referencia de la tabla agregarNB a pedidoN';

-- FK agregarNS
ALTER TABLE agregarNS ADD CONSTRAINT agregarNS_fkey1 FOREIGN KEY(idPlatillo, noSucursal)
REFERENCES salsa(idPlatillo, noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT agregarNS_fkey1 ON agregarNS IS 'La referencia de la tabla agregarNS a salsa';
ALTER TABLE agregarNS ADD CONSTRAINT agregarNS_fkey2 FOREIGN KEY(noPedidoN, curp)
REFERENCES pedidoN(noPedidoN, curp) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT agregarNS_fkey2 ON agregarNS IS 'La referencia de la tabla agregarNS a pedidoN';

-- FK agregarNBB
ALTER TABLE agregarNBB ADD CONSTRAINT agregarNBB_fkey1 FOREIGN KEY(idPlatillo, noSucursal)
REFERENCES bebida(idPlatillo, noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT agregarNBB_fkey1 ON agregarNBB IS 'La referencia de la tabla agregarNBB a bebida';
ALTER TABLE agregarNBB ADD CONSTRAINT agregarNBB_fkey2 FOREIGN KEY(noPedidoN, curp)
REFERENCES pedidoN(noPedidoN, curp) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT agregarNBB_fkey2 ON agregarNBB IS 'La referencia de la tabla agregarNBB a pedidoN';

-- FK agregarNQ
ALTER TABLE agregarNQ ADD CONSTRAINT agregarNQ_fkey1 FOREIGN KEY(idPlatillo, noSucursal)
REFERENCES quesadilla(idPlatillo, noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT agregarNQ_fkey1 ON agregarNQ IS 'La referencia de la tabla agregarNQ a quesadilla';
ALTER TABLE agregarNQ ADD CONSTRAINT agregarNQ_fkey2 FOREIGN KEY(noPedidoN, curp)
REFERENCES pedidoN(noPedidoN, curp) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT agregarNQ_fkey2 ON agregarNQ IS 'La referencia de la tabla agregarNQ a pedidoN';

-- FK contenerM
ALTER TABLE contenerM ADD CONSTRAINT contenerM_fkey1 FOREIGN KEY(idPlatillo, noSucursal)
REFERENCES mex(idPlatillo, noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT contenerM_fkey1 ON contenerM IS 'La referencia de la tabla contenerM a mex';
ALTER TABLE contenerM ADD CONSTRAINT contenerM_fkey2 FOREIGN KEY(idProducto)
REFERENCES ingrediente(idProducto) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT contenerM_fkey2 ON contenerM IS 'La referencia de la tabla contenerM a ingrediente';

-- FK contenerG
ALTER TABLE contenerG ADD CONSTRAINT contenerG_fkey1 FOREIGN KEY(idPlatillo, noSucursal)
REFERENCES gringa(idPlatillo, noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT contenerG_fkey1 ON contenerG IS 'La referencia de la tabla contenerG a gringa';
ALTER TABLE contenerG ADD CONSTRAINT contenerG_fkey2 FOREIGN KEY(idProducto)
REFERENCES ingrediente(idProducto) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT contenerG_fkey2 ON contenerG IS 'La referencia de la tabla contenerG a ingrediente';

-- FK contenerT
ALTER TABLE contenerT ADD CONSTRAINT contenerT_fkey1 FOREIGN KEY(idPlatillo, noSucursal)
REFERENCES tacos(idPlatillo, noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT contenerT_fkey1 ON contenerT IS 'La referencia de la tabla contenerT a tacos';
ALTER TABLE contenerT ADD CONSTRAINT contenerT_fkey2 FOREIGN KEY(idProducto)
REFERENCES ingrediente(idProducto) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT contenerT_fkey2 ON contenerT IS 'La referencia de la tabla contenerT a ingrediente';

-- FK contenerTT
ALTER TABLE contenerTT ADD CONSTRAINT contenerTT_fkey1 FOREIGN KEY(idPlatillo, noSucursal)
REFERENCES torta(idPlatillo, noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT contenerTT_fkey1 ON contenerTT IS 'La referencia de la tabla contenerTT a torta';
ALTER TABLE contenerTT ADD CONSTRAINT contenerTT_fkey2 FOREIGN KEY(idProducto)
REFERENCES ingrediente(idProducto) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT contenerTT_fkey2 ON contenerTT IS 'La referencia de la tabla contenerTT a ingrediente';

-- FK contenerB
ALTER TABLE contenerB ADD CONSTRAINT contenerB_fkey1 FOREIGN KEY(idPlatillo, noSucursal)
REFERENCES burrito(idPlatillo, noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT contenerB_fkey1 ON contenerB IS 'La referencia de la tabla contenerB a burrito';
ALTER TABLE contenerB ADD CONSTRAINT contenerB_fkey2 FOREIGN KEY(idProducto)
REFERENCES ingrediente(idProducto) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT contenerB_fkey2 ON contenerB IS 'La referencia de la tabla contenerB a ingrediente';

-- FK contenerS
ALTER TABLE contenerS ADD CONSTRAINT contenerS_fkey1 FOREIGN KEY(idPlatillo, noSucursal)
REFERENCES salsa(idPlatillo, noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT contenerS_fkey1 ON contenerS IS 'La referencia de la tabla contenerS a salsa';
ALTER TABLE contenerS ADD CONSTRAINT contenerS_fkey2 FOREIGN KEY(idProducto)
REFERENCES ingrediente(idProducto) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT contenerS_fkey2 ON contenerS IS 'La referencia de la tabla contenerS a ingrediente';

-- FK contenerBB
ALTER TABLE contenerBB ADD CONSTRAINT contenerBB_fkey1 FOREIGN KEY(idPlatillo, noSucursal)
REFERENCES bebida(idPlatillo, noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT contenerBB_fkey1 ON contenerBB IS 'La referencia de la tabla contenerBB a bebida';
ALTER TABLE contenerBB ADD CONSTRAINT contenerBB_fkey2 FOREIGN KEY(idProducto)
REFERENCES ingrediente(idProducto) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT contenerBB_fkey2 ON contenerBB IS 'La referencia de la tabla contenerBB a ingrediente';

-- FK contenerQ
ALTER TABLE contenerQ ADD CONSTRAINT contenerQ_fkey1 FOREIGN KEY(idPlatillo, noSucursal)
REFERENCES quesadilla(idPlatillo, noSucursal) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT contenerQ_fkey1 ON contenerQ IS 'La referencia de la tabla contenerQ a quesadilla';
ALTER TABLE contenerQ ADD CONSTRAINT contenerQ_fkey2 FOREIGN KEY(idProducto)
REFERENCES ingrediente(idProducto) ON DELETE CASCADE ON UPDATE CASCADE;
COMMENT ON CONSTRAINT contenerQ_fkey2 ON contenerQ IS 'La referencia de la tabla contenerQ a ingrediente';