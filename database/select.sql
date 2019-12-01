CREATE OR REPLACE PROCEDURE selectProcedure(VARCHAR(64), VARCHAR(10), VARCHAR(1024))
LANGUAGE plpgsql
AS $selectProcedure$
BEGIN
    IF $2 IS NULL THEN
        EXECUTE format('SELECT ''%I'' FROM %I', $3, $1);
    ELSE
        EXECUTE format('SELECT ''%I'' FROM %I WHERE cod_%I = %I', $3, $1, $1, $2);
    END IF;
END
$selectProcedure$;