-- General
INSERT INTO tipositem
VALUES ('iEQzDgtEMw', 'Liquido');

INSERT INTO tipositem
VALUES ('PowJfLXyqQ', 'Solido');

INSERT INTO datasementa
VALUES ('tPirSbDCiw', NOW());

INSERT INTO tiposementa
VALUES ('H1jv3QlW8w', 'Vegetariana');

INSERT INTO tiposementa
VALUES ('QCA6-9vvoA', 'Carne');

INSERT INTO tiposementa
VALUES ('eP9EHVayqA', 'Peixe');

INSERT INTO tiposementa
VALUES ('Bv506M5dQA', 'Dieta');

INSERT INTO tiposementa
VALUES ('4HWoLSl28Q', 'Outro');

INSERT INTO tiposrefeicao
VALUES ('hwHmv0WTNg', 'Pequeno-almoco');

INSERT INTO tiposrefeicao
VALUES ('Z-RHTrpYrw', 'Almoco');

INSERT INTO tiposrefeicao
VALUES ('PBro7fErQQ', 'Jantar');

INSERT INTO tiposrefeicao
VALUES ('vAXxfT8m0Q', 'Outro');

INSERT INTO itens
VALUES ('I0CQCjwbIg', 'Bacalhau', '5.50', 'PowJfLXyqQ');

INSERT INTO itens
VALUES ('9A_BxgYxOA', 'Batatas', '5.50', 'PowJfLXyqQ');

INSERT INTO itens
VALUES ('MpvRqcxeEg', 'Porco', '4.50', 'PowJfLXyqQ');

INSERT INTO itens
VALUES ('RUxjbG4PFg', 'Ovo', '4.50', 'PowJfLXyqQ');

INSERT INTO clientes
VALUES ('_bFWsv-uFg', 'Paulo Tome', '222333222');

INSERT INTO clientes
VALUES ('4DE91p_xZA', 'Pedro Martins', '212444666');

INSERT INTO clientes
VALUES ('9yfwCPeaBA', 'To Cepo', '244256789');

-- Restaurante Breno
INSERT INTO locais
VALUES ('FYFQMPBtFA', 'Viseu');

INSERT INTO restaurantes
VALUES ('gMMd0MtDuw', 'Restaurante do Breno', 'FYFQMPBtFA');

INSERT INTO locaisconsumo
VALUES ('x-ypRN-DpQ', 'Esplanada', 'gMMd0MtDuw');

INSERT INTO locaisconsumo
VALUES ('tMXmBsMYbw', 'Interior', 'gMMd0MtDuw');

INSERT INTO funcionarios
VALUES ('PYYAr9K67g', 'BrenoFuncionario', TRUE, 'x-ypRN-DpQ');

INSERT INTO consumos
VALUES ('tykEWk7L-A', NOW(), '_bFWsv-uFg', 'PYYAr9K67g');

INSERT INTO ementas
VALUES ('M10ViwLFIg', 'QCA6-9vvoA', 'tPirSbDCiw', 'PBro7fErQQ', 'gMMd0MtDuw');

INSERT INTO ementasitens
VALUES ('M10ViwLFIg', 'RUxjbG4PFg');

INSERT INTO ementasitens
VALUES ('M10ViwLFIg', 'MpvRqcxeEg');

INSERT INTO consumosementas
VALUES ('tykEWk7L-A', 'M10ViwLFIg');

-- Restaurante Diogo
INSERT INTO locais
VALUES ('Kz6POjTWkg', 'Lisboa');

INSERT INTO restaurantes
VALUES ('OCrWaO9X7g', 'Restaurante do Diogo', 'Kz6POjTWkg');

INSERT INTO locaisconsumo
VALUES ('EuXSXMdODg', 'Esplanada', 'OCrWaO9X7g');

INSERT INTO locaisconsumo
VALUES ('dKX6DTgg3w', 'Interior', 'OCrWaO9X7g');

INSERT INTO funcionarios
VALUES ('9pOoz97XDQ', 'DiogoFuncionario', TRUE, 'dKX6DTgg3w');