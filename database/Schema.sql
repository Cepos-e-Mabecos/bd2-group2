-- Tables creation
CREATE TABLE Clientes (
  cod_Cliente VARCHAR(10) NOT NULL,
  nome VARCHAR(256) NOT NULL,
  nif VARCHAR(10) NOT NULL
);
CREATE TABLE Consumos (
  cod_Consumo VARCHAR(10) NOT NULL,
  data_Consumo TIMESTAMP NOT NULL
);
CREATE TABLE Funcionarios (
  cod_Funcionario VARCHAR(10) NOT NULL,
  nome VARCHAR(256) NOT NULL
);
CREATE TABLE LocaisConsumo (
  cod_LocalConsumo VARCHAR(10) NOT NULL,
  designacao VARCHAR(256) NOT NULL
);
CREATE TABLE Restaurantes (
  cod_Restaurante VARCHAR(10) NOT NULL,
  designacao VARCHAR(256) NOT NULL
);
CREATE TABLE Locais (
  cod_Local VARCHAR(10) NOT NULL,
  designacao VARCHAR(256) NOT NULL
);
CREATE TABLE Ementas (cod_Ementa VARCHAR(10) NOT NULL);
CREATE TABLE TiposEmenta (
  cod_TipoEmenta VARCHAR(10) NOT NULL,
  designacao VARCHAR(256) NOT NULL
);
CREATE TABLE Itens (
  cod_Item VARCHAR(10) NOT NULL,
  designacao VARCHAR(256) NOT NULL,
  custo MONEY NOT NULL
);
CREATE TABLE TiposItem (
  cod_TipoItem VARCHAR(10) NOT NULL,
  designacao VARCHAR(256) NOT NULL
);
CREATE TABLE TiposRefeicao (
  cod_TipoRefeicao VARCHAR(10) NOT NULL,
  designacao VARCHAR(256) NOT NULL
);
CREATE TABLE DatasEmenta (
  cod_DataEmenta VARCHAR(10) NOT NULL,
  data_Ementa TIMESTAMP NOT NULL
);
CREATE TABLE Alergias (
  cod_Alergia VARCHAR(10) NOT NULL,
  designacao VARCHAR(256) NOT NULL
);
-- Tables primary keys
ALTER TABLE Clientes
ADD
  PRIMARY KEY (cod_Cliente);
ALTER TABLE Consumos
ADD
  PRIMARY KEY (cod_Consumo);
ALTER TABLE Funcionarios
ADD
  PRIMARY KEY (cod_Funcionario);
ALTER TABLE LocaisConsumo
ADD
  PRIMARY KEY (cod_LocalConsumo);
ALTER TABLE Restaurantes
ADD
  PRIMARY KEY (cod_Restaurante);
ALTER TABLE Locais
ADD
  PRIMARY KEY (cod_Local);
ALTER TABLE Ementas
ADD
  PRIMARY KEY (cod_Ementa);
ALTER TABLE TiposEmenta
ADD
  PRIMARY KEY (cod_TipoEmenta);
ALTER TABLE Itens
ADD
  PRIMARY KEY (cod_Item);
ALTER TABLE TiposItem
ADD
  PRIMARY KEY (cod_TipoItem);
ALTER TABLE TiposRefeicao
ADD
  PRIMARY KEY (cod_TipoRefeicao);
ALTER TABLE DatasEmenta
ADD
  PRIMARY KEY (cod_DataEmenta);
ALTER TABLE Alergias
ADD
  PRIMARY KEY (cod_Alergia);