/* Base de Dados 2 - Projeto Final */

-- Tabela Restaurantes
	CREATE TABLE RESTAURANTES(
		cod_restaurante BIGSERIAL PRIMARY KEY NOT NULL,
		cod_local BIGSERIAL NOT NULL REFERENCES LOCAIS(cod_local),
		designacao TEXT NOT NULL
	);

-- Tabela Locais
	CREATE TABLE LOCAIS(
		cod_local BIGSERIAL PRIMARY KEY NOT NULL,
		cod_tipo_local BIGSERIAL NOT NULL REFERENCES TIPO_LOCAL(cod_tipo_local),
		designacao TEXT NOT NULL
	);

-- Tabela Tipo_Local
	CREATE TABLE TIPOS_LOCAIS(
		cod_tipo_local BIGSERIAL PRIMARY KEY NOT NULL,
		designacao TEXT NOT NULL
	);

-- Tabela Funcionarios
	CREATE TABLE FUNCIONARIOS(
		cod_funcionario BIGSERIAL PRIMARY KEY NOT NULL,
		cod_restaurante BIGSERIAL NOT NULL REFERENCES RESTAURANTES(cod_restaurante),
		nome TEXT NOT NULL
	);
	
-- TABELA Locais_Consumo
	CREATE TABLE LOCAIS_CONSUMOS(
		cod_local_consumo BIGSERIAL PRIMARY KEY NOT NULL,
		designacao TEXT NOT NULL,
		cupao VARCHAR(50)
	);
	
-- TABELA Consumo
	CREATE TABLE CONSUMOS(
		cod_consumo BIGSERIAL PRIMARY KEY NOT NULL,
		cod_cliente BIGSERIAL NOT NULL REFERENCES CLIENTES(cod_cliente),
		cod_local_consumo BIGSERIAL NOT NULL REFERENCES LOCAIS_CONSUMO(cod_local_consumo),
		cod_funcionario BIGSERIAL NOT NULL REFERENCES FUNCIONARIOS(cod_funcionario),
		data_consumo DATE NOT NULL
	);

-- TABELA Clientes
	CREATE TABLE CLIENTES(
		cod_cliente BIGSERIAL PRIMARY KEY NOT NULL,
		nome TEXT NOT NULL,
		nif VARCHAR(50)
	);

-- TABELA Ementas
	CREATE TABLE EMENTAS(
		cod_ementa BIGSERIAL PRIMARY KEY NOT NULL,
		cod_tipo_ementa BIGSERIAL NOT NULL REFERENCES TIPO_EMENTA(cod_tipo_ementa),
		cod_restaurante BIGSERIAL NOT NULL REFERENCES EMENTAS(cod_ementa),
		cod_data BIGSERIAL NOT NULL REFERENCES DATAS(cod_data)
	);
	
-- TABELA Tipo_Ementas
	CREATE TABLE TIPOS_EMENTAS(
		cod_tipo_ementa BIGSERIAL PRIMARY KEY NOT NULL,
		designacao TEXT NOT NULL
	);
	
-- TABELA Datas
	CREATE TABLE DATAS(
		cod_data BIGSERIAL PRIMARY KEY NOT NULL,
		hora_dia DATA TIME NOT NULL
	);

-- TABELA Items_Ementas
	CREATE TABLE ITEMS_EMENTAS(
		cod_item BIGSERIAL NOT NULL REFERENCES ITEMS(cod_item),
		cod_ementa BIGSERIAL NOT NULL REFERENCES EMENTAS(cod_ementa),
		PRIMARY KEY(cod_item,cod_ementa)
	);
	
-- TABELA Items
	CREATE TABLE ITEMS(
		cod_item BIGSERIAL PRIMARY KEY NOT NULL,
		cod_tipo_item BIGSERIAL NOT NULL REFERENCES TIPO_ITEM(cod_tipo_item),
		designacao TEXT NOT NULL,
		custo DECIMAL NOT NULL
	);

-- TABELA Tipo_Item
	CREATE TABLE TIPOS_ITEMS(
		cod_tipo_item BIGSERIAL PRIMARY KEY NOT NULL,
		designacao TEXT NOT NULL
	);

-- TABELA Items_Alergias
	CREATE TABLE ITEMS_ALERGIAS(
		cod_item BIGSERIAL NOT NULL REFERENCES ITEMS(cod_item),
		cod_alergia BIGSERIAL NOT NULL REFERENCES ALERGIAS(cod_alergia),
		PRIMARY KEY(cod_alergia,cod_item)
	);

-- TABELA Alergias
	CREATE TABLE ALERGIAS(
		cod_alergia BIGSERIAL PRIMARY KEY NOT NULL,
		sintoma TEXT NOT NULL
	);
	