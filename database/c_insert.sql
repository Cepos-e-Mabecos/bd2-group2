-- Insert Clientes
CREATE OR REPLACE FUNCTION insertclientes(JSON)
RETURNS TABLE (cod_cliente VARCHAR(10), nome VARCHAR(256), nif VARCHAR(9))
LANGUAGE plpgsql
AS $insertclientes$
DECLARE _cod_cliente VARCHAR(10) := generate_uid(10);
BEGIN    
    INSERT INTO clientes
    SELECT _cod_cliente, JSON_POPULATE_RECORD.nome, JSON_POPULATE_RECORD.nif
    FROM JSON_POPULATE_RECORD(NULL::clientes, $1);
    
    RETURN QUERY
        SELECT *
        FROM clientes
        WHERE clientes.cod_cliente = _cod_cliente;
END
$insertclientes$;

-- Insert Consumos
CREATE OR REPLACE FUNCTION insertconsumos(JSON)
RETURNS TABLE (cod_consumo VARCHAR(10), data_consumo TIMESTAMP, cod_cliente VARCHAR(10), cod_funcionario VARCHAR(10))
LANGUAGE plpgsql
AS $insertconsumos$
DECLARE _cod_consumo VARCHAR(10) := generate_uid(10);
DECLARE _data_consumo TIMESTAMP := NOW();
BEGIN
    INSERT INTO consumos
    SELECT _cod_consumo, _data_consumo, JSON_POPULATE_RECORD.cod_cliente, JSON_POPULATE_RECORD.cod_funcionario
    FROM JSON_POPULATE_RECORD(NULL::consumos, $1);

    RETURN QUERY
        SELECT *
        FROM consumos
        WHERE consumos.cod_consumo = _cod_consumo;
END
$insertconsumos$;

-- Insert Locais
CREATE OR REPLACE FUNCTION insertlocais(JSON)
RETURNS TABLE (cod_local VARCHAR(10), designacao VARCHAR(256))
LANGUAGE plpgsql
AS $insertlocais$
DECLARE _cod_local VARCHAR(10) := generate_uid(10);
BEGIN
    INSERT INTO locais
    SELECT _cod_local, JSON_POPULATE_RECORD.designacao
    FROM JSON_POPULATE_RECORD(NULL::locais, $1);

    RETURN QUERY
        SELECT *
        FROM locais
        WHERE locais.cod_local = _cod_local;
END
$insertlocais$;

-- Insert Restaurantes 
CREATE OR REPLACE FUNCTION insertrestaurantes(JSON)
RETURNS TABLE (cod_restaurante VARCHAR(10), designacao VARCHAR(256), cod_local VARCHAR(10))
LANGUAGE plpgsql
AS $insertrestaurantes$
DECLARE _cod_restaurante VARCHAR(10) := generate_uid(10);
BEGIN
    INSERT INTO restaurantes
    SELECT _cod_restaurante, JSON_POPULATE_RECORD.designacao, JSON_POPULATE_RECORD.cod_local
    FROM JSON_POPULATE_RECORD(NULL::restaurantes, $1);

    RETURN QUERY
        SELECT *
        FROM restaurantes
        WHERE restaurantes.cod_restaurante = _cod_restaurante;
END
$insertrestaurantes$;

-- Insert Funcionarios 
CREATE OR REPLACE FUNCTION insertfuncionarios(JSON)
RETURNS TABLE (cod_funcionario VARCHAR(10), nome VARCHAR(256), cod_localconsumo VARCHAR(10), ativo BOOLEAN)
LANGUAGE plpgsql
AS $insertfuncionarios$
DECLARE _cod_funcionario VARCHAR(10) := generate_uid(10);
BEGIN
    INSERT INTO funcionarios
    SELECT _cod_funcionario, JSON_POPULATE_RECORD.nome, JSON_POPULATE_RECORD.cod_localconsumo
    FROM JSON_POPULATE_RECORD(NULL::funcionarios, $1);

    RETURN QUERY
        SELECT *
        FROM funcionarios
        WHERE funcionarios.cod_funcionario = _cod_funcionario;
END
$insertfuncionarios$;

-- Insert LocaisConsumo 
CREATE OR REPLACE FUNCTION insertlocaisconsumo(JSON)
RETURNS TABLE (cod_localconsumo VARCHAR(10), designacao VARCHAR(256), cod_restaurante VARCHAR(10))
LANGUAGE plpgsql
AS $insertlocaisconsumo$
DECLARE _cod_localconsumo VARCHAR(10) := generate_uid(10);
BEGIN
    INSERT INTO locaisconsumo
    SELECT _cod_localconsumo, JSON_POPULATE_RECORD.designacao, JSON_POPULATE_RECORD.cod_restaurante
    FROM JSON_POPULATE_RECORD(NULL::locaisconsumo, $1);

    RETURN QUERY
        SELECT *
        FROM locaisconsumo
        WHERE locaisconsumo.cod_localconsumo = _cod_localconsumo;
END
$insertlocaisconsumo$;

-- Insert TiposEmenta 
CREATE OR REPLACE FUNCTION inserttiposementa(JSON)
RETURNS TABLE (cod_tipoementa VARCHAR(10), designacao VARCHAR(256))
LANGUAGE plpgsql
AS $inserttiposementa$
DECLARE _cod_tipoementa VARCHAR(10) := generate_uid(10);
BEGIN
    INSERT INTO tiposementa
    SELECT _cod_tipoementa, JSON_POPULATE_RECORD.designacao
    FROM JSON_POPULATE_RECORD(NULL::tiposementa, $1);

    RETURN QUERY
        SELECT *
        FROM tiposementa
        WHERE tiposementa.cod_tipoementa = _cod_tipoementa;
END
$inserttiposementa$;

-- Insert TiposItem 
CREATE OR REPLACE FUNCTION inserttipositem(JSON)
RETURNS TABLE (cod_tipoitem VARCHAR(10), designacao VARCHAR(256))
LANGUAGE plpgsql
AS $inserttipositem$
DECLARE _cod_tipoitem VARCHAR(10) := generate_uid(10);
BEGIN
    INSERT INTO tipositem
    SELECT _cod_tipoitem, JSON_POPULATE_RECORD.designacao
    FROM JSON_POPULATE_RECORD(NULL::tipositem, $1);

    RETURN QUERY
        SELECT *
        FROM tipositem
        WHERE tipositem.cod_tipoitem = _cod_tipoitem;
END
$inserttipositem$;

-- Insert Itens 
CREATE OR REPLACE FUNCTION insertitens(JSON)
RETURNS TABLE (cod_item VARCHAR(10), designacao VARCHAR(256), custo MONEY, cod_tipoitem VARCHAR(10))
LANGUAGE plpgsql
AS $insertitens$
DECLARE _cod_item VARCHAR(10) := generate_uid(10);
BEGIN
    INSERT INTO itens
    SELECT _cod_item, JSON_POPULATE_RECORD.designacao, JSON_POPULATE_RECORD.custo, JSON_POPULATE_RECORD.cod_tipoitem
    FROM JSON_POPULATE_RECORD(NULL::itens, $1);

    RETURN QUERY
        SELECT *
        FROM itens
        WHERE itens.cod_item = _cod_item;
END
$insertitens$;

-- Insert DatasEmenta 
CREATE OR REPLACE FUNCTION insertdatasementa(JSON)
RETURNS TABLE (cod_dataementa VARCHAR(10), data_ementa TIMESTAMP)
LANGUAGE plpgsql
AS $insertdatasementa$
DECLARE _cod_dataementa VARCHAR(10) := generate_uid(10);
BEGIN
    INSERT INTO datasementa
    SELECT _cod_dataementa, JSON_POPULATE_RECORD.data_ementa
    FROM JSON_POPULATE_RECORD(NULL::datasementa, $1);

    RETURN QUERY
        SELECT *
        FROM datasementa
        WHERE datasementa.cod_dataementa = _cod_dataementa;
END
$insertdatasementa$;

-- Insert TiposRefeicao 
CREATE OR REPLACE FUNCTION inserttiposrefeicao(JSON)
RETURNS TABLE (cod_tiporefeicao VARCHAR(10), designacao VARCHAR(256))
LANGUAGE plpgsql
AS $inserttiposrefeicao$
DECLARE _cod_tiporefeicao VARCHAR(10) := generate_uid(10);
BEGIN
    INSERT INTO tiposrefeicao
    SELECT _cod_tiporefeicao, JSON_POPULATE_RECORD.designacao
    FROM JSON_POPULATE_RECORD(NULL::tiposrefeicao, $1);

    RETURN QUERY
        SELECT *
        FROM tiposrefeicao
        WHERE tiposrefeicao.cod_tiporefeicao = _cod_tiporefeicao;
END
$inserttiposrefeicao$;

-- Insert Ementas 
CREATE OR REPLACE FUNCTION insertementas(JSON)
RETURNS TABLE (cod_ementa VARCHAR(10), cod_tipoementa VARCHAR(10), cod_dataementa VARCHAR(10), cod_tiporefeicao VARCHAR(10), cod_restaurante VARCHAR(10))
LANGUAGE plpgsql
AS $insertementas$
DECLARE _cod_ementa VARCHAR(10) := generate_uid(10);
BEGIN
    INSERT INTO ementas
    SELECT _cod_ementa, JSON_POPULATE_RECORD.cod_tipoementa, JSON_POPULATE_RECORD.cod_dataementa, JSON_POPULATE_RECORD.cod_tiporefeicao, JSON_POPULATE_RECORD.cod_restaurante
    FROM JSON_POPULATE_RECORD(NULL::ementas, $1);
    
    RETURN QUERY
        SELECT *
        FROM ementas
        WHERE ementas.cod_ementa = _cod_ementa;
END
$insertementas$;

-- Insert Alergias 
CREATE OR REPLACE FUNCTION insertalergias(JSON)
RETURNS TABLE (cod_alergia VARCHAR(10), designacao VARCHAR(256))
LANGUAGE plpgsql
AS $insertalergias$
DECLARE _cod_alergia VARCHAR(10) := generate_uid(10);
BEGIN
    INSERT INTO alergias
    SELECT _cod_alergia, JSON_POPULATE_RECORD.designacao
    FROM JSON_POPULATE_RECORD(NULL::alergias, $1);

    RETURN QUERY
        SELECT *
        FROM alergias
        WHERE alergias.cod_alergia = _cod_alergia;
END
$insertalergias$;