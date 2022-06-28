
--TRIGGERS

--CLIENTE DEFAULT
CREATE OR REPLACE FUNCTION clienteDefault() RETURNS TRIGGER
AS
$$
BEGIN
	INSERT INTO persona(curp,noSucursal,nombre,paterno,materno,nacimiento,genero,email,telefono,cp,estado,calle,numero,esCliente,esEmpleado) VALUES (NEW.rfc,NEW.noSucursal,'DEFAULT','DEFAULT','DEFAULT','01/01/2000','NOBIN',NEW.email,NEW.telefono,NEW.cp,NEW.estado,NEW.calle,NEW.numero,true,false);
	RETURN NULL;
END;
$$
LANGUAGE plpgsql;
CREATE OR REPLACE TRIGGER dispClienteDef
	AFTER INSERT
	ON sucursal
	FOR EACH ROW 
	EXECUTE PROCEDURE clienteDefault();


CREATE OR REPLACE FUNCTION subtotalNB() RETURNS TRIGGER
AS
$$
BEGIN
	UPDATE agregarNB
    SET subtotal = cantidad * precio
    FROM burrito
    WHERE agregarNB.noSucursal = burrito.noSucursal;
  
	RETURN NULL;
END;
$$
LANGUAGE plpgsql;
CREATE OR REPLACE TRIGGER dispSubNB
	AFTER INSERT
	ON agregarNB
	FOR EACH ROW 
	EXECUTE PROCEDURE subtotalNB();

-- SubtotalNBB
CREATE OR REPLACE FUNCTION subtotalNBB() RETURNS TRIGGER
AS
$$
BEGIN
	UPDATE agregarNBB
    SET subtotal = cantidad * precio
    FROM bebida
  WHERE agregarNBB.noSucursal = bebida.noSucursal;
  
	RETURN NULL;
END;
$$
LANGUAGE plpgsql;
CREATE OR REPLACE TRIGGER dispSubNBB
	AFTER INSERT
	ON agregarNBB
	FOR EACH ROW 
	EXECUTE PROCEDURE subtotalNBB();

-- SubtotalNG
CREATE OR REPLACE FUNCTION subtotalNG() RETURNS TRIGGER
AS
$$
BEGIN
	UPDATE agregarNG
    SET subtotal = cantidad * precio
    FROM gringa
    WHERE agregarNG.noSucursal = gringa.noSucursal;
  
	RETURN NULL;
END;
$$
LANGUAGE plpgsql;
CREATE OR REPLACE TRIGGER dispSubNG
	AFTER INSERT
	ON agregarNG
	FOR EACH ROW 
	EXECUTE PROCEDURE subtotalNG();

-- SubtotalNM
CREATE OR REPLACE FUNCTION subtotalNM() RETURNS TRIGGER
AS
$$
BEGIN
	UPDATE agregarNM
    SET subtotal = cantidad * precio
    FROM mex
    WHERE agregarNM.noSucursal = mex.noSucursal;
  
	RETURN NULL;
END;
$$
LANGUAGE plpgsql;
CREATE OR REPLACE TRIGGER dispSubNM
	AFTER INSERT
	ON agregarNM
	FOR EACH ROW 
	EXECUTE PROCEDURE subtotalNM();

-- SubtotalNQ
CREATE OR REPLACE FUNCTION subtotalNQ() RETURNS TRIGGER
AS
$$
BEGIN
	UPDATE agregarNQ
    SET subtotal = cantidad * precio
    FROM quesadilla
    WHERE agregarNQ.noSucursal = quesadilla.noSucursal;
  
	RETURN NULL;
END;
$$
LANGUAGE plpgsql;
CREATE OR REPLACE TRIGGER dispSubNQ
	AFTER INSERT
	ON agregarNQ
	FOR EACH ROW 
	EXECUTE PROCEDURE subtotalNQ();

-- SubtotalNS
CREATE OR REPLACE FUNCTION subtotalNS() RETURNS TRIGGER
AS
$$
BEGIN
	UPDATE agregarNS
    SET subtotal = cantidad * precio
    FROM salsa
    WHERE agregarNS.noSucursal = salsa.noSucursal;
  
	RETURN NULL;
END;
$$
LANGUAGE plpgsql;
CREATE OR REPLACE TRIGGER dispSubNS
	AFTER INSERT
	ON agregarNS
	FOR EACH ROW 
	EXECUTE PROCEDURE subtotalNS();

-- SubtotalNT
CREATE OR REPLACE FUNCTION subtotalNT() RETURNS TRIGGER
AS
$$
BEGIN
	UPDATE agregarNT
    SET subtotal = cantidad * precio
    FROM tacos
    WHERE agregarNT.noSucursal = tacos.noSucursal;
  
	RETURN NULL;
END;
$$
LANGUAGE plpgsql;
CREATE OR REPLACE TRIGGER dispSubNT
	AFTER INSERT
	ON agregarNT
	FOR EACH ROW 
	EXECUTE PROCEDURE subtotalNT();

-- SubtotalNTT
CREATE OR REPLACE FUNCTION subtotalNTT() RETURNS TRIGGER
AS
$$
BEGIN
	UPDATE agregarNTT
    SET subtotal = cantidad * precio
    FROM torta
    WHERE agregarNTT.noSucursal = torta.noSucursal;
  
	RETURN NULL;
END;
$$
LANGUAGE plpgsql;
CREATE OR REPLACE TRIGGER dispSubNTT
	AFTER INSERT
	ON agregarNTT
	FOR EACH ROW 
	EXECUTE PROCEDURE subtotalNTT();


-- SubtotalDB
CREATE OR REPLACE FUNCTION subtotalDB() RETURNS TRIGGER
AS
$$
BEGIN
	UPDATE agregarDB
    SET subtotal = cantidad * precio
    FROM burrito
    WHERE agregarDB.noSucursal = burrito.noSucursal;
	RETURN NULL;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER dispSubDB
	AFTER INSERT
	ON agregarDB
	FOR EACH ROW 
	EXECUTE PROCEDURE subtotalDB();

-- SubtotalDBB
CREATE OR REPLACE FUNCTION subtotalDBB() RETURNS TRIGGER
AS
$$
BEGIN
	UPDATE agregarDBB
    SET subtotal = cantidad * precio
    FROM bebida
  WHERE agregarDBB.noSucursal = bebida.noSucursal;
  
	RETURN NULL;
END;
$$
LANGUAGE plpgsql;
CREATE OR REPLACE TRIGGER dispSubDBB
	AFTER INSERT
	ON agregarDBB
	FOR EACH ROW 
	EXECUTE PROCEDURE subtotalDBB();

-- SubtotalDG
CREATE OR REPLACE FUNCTION subtotalDG() RETURNS TRIGGER
AS
$$
BEGIN
	UPDATE agregarDG
    SET subtotal = cantidad * precio
    FROM gringa
    WHERE agregarDG.noSucursal = gringa.noSucursal;
  
	RETURN NULL;
END;
$$
LANGUAGE plpgsql;
CREATE OR REPLACE TRIGGER dispSubDG
	AFTER INSERT
	ON agregarDG
	FOR EACH ROW 
	EXECUTE PROCEDURE subtotalDG();

-- SubtotalDM
CREATE OR REPLACE FUNCTION subtotalDM() RETURNS TRIGGER
AS
$$
BEGIN
	UPDATE agregarDM
    SET subtotal = cantidad * precio
    FROM mex
    WHERE agregarDM.noSucursal = mex.noSucursal;
  
	RETURN NULL;
END;
$$
LANGUAGE plpgsql;
CREATE OR REPLACE TRIGGER dispSubDM
	AFTER INSERT
	ON agregarDM
	FOR EACH ROW 
	EXECUTE PROCEDURE subtotalDM();

-- SubtotalDQ
CREATE OR REPLACE FUNCTION subtotalDQ() RETURNS TRIGGER
AS
$$
BEGIN
	UPDATE agregarDQ
    SET subtotal = cantidad * precio
    FROM quesadilla
    WHERE agregarDQ.noSucursal = quesadilla.noSucursal;
  
	RETURN NULL;
END;
$$
LANGUAGE plpgsql;
CREATE OR REPLACE TRIGGER dispSubDQ
	AFTER INSERT
	ON agregarDQ
	FOR EACH ROW 
	EXECUTE PROCEDURE subtotalDQ();

-- SubtotalDS
CREATE OR REPLACE FUNCTION subtotalDS() RETURNS TRIGGER
AS
$$
BEGIN
	UPDATE agregarDS
    SET subtotal = cantidad * precio
    FROM salsa
    WHERE agregarDS.noSucursal = salsa.noSucursal;
  
	RETURN NULL;
END;
$$
LANGUAGE plpgsql;
CREATE OR REPLACE TRIGGER dispSubDS
	AFTER INSERT
	ON agregarDS
	FOR EACH ROW 
	EXECUTE PROCEDURE subtotalDS();

-- SubtotalTacos
CREATE OR REPLACE FUNCTION subtotalDT() RETURNS TRIGGER
AS
$$
BEGIN
	UPDATE agregarDT
    SET subtotal = cantidad * precio
    FROM tacos
    WHERE agregarDT.noSucursal = tacos.noSucursal;
  
	RETURN NULL;
END;
$$
LANGUAGE plpgsql;
CREATE OR REPLACE TRIGGER dispSubDT
	AFTER INSERT
	ON agregarDT
	FOR EACH ROW 
	EXECUTE PROCEDURE subtotalDT();

-- SubtotalTortas
CREATE OR REPLACE FUNCTION subtotalDTT() RETURNS TRIGGER
AS
$$
BEGIN
	UPDATE agregarDTT
    SET subtotal = cantidad * precio
    FROM torta
    WHERE agregarDTT.noSucursal = torta.noSucursal;
	RETURN NULL;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER dispSubDTT
	AFTER INSERT
	ON agregarDTT
	FOR EACH ROW 
	EXECUTE PROCEDURE subtotalDTT();

-- TOTAL PedidoN

CREATE TABLE subtotalesPEDN 
AS 
SELECT noPedidoN,subtotal FROM agregarNB 
UNION ALL SELECT noPedidoN,subtotal FROM agregarNBB 
UNION ALL SELECT noPedidoN,subtotal FROM  agregarNG 
UNION ALL SELECT noPedidoN,subtotal FROM agregarNM 
UNION ALL SELECT noPedidoN,subtotal FROM agregarNQ 
UNION ALL SELECT noPedidoN,subtotal FROM agregarNS
UNION ALL SELECT noPedidoN,subtotal FROM agregarNT 
UNION ALL SELECT noPedidoN,subtotal FROM agregarNTT ORDER BY nopedidon;

CREATE TABLE subtotalesPEDD
AS 
SELECT noPedidoD,subtotal FROM agregarDB 
UNION ALL SELECT noPedidoD,subtotal FROM agregarDBB 
UNION ALL SELECT noPedidoD,subtotal FROM  agregarDG 
UNION ALL SELECT noPedidoD,subtotal FROM agregarDM 
UNION ALL SELECT noPedidoD,subtotal FROM agregarDQ 
UNION ALL SELECT noPedidoD,subtotal FROM agregarDS
UNION ALL SELECT noPedidoD,subtotal FROM agregarDT 
UNION ALL SELECT noPedidoD,subtotal FROM agregarDTT ORDER BY noPedidoD;
  
CREATE OR REPLACE FUNCTION subtotalUpdate() RETURNS TRIGGER
AS
$$
BEGIN
  INSERT INTO subtotalesPEDN(noPedidoN, subtotal)
  VALUES (NEW.noPedidoN,NEW.subtotal);
	RETURN NULL;
END;
$$
LANGUAGE plpgsql;
CREATE OR REPLACE FUNCTION subtotalUpdateDom() RETURNS TRIGGER
AS
$$
BEGIN
  INSERT INTO subtotalesPEDD(noPedidoD, subtotal)
  VALUES (NEW.noPedidoD,NEW.subtotal);
	RETURN NULL;
END;
$$
LANGUAGE plpgsql;
-- Actualizacion de subtotales en la tabla de subtotoles
CREATE OR REPLACE TRIGGER dispUpdSubNB
	AFTER UPDATE
	ON agregarNB
	FOR EACH ROW 
	EXECUTE PROCEDURE subtotalUpdate();
CREATE OR REPLACE TRIGGER dispUpdSubNBB
	AFTER UPDATE
	ON agregarNBB
	FOR EACH ROW 
	EXECUTE PROCEDURE subtotalUpdate();
CREATE OR REPLACE TRIGGER dispUpdSubNG
	AFTER UPDATE
	ON agregarNG
	FOR EACH ROW 
	EXECUTE PROCEDURE subtotalUpdate();
CREATE OR REPLACE TRIGGER dispUpdSubNM
	AFTER UPDATE
	ON agregarNM
	FOR EACH ROW 
	EXECUTE PROCEDURE subtotalUpdate();
CREATE OR REPLACE TRIGGER dispUpdSubNQ
	AFTER UPDATE
	ON agregarNQ
	FOR EACH ROW 
	EXECUTE PROCEDURE subtotalUpdate();
CREATE OR REPLACE TRIGGER dispUpdSubNS
	AFTER UPDATE
	ON agregarNS
	FOR EACH ROW 
	EXECUTE PROCEDURE subtotalUpdate();
CREATE OR REPLACE TRIGGER dispUpdSubNT
	AFTER UPDATE
	ON agregarNT
	FOR EACH ROW 
	EXECUTE PROCEDURE subtotalUpdate();
CREATE OR REPLACE TRIGGER dispUpdSubNTT
	AFTER UPDATE
	ON agregarNTT
	FOR EACH ROW 
	EXECUTE PROCEDURE subtotalUpdate();

CREATE OR REPLACE TRIGGER dispUpdSubDB
	AFTER UPDATE
	ON agregarDB
	FOR EACH ROW 
	EXECUTE PROCEDURE subtotalUpdateDom();
CREATE OR REPLACE TRIGGER dispUpdSubDBB
	AFTER UPDATE
	ON agregarDBB
	FOR EACH ROW 
	EXECUTE PROCEDURE subtotalUpdateDom();
CREATE OR REPLACE TRIGGER dispUpdSubDG
	AFTER UPDATE
	ON agregarDG
	FOR EACH ROW 
	EXECUTE PROCEDURE subtotalUpdateDom();
CREATE OR REPLACE TRIGGER dispUpdSubDM
	AFTER UPDATE
	ON agregarDM
	FOR EACH ROW 
	EXECUTE PROCEDURE subtotalUpdateDom();
CREATE OR REPLACE TRIGGER dispUpdSubDQ
	AFTER UPDATE
	ON agregarDQ
	FOR EACH ROW 
	EXECUTE PROCEDURE subtotalUpdateDom();
CREATE OR REPLACE TRIGGER dispUpdSubDS
	AFTER UPDATE
	ON agregarDS
	FOR EACH ROW 
	EXECUTE PROCEDURE subtotalUpdateDom();
CREATE OR REPLACE TRIGGER dispUpdSubDT
	AFTER UPDATE
	ON agregarDT
	FOR EACH ROW 
	EXECUTE PROCEDURE subtotalUpdateDom();
CREATE OR REPLACE TRIGGER dispUpdSubDTT
	AFTER UPDATE
	ON agregarDTT
	FOR EACH ROW 
	EXECUTE PROCEDURE subtotalUpdateDom();
--ARRIBA FUNCIONA

CREATE OR REPLACE FUNCTION totalPedido() RETURNS TRIGGER
AS
$$
BEGIN
  IF NEW.esDOM  THEN 
  UPDATE pedidoD
    SET totalP = (SELECT DISTINCT SUM(DISTINCT subtotal) 
    FROM subtotalesPEDD JOIN pedidoD USING(noPedidoD)
    WHERE folio = NEW.folio)
  WHERE folio = NEW.folio;
	RETURN NEW;
  ELSE
	UPDATE pedidoN
    SET totalP = (SELECT DISTINCT SUM(DISTINCT subtotal)
    FROM subtotalesPEDN JOIN pedidoN USING(noPedidoN)
    WHERE folio = NEW.folio)
    WHERE folio = NEW.folio;
	RETURN NEW;
END IF;
END;
$$
LANGUAGE plpgsql;
CREATE OR REPLACE TRIGGER dispTotPEDEf
	BEFORE INSERT 
	ON pagarConE
	FOR EACH ROW
	EXECUTE PROCEDURE totalPedido();
CREATE OR REPLACE TRIGGER dispTotPEDTar
	BEFORE INSERT 
	ON pagarConT
	FOR EACH ROW
	EXECUTE PROCEDURE totalPedido();
CREATE OR REPLACE TRIGGER dispTotPEDP
	BEFORE INSERT 
	ON pagarConP
	FOR EACH ROW
	EXECUTE PROCEDURE totalPedido();


CREATE OR REPLACE FUNCTION totalTicket() RETURNS TRIGGER
AS
$$
BEGIN
  IF NEW.esDom THEN
	  UPDATE ticket
      SET total = (SELECT DISTINCT SUM(DISTINCT totalP)
      FROM pedidoD 
      WHERE folio = NEW.folio)
    WHERE folio = NEW.folio;
	  RETURN NEW;
  ELSE 
  UPDATE ticket
    SET total = (SELECT DISTINCT SUM(DISTINCT totalP)
    FROM pedidoN
    WHERE folio = NEW.folio)
  WHERE folio = NEW.folio;
	RETURN NEW;
END IF;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER dispTotTicketEf
	AFTER INSERT 
	ON pagarConE
	FOR EACH ROW
	EXECUTE PROCEDURE totalTicket();
CREATE OR REPLACE TRIGGER dispTotTicketTar
	AFTER INSERT 
	ON pagarConT
	FOR EACH ROW
	EXECUTE PROCEDURE totalTicket();
CREATE OR REPLACE TRIGGER dispTotTicketP
	AFTER INSERT 
	ON pagarConP
	FOR EACH ROW
	EXECUTE PROCEDURE totalTicket();


-- RegistrosQuesadilla
CREATE OR REPLACE FUNCTION registrosQ() RETURNS TRIGGER
AS
$$
BEGIN
	UPDATE quesadilla
    SET precio = NEW.precioNuevo
    WHERE idPlatillo = NEW.idPlatillo AND noSucursal = NEW.noSucursal;
	RETURN NULL;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER dispRQ
	AFTER INSERT
	ON registroQ
	FOR EACH ROW 
	EXECUTE PROCEDURE registrosQ();

-- RegistrosBurrito
CREATE OR REPLACE FUNCTION registrosB() RETURNS TRIGGER
AS
$$
BEGIN
	UPDATE burrito
    SET precio = NEW.precioNuevo
    WHERE idPlatillo = NEW.idPlatillo AND noSucursal = NEW.noSucursal;
	RETURN NULL;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER dispRB
	AFTER INSERT
	ON registroB
	FOR EACH ROW 
	EXECUTE PROCEDURE registrosB();

-- RegistrosBebidas
CREATE OR REPLACE FUNCTION registrosBB() RETURNS TRIGGER
AS
$$
BEGIN
	UPDATE bebida
    SET precio = NEW.precioNuevo
    WHERE idPlatillo = NEW.idPlatillo AND noSucursal = NEW.noSucursal;
	RETURN NULL;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER dispRBB
	AFTER INSERT
	ON registroBB
	FOR EACH ROW 
	EXECUTE PROCEDURE registrosBB();

-- RegistrosMex
CREATE OR REPLACE FUNCTION registrosM() RETURNS TRIGGER
AS
$$
BEGIN
	UPDATE mex
    SET precio = NEW.precioNuevo
    WHERE idPlatillo = NEW.idPlatillo AND noSucursal = NEW.noSucursal;
	RETURN NULL;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER dispRM
	AFTER INSERT
	ON registroM
	FOR EACH ROW 
	EXECUTE PROCEDURE registrosM();

-- RegistrosGringa
CREATE OR REPLACE FUNCTION registrosG() RETURNS TRIGGER
AS
$$
BEGIN
	UPDATE gringa
    SET precio = NEW.precioNuevo
    WHERE idPlatillo = NEW.idPlatillo AND noSucursal = NEW.noSucursal;
	RETURN NULL;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER dispRG
	AFTER INSERT
	ON registroG
	FOR EACH ROW 
	EXECUTE PROCEDURE registrosG();

-- RegistrosSalsa
CREATE OR REPLACE FUNCTION registrosS() RETURNS TRIGGER
AS
$$
BEGIN
	UPDATE salsa
    SET precio = NEW.precioNuevo
    WHERE idPlatillo = NEW.idPlatillo AND noSucursal = NEW.noSucursal;
	RETURN NULL;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER dispRS
	AFTER INSERT
	ON registroS
	FOR EACH ROW 
	EXECUTE PROCEDURE registrosS();

-- RegistroTacos
CREATE OR REPLACE FUNCTION registrosT() RETURNS TRIGGER
AS
$$
BEGIN
	UPDATE tacos
    SET precio = NEW.precioNuevo
    WHERE idPlatillo = NEW.idPlatillo AND noSucursal = NEW.noSucursal;
	RETURN NULL;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER dispRT
	AFTER INSERT
	ON registroT
	FOR EACH ROW 
	EXECUTE PROCEDURE registrosT();

-- RegistroTortas
CREATE OR REPLACE FUNCTION registrosTT() RETURNS TRIGGER
AS
$$
BEGIN
	UPDATE torta
    SET precio = NEW.precioNuevo
    WHERE idPlatillo = NEW.idPlatillo AND noSucursal = NEW.noSucursal;
	RETURN NULL;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER dispRTT
	AFTER INSERT
	ON registroTT
	FOR EACH ROW 
	EXECUTE PROCEDURE registrosTT();

-- RegistrosIngredientes
CREATE OR REPLACE FUNCTION registrosI() RETURNS TRIGGER
AS
$$
BEGIN
	UPDATE ingrediente
    SET precio = NEW.precioNuevo
    WHERE idProducto = NEW.idProducto;
	RETURN NULL;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER dispRI
	AFTER INSERT
	ON registroI
	FOR EACH ROW 
	EXECUTE PROCEDURE registrosI();

-- Taquero de corazon
CREATE OR REPLACE FUNCTION tacoCora() RETURNS TRIGGER
AS
$$
BEGIN
	UPDATE puntos
    SET puntosT = puntosT + (total * .1)
    FROM ticket
    WHERE ticket.folio = NEW.folio AND puntos.curp = NEW.curp;
	RETURN NULL;
END;
$$
LANGUAGE plpgsql;

CREATE OR REPLACE TRIGGER dispTCE
	AFTER INSERT
	ON pagarConE 
	FOR EACH ROW 
	EXECUTE PROCEDURE tacoCora();

CREATE OR REPLACE TRIGGER dispTCT
	AFTER INSERT
	ON pagarConT
	FOR EACH ROW 
	EXECUTE PROCEDURE tacoCora();



