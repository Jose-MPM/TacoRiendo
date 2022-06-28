-- CONSULTAS

-- 1. Obtiene la promoción que más se aplica en cada sucursal
SELECT * FROM bestpromo();
    
-- 2. Obtiene un resumen del curp, nombre completo y tipo del empleado más antiguo de cada sucursal
SELECT * FROM masantiguo();

-- 3. Obtiene el ingrediente con menor lapso de caducidad para cada sucursal
SELECT * FROM mining();

-- 4. Obtiene el ingrediente con mayor lapso de caducidad para cada sucursal
SELECT * FROM maxing();

-- 5. Informacion del proveedor que brinda más productos por cada tipo
SELECT * FROM bestprove();

-- 6. Obtiene la información de la persona con mayor tiempo trabajando en la sucursal Schaden LLC, su edad y antiguedad como empleado
SELECT *, AGE(nacimiento) AS edad, antiguedad(curp)
FROM persona WHERE curp = (SELECT curpa
FROM antiguo((SELECT nosucursal FROM public.sucursal WHERE nombre = 'Schaden LLC')) as x);

-- 7. Obtiene el picor y presentación de salsa preferido de la sucursal con más pedidos a domicilio
SELECT sucursal, presfav(sucursal), picorfav(sucursal) FROM 
(SELECT mode() WITHIN GROUP (ORDER BY nosucursal) AS sucursal FROM agregards) AS x;

-- 8. Suma total de todos los tickets de la sucursal Christiansen Inc en California
SELECT sum(t.total), s.nombre
FROM sucursal s NATURAL JOIN ticket t
WHERE s.estado = 'California' AND s.nombre ='Christiansen Inc'
GROUP BY(s.nombre);

-- 9. Tickets expedidos por la sucursal Christiansen Inc ubicada en California
-- **
SELECT t.*
FROM sucursal s NATURAL JOIN ticket t 
WHERE s.estado = 'California' AND s.nombre ='Christiansen Inc';

-- 10. Resumen por cada sucursal, la venta más grande, la menor, la venta promedio y el total de ventas junto con el número de tickets
SELECT s.noSucursal, s.nombre, to_char(MAX(t.total), 'LFM999,999,999.00') "Venta mayor", 
        to_char(MIN(t.total), 'LFM999,999,999.00') "Venta menor",
        to_char(AVG(t.total), 'LFM999,999,999.00') "Venta promedio",
        to_char(sum(t.total), 'LFM999,999,999.00') "Total de Ventas",
        COUNT(t.folio) "Numero de tickets"
FROM ticket t NATURAL JOIN sucursal s
GROUP BY s.noSucursal
ORDER BY  s.noSucursal ASC;

-- 11. Ganancias de todas las sucursales ubicadas en New York
SELECT s.noSucursal, ganancias(s.noSucursal), s.nombre
FROM sucursal s
WHERE s.estado = 'New York';

-- 12. Información de los tickets de las mesas atendidas durante todo este año en las del estado de Minnesota.
SELECT p.*, t.*
FROM pedidoN p LEFT JOIN (sucursal s NATURAL JOIN ticket t) ON p.folio = t.folio
WHERE UPPER(t.tipo) = 'MESA' AND t.fecha BETWEEN SYMMETRIC '2022-01-01' AND CURRENT_DATE AND LOWER(s.estado) = 'minnesota' 
ORDER BY t.total ASC;

-- 13. Total atendido por cada mesero de todas las sucursales, en el ultimo año, en tipo mesa
SELECT m.curp,m.nosucursal,COUNT(m.curp) AS "Mesas atentidas", extract(YEAR FROM t.fecha) AS año,
       to_char(sum(t.total),'LFM999,999,999.00') AS "Total de las mesas atendidas"
FROM mesero m JOIN ticket t ON m.curp = t.curpmesero AND t.tipo = 'mesa' AND date_part('year',fecha) = 2022
GROUP BY m.curp,m.nosucursal, extract(YEAR FROM t.fecha)
ORDER BY sum(t.total) DESC;
  
-- 14. Sucursales con 2 o más repartidores que cuentan con una moto como medio de transporte
SELECT r.nosucursal,t.tipo,COUNT(t.tipo) AS "Repartidores con moto"
FROM repartidor r NATURAL JOIN transporte t JOIN sucursal s ON s.nosucursal=r.nosucursal AND t.tipo ='moto'
GROUP BY r.nosucursal,t.tipo
HAVING COUNT(t.tipo) >= 2
ORDER BY COUNT(t.tipo) DESC;


-- 15. Obtiene el resumen con el nombre completo, curp, mail y puntos del cliente con más puntos acumulados
SELECT curp, concat(nombre, ' ', paterno, ' ', materno) AS nombrec,  email, puntost FROM persona NATURAL JOIN puntos WHERE curp = (SELECT curp
FROM puntos AS y WHERE puntost = (SELECT MAX(puntost) AS puntos
FROM puntos));
