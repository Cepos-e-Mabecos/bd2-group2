-- Tables creation
CREATE TABLE Clientes (
  cod_Cliente VARCHAR(10) NOT NULL,
  nome VARCHAR(256) NOT NULL,
  nif VARCHAR(10) NOT NULL,
  PRIMARY KEY(cod_Cliente)
);
CREATE TABLE Consumos (
  cod_Consumo VARCHAR(10) NOT NULL,
  data_Consumo TIMESTAMP NOT NULL,
  cod_Cliente VARCHAR(10) NOT NULL REFERENCES Clientes(cod_Cliente) ON DELETE CASCADE,
  PRIMARY KEY(cod_Consumo)
);
CREATE TABLE Locais (
  cod_Local VARCHAR(10) NOT NULL,
  designacao VARCHAR(256) NOT NULL,
  PRIMARY KEY(cod_Local)
);
CREATE TABLE Restaurantes (
  cod_Restaurante VARCHAR(10) NOT NULL,
  designacao VARCHAR(256) NOT NULL,
  cod_Local VARCHAR(10) NOT NULL REFERENCES Locais(cod_Local) ON DELETE CASCADE,
  PRIMARY KEY(cod_Restaurante)
);
CREATE TABLE Funcionarios (
  cod_Funcionario VARCHAR(10) NOT NULL,
  nome VARCHAR(256) NOT NULL,
  cod_Restaurante VARCHAR(10) NOT NULL REFERENCES Restaurantes(cod_Restaurante) ON DELETE CASCADE,
  PRIMARY KEY(cod_Funcionario)
);
CREATE TABLE LocaisConsumo (
  cod_LocalConsumo VARCHAR(10) NOT NULL,
  designacao VARCHAR(256) NOT NULL,
  cod_Restaurante VARCHAR(10) NOT NULL REFERENCES Restaurantes(cod_Restaurante) ON DELETE CASCADE,
  PRIMARY KEY(cod_LocalConsumo)
);
CREATE TABLE TiposEmenta (
  cod_TipoEmenta VARCHAR(10) NOT NULL,
  designacao VARCHAR(256) NOT NULL,
  PRIMARY KEY(cod_TipoEmenta)
);
CREATE TABLE TiposItem (
  cod_TipoItem VARCHAR(10) NOT NULL,
  designacao VARCHAR(256) NOT NULL,
  PRIMARY KEY(cod_TipoItem)
);
CREATE TABLE Itens (
  cod_Item VARCHAR(10) NOT NULL,
  designacao VARCHAR(256) NOT NULL,
  custo MONEY NOT NULL,
  cod_TipoItem VARCHAR(10) NOT NULL REFERENCES TiposItem(cod_TipoItem) ON DELETE CASCADE,
  PRIMARY KEY(cod_Item)
);
CREATE TABLE DatasEmenta (
  cod_DataEmenta VARCHAR(10) NOT NULL,
  data_Ementa TIMESTAMP NOT NULL,
  PRIMARY KEY(cod_DataEmenta)
);
CREATE TABLE TiposRefeicao (
  cod_TipoRefeicao VARCHAR(10) NOT NULL,
  designacao VARCHAR(256) NOT NULL,
  PRIMARY KEY(cod_TipoRefeicao)
);
CREATE TABLE Ementas (
  cod_Ementa VARCHAR(10) NOT NULL,
  cod_TipoEmenta VARCHAR(10) NOT NULL REFERENCES TiposEmenta(cod_TipoEmenta) ON DELETE CASCADE,
  cod_DataEmenta VARCHAR(10) NOT NULL REFERENCES DatasEmenta(cod_DataEmenta) ON DELETE CASCADE,
  cod_TipoRefeicao VARCHAR(10) NOT NULL REFERENCES TiposRefeicao(cod_TipoRefeicao) ON DELETE CASCADE,
  cod_Restaurante VARCHAR(10) NOT NULL REFERENCES Restaurantes(cod_Restaurante) ON DELETE CASCADE,
  PRIMARY KEY(cod_Ementa)
);
CREATE TABLE Alergias (
  cod_Alergia VARCHAR(10) NOT NULL,
  designacao VARCHAR(256) NOT NULL,
  PRIMARY KEY(cod_Alergia)
);
CREATE TABLE EmentasItens (
  cod_Ementa VARCHAR(10) NOT NULL REFERENCES Ementas(cod_Ementa) ON DELETE CASCADE,
  cod_Item VARCHAR(10) NOT NULL REFERENCES Itens(cod_Item) ON DELETE CASCADE,
  PRIMARY KEY(cod_Ementa, cod_Item)
);
CREATE TABLE ItensAlergias (
  cod_Item VARCHAR(10) NOT NULL REFERENCES Itens(cod_Item) ON DELETE CASCADE,
  cod_Alergia VARCHAR(10) NOT NULL REFERENCES Alergias(cod_Alergia) ON DELETE CASCADE,
  PRIMARY KEY(cod_Item, cod_Alergia)
);