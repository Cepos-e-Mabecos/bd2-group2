-- Delete Clientes
CREATE OR REPLACE PROCEDURE deleteclientes(VARCHAR(10))
LANGUAGE plpgsql
AS $deleteclientes$
BEGIN

    DELETE FROM clientes WHERE cod_cliente = $1;

END
$deleteclientes$;

-- Delete Consumos
CREATE OR REPLACE PROCEDURE deleteconsumos(VARCHAR(10))
LANGUAGE plpgsql
AS $deleteconsumos$
BEGIN

    DELETE FROM consumos WHERE cod_consumo = $1;

END
$deleteconsumos$;

-- Delete Locais
CREATE OR REPLACE PROCEDURE deletelocais(VARCHAR(10))
LANGUAGE plpgsql
AS $deletelocais$
BEGIN

    DELETE FROM locais WHERE cod_local = $1;

END
$deletelocais$;

-- Delete Restaurantes
CREATE OR REPLACE PROCEDURE deleterestaurantes(VARCHAR(10))
LANGUAGE plpgsql
AS $deleterestaurantes$
BEGIN

    DELETE FROM restaurantes WHERE cod_restaurante = $1;

END
$deleterestaurantes$;

-- Delete Funcionarios
CREATE OR REPLACE PROCEDURE deletefuncionarios(VARCHAR(10))
LANGUAGE plpgsql
AS $deletefuncionarios$
BEGIN

    DELETE FROM funcionarios WHERE cod_funcionario = $1;

END
$deletefuncionarios$;

-- Delete LocaisConsumo
CREATE OR REPLACE PROCEDURE deletelocaisconsumo(VARCHAR(10))
LANGUAGE plpgsql
AS $deletelocaisconsumo$
BEGIN

    DELETE FROM locaisconsumo WHERE cod_localconsumo = $1;

END
$deletelocaisconsumo$;

-- Delete TiposEmenta
CREATE OR REPLACE PROCEDURE deletetiposementa(VARCHAR(10))
LANGUAGE plpgsql
AS $deletetiposementa$
BEGIN

    DELETE FROM tiposementa WHERE cod_tipoementa = $1;

END
$deletetiposementa$;

-- Delete TiposItem
CREATE OR REPLACE PROCEDURE deletetipositem(VARCHAR(10))
LANGUAGE plpgsql
AS $deletetipositem$
BEGIN

    DELETE FROM tipositem WHERE cod_tipoitem = $1;

END
$deletetipositem$;

-- Delete Itens
CREATE OR REPLACE PROCEDURE deleteitens(VARCHAR(10))
LANGUAGE plpgsql
AS $deleteitens$
BEGIN

    DELETE FROM itens WHERE cod_item = $1;

END
$deleteitens$;

-- Delete DatasEmenta
CREATE OR REPLACE PROCEDURE deletedatasementa(VARCHAR(10))
LANGUAGE plpgsql
AS $deletedatasementa$
BEGIN

    DELETE FROM datasementa WHERE cod_dataementa = $1;

END
$deletedatasementa$;

-- Delete TiposRefeicao
CREATE OR REPLACE PROCEDURE deletetiposrefeicao(VARCHAR(10))
LANGUAGE plpgsql
AS $deletetiposrefeicao$
BEGIN

    DELETE FROM tiposrefeicao WHERE cod_tiporefeicao = $1;

END
$deletetiposrefeicao$;

-- Delete Ementas
CREATE OR REPLACE PROCEDURE deleteementas(VARCHAR(10))
LANGUAGE plpgsql
AS $deleteementas$
BEGIN

    DELETE FROM ementas WHERE cod_ementa = $1;

END
$deleteementas$;

-- Delete Alergias
CREATE OR REPLACE PROCEDURE deletealergias(VARCHAR(10))
LANGUAGE plpgsql
AS $deletealergias$
BEGIN

    DELETE FROM alergias WHERE cod_alergia = $1;

END
$deletealergias$;

-- Delete EmentasItens
CREATE OR REPLACE PROCEDURE deleteementasitens(VARCHAR(10), VARCHAR(10))
LANGUAGE plpgsql
AS $deleteementasitens$
BEGIN

    DELETE FROM ementasitens WHERE cod_ementa = $1 AND cod_item = $1;

END
$deleteementasitens$;

-- Delete ItensAlergias
CREATE OR REPLACE PROCEDURE deleteitensalergias(VARCHAR(10), VARCHAR(10))
LANGUAGE plpgsql
AS $deleteitensalergias$
BEGIN

    DELETE FROM itensalergias WHERE cod_item = $1 AND cod_alergia = $2;

END
$deleteitensalergias$;

-- Delete ItensAlergias
CREATE OR REPLACE PROCEDURE deleteconsumosementas(VARCHAR(10), VARCHAR(10))
LANGUAGE plpgsql
AS $deleteconsumosementas$
BEGIN

    DELETE FROM consumosementas WHERE cod_consumo = $1 AND cod_ementa = $2;

END
$deleteconsumosementas$;
