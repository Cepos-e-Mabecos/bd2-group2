-- INSERT Cliente Final
INSERT INTO clientes VALUES ('0000000000', 'Cliente Final', '000000000');

-- Default Cliente
CREATE OR REPLACE FUNCTION defaultcliente()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $defaultcliente$
BEGIN
   IF OLD.cod_cliente = '0000000000' THEN
      RETURN OLD;
   END IF;

   UPDATE consumos
   SET cod_cliente = '0000000000'
   WHERE consumos.cod_cliente = OLD.cod_cliente;

   RETURN NEW; 

END
$defaultcliente$;

DROP TRIGGER IF EXISTS clearcliente ON clientes CASCADE;

CREATE TRIGGER clearcliente
  BEFORE DELETE
  ON clientes
  FOR EACH ROW
  EXECUTE PROCEDURE defaultcliente();
