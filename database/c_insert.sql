-- Insert Clientes
CREATE OR REPLACE PROCEDURE insertclientes(JSON)
LANGUAGE plpgsql
AS $insertclientes$
DECLARE cod VARCHAR(10) := generate_uid(10);
BEGIN
    INSERT INTO clientes SELECT cod, nome, nif FROM JSON_POPULATE_RECORD(NULL::clientes, $1);
END
$insertclientes$;

-- Insert Consumos
CREATE OR REPLACE PROCEDURE insertconsumos(JSON)
LANGUAGE plpgsql
AS $insertconsumos$
DECLARE cod VARCHAR(10) := generate_uid(10);
DECLARE dataconsumo TIMESTAMP := NOW();
BEGIN
    INSERT INTO consumos SELECT cod, dataconsumo, cod_cliente, cod_funcionario FROM JSON_POPULATE_RECORD(NULL::consumos, $1);
END
$insertconsumos$;

-- Insert Locais
CREATE OR REPLACE PROCEDURE insertlocais(JSON)
LANGUAGE plpgsql
AS $insertlocais$
DECLARE cod VARCHAR(10) := generate_uid(10);
BEGIN
    INSERT INTO locais SELECT cod, designacao FROM JSON_POPULATE_RECORD(NULL::locais, $1);
END
$insertlocais$;

-- Insert Restaurantes 
CREATE OR REPLACE PROCEDURE insertcestaurantes(JSON)
LANGUAGE plpgsql
AS $insertrestaurantes$
DECLARE cod VARCHAR(10) := generate_uid(10);
BEGIN
    INSERT INTO restaurantes SELECT cod, designacao, cod_local FROM JSON_POPULATE_RECORD(NULL::restaurantes, $1);
END
$insertrestaurantes$;

-- Insert Funcionarios 
CREATE OR REPLACE PROCEDURE insertfuncionarios(JSON)
LANGUAGE plpgsql
AS $insertfuncionarios$
DECLARE cod VARCHAR(10) := generate_uid(10);
BEGIN
    INSERT INTO funcionarios SELECT cod, nome, cod_localconsumo FROM JSON_POPULATE_RECORD(NULL::funcionarios, $1);
END
$insertfuncionarios$;

-- Insert LocaisConsumo 
CREATE OR REPLACE PROCEDURE insertlocaisconsumo(JSON)
LANGUAGE plpgsql
AS $insertlocaisconsumo$
DECLARE cod VARCHAR(10) := generate_uid(10);
BEGIN
    INSERT INTO locaisconsumo SELECT cod, designacao, cod_restaurante FROM JSON_POPULATE_RECORD(NULL::locaisconsumo, $1);
END
$insertlocaisconsumo$;

-- Insert TiposEmenta 
CREATE OR REPLACE PROCEDURE inserttiposementa(JSON)
LANGUAGE plpgsql
AS $inserttiposementa$
DECLARE cod VARCHAR(10) := generate_uid(10);
BEGIN
    INSERT INTO tiposementa SELECT cod, designacao FROM JSON_POPULATE_RECORD(NULL::tiposementa, $1);
END
$inserttiposementa$;

-- Insert TiposItem 
CREATE OR REPLACE PROCEDURE inserttipositem(JSON)
LANGUAGE plpgsql
AS $inserttipositem$
DECLARE cod VARCHAR(10) := generate_uid(10);
BEGIN
    INSERT INTO tipositem SELECT cod, designacao FROM JSON_POPULATE_RECORD(NULL::tipositem, $1);
END
$inserttipositem$;

-- Insert Itens 
CREATE OR REPLACE PROCEDURE insertitens(JSON)
LANGUAGE plpgsql
AS $insertitens$
DECLARE cod VARCHAR(10) := generate_uid(10);
BEGIN
    INSERT INTO itens SELECT cod, designacao, custo, cod_tipoitem FROM JSON_POPULATE_RECORD(NULL::itens, $1);
END
$insertitens$;

-- Insert DatasEmenta 
CREATE OR REPLACE PROCEDURE insertdatasementa(JSON)
LANGUAGE plpgsql
AS $insertdatasementa$
DECLARE cod VARCHAR(10) := generate_uid(10);
BEGIN
    INSERT INTO datasementa SELECT cod, data_ementa FROM JSON_POPULATE_RECORD(NULL::datasementa, $1);
END
$insertdatasementa$;

-- Insert TiposRefeicao 
CREATE OR REPLACE PROCEDURE inserttiposrefeicao(JSON)
LANGUAGE plpgsql
AS $inserttiposrefeicao$
DECLARE cod VARCHAR(10) := generate_uid(10);
BEGIN
    INSERT INTO tiposrefeicao SELECT cod, designacao FROM JSON_POPULATE_RECORD(NULL::tiposrefeicao, $1);
END
$inserttiposrefeicao$;

-- Insert Ementas 
CREATE OR REPLACE PROCEDURE insertementas(JSON)
LANGUAGE plpgsql
AS $insertementas$
DECLARE cod VARCHAR(10) := generate_uid(10);
BEGIN
    INSERT INTO ementas SELECT cod, cod_tipoementa, cod_dataementa, cod_tiporefeicao, cod_restaurante FROM JSON_POPULATE_RECORD(NULL::ementas, $1);
END
$insertementas$;

-- Insert Alergias 
CREATE OR REPLACE PROCEDURE insertalergias(JSON)
LANGUAGE plpgsql
AS $insertalergias$
DECLARE cod VARCHAR(10) := generate_uid(10);
BEGIN
    INSERT INTO alergias SELECT cod, designacao FROM JSON_POPULATE_RECORD(NULL::alergias, $1);
END
$insertalergias$;

-- Insert EmentasItens 
CREATE OR REPLACE PROCEDURE insertementasitens(JSON)
LANGUAGE plpgsql
AS $insertementasitens$

BEGIN
    INSERT INTO ementasitens SELECT cod_ementa, cod_item FROM JSON_POPULATE_RECORD(NULL::ementasitens, $1);
END
$insertementasitens$;

-- Insert ItensAlergias 
CREATE OR REPLACE PROCEDURE insertitensalergias(JSON)
LANGUAGE plpgsql
AS $insertitensalergias$

BEGIN
    INSERT INTO itensalergias SELECT cod_item, cod_alergia FROM JSON_POPULATE_RECORD(NULL::itensalergias, $1);
END
$insertitensalergias$;

-- Insert ConsumosEmentas
CREATE OR REPLACE PROCEDURE insertconsumosementas(JSON)
LANGUAGE plpgsql
AS $insertconsumosementas$

BEGIN
    INSERT INTO consumosementas SELECT cod_consumo, cod_ementa FROM JSON_POPULATE_RECORD(NULL::consumosementas, $1);
END
$insertconsumosementas$;
