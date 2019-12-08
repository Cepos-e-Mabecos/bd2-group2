-- Tables creation
CREATE TABLE locais (
  cod_local VARCHAR(10) NOT NULL,
  designacao VARCHAR(256) NOT NULL,
  PRIMARY KEY(cod_local)
);
CREATE TABLE restaurantes (
  cod_restaurante VARCHAR(10) NOT NULL,
  designacao VARCHAR(256) NOT NULL,
  cod_local VARCHAR(10) NOT NULL REFERENCES locais(cod_local) ON DELETE CASCADE,
  PRIMARY KEY(cod_restaurante)
);
CREATE TABLE locaisconsumo (
  cod_localconsumo VARCHAR(10) NOT NULL,
  designacao VARCHAR(256) NOT NULL,
  cod_restaurante VARCHAR(10) NOT NULL REFERENCES restaurantes(cod_restaurante) ON DELETE CASCADE,
  PRIMARY KEY(cod_localconsumo)
);
CREATE TABLE funcionarios (
  cod_funcionario VARCHAR(10) NOT NULL,
  nome VARCHAR(256) NOT NULL,
  cod_localconsumo VARCHAR(10) NOT NULL REFERENCES locaisconsumo(cod_localconsumo) ON DELETE CASCADE,
  PRIMARY KEY(cod_funcionario)
);
CREATE TABLE clientes (
  cod_cliente VARCHAR(10) NOT NULL,
  nome VARCHAR(256) NOT NULL,
  nif VARCHAR(9) NOT NULL,
  PRIMARY KEY(cod_cliente)
);
CREATE TABLE consumos (
  cod_consumo VARCHAR(10) NOT NULL,
  data_consumo TIMESTAMP NOT NULL,
  cod_cliente VARCHAR(10) NOT NULL REFERENCES clientes(cod_cliente) ON DELETE CASCADE,
  cod_funcionario VARCHAR(10) NOT NULL REFERENCES funcionarios(cod_funcionario) ON DELETE CASCADE,
  PRIMARY KEY(cod_consumo)
);
CREATE TABLE alergias (
  cod_alergia VARCHAR(10) NOT NULL,
  designacao VARCHAR(256) NOT NULL,
  PRIMARY KEY(cod_alergia)
);
CREATE TABLE tipositem (
  cod_tipoitem VARCHAR(10) NOT NULL,
  designacao VARCHAR(256) NOT NULL,
  PRIMARY KEY(cod_tipoitem)
);
CREATE TABLE itens (
  cod_item VARCHAR(10) NOT NULL,
  designacao VARCHAR(256) NOT NULL,
  custo MONEY NOT NULL,
  cod_tipoitem VARCHAR(10) NOT NULL REFERENCES tipositem(cod_tipoitem) ON DELETE CASCADE,
  PRIMARY KEY(cod_item)
);
CREATE TABLE itensalergias (
  cod_item VARCHAR(10) NOT NULL REFERENCES itens(cod_item) ON DELETE CASCADE,
  cod_alergia VARCHAR(10) NOT NULL REFERENCES alergias(cod_alergia) ON DELETE CASCADE,
  PRIMARY KEY(cod_item, cod_alergia)
);
CREATE TABLE datasementa (
  cod_dataementa VARCHAR(10) NOT NULL,
  data_ementa TIMESTAMP NOT NULL,
  PRIMARY KEY(cod_dataementa)
);
CREATE TABLE tiposementa (
  cod_tipoementa VARCHAR(10) NOT NULL,
  designacao VARCHAR(256) NOT NULL,
  PRIMARY KEY(cod_tipoementa)
);
CREATE TABLE tiposrefeicao (
  cod_tiporefeicao VARCHAR(10) NOT NULL,
  designacao VARCHAR(256) NOT NULL,
  PRIMARY KEY(cod_tiporefeicao)
);
CREATE TABLE ementas (
  cod_ementa VARCHAR(10) NOT NULL,
  cod_tipoementa VARCHAR(10) NOT NULL REFERENCES tiposementa(cod_tipoementa) ON DELETE CASCADE,
  cod_dataementa VARCHAR(10) NOT NULL REFERENCES datasementa(cod_dataementa) ON DELETE CASCADE,
  cod_tiporefeicao VARCHAR(10) NOT NULL REFERENCES tiposrefeicao(cod_tiporefeicao) ON DELETE CASCADE,
  cod_restaurante VARCHAR(10) NOT NULL REFERENCES restaurantes(cod_restaurante) ON DELETE CASCADE,
  PRIMARY KEY(cod_ementa)
);
CREATE TABLE ementasitens (
  cod_ementa VARCHAR(10) NOT NULL REFERENCES ementas(cod_ementa) ON DELETE CASCADE,
  cod_item VARCHAR(10) NOT NULL REFERENCES itens(cod_item) ON DELETE CASCADE,
  PRIMARY KEY(cod_ementa, cod_item)
);
CREATE TABLE consumosementas (
  cod_consumo VARCHAR(10) NOT NULL REFERENCES consumos(cod_consumo) ON DELETE CASCADE,
  cod_ementa VARCHAR(10) NOT NULL REFERENCES ementas(cod_ementa) ON DELETE CASCADE,
  PRIMARY KEY(cod_consumo, cod_ementa)
);