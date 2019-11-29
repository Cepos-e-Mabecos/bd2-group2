-- Insert Clientes
CREATE OR REPLACE PROCEDURE insertClientes(JSON)
LANGUAGE plpgsql
AS $insertClientes$
DECLARE cod VARCHAR(10) := generate_uid(10);
BEGIN
    INSERT INTO Clientes SELECT cod, nome, nif FROM JSON_POPULATE_RECORD(NULL::Clientes, $1);
END
$insertClientes$;

-- Insert Consumos
CREATE OR REPLACE PROCEDURE insertConsumos(JSON)
LANGUAGE plpgsql
AS $insertConsumos$
DECLARE cod VARCHAR(10) := generate_uid(10);
DECLARE dataConsumo TIMESTAMP := NOW();
BEGIN
    INSERT INTO Consumos SELECT cod, dataConsumo, cod_Cliente FROM JSON_POPULATE_RECORD(NULL::Consumos, $1);
END
$insertConsumos$;

-- Insert Locais
CREATE OR REPLACE PROCEDURE insertLocais(JSON)
LANGUAGE plpgsql
AS $insertLocais$
DECLARE cod VARCHAR(10) := generate_uid(10);
BEGIN
    INSERT INTO Locais SELECT cod, designacao FROM JSON_POPULATE_RECORD(NULL::Locais, $1);
END
$insertLocais$;

-- Insert Restaurantes 
CREATE OR REPLACE PROCEDURE insertRestaurantes(JSON)
LANGUAGE plpgsql
AS $insertRestaurantes$
DECLARE cod VARCHAR(10) := generate_uid(10);
BEGIN
    INSERT INTO Restaurantes SELECT cod, designacao, cod_Local FROM JSON_POPULATE_RECORD(NULL::Restaurantes, $1);
END
$insertRestaurantes$;

-- Insert Funcionarios 
CREATE OR REPLACE PROCEDURE insertFuncionarios(JSON)
LANGUAGE plpgsql
AS $insertFuncionarios$
DECLARE cod VARCHAR(10) := generate_uid(10);
BEGIN
    INSERT INTO Funcionarios SELECT cod, nome, cod_Restaurante FROM JSON_POPULATE_RECORD(NULL::Funcionarios, $1);
END
$insertFuncionarios$;

-- Insert LocaisConsumo 
CREATE OR REPLACE PROCEDURE insertLocaisConsumo(JSON)
LANGUAGE plpgsql
AS $insertLocaisConsumo$
DECLARE cod VARCHAR(10) := generate_uid(10);
BEGIN
    INSERT INTO LocaisConsumo SELECT cod, designacao, cod_Restaurante FROM JSON_POPULATE_RECORD(NULL::LocaisConsumo, $1);
END
$insertLocaisConsumo$;

-- Insert TiposEmenta 
CREATE OR REPLACE PROCEDURE insertTiposEmenta(JSON)
LANGUAGE plpgsql
AS $insertTiposEmenta$
DECLARE cod VARCHAR(10) := generate_uid(10);
BEGIN
    INSERT INTO TiposEmenta SELECT cod, designacao FROM JSON_POPULATE_RECORD(NULL::TiposEmenta, $1);
END
$insertTiposEmenta$;

-- Insert TiposItem 
CREATE OR REPLACE PROCEDURE insertTiposItem(JSON)
LANGUAGE plpgsql
AS $insertTiposItem$
DECLARE cod VARCHAR(10) := generate_uid(10);
BEGIN
    INSERT INTO TiposItem SELECT cod, designacao FROM JSON_POPULATE_RECORD(NULL::TiposItem, $1);
END
$insertTiposItem$;

-- Insert Itens 
CREATE OR REPLACE PROCEDURE insertItens(JSON)
LANGUAGE plpgsql
AS $insertItens$
DECLARE cod VARCHAR(10) := generate_uid(10);
BEGIN
    INSERT INTO Itens SELECT cod, designacao, custo, cod_TipoItem FROM JSON_POPULATE_RECORD(NULL::Itens, $1);
END
$insertItens$;

-- Insert DatasEmenta 
CREATE OR REPLACE PROCEDURE insertDatasEmenta(JSON)
LANGUAGE plpgsql
AS $insertDatasEmenta$
DECLARE cod VARCHAR(10) := generate_uid(10);
BEGIN
    INSERT INTO DatasEmenta SELECT cod, data_Ementa FROM JSON_POPULATE_RECORD(NULL::DatasEmenta, $1);
END
$insertDatasEmenta$;

-- Insert TiposRefeicao 
CREATE OR REPLACE PROCEDURE insertTiposRefeicao(JSON)
LANGUAGE plpgsql
AS $insertTiposRefeicao$
DECLARE cod VARCHAR(10) := generate_uid(10);
BEGIN
    INSERT INTO TiposRefeicao SELECT cod, designacao FROM JSON_POPULATE_RECORD(NULL::TiposRefeicao, $1);
END
$insertTiposRefeicao$;

-- Insert Ementas 
CREATE OR REPLACE PROCEDURE insertEmentas(JSON)
LANGUAGE plpgsql
AS $insertEmentas$
DECLARE cod VARCHAR(10) := generate_uid(10);
BEGIN
    INSERT INTO Ementas SELECT cod, cod_TipoEmenta, cod_DataEmenta, cod_TipoRefeicao, cod_Restaurante FROM JSON_POPULATE_RECORD(NULL::Ementas, $1);
END
$insertEmentas$;

-- Insert Alergias 
CREATE OR REPLACE PROCEDURE insertAlergias(JSON)
LANGUAGE plpgsql
AS $insertAlergias$
DECLARE cod VARCHAR(10) := generate_uid(10);
BEGIN
    INSERT INTO Alergias SELECT cod, designacao FROM JSON_POPULATE_RECORD(NULL::Alergias, $1);
END
$insertAlergias$;

-- Insert EmentasItens 
CREATE OR REPLACE PROCEDURE insertEmentasItens(JSON)
LANGUAGE plpgsql
AS $insertEmentasItens$

BEGIN
    INSERT INTO EmentasItens SELECT cod_Ementa, cod_Item FROM JSON_POPULATE_RECORD(NULL::EmentasItens, $1);
END
$insertEmentasItens$;

-- Insert ItensAlergias 
CREATE OR REPLACE PROCEDURE insertItensAlergias(JSON)
LANGUAGE plpgsql
AS $insertItensAlergias$

BEGIN
    INSERT INTO ItensAlergias SELECT cod_Item, cod_Alergia FROM JSON_POPULATE_RECORD(NULL::ItensAlergias, $1);
END
$insertItensAlergias$;
