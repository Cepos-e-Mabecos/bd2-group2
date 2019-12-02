-- Delete Clientes
CREATE OR REPLACE PROCEDURE deleteClientes(VARCHAR(10))
LANGUAGE plpgsql
AS $deleteClientes$
BEGIN

    DELETE FROM Clientes WHERE cod_Cliente = $1;

END
$deleteClientes$;

-- Delete Consumos
CREATE OR REPLACE PROCEDURE deleteClientes(VARCHAR(10))
LANGUAGE plpgsql
AS $deleteConsumos$
BEGIN

    DELETE FROM Consumos WHERE cod_Consumo = $1;

END
$deleteConsumos$;

-- Delete Locais
CREATE OR REPLACE PROCEDURE deleteLocais(VARCHAR(10))
LANGUAGE plpgsql
AS $deleteLocais$
BEGIN

    DELETE FROM Locais WHERE cod_Local = $1;

END
$deleteLocais$;

-- Delete Restaurantes
CREATE OR REPLACE PROCEDURE deleteRestaurantes(VARCHAR(10))
LANGUAGE plpgsql
AS $deleteRestaurantes$
BEGIN

    DELETE FROM Restaurantes WHERE cod_Restaurante = $1;

END
$deleteRestaurantes$;

-- Delete Funcionarios
CREATE OR REPLACE PROCEDURE deleteFuncionarios(VARCHAR(10))
LANGUAGE plpgsql
AS $deleteFuncionarios$
BEGIN

    DELETE FROM Funcionarios WHERE cod_Funcionario = $1;

END
$deleteFuncionarios$;

-- Delete LocaisConsumo
CREATE OR REPLACE PROCEDURE deleteLocaisConsumo(VARCHAR(10))
LANGUAGE plpgsql
AS $deleteLocaisConsumo$
BEGIN

    DELETE FROM LocaisConsumo WHERE cod_LocalConsumo = $1;

END
$deleteLocaisConsumo$;

-- Delete TiposEmenta
CREATE OR REPLACE PROCEDURE deleteTiposEmenta(VARCHAR(10))
LANGUAGE plpgsql
AS $deleteTiposEmenta$
BEGIN

    DELETE FROM TiposEmenta WHERE cod_TipoEmenta = $1;

END
$deleteTiposEmenta$;

-- Delete TiposItem
CREATE OR REPLACE PROCEDURE deleteTiposItem(VARCHAR(10))
LANGUAGE plpgsql
AS $deleteTiposItem$
BEGIN

    DELETE FROM TiposItem WHERE cod_TipoItem = $1;

END
$deleteTiposItem$;

-- Delete Itens
CREATE OR REPLACE PROCEDURE deleteItens(VARCHAR(10))
LANGUAGE plpgsql
AS $deleteItens$
BEGIN

    DELETE FROM Itens WHERE cod_Item = $1;

END
$deleteItens$;

-- Delete DatasEmenta
CREATE OR REPLACE PROCEDURE deleteDatasEmenta(VARCHAR(10))
LANGUAGE plpgsql
AS $deleteDatasEmenta$
BEGIN

    DELETE FROM DatasEmenta WHERE cod_DataEmenta = $1;

END
$deleteDatasEmenta$;

-- Delete TiposRefeicao
CREATE OR REPLACE PROCEDURE deleteTiposRefeicao(VARCHAR(10))
LANGUAGE plpgsql
AS $deleteTiposRefeicao$
BEGIN

    DELETE FROM TiposRefeicao WHERE cod_TipoRefeicao = $1;

END
$deleteTiposRefeicao$;

-- Delete Ementas
CREATE OR REPLACE PROCEDURE deleteEmentas(VARCHAR(10))
LANGUAGE plpgsql
AS $deleteEmentas$
BEGIN

    DELETE FROM Ementas WHERE cod_Ementa = $1;

END
$deleteEmentas$;

-- Delete Alergias
CREATE OR REPLACE PROCEDURE deleteAlergias(VARCHAR(10))
LANGUAGE plpgsql
AS $deleteAlergias$
BEGIN

    DELETE FROM Alergias WHERE cod_Alergia = $1;

END
$deleteAlergias$;

-- Delete EmentasItens
CREATE OR REPLACE PROCEDURE deleteEmentasItens(VARCHAR(10), VARCHAR(10))
LANGUAGE plpgsql
AS $deleteEmentasItens$
BEGIN

    DELETE FROM EmentasItens WHERE cod_Ementa = $1 AND cod_Item = $1;

END
$deleteEmentasItens$;

-- Delete ItensAlergias
CREATE OR REPLACE PROCEDURE deleteItensAlergias(VARCHAR(10), VARCHAR(10))
LANGUAGE plpgsql
AS $deleteItensAlergias$
BEGIN

    DELETE FROM ItensAlergias WHERE cod_Item = $1 AND cod_Alergia = $2;

END
$deleteItensAlergias$;
