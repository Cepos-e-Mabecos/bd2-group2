-- View Clientes
CREATE OR REPLACE VIEW getClientes
AS SELECT * FROM Clientes;

-- Select Clientes
CREATE OR REPLACE FUNCTION selectClientes()
RETURNS TABLE (cod_Cliente VARCHAR(10), nome VARCHAR(256), nif VARCHAR(10))
LANGUAGE plpgsql
AS $selectClientes$
BEGIN

RETURN QUERY
    SELECT *
    FROM getClientes;

END
$selectClientes$;

-- Select Cliente
CREATE OR REPLACE FUNCTION selectCliente(VARCHAR(10))
RETURNS TABLE (cod_Cliente VARCHAR(10), nome VARCHAR(256), nif VARCHAR(10))
LANGUAGE plpgsql
AS $selectCliente$
BEGIN

RETURN QUERY
    SELECT *
    FROM getClientes
    WHERE getClientes.cod_Cliente = $1;

END
$selectCliente$;

-- View Consumos
CREATE OR REPLACE VIEW getConsumos
AS SELECT * FROM Consumos;

-- Select Consumos
CREATE OR REPLACE FUNCTION selectConsumos()
RETURNS TABLE (cod_Consumo VARCHAR(10), data_Consumo TIMESTAMP, cod_Cliente VARCHAR(10))
LANGUAGE plpgsql
AS $selectConsumos$
BEGIN

RETURN QUERY
    SELECT *
    FROM getConsumos;

END
$selectConsumos$;

-- Select Consumo
CREATE OR REPLACE FUNCTION selectConsumo(VARCHAR(10))
RETURNS TABLE (cod_Consumo VARCHAR(10), data_Consumo TIMESTAMP, cod_Cliente VARCHAR(10))
LANGUAGE plpgsql
AS $selectConsumo$
BEGIN

RETURN QUERY
    SELECT *
    FROM getConsumos
    WHERE getConsumos.cod_Consumo = $1;

END
$selectConsumo$;

-- View Locais
CREATE OR REPLACE VIEW getLocais
AS SELECT * FROM Locais;

-- Select Locais
CREATE OR REPLACE FUNCTION selectLocais()
RETURNS TABLE (cod_Local VARCHAR(10), designacao VARCHAR(256))
LANGUAGE plpgsql
AS $selectLocais$
BEGIN

RETURN QUERY
    SELECT *
    FROM getLocais;

END
$selectLocais$;

-- Select Local
CREATE OR REPLACE FUNCTION selectLocal(VARCHAR(10))
RETURNS TABLE (cod_Local VARCHAR(10), designacao VARCHAR(256))
LANGUAGE plpgsql
AS $selectLocal$
BEGIN

RETURN QUERY
    SELECT *
    FROM getLocais
    WHERE getLocais.cod_Local = $1;

END
$selectLocal$;

-- View Restaurantes
CREATE OR REPLACE VIEW getRestaurantes
AS SELECT * FROM Restaurantes;

-- Select Restaurantes
CREATE OR REPLACE FUNCTION selectRestaurantes()
RETURNS TABLE (cod_Restaurante VARCHAR(10), designacao VARCHAR(256), cod_Local VARCHAR(10))
LANGUAGE plpgsql
AS $selectRestaurantes$
BEGIN

RETURN QUERY
    SELECT *
    FROM getRestaurantes;

END
$selectRestaurantes$;

-- Select Restaurante
CREATE OR REPLACE FUNCTION selectRestaurante(VARCHAR(10))
RETURNS TABLE (cod_Restaurante VARCHAR(10), designacao VARCHAR(256), cod_Local VARCHAR(10))
LANGUAGE plpgsql
AS $selectRestaurante$
BEGIN

RETURN QUERY
    SELECT *
    FROM getRestaurantes
    WHERE getRestaurantes.cod_Restaurante = $1;

END
$selectRestaurante$;

-- View LocaisConsumo
CREATE OR REPLACE VIEW getLocaisConsumo
AS SELECT * FROM LocaisConsumo;

-- Select LocaisConsumo
CREATE OR REPLACE FUNCTION selectLocaisConsumo()
RETURNS TABLE (cod_LocalConsumo VARCHAR(10), designacao VARCHAR(256), cod_Restaurante VARCHAR(10))
LANGUAGE plpgsql
AS $selectLocaisConsumo$
BEGIN

RETURN QUERY
    SELECT *
    FROM getLocaisConsumo;

END
$selectLocaisConsumo$;

-- Select LocalConsumo
CREATE OR REPLACE FUNCTION selectLocalConsumo(VARCHAR(10))
RETURNS TABLE (cod_LocalConsumo VARCHAR(10), designacao VARCHAR(256), cod_Restaurante VARCHAR(10))
LANGUAGE plpgsql
AS $selectLocalConsumo$
BEGIN

RETURN QUERY
    SELECT *
    FROM getLocaisConsumo
    WHERE getLocaisConsumo.cod_LocalConsumo = $1;

END
$selectLocalConsumo$;

-- View Funcionarios
CREATE OR REPLACE VIEW getFuncionarios
AS SELECT * FROM Funcionarios;

-- Select Funcionarios
CREATE OR REPLACE FUNCTION selectFuncionarios()
RETURNS TABLE (cod_Funcionario VARCHAR(10), nome VARCHAR(256), cod_Restaurante VARCHAR(10), cod_LocalConsumo VARCHAR(10))
LANGUAGE plpgsql
AS $selectFuncionarios$
BEGIN

RETURN QUERY
    SELECT *
    FROM getFuncionarios;

END
$selectFuncionarios$;

-- Select Funcionario
CREATE OR REPLACE FUNCTION selectFuncionario(VARCHAR(10))
RETURNS TABLE (cod_Funcionario VARCHAR(10), nome VARCHAR(256), cod_Restaurante VARCHAR(10), cod_LocalConsumo VARCHAR(10))
LANGUAGE plpgsql
AS $selectFuncionario$
BEGIN

RETURN QUERY
    SELECT *
    FROM getFuncionarios
    WHERE getFuncionarios.cod_Funcionario = $1;

END
$selectFuncionario$;

-- View TiposEmenta
CREATE OR REPLACE VIEW getTiposEmenta
AS SELECT * FROM TiposEmenta;

-- Select TiposEmenta
CREATE OR REPLACE FUNCTION selectTiposEmenta()
RETURNS TABLE (cod_TipoEmenta VARCHAR(10), designacao VARCHAR(256))
LANGUAGE plpgsql
AS $selectTiposEmenta$
BEGIN

RETURN QUERY
    SELECT *
    FROM getTiposEmenta;

END
$selectTiposEmenta$;

-- Select TipoEmenta
CREATE OR REPLACE FUNCTION selectTipoEmenta(VARCHAR(10))
RETURNS TABLE (cod_TipoEmenta VARCHAR(10), designacao VARCHAR(256))
LANGUAGE plpgsql
AS $selectTipoEmenta$
BEGIN

RETURN QUERY
    SELECT *
    FROM getTiposEmenta
    WHERE getTiposEmenta.cod_TipoEmenta = $1;

END
$selectTipoEmenta$;

-- View TiposItem
CREATE OR REPLACE VIEW getTiposItem
AS SELECT * FROM TiposItem;

-- Select TiposItem
CREATE OR REPLACE FUNCTION selectTiposItem()
RETURNS TABLE (cod_TipoItem VARCHAR(10), designacao VARCHAR(256))
LANGUAGE plpgsql
AS $selectTiposItem$
BEGIN

RETURN QUERY
    SELECT *
    FROM getTiposItem;

END
$selectTiposItem$;

-- Select TipoItem
CREATE OR REPLACE FUNCTION selectTipoItem(VARCHAR(10))
RETURNS TABLE (cod_TipoItem VARCHAR(10), designacao VARCHAR(256))
LANGUAGE plpgsql
AS $selectTipoItem$
BEGIN

RETURN QUERY
    SELECT *
    FROM getTiposItem
    WHERE getTiposItem.cod_TipoItem = $1;

END
$selectTipoItem$;

-- View Itens
CREATE OR REPLACE VIEW getItens
AS SELECT * FROM Itens;

-- Select Itens
CREATE OR REPLACE FUNCTION selectItens()
RETURNS TABLE (cod_Item VARCHAR(10), designacao VARCHAR(256), custo MONEY, cod_TipoItem VARCHAR(10))
LANGUAGE plpgsql
AS $selectItens$
BEGIN

RETURN QUERY
    SELECT *
    FROM getItens;

END
$selectItens$;

-- Select Item
CREATE OR REPLACE FUNCTION selectItem(VARCHAR(10))
RETURNS TABLE (cod_Item VARCHAR(10), designacao VARCHAR(256), custo MONEY, cod_TipoItem VARCHAR(10))
LANGUAGE plpgsql
AS $selectItem$
BEGIN

RETURN QUERY
    SELECT *
    FROM getItens
    WHERE getItens.cod_Item = $1;

END
$selectItem$;

-- View DatasEmenta
CREATE OR REPLACE VIEW getDatasEmenta
AS SELECT * FROM DatasEmenta;

-- Select DatasEmenta
CREATE OR REPLACE FUNCTION selectDatasEmenta()
RETURNS TABLE (cod_DataEmenta VARCHAR(10), data_Ementa TIMESTAMP)
LANGUAGE plpgsql
AS $selectDatasEmenta$
BEGIN

RETURN QUERY
    SELECT *
    FROM getDatasEmenta;

END
$selectDatasEmenta$;

-- Select DataEmenta
CREATE OR REPLACE FUNCTION selectDataEmenta(VARCHAR(10))
RETURNS TABLE (cod_DataEmenta VARCHAR(10), TIMESTAMP)
LANGUAGE plpgsql
AS $selectDataEmenta$
BEGIN

RETURN QUERY
    SELECT *
    FROM getDatasEmenta
    WHERE getDatasEmenta.cod_DataEmenta = $1;

END
$selectDataEmenta$;

-- View TiposRefeicao
CREATE OR REPLACE VIEW getTiposRefeicao
AS SELECT * FROM TiposRefeicao;

-- Select TiposRefeicao
CREATE OR REPLACE FUNCTION selectTiposRefeicao()
RETURNS TABLE (cod_TipoRefeicao VARCHAR(10), designacao VARCHAR(256))
LANGUAGE plpgsql
AS $selectTiposRefeicao$
BEGIN

RETURN QUERY
    SELECT *
    FROM getTiposRefeicao;

END
$selectTiposRefeicao$;

-- Select TipoRefeicao
CREATE OR REPLACE FUNCTION selectTipoRefeicao(VARCHAR(10))
RETURNS TABLE (cod_TipoRefeicao VARCHAR(10), designacao VARCHAR(256))
LANGUAGE plpgsql
AS $selectTipoRefeicao$
BEGIN

RETURN QUERY
    SELECT *
    FROM getTiposRefeicao
    WHERE getTiposRefeicao.cod_TipoRefeicao = $1;

END
$selectTipoRefeicao$;

-- View Ementas
CREATE OR REPLACE VIEW getEmentas
AS SELECT * FROM Ementas;

-- Select Ementas
CREATE OR REPLACE FUNCTION selectEmentas()
RETURNS TABLE (cod_Ementa VARCHAR(10), cod_TipoEmenta VARCHAR(10), cod_DataEmenta VARCHAR(10), cod_TipoRefeicao VARCHAR(10), cod_Restaurante VARCHAR(10))
LANGUAGE plpgsql
AS $selectEmentas$
BEGIN

RETURN QUERY
    SELECT *
    FROM getEmentas;

END
$selectEmentas$;

-- Select Ementas
CREATE OR REPLACE FUNCTION selectEmenta(VARCHAR(10))
RETURNS TABLE (cod_Ementa VARCHAR(10), cod_TipoEmenta VARCHAR(10), cod_DataEmenta VARCHAR(10), cod_TipoRefeicao VARCHAR(10), cod_Restaurante VARCHAR(10))
LANGUAGE plpgsql
AS $selectEmenta$
BEGIN

RETURN QUERY
    SELECT *
    FROM getEmentas
    WHERE getEmentas.cod_Ementa = $1;

END
$selectEmenta$;

-- View Alergias
CREATE OR REPLACE VIEW getAlergias
AS SELECT * FROM Alergias;

-- Select Alergias
CREATE OR REPLACE FUNCTION selectAlergias()
RETURNS TABLE (cod_Alergia VARCHAR(10), designacao VARCHAR(256))
LANGUAGE plpgsql
AS $selectAlergias$
BEGIN

RETURN QUERY
    SELECT *
    FROM getAlergias;

END
$selectAlergias$;

-- Select Alergia
CREATE OR REPLACE FUNCTION selectAlergia(VARCHAR(10))
RETURNS TABLE (cod_Alergia VARCHAR(10), designacao VARCHAR(256))
LANGUAGE plpgsql
AS $selectAlergia$
BEGIN

RETURN QUERY
    SELECT *
    FROM getAlergias
    WHERE getAlergias.cod_Alergia = $1;

END
$selectAlergia$;

-- View EmentasItens
CREATE OR REPLACE VIEW getEmentasItens
AS SELECT * FROM EmentasItens;

-- Select EmentasItens
CREATE OR REPLACE FUNCTION selectEmentasItens()
RETURNS TABLE (cod_Ementa VARCHAR(10), cod_Item VARCHAR(10))
LANGUAGE plpgsql
AS $selectAlergias$
BEGIN

RETURN QUERY
    SELECT *
    FROM getEmentasItens;

END
$selectEmentasItens$;

-- Select EmentaItem
CREATE OR REPLACE FUNCTION selectEmentaItem(VARCHAR(10), VARCHAR(10))
RETURNS TABLE (cod_Ementa VARCHAR(10), cod_Item VARCHAR(10))
LANGUAGE plpgsql
AS $selectEmentaItem$
BEGIN

RETURN QUERY
    SELECT *
    FROM getEmentasItens
    WHERE getEmentasItens.cod_Ementa = $1 AND getEmentasItens.cod_Item = $2;

END
$selectEmentaItem$;

-- View ItensAlergias
CREATE OR REPLACE VIEW getItensAlergias
AS SELECT * FROM ItensAlergias;

-- Select ItensAlergias
CREATE OR REPLACE FUNCTION selectItensAlergias()
RETURNS TABLE (cod_Item VARCHAR(10), cod_Alergia VARCHAR(10))
LANGUAGE plpgsql
AS $selectItensAlergias$
BEGIN

RETURN QUERY
    SELECT *
    FROM getItensAlergias;

END
$selectItensAlergias$;

-- Select ItemAlergia
CREATE OR REPLACE FUNCTION selectItemAlergia(VARCHAR(10), VARCHAR(10))
RETURNS TABLE (cod_Item VARCHAR(10), cod_Alergia VARCHAR(10))
LANGUAGE plpgsql
AS $selectItemAlergia$
BEGIN

RETURN QUERY
    SELECT *
    FROM getItensAlergias
    WHERE getItensAlergias.cod_Item = $1 AND getItensAlergias.cod_Alergia = $2;

END
$selectItensAlergias$;
