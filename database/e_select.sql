-- View Clientes
CREATE OR REPLACE VIEW getclientes
AS SELECT * FROM clientes;

-- Select Clientes
CREATE OR REPLACE FUNCTION selectclientes()
RETURNS TABLE (cod_cliente VARCHAR(10), nome VARCHAR(256), nif VARCHAR(9))
LANGUAGE plpgsql
AS $selectclientes$
BEGIN

RETURN QUERY
    SELECT *
    FROM getclientes;

END
$selectclientes$;

-- Select Cliente
CREATE OR REPLACE FUNCTION selectcliente(VARCHAR(10))
RETURNS TABLE (cod_cliente VARCHAR(10), nome VARCHAR(256), nif VARCHAR(9))
LANGUAGE plpgsql
AS $selectcliente$
BEGIN

RETURN QUERY
    SELECT *
    FROM getclientes
    WHERE getclientes.cod_cliente = $1;

END
$selectcliente$;

-- Select Consumos
CREATE OR REPLACE FUNCTION selectconsumos()
RETURNS TABLE (cod_consumo VARCHAR(10), data_consumo TIMESTAMP, cod_cliente VARCHAR(10), cod_funcionario VARCHAR(10))
LANGUAGE plpgsql
AS $selectconsumos$
BEGIN

RETURN QUERY
    SELECT *
    FROM getconsumos;

END
$selectconsumos$;

-- Select Consumo
CREATE OR REPLACE FUNCTION selectconsumo(VARCHAR(10))
RETURNS TABLE (cod_consumo VARCHAR(10), data_consumo TIMESTAMP, cod_cliente VARCHAR(10), cod_funcionario VARCHAR(10))
LANGUAGE plpgsql
AS $selectconsumo$
BEGIN

RETURN QUERY
    SELECT *
    FROM getconsumos
    WHERE getconsumos.cod_consumo = $1;

END
$selectconsumo$;

-- View Locais
CREATE OR REPLACE VIEW getlocais
AS SELECT * FROM locais;

-- Select Locais
CREATE OR REPLACE FUNCTION selectlocais()
RETURNS TABLE (cod_local VARCHAR(10), designacao VARCHAR(256))
LANGUAGE plpgsql
AS $selectlocais$
BEGIN

RETURN QUERY
    SELECT *
    FROM getlocais;

END
$selectlocais$;

-- Select Local
CREATE OR REPLACE FUNCTION selectlocal(VARCHAR(10))
RETURNS TABLE (cod_local VARCHAR(10), designacao VARCHAR(256))
LANGUAGE plpgsql
AS $selectlocal$
BEGIN

RETURN QUERY
    SELECT *
    FROM getlocais
    WHERE getlocais.cod_local = $1;

END
$selectlocal$;

-- View Restaurantes
CREATE OR REPLACE VIEW getrestaurantes
AS SELECT * FROM restaurantes;

-- Select Restaurantes
CREATE OR REPLACE FUNCTION selectrestaurantes()
RETURNS TABLE (cod_restaurante VARCHAR(10), designacao VARCHAR(256), cod_local VARCHAR(10))
LANGUAGE plpgsql
AS $selectrestaurantes$
BEGIN

RETURN QUERY
    SELECT *
    FROM getrestaurantes;

END
$selectrestaurantes$;

-- Select Restaurante
CREATE OR REPLACE FUNCTION selectrestaurante(VARCHAR(10))
RETURNS TABLE (cod_restaurante VARCHAR(10), designacao VARCHAR(256), cod_local VARCHAR(10))
LANGUAGE plpgsql
AS $selectrestaurante$
BEGIN

RETURN QUERY
    SELECT *
    FROM getrestaurantes
    WHERE getrestaurantes.cod_restaurante = $1;

END
$selectrestaurante$;

-- View LocaisConsumo
CREATE OR REPLACE VIEW getlocaisconsumo
AS SELECT * FROM locaisconsumo;

-- Select LocaisConsumo
CREATE OR REPLACE FUNCTION selectlocaisconsumo()
RETURNS TABLE (cod_localconsumo VARCHAR(10), designacao VARCHAR(256), cod_restaurante VARCHAR(10))
LANGUAGE plpgsql
AS $selectlocaisconsumo$
BEGIN

RETURN QUERY
    SELECT *
    FROM getlocaisconsumo;

END
$selectlocaisconsumo$;

-- Select LocalConsumo
CREATE OR REPLACE FUNCTION selectlocalconsumo(VARCHAR(10))
RETURNS TABLE (cod_localconsumo VARCHAR(10), designacao VARCHAR(256), cod_restaurante VARCHAR(10))
LANGUAGE plpgsql
AS $selectlocalconsumo$
BEGIN

RETURN QUERY
    SELECT *
    FROM getlocaisconsumo
    WHERE getlocaisconsumo.cod_localconsumo = $1;

END
$selectlocalconsumo$;

-- View Funcionarios
CREATE OR REPLACE VIEW getfuncionarios
AS SELECT * FROM funcionarios;

-- Select Funcionarios
CREATE OR REPLACE FUNCTION selectfuncionarios()
RETURNS TABLE (cod_funcionario VARCHAR(10), nome VARCHAR(256), cod_localconsumo VARCHAR(10))
LANGUAGE plpgsql
AS $selectfuncionarios$
BEGIN

RETURN QUERY
    SELECT *
    FROM getfuncionarios;

END
$selectfuncionarios$;

-- Select Funcionario
CREATE OR REPLACE FUNCTION selectfuncionario(VARCHAR(10))
RETURNS TABLE (cod_funcionario VARCHAR(10), nome VARCHAR(256), cod_localconsumo VARCHAR(10))
LANGUAGE plpgsql
AS $selectfuncionario$
BEGIN

RETURN QUERY
    SELECT *
    FROM getfuncionarios
    WHERE getfuncionarios.cod_funcionario = $1;

END
$selectfuncionario$;

-- View Tiposementa
CREATE OR REPLACE VIEW gettiposementa
AS SELECT * FROM tiposementa;

-- Select Tiposementa
CREATE OR REPLACE FUNCTION selecttiposementa()
RETURNS TABLE (cod_tipoementa VARCHAR(10), designacao VARCHAR(256))
LANGUAGE plpgsql
AS $selecttiposementa$
BEGIN

RETURN QUERY
    SELECT *
    FROM gettiposementa;

END
$selecttiposementa$;

-- Select Tipoementa
CREATE OR REPLACE FUNCTION selecttipoementa(VARCHAR(10))
RETURNS TABLE (cod_tipoementa VARCHAR(10), designacao VARCHAR(256))
LANGUAGE plpgsql
AS $selecttipoementa$
BEGIN
RETURN QUERY
    SELECT *
    FROM gettiposementa
    WHERE gettiposementa.cod_tipoementa = $1;

END
$selecttipoementa$;

-- View Tipositens
CREATE OR REPLACE VIEW gettipositem
AS SELECT * FROM tipositem;

-- Select Tipositens
CREATE OR REPLACE FUNCTION selecttipositem()
RETURNS TABLE (cod_tipoitem VARCHAR(10), designacao VARCHAR(256))
LANGUAGE plpgsql
AS $selecttipositem$
BEGIN

RETURN QUERY
    SELECT *
    FROM gettipositem;

END
$selecttipositem$;

-- Select Tipoitens
CREATE OR REPLACE FUNCTION selecttipoitem(VARCHAR(10))
RETURNS TABLE (cod_tipoitem VARCHAR(10), designacao VARCHAR(256))
LANGUAGE plpgsql
AS $selecttipoitem$
BEGIN

RETURN QUERY
    SELECT *
    FROM gettipositem
    WHERE gettipositem.cod_tipoitem = $1;

END
$selecttipoitem$;

-- View itens
CREATE OR REPLACE VIEW getitens
AS SELECT * FROM itens;

-- Select itens
CREATE OR REPLACE FUNCTION selectitens()
RETURNS TABLE (cod_item VARCHAR(10), designacao VARCHAR(256), custo MONEY, cod_tipoitem VARCHAR(10))
LANGUAGE plpgsql
AS $selectitens$
BEGIN

RETURN QUERY
    SELECT *
    FROM getitens;

END
$selectitens$;

-- Select itens
CREATE OR REPLACE FUNCTION selectitem(VARCHAR(10))
RETURNS TABLE (cod_item VARCHAR(10), designacao VARCHAR(256), custo MONEY, cod_tipoitem VARCHAR(10))
LANGUAGE plpgsql
AS $selectitem$
BEGIN

RETURN QUERY
    SELECT *
    FROM getitens
    WHERE getitens.cod_item = $1;

END
$selectitem$;

-- View Datasementa
CREATE OR REPLACE VIEW getdatasementa
AS SELECT * FROM datasementa;

-- Select Datasementa
CREATE OR REPLACE FUNCTION selectdatasementa()
RETURNS TABLE (cod_dataementa VARCHAR(10), data_ementa TIMESTAMP)
LANGUAGE plpgsql
AS $selectdatasementa$
BEGIN

RETURN QUERY
    SELECT *
    FROM getdatasementa;

END
$selectdatasementa$;

-- Select Dataementa
CREATE OR REPLACE FUNCTION selectdataementa(VARCHAR(10))
RETURNS TABLE (cod_dataementa VARCHAR(10), data_ementa TIMESTAMP)
LANGUAGE plpgsql
AS $selectdataementa$
BEGIN

RETURN QUERY
    SELECT *
    FROM getdatasementa
    WHERE getdatasementa.cod_dataementa = $1;

END
$selectdataementa$;

-- View TiposRefeicao
CREATE OR REPLACE VIEW gettiposrefeicao
AS SELECT * FROM tiposrefeicao;

-- Select TiposRefeicao
CREATE OR REPLACE FUNCTION selecttiposrefeicao()
RETURNS TABLE (cod_tiporefeicao VARCHAR(10), designacao VARCHAR(256))
LANGUAGE plpgsql
AS $selecttiposrefeicao$
BEGIN

RETURN QUERY
    SELECT *
    FROM gettiposrefeicao;

END
$selecttiposrefeicao$;

-- Select TipoRefeicao
CREATE OR REPLACE FUNCTION selecttiporefeicao(VARCHAR(10))
RETURNS TABLE (cod_tiporefeicao VARCHAR(10), designacao VARCHAR(256))
LANGUAGE plpgsql
AS $selecttiporefeicao$
BEGIN

RETURN QUERY
    SELECT *
    FROM gettiposrefeicao
    WHERE gettiposrefeicao.cod_tiporefeicao = $1;

END
$selecttiporefeicao$;

-- View ementas
CREATE OR REPLACE VIEW getementas
AS
SELECT
    cod_ementa,
    cod_tipoementa,
    cod_dataementa,
    cod_tiporefeicao,
    cod_restaurante,
    (SELECT total
    FROM
    (
        SELECT 
            ementasitens.cod_ementa,
            SUM(itens.custo) AS total
        FROM ementasitens
            INNER JOIN itens
            ON ementasitens.cod_item = itens.cod_item
        WHERE ementasitens.cod_ementa = ementas.cod_ementa
        GROUP BY ementasitens.cod_ementa
    ) AS totalementa
    ) AS preco
FROM ementas;

-- Select ementas
CREATE OR REPLACE FUNCTION selectementas()
RETURNS TABLE (cod_ementa VARCHAR(10), cod_tipoementa VARCHAR(10), cod_dataementa VARCHAR(10), cod_tiporefeicao VARCHAR(10), cod_restaurante VARCHAR(10))
LANGUAGE plpgsql
AS $selectementas$
BEGIN

RETURN QUERY
    SELECT *
    FROM getementas;

END
$selectementas$;

-- Select ementa
CREATE OR REPLACE FUNCTION selectementa(VARCHAR(10))
RETURNS TABLE (cod_ementa VARCHAR(10), cod_tipoementa VARCHAR(10), cod_dataementa VARCHAR(10), cod_tiporefeicao VARCHAR(10), cod_restaurante VARCHAR(10))
LANGUAGE plpgsql
AS $selectementa$
BEGIN

RETURN QUERY
    SELECT *
    FROM getementas
    WHERE getementas.cod_ementa = $1;

END
$selectementa$;

-- View Consumos
CREATE OR REPLACE VIEW getconsumos
AS 
SELECT
    consumos.cod_consumo,
    consumos.data_consumo,
    consumos.cod_cliente,
    consumos.cod_funcionario,
    (
        SELECT count(*)
        FROM consumosementas
        WHERE consumos.cod_consumo = consumosementas.cod_consumo
    ) AS n_ementas_consumidas,
    (SELECT preco
    FROM
    (
        SELECT 
            consumosementas.cod_consumo,
            SUM(getementas.preco) AS preco
        FROM consumosementas
            INNER JOIN getementas
            ON consumosementas.cod_ementa = getementas.cod_ementa
        WHERE consumosementas.cod_consumo = consumos.cod_consumo
        GROUP BY consumosementas.cod_consumo
    ) AS totalementa
    ) AS total
FROM consumos;

-- View alergias
CREATE OR REPLACE VIEW getalergias
AS SELECT * FROM alergias;

-- Select alergias
CREATE OR REPLACE FUNCTION selectalergias()
RETURNS TABLE (cod_alergia VARCHAR(10), designacao VARCHAR(256))
LANGUAGE plpgsql
AS $selectalergias$
BEGIN

RETURN QUERY
    SELECT *
    FROM getalergias;

END
$selectalergias$;

-- Select alergia
CREATE OR REPLACE FUNCTION selectalergia(VARCHAR(10))
RETURNS TABLE (cod_alergia VARCHAR(10), designacao VARCHAR(256))
LANGUAGE plpgsql
AS $selectalergia$
BEGIN

RETURN QUERY
    SELECT *
    FROM getalergias
    WHERE getalergias.cod_alergia = $1;

END
$selectalergia$;

-- View ementasitens
CREATE OR REPLACE VIEW getementasitens
AS SELECT * FROM ementasitens;

-- Select ementasitens
CREATE OR REPLACE FUNCTION selectementasitens()
RETURNS TABLE (cod_ementa VARCHAR(10), cod_item VARCHAR(10))
LANGUAGE plpgsql
AS $selectementasitens$
BEGIN

RETURN QUERY
    SELECT *
    FROM getementasitens;

END
$selectementasitens$;

-- Select ementaitem
CREATE OR REPLACE FUNCTION selectementaitem(VARCHAR(10), VARCHAR(10))
RETURNS TABLE (cod_ementa VARCHAR(10), cod_item VARCHAR(10))
LANGUAGE plpgsql
AS $selectementaitem$
BEGIN

RETURN QUERY
    SELECT *
    FROM getementasitens
    WHERE getementasitens.cod_ementa = $1 AND getementasitens.cod_item = $2;

END
$selectementaitem$;

-- View itensalergias
CREATE OR REPLACE VIEW getitensalergias
AS SELECT * FROM itensalergias;

-- Select itensalergias
CREATE OR REPLACE FUNCTION selectitensalergias()
RETURNS TABLE (cod_item VARCHAR(10), cod_alergia VARCHAR(10))
LANGUAGE plpgsql
AS $selectitensalergias$
BEGIN

RETURN QUERY
    SELECT *
    FROM getitensalergias;

END
$selectitensalergias$;

-- Select itemsalergia
CREATE OR REPLACE FUNCTION selectitemalergia(VARCHAR(10), VARCHAR(10))
RETURNS TABLE (cod_item VARCHAR(10), cod_alergia VARCHAR(10))
LANGUAGE plpgsql
AS $selectitemalergia$
BEGIN

RETURN QUERY
    SELECT *
    FROM getitensalergias
    WHERE getitensalergias.cod_item = $1 AND getitensalergias.cod_alergia = $2;

END
$selectitemalergia$;

-- View consumosementas
CREATE OR REPLACE VIEW getconsumosementas
AS SELECT * FROM consumosementas;

-- Select consumosementas
CREATE OR REPLACE FUNCTION selectconsumosementas()
RETURNS TABLE (cod_consumo VARCHAR(10), cod_ementa VARCHAR(10))
LANGUAGE plpgsql
AS $selectconsumosementas$
BEGIN

RETURN QUERY
    SELECT *
    FROM getconsumosementas;

END
$selectconsumosementas$;

-- Select consumoementa
CREATE OR REPLACE FUNCTION selectconsumoementa(VARCHAR(10), VARCHAR(10))
RETURNS TABLE (cod_consumo VARCHAR(10), cod_ementa VARCHAR(10))
LANGUAGE plpgsql
AS $selectconsumoementa$
BEGIN

RETURN QUERY
    SELECT *
    FROM getconsumosementas
    WHERE getconsumosementas.cod_consumo = $1 AND getconsumosementas.cod_consumo = $2;

END
$selectconsumoementa$;
