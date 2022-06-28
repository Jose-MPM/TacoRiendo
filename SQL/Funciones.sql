-- FUNCIONES

-- CREATE LANGUAGE plpgsql;

-- Calcula la antigüedad de los empleados de la sucursal 
-- select antiguedad('ADAR578566AMHAYJ17');
CREATE OR REPLACE FUNCTION antiguedad(char(18))
	RETURNS interval
	AS $$
	DECLARE
		c char(18); -- curp
        b bool; -- esEmpleado?
		n date; -- fecha_ingreso
	BEGIN
		c := $1;
        b := (SELECT esEmpleado FROM public.persona WHERE curp = c);
        IF b THEN 
            n := (SELECT fechaIngreso FROM public.cajero WHERE curp = c
            UNION ALL SELECT fechaIngreso FROM public.mesero WHERE curp = c
            UNION ALL SELECT fechaIngreso FROM public.tortillero WHERE curp = c
            UNION ALL SELECT fechaIngreso FROM public.repartidor WHERE curp = c
            UNION ALL SELECT fechaIngreso FROM public.parrillero WHERE curp = c
            UNION ALL SELECT fechaIngreso FROM public.taquero WHERE curp = c);
            return AGE(n);
        ELSE 
            return NULL;
        END IF;
	END;
	$$
	Language plpgsql;

-- Obtiene el empleado más antiguo de todas las sucursales
-- SELECT * FROM masantiguo();
CREATE OR REPLACE FUNCTION masantiguo() 
    RETURNS TABLE (noSucursalE int, curpE CHAR(18), nombreE CHAR(50), tipoE char(20), antiguedadE interval)
    AS $$
    DECLARE       
        c int;
    BEGIN
    FOR c IN SELECT nosucursal FROM sucursal loop 
        noSucursale := c;
    	curpE := (SELECT curpA FROM antiguo(c));
        nombreE := (SELECT concat(nombre, ' ', paterno, ' ', materno) as nombrec FROM persona WHERE curp = curpE);
        tipoE := (SELECT tipoA FROM antiguo(c));
        antiguedade := (SELECT antiguedad(curpe));
        RETURN NEXT;
    end loop;
    end; $$
    LANGUAGE 'plpgsql';
    
-- Obtiene el curp del empleado más antiguo de x sucursal
-- SELECT antiguo(2);
CREATE OR REPLACE FUNCTION antiguo(int) 
    RETURNS TABLE (curpA CHAR(18), tipoA CHAR(20)) 
    AS $$
    DECLARE 
        s int;
    begin
        s := $1;
        curpA := (SELECT curp FROM (SELECT curp, antiguedad(curp), ('cajero')"tipo" FROM cajero WHERE noSucursal = s
              UNION ALL SELECT curp, antiguedad(curp), ('mesero')"tipo" FROM mesero WHERE noSucursal = s
              UNION ALL SELECT curp, antiguedad(curp), ('tortillero')"tipo" FROM tortillero WHERE noSucursal = s
              UNION ALL SELECT curp, antiguedad(curp), ('reparidor')"tipo" FROM repartidor WHERE noSucursal = s
              UNION ALL SELECT curp, antiguedad(curp), ('parrillero')"tipo" FROM parrillero WHERE noSucursal = s
              UNION ALL SELECT curp, antiguedad(curp), ('taquero')"tipo" FROM taquero WHERE noSucursal = s
             ) AS x
             WHERE antiguedad = (SELECT MAX(antiguedad) FROM (SELECT antiguedad(curp) FROM cajero WHERE noSucursal = s
              UNION ALL SELECT antiguedad(curp) FROM mesero WHERE noSucursal = s
              UNION ALL SELECT antiguedad(curp) FROM tortillero WHERE noSucursal = s
              UNION ALL SELECT antiguedad(curp) FROM repartidor WHERE noSucursal = s
              UNION ALL SELECT antiguedad(curp) FROM parrillero WHERE noSucursal = s
              UNION ALL SELECT antiguedad(curp) FROM taquero WHERE noSucursal = s
             ) AS employ));             
           tipoA := (SELECT tipo FROM (SELECT curp, antiguedad(curp), ('cajero')"tipo" FROM cajero WHERE noSucursal = s
              UNION ALL SELECT curp, antiguedad(curp), ('mesero')"tipo" FROM mesero WHERE noSucursal = s
              UNION ALL SELECT curp, antiguedad(curp), ('tortillero')"tipo" FROM tortillero WHERE noSucursal = s
              UNION ALL SELECT curp, antiguedad(curp), ('reparidor')"tipo" FROM repartidor WHERE noSucursal = s
              UNION ALL SELECT curp, antiguedad(curp), ('parrillero')"tipo" FROM parrillero WHERE noSucursal = s
              UNION ALL SELECT curp, antiguedad(curp), ('taquero')"tipo" FROM taquero WHERE noSucursal = s
             ) AS x
             WHERE antiguedad = (SELECT MAX(antiguedad) FROM (SELECT antiguedad(curp) FROM cajero WHERE noSucursal = s
              UNION ALL SELECT antiguedad(curp) FROM mesero WHERE noSucursal = s
              UNION ALL SELECT antiguedad(curp) FROM tortillero WHERE noSucursal = s
              UNION ALL SELECT antiguedad(curp) FROM repartidor WHERE noSucursal = s
              UNION ALL SELECT antiguedad(curp) FROM parrillero WHERE noSucursal = s
              UNION ALL SELECT antiguedad(curp) FROM taquero WHERE noSucursal = s
             ) AS employ));
             return NEXT;
    end; $$
    LANGUAGE 'plpgsql';

-- Calcular las ganancias x sucursal
-- select ganancias(1);
CREATE OR REPLACE FUNCTION ganancias(INT)
	RETURNS INT
	AS $$
	DECLARE
		id int; -- noSucursal		
		t int; -- total
	BEGIN
		id := $1;
		t := SUM(total) FROM public.ticket WHERE noSucursal = id;		
		return t;
	END;
	$$
	Language plpgsql;

-- Calcula la promoción más aplicada en x sucursal
-- select promofav(50);
CREATE OR REPLACE FUNCTION promofav(int)
RETURNS char
	AS $$
	DECLARE
		id int; -- noScursal
        promo text;
	BEGIN
        id := $1;
        promo := (SELECT mode() WITHIN GROUP (ORDER BY descripcion) AS modal_value FROM 
              (SELECT descripcion FROM ticket NATURAL JOIN promocion WHERE noSucursal = id) AS salsad);
        return promo;
    END;
	$$
	Language plpgsql;

-- Obtiene la promoción más aplicada de todas las sucursales
-- SELECT * FROM bestpromo();
CREATE OR REPLACE FUNCTION bestpromo() 
    RETURNS TABLE (noSucursalP int, bestpromo CHAR(20))
    AS $$
    DECLARE       
        c int;
    BEGIN
    FOR c IN SELECT nosucursal FROM sucursal loop         
        noSucursalP := c;
    	bestpromo := (SELECT promofav(c));
        RETURN NEXT;
    end loop;
    end; $$
    LANGUAGE 'plpgsql';

-- Calcula el nivel de picor de salsa más vendido en x sucursal
-- select picorfav(22);
-- Calcular la de todas las sucursales
CREATE OR REPLACE FUNCTION picorfav(int)
RETURNS text
	AS $$
	DECLARE
		id int; -- noScursal
        cn int; -- cantidad normal
        cd int; -- cantidad domicilio
        c int;
        s int; -- salsa
        p text; -- picor
	BEGIN
        id := $1;        
        cn := COALESCE((SELECT MAX(cantidad) FROM agregarns WHERE noSucursal = id), 0);
        cd := COALESCE((SELECT MAX(cantidad) FROM agregards WHERE noSucursal = id), 0);
        IF cn > cd THEN 
            c := cn; 
            s := (SELECT idPlatillo FROM agregarns WHERE noSucursal = id and cantidad = c);
        ELSE 
            c := cd; 
            s := (SELECT idPlatillo FROM agregards WHERE noSucursal = id and cantidad = c);
        END IF;
        p := (SELECT picor FROM salsa WHERE idPlatillo = s and noSucursal = id);
        return p;
    END;
	$$
	Language plpgsql;

-- Calcula la presentación de salsa más pedida en x sucursal
-- select presfav(22);
-- Para todas las suc
CREATE OR REPLACE FUNCTION presfav(int)
RETURNS text
	AS $$
	DECLARE
		id INT; -- noScursal
    pres text; -- presentacion
	BEGIN
        id := $1;
        pres := (SELECT mode() WITHIN GROUP (ORDER BY presentacion) AS modal_value FROM 
              (SELECT presentacion FROM agregards NATURAL JOIN salsa WHERE noSucursal = id) AS salsad);
        return pres;
    END;
	$$
	Language plpgsql;

-- Obtiene el ingrediente con menor lapso de caducidad para cada sucursal
-- SELECT * FROM mining();
CREATE OR REPLACE FUNCTION mining() 
    RETURNS TABLE (noSucursalM int, idproductoM int, tipoM CHAR(20), vida interval)
    AS $$
    DECLARE       
        c int;
    BEGIN
    FOR c IN SELECT nosucursal FROM sucursal loop         
        noSucursalM := c;
        vida := (SELECT MIN(vidautil) FROM (SELECT nosucursal, AGE(caducidad,diacompra) as vidautil FROM ingrediente WHERE noSucursal = c) AS x);
        idproductoM := (SELECT idproducto FROM (SELECT idproducto, nosucursal, AGE(caducidad,diacompra) as vidautil FROM ingrediente WHERE nosucursal = c) AS y WHERE vidautil = vida LIMIT 1);
        tipoM := (SELECT tipo FROM (SELECT tipo FROM ingrediente WHERE noSucursal = c AND idproducto = idproductoM) AS z);
        RETURN NEXT;
    end loop;
    end; $$
    LANGUAGE 'plpgsql';    

-- Obtiene el ingrediente con mayor lapso de caducidad para cada sucursal
-- SELECT * FROM mining();
CREATE OR REPLACE FUNCTION maxing() 
    RETURNS TABLE (noSucursalM int, idproductoM int, tipoM CHAR(20), vida interval)
    AS $$
    DECLARE       
        c int;
    BEGIN
    FOR c IN SELECT nosucursal FROM sucursal loop         
        noSucursalM := c;
        vida := (SELECT MAX(vidautil) FROM (SELECT nosucursal, AGE(caducidad,diacompra) as vidautil FROM ingrediente WHERE noSucursal = c) AS x);
        idproductoM := (SELECT idproducto FROM (SELECT idproducto, nosucursal, AGE(caducidad,diacompra) as vidautil FROM ingrediente WHERE nosucursal = c) AS y WHERE vidautil = vida LIMIT 1);
        tipoM := (SELECT tipo FROM (SELECT tipo FROM ingrediente WHERE noSucursal = c AND idproducto = idproductoM) AS z);
        RETURN NEXT;
    end loop;
    end; $$
    LANGUAGE 'plpgsql';

-- Obtiene a los proveedores con precios economicos por tipo
CREATE OR REPLACE FUNCTION bestprove() 
RETURNS TABLE(noproveedor INT, nom VARCHAR(50), producto VARCHAR(20), marca VARCHAR(50))
AS $$
DECLARE
 s VARCHAR;
 arr VARCHAR[] := ARRAY['mesa','silla','ingrediente','banco','servilletero'];
BEGIN
       
FOREACH s IN ARRAY arr LOOP    
    noproveedor := (SELECT idprove FROM best(s));
    nom := (SELECT nombre FROM proveedor WHERE idProveedor = noproveedor);
    marca := (SELECT brand FROM best(s));
    producto := s;
    RETURN NEXT;
END LOOP;
END; $$
LANGUAGE 'plpgsql';

-- Dado el tipo de producto, obiente al proveedor con productos a precio economico.
CREATE OR REPLACE FUNCTION best(VARCHAR(20)) 
RETURNS TABLE(idprove INT, brand VARCHAR(50))
AS $$
DECLARE
tipo VARCHAR(20);
BEGIN
    tipo := $1;
    CASE
        WHEN tipo = 'ingrediente' THEN 
        idprove := (SELECT idProveedor FROM proveedor NATURAL JOIN ingrediente 
        WHERE precio = (SELECT MIN(precio) FROM ingrediente));
        brand := (SELECT marca FROM ingrediente WHERE idProveedor = idprove 
                  AND precio = (SELECT MIN(precio) FROM ingrediente));
                  
        WHEN tipo = 'mesa' THEN 
        idprove := (SELECT idProveedor FROM proveedor NATURAL JOIN mesa 
        WHERE precio = (SELECT MIN(precio) FROM mesa));
        brand := (SELECT marca FROM mesa WHERE idProveedor = idprove);
        
        WHEN tipo = 'plato' THEN 
        idprove := (SELECT idProveedor FROM proveedor NATURAL JOIN plato 
        WHERE precio = (SELECT MIN(precio) FROM plato));
        brand := (SELECT marca FROM plato WHERE idProveedor = idprove);
        
        WHEN tipo = 'servilletero' THEN 
        idprove := (SELECT idProveedor FROM proveedor NATURAL JOIN servilletero 
        WHERE precio = (SELECT MIN(precio) FROM servilletero));
        brand := (SELECT marca FROM servilletero WHERE idProveedor = idprove);
        
        ELSE 
        idprove := (SELECT idProveedor FROM proveedor NATURAL JOIN silla 
        WHERE precio = (SELECT MIN(precio) FROM silla));
        brand := (SELECT marca FROM silla WHERE idProveedor = idprove);
    END CASE;
    RETURN NEXT;
END; $$
LANGUAGE 'plpgsql';

