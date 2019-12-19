-- Update clientes
CREATE OR REPLACE PROCEDURE updateclientes(VARCHAR(10), JSON)
LANGUAGE plpgsql
AS $updateclientes$
BEGIN

    UPDATE clientes SET (nome, nif) = (SELECT nome, nif FROM JSON_POPULATE_RECORD(NULL::clientes,$2)) WHERE cod_cliente = $1;

END
$updateclientes$;

-- Update consumos
CREATE OR REPLACE PROCEDURE updateconsumos(VARCHAR(10), JSON)
LANGUAGE plpgsql
AS $updateconsumos$
BEGIN

    UPDATE consumos SET (data_consumo, cod_cliente, cod_funcionario) = (SELECT data_consumo, cod_cliente, cod_funcionario FROM JSON_POPULATE_RECORD(NULL::consumos,$2)) WHERE cod_consumo = $1;

END
$updateconsumos$;

-- Update locais
CREATE OR REPLACE PROCEDURE updatelocais(VARCHAR(10), JSON)
LANGUAGE plpgsql
AS $updatelocais$
BEGIN

    UPDATE locais SET (designacao) = (SELECT designacao FROM JSON_POPULATE_RECORD(NULL::locais,$2)) WHERE cod_local = $1;

END
$updatelocais$;

-- Update restaurantes
CREATE OR REPLACE PROCEDURE updaterestaurantes(VARCHAR(10), JSON)
LANGUAGE plpgsql
AS $updaterestaurantes$
BEGIN

    UPDATE restaurantes SET (designacao, cod_local) = (SELECT designacao, cod_local FROM JSON_POPULATE_RECORD(NULL::restaurantes,$2)) WHERE cod_restaurante = $1;

END
$updaterestaurantes$;

-- Update funcionarios
CREATE OR REPLACE PROCEDURE updatefuncionarios(VARCHAR(10), JSON)
LANGUAGE plpgsql
AS $updatefuncionarios$
BEGIN

    UPDATE funcionarios SET (nome, cod_localconsumo) = (SELECT nome, cod_localconsumo FROM JSON_POPULATE_RECORD(NULL::funcionarios,$2)) WHERE cod_funcionario = $1;

END
$updatefuncionarios$;

-- Update locaisconsumo
CREATE OR REPLACE PROCEDURE updatelocaisconsumo(VARCHAR(10), JSON)
LANGUAGE plpgsql
AS $updatelocaisconsumo$
BEGIN

    UPDATE locaisconsumo SET (designacao, cod_restaurante) = (SELECT designacao, cod_restaurante FROM JSON_POPULATE_RECORD(NULL::locaisconsumo,$2)) WHERE cod_localconsumo = $1;

END
$updatelocaisconsumo$;

-- Update tiposementa
CREATE OR REPLACE PROCEDURE updatetiposementa(VARCHAR(10), JSON)
LANGUAGE plpgsql
AS $updatetiposementa$
BEGIN

    UPDATE tiposementa SET (designacao) = (SELECT designacao FROM JSON_POPULATE_RECORD(NULL::tiposementa,$2)) WHERE cod_tipoementa = $1;

END
$updatetiposementa$;

-- Update tipositem
CREATE OR REPLACE PROCEDURE updatetipositem(VARCHAR(10), JSON)
LANGUAGE plpgsql
AS $updatetipositem$
BEGIN

    UPDATE tipositem SET (designacao) = (SELECT designacao FROM JSON_POPULATE_RECORD(NULL::tipositem,$2)) WHERE cod_tipoitem = $1;

END
$updatetipositem$;

-- Update itens
CREATE OR REPLACE PROCEDURE updateitens(VARCHAR(10), JSON)
LANGUAGE plpgsql
AS $updateitens$
BEGIN

    UPDATE itens SET (designacao, custo, cod_tipoitem) = (SELECT designacao, custo, cod_tipoitem FROM JSON_POPULATE_RECORD(NULL::itens,$2)) WHERE cod_item = $1;

END
$updateitens$;

-- Update datasementa
CREATE OR REPLACE PROCEDURE updatedatasementa(VARCHAR(10), JSON)
LANGUAGE plpgsql
AS $updatedatasementa$
BEGIN

    UPDATE datasementa SET (data_ementa) = (SELECT data_ementa FROM JSON_POPULATE_RECORD(NULL::datasementa,$2)) WHERE cod_dataementa = $1;

END
$updatedatasementa$;

-- Update tiposrefeicao
CREATE OR REPLACE PROCEDURE updatetiposrefeicao(VARCHAR(10), JSON)
LANGUAGE plpgsql
AS $updatetiposrefeicao$
BEGIN

    UPDATE tiposrefeicao SET (designacao) = (SELECT designacao FROM JSON_POPULATE_RECORD(NULL::tiposrefeicao,$2)) WHERE cod_tiporefeicao = $1;

END
$updatetiposrefeicao$;

-- Update ementas
CREATE OR REPLACE PROCEDURE updateementas(VARCHAR(10), JSON)
LANGUAGE plpgsql
AS $updateementas$
BEGIN

    UPDATE ementas SET (cod_tipoementa, cod_dataementa, cod_tiporefeicao, cod_restaurante) = (SELECT cod_tipoementa, cod_dataementa, cod_tiporefeicao, cod_restaurante FROM JSON_POPULATE_RECORD(NULL::ementas,$2)) WHERE cod_ementa = $1;

END
$updateementas$;

-- Update alergias
CREATE OR REPLACE PROCEDURE updatealergias(VARCHAR(10), JSON)
LANGUAGE plpgsql
AS $updatealergias$
BEGIN

    UPDATE alergias SET (designacao) = (SELECT designacao FROM JSON_POPULATE_RECORD(NULL::alergias,$2)) WHERE cod_alergia = $1;

END
$updatealergias$;

-- Update ementasitens
CREATE OR REPLACE PROCEDURE updateementasitens(VARCHAR(10), VARCHAR(10), JSON)
LANGUAGE plpgsql
AS $updateementasitens$
BEGIN

    UPDATE ementasitens SET (cod_ementa, cod_item) = (SELECT cod_ementa, cod_item FROM JSON_POPULATE_RECORD(NULL::ementasitens,$3)) WHERE cod_alergia = $1 AND cod_item = $2;

END
$updateementasitens$;

-- Update itensalergias
CREATE OR REPLACE PROCEDURE updateitensalergias(VARCHAR(10), VARCHAR(10), JSON)
LANGUAGE plpgsql
AS $updateitensalergias$
BEGIN

    UPDATE itensalergias SET (cod_item, cod_alergia) = (SELECT cod_item, cod_alergia FROM JSON_POPULATE_RECORD(NULL::itensalergias,$3)) WHERE cod_item = $1 AND cod_alergia = $2;

END
$updateitensalergias$;

-- Update consumosementas
CREATE OR REPLACE PROCEDURE updateconsumosementas(VARCHAR(10), VARCHAR(10), JSON)
LANGUAGE plpgsql
AS $updateconsumosementas$
BEGIN

    UPDATE consumosementas SET (cod_consumo, cod_ementa) = (SELECT cod_consumo, cod_ementa FROM JSON_POPULATE_RECORD(NULL::consumosementas,$3)) WHERE cod_consumo = $1 AND cod_ementa = $2;

END
$updateconsumosementas$;
