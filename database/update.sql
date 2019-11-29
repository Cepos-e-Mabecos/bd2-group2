-- Update Clientes
CREATE OR REPLACE PROCEDURE updateClientes(VARCHAR(10), JSON)
LANGUAGE plpgsql
AS $updateClientes$
BEGIN

    UPDATE Clientes SET (nome, nif) = (SELECT nome, nif FROM JSON_POPULATE_RECORD(NULL::Clientes,$2)) WHERE cod_Cliente = $1;

END
$updateClientes$;

-- Update Consumos
CREATE OR REPLACE PROCEDURE updateConsumos(VARCHAR(10), JSON)
LANGUAGE plpgsql
AS $updateConsumos$
BEGIN

    UPDATE Consumos SET (data_Consumo, cod_Cliente) = (SELECT dataConsumo, cod_Cliente FROM JSON_POPULATE_RECORD(NULL::Consumos,$2)) WHERE cod_Consumo = $1;

END
$updateConsumos$;

-- Update Locais
CREATE OR REPLACE PROCEDURE updateLocais(VARCHAR(10), JSON)
LANGUAGE plpgsql
AS $updateLocais$
BEGIN

    UPDATE Locais SET (designacao) = (SELECT designacao FROM JSON_POPULATE_RECORD(NULL::Locais,$2)) WHERE cod_Local = $1;

END
$updateLocais$;

-- Update Restaurantes
CREATE OR REPLACE PROCEDURE updateRestaurantes(VARCHAR(10), JSON)
LANGUAGE plpgsql
AS $updateRestaurantes$
BEGIN

    UPDATE Restaurantes SET (designacao, cod_Local) = (SELECT designacao, cod_Local FROM JSON_POPULATE_RECORD(NULL::Restaurantes,$2)) WHERE cod_Restaurante = $1;

END
$updateRestaurantes$;

-- Update Funcionarios
CREATE OR REPLACE PROCEDURE updateFuncionarios(VARCHAR(10), JSON)
LANGUAGE plpgsql
AS $updateFuncionarios$
BEGIN

    UPDATE Funcionarios SET (nome, cod_Restaurante) = (SELECT nome, cod_Restaurante FROM JSON_POPULATE_RECORD(NULL::Funcionarios,$2)) WHERE cod_Funcionario = $1;

END
$updateFuncionarios$;

-- Update LocaisConsumo
CREATE OR REPLACE PROCEDURE updateLocaisConsumo(VARCHAR(10), JSON)
LANGUAGE plpgsql
AS $updateLocaisConsumo$
BEGIN

    UPDATE LocaisConsumo SET (designacao, cod_Restaurante) = (SELECT designacao, cod_Restaurante FROM JSON_POPULATE_RECORD(NULL::LocaisConsumo,$2)) WHERE cod_LocalConsumo = $1;

END
$updateLocaisConsumo$;

-- Update TiposEmenta
CREATE OR REPLACE PROCEDURE updateTiposEmenta(VARCHAR(10), JSON)
LANGUAGE plpgsql
AS $updateTiposEmenta$
BEGIN

    UPDATE TiposEmenta SET (designacao) = (SELECT designacao FROM JSON_POPULATE_RECORD(NULL::TiposEmenta,$2)) WHERE cod_TipoEmenta = $1;

END
$updateTiposEmenta$;

-- Update TiposItem
CREATE OR REPLACE PROCEDURE updateTiposItem(VARCHAR(10), JSON)
LANGUAGE plpgsql
AS $updateTiposItem$
BEGIN

    UPDATE TiposItem SET (designacao) = (SELECT designacao FROM JSON_POPULATE_RECORD(NULL::TiposItem,$2)) WHERE cod_TipoItem = $1;

END
$updateTiposItem$;

-- Update Itens
CREATE OR REPLACE PROCEDURE updateItens(VARCHAR(10), JSON)
LANGUAGE plpgsql
AS $updateItens$
BEGIN

    UPDATE Itens SET (designacao, custo, cod_TipoItem) = (SELECT designacao, custo, cod_TipoItem FROM JSON_POPULATE_RECORD(NULL::Itens,$2)) WHERE cod_Item = $1;

END
$updateItens$;

-- Update DatasEmenta
CREATE OR REPLACE PROCEDURE updateDatasEmenta(VARCHAR(10), JSON)
LANGUAGE plpgsql
AS $updateDatasEmenta$
BEGIN

    UPDATE DatasEmenta SET (data_Ementa) = (SELECT data_Ementa FROM JSON_POPULATE_RECORD(NULL::DatasEmenta,$2)) WHERE cod_DataEmenta = $1;

END
$updateDatasEmenta$;

-- Update TiposRefeicao
CREATE OR REPLACE PROCEDURE updateTiposRefeicao(VARCHAR(10), JSON)
LANGUAGE plpgsql
AS $updateTiposRefeicao$
BEGIN

    UPDATE TiposRefeicao SET (designacao) = (SELECT designacao FROM JSON_POPULATE_RECORD(NULL::TiposRefeicao,$2)) WHERE cod_TipoRefeicao = $1;

END
$updateDatasEmenta$;

-- Update Ementas
CREATE OR REPLACE PROCEDURE updateEmentas(VARCHAR(10), JSON)
LANGUAGE plpgsql
AS $updateEmentas$
BEGIN

    UPDATE Ementas SET (cod_TipoEmenta, cod_DataEmenta, cod_TipoRefeicao, cod_Restaurante) = (SELECT cod_TipoEmenta, cod_DataEmenta, cod_TipoRefeicao, cod_Restaurante FROM JSON_POPULATE_RECORD(NULL::Ementas,$2)) WHERE cod_Ementa = $1;

END
$updateEmentas$;

-- Update Alergias
CREATE OR REPLACE PROCEDURE updateAlergias(VARCHAR(10), JSON)
LANGUAGE plpgsql
AS $updateAlergias$
BEGIN

    UPDATE Alergias SET (designacao) = (SELECT designacao FROM JSON_POPULATE_RECORD(NULL::Alergias,$2)) WHERE cod_Alergia = $1;

END
$updateAlergias$;

-- Update EmentasItens
CREATE OR REPLACE PROCEDURE updateEmentasItens(VARCHAR(10), VARCHAR(10), JSON)
LANGUAGE plpgsql
AS $updateEmentasItens$
BEGIN

    UPDATE EmentasItens SET (cod_Ementa, cod_Item) = (SELECT cod_Ementa, cod_Item FROM JSON_POPULATE_RECORD(NULL::EmentasItens,$3)) WHERE cod_Alergia = $1 AND cod_Item = $2;

END
$updateEmentasItens$;

-- Update ItensAlergias
CREATE OR REPLACE PROCEDURE updateItensAlergias(VARCHAR(10), VARCHAR(10), JSON)
LANGUAGE plpgsql
AS $updateItensAlergias$
BEGIN

    UPDATE ItensAlergias SET (cod_Item, cod_Alergia) = (SELECT cod_Item, cod_Alergia FROM JSON_POPULATE_RECORD(NULL::ItensAlergias,$3)) WHERE cod_Item = $1 AND cod_Alergia = $2;

END
$updateEmentasItens$;
