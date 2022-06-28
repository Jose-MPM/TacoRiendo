-- PROCEDIMIENTOS

-- Realiza el registro de un repartidor
CREATE OR REPLACE PROCEDURE agregarRepartidor(curpR CHAR(18), noSucursalR INT, nombreR VARCHAR(20), paternoR VARCHAR(20), maternoR VARCHAR(20), nacimientoR DATE,
                                  generoR VARCHAR(20), emailR VARCHAR(50), telefonoR CHAR(10), cpR CHAR(5), estadoR VARCHAR(20), calleR VARCHAR(20),
                                  numeroR INT, rfcR CHAR(13), nominaR CHAR(9), fechaIngresoR DATE,
                                  noSSR CHAR(9), noLicenciaR CHAR(9))
AS $$
DECLARE
esEmpleado BOOLEAN;
esCliente BOOLEAN;
BEGIN
    esEmpleado := TRUE;
    esCliente := FALSE;
    
    IF (nombreR ~ '^[a-zA-Z\s]+$' AND paternoR ~ '^[a-zA-Z\s]+$' AND maternoR ~ '^[a-zA-Z\s]+$') THEN
        INSERT INTO persona(curp, noSucursal, nombre, paterno, materno, nacimiento, genero, email, telefono, cp, estado, calle, 
                            numero, esCliente, esEmpleado) 
        VALUES(curpR, noSucursalR, nombreR, paternoR, maternoR, nacimientoR, generoR, emailR, telefonoR, cpR, estadoR, calleR, 
               numeroR, esCliente, esEmpleado);

        INSERT INTO repartidor(curp, noSucursal, rfc, nomina, fechaIngreso, noSS, noLicencia) 
        VALUES(curpR, noSucursalR, rfcR, nominaR, fechaIngresoR, noSSR, noLicenciaR);
    ELSE
        RAISE NOTICE 'Información invalida';
    END IF;
END
$$
LANGUAGE plpgsql;

CALL agregarRepartidor('0123456789ABCDEFGH', 1, 'Fulanito', '666Perez de Perez', 'Lopez', '07/03/1998', 'Male', 'pp@gmail.com',
                 '0123456789', '01023', 'Mexico', 'amistad', 24,'ALJG700807B06', '123456789', '15/06/2022', 
                  '123456789', '123456789');

DELETE FROM persona WHERE curp = '0123456789ABCDEFGH';
DELETE FROM repartidor WHERE curp = '0123456789ABCDEFGH';

-- Agrega una salsa
CREATE OR REPLACE PROCEDURE agregarSalsa(idSalsa INT, sucursal INT, costo INT, tip VARCHAR(50), pic VARCHAR(8), 
                                             rec VARCHAR(100), pre VARCHAR(5))
AS $$
DECLARE
n INT;
BEGIN
    n := sucursal;
    
    IF EXISTS(SELECT 1 FROM sucursal WHERE noSucursal = n) THEN
        IF NOT EXISTS(SELECT 1 FROM salsa WHERE idPlatillo = idSalsa AND noSucursal = sucursal) THEN
        
            INSERT INTO salsa(idPlatillo, noSucursal, precio, tipo, picor, recomendacion, presentacion)
            VALUES(idSalsa, sucursal, costo, tip, pic, rec, pre);
        ELSE
            RAISE NOTICE 'La salsa con el id %, ya se encuentra en la base de datos', idSalsa;
        END IF;
    ELSE
     RAISE NOTICE 'No se encontro la sucursal con numero % en la base de datos', sucursal;
    END IF;
END
$$
LANGUAGE plpgsql;

CALL agregarSalsa(500, 1, 34, 'bastarda', 'extremo', 'esta rika yum', 'medio');

DELETE FROM salsa WHERE idPlatillo = 500;

CREATE OR REPLACE PROCEDURE abonar(curpE VARCHAR(18)) 
AS $$
DECLARE
aux INTERVAL;
BEGIN 
    aux := antiguedad(curpE);
    IF (EXTRACT(years FROM aux)) % 2 = 0 THEN
        CASE
        WHEN EXISTS(SELECT 1 FROM nominaT WHERE curp = curpE) THEN 
            UPDATE nominaT SET bonos = bonos + 1500 WHERE curp = curpE;
        WHEN EXISTS(SELECT 1 FROM nominaTT WHERE curp = curpE) THEN 
            UPDATE nominaTT SET bonos = bonos + 1500 WHERE curp = curpE;
        WHEN EXISTS(SELECT 1 FROM nominaR WHERE curp = curpE) THEN
            UPDATE nominaR SET bonos = bonos + 1500 WHERE curp = curpE;
        WHEN EXISTS(SELECT 1 FROM nominaC WHERE curp = curpE) THEN
            UPDATE nominaC SET bonos = bonos + 1500 WHERE curp = curpE;
        WHEN EXISTS(SELECT 1 FROM nominaP WHERE curp = curpE) THEN
            UPDATE nominaP SET bonos = bonos + 1500 WHERE curp = curpE;
        ELSE
            UPDATE nominaM SET bonos = bonos + 1500 WHERE curp = curpE;
       END CASE;
    END IF;
END $$
LANGUAGE plpgsql;

CALL agregarRepartidor('0123456789ABCDEFGH', 1, 'Fulanito', 'Perez de Perez', 'Lopez', '07/03/1998', 'Male', 'pp@gmail.com','0123456789', '01023', 'Mexico', 'amistad', 24,'ALJG700807B06', '123456789', '15/06/2020', '123456789', '123456789');
                  
INSERT INTO nominaR(curp, noNomina, salario, bonos) VALUES('0123456789ABCDEFGH', 1234, 1500, 234);
SELECT antiguedad('0123456789ABCDEFGH');

CALL abonar('0123456789ABCDEFGH');
SELECT bonos FROM nominaR WHERE curp = '0123456789ABCDEFGH';

CREATE OR REPLACE PROCEDURE dosAnios() 
-- RETURNS TABLE(curpE VARCHAR(50))

AS $$
DECLARE 
e VARCHAR(18);
BEGIN

    FOR e IN (SELECT curp FROM parrillero UNION
                 SELECT curp FROM mesero UNION
                 SELECT curp FROM cajero UNION
                 SELECT curp FROM taquero UNION
                 SELECT curp FROM tortillero UNION
                 SELECT curp FROM repartidor) LOOP
            -- curpE := e;
            CALL bono(e);
         -- RETURN NEXT;
   END LOOP;
END $$
LANGUAGE plpgsql;