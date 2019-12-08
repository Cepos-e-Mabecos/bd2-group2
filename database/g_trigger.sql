-- INSERT Cliente Final
INSERT INTO clientes VALUES ('0000000000', 'Cliente Final', '000000000');

-- Default Cliente
CREATE OR REPLACE FUNCTION defaultCliente()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $defaultCliente$
BEGIN

   UPDATE consumos
   SET cod_cliente = '0000000000'
   WHERE consumos.cod_cliente = OLD.cod_cliente;

   RETURN OLD; 

END
$defaultCliente$;

DROP TRIGGER IF EXISTS clearCliente ON clientes CASCADE;

CREATE TRIGGER clearCliente
  BEFORE DELETE
  ON clientes
  FOR EACH ROW
  EXECUTE PROCEDURE defaultCliente();
