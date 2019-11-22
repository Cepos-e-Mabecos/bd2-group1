/* Base de Dados 2 - Projeto Final */

-- Tabela Restaurantes
	CREATE TABLE RESTAURANTES(
		cod_restaurante INTEGER PRIMARY KEY NOT NULL,
		cod_local INTEGER NOT NULL REFERENCES LOCAIS(cod_local),
		designacao TEXT NOT NULL
	);

-- Tabela Locais
	CREATE TABLE LOCAIS(
		cod_local INTEGER PRIMARY KEY NOT NULL,
		cod_tipo_local INTEGER NOT NULL REFERENCES TIPO_LOCAL(cod_tipo_local),
		designacao TEXT NOT NULL
	);

-- Tabela Tipo_Local
	CREATE TABLE TIPO_LOCAL(
		cod_tipo_local INTEGER PRIMARY KEY NOT NULL,
		designacao TEXT NOT NULL
	);

-- Tabela Funcionarios
	CREATE TABLE FUNCIONARIOS(
		cod_funcionario INTEGER PRIMARY KEY NOT NULL,
		cod_restaurante INTEGER NOT NULL REFERENCES RESTAURANTES(cod_restaurante),
		nome TEXT NOT NULL
	);
	
-- TABELA Locais_Consumo
	CREATE TABLE LOCAIS_CONSUMO(
		cod_local_consumo INTEGER PRIMARY KEY NOT NULL,
		designacao TEXT NOT NULL,
		cupao VARCHAR(50)
	);
	
-- TABELA Consumo
	CREATE TABLE CONSUMO(
		cod_consumo INTEGER PRIMARY KEY NOT NULL,
		cod_cliente INTEGER NOT NULL REFERENCES CLIENTES(cod_cliente),
		cod_local_consumo INTEGER NOT NULL REFERENCES LOCAIS_CONSUMO(cod_local_consumo),
		cod_funcionario INTEGER NOT NULL REFERENCES FUNCIONARIOS(cod_funcionario),
		data_consumo DATE NOT NULL
	);

-- TABELA Clientes
	CREATE TABLE CLIENTES(
		cod_cliente INTEGER PRIMARY KEY NOT NULL,
		nome TEXT NOT NULL,
		nif VARCHAR(50)
	);

-- TABELA Ementas
	CREATE TABLE EMENTAS(
		cod_ementa INTEGER PRIMARY KEY NOT NULL,
		cod_tipo_ementa INTEGER NOT NULL REFERENCES TIPO_EMENTA(cod_tipo_ementa),
		cod_restaurante INTEGER NOT NULL REFERENCES EMENTAS(cod_ementa),
		cod_data INTEGER NOT NULL REFERENCES DATAS(cod_data)
	);
	
-- TABELA Tipo_Ementas
	CREATE TABLE TIPO_EMENTA(
		cod_tipo_ementa INTEGER PRIMARY KEY NOT NULL,
		designacao TEXT NOT NULL
	);
	
-- TABELA Datas
	CREATE TABLE DATAS(
		cod_data INTEGER PRIMARY KEY NOT NULL,
		data_datas DATE NOT NULL
	);

-- TABELA Items_Ementas
	CREATE TABLE ITEMS_EMENTAS(
		cod_item INTEGER NOT NULL REFERENCES ITEMS(cod_item),
		cod_ementa INTEGER NOT NULL REFERENCES EMENTAS(cod_ementa),
		PRIMARY KEY(cod_item,cod_ementa)
	);
	
-- TABELA Items
	CREATE TABLE ITEMS(
		cod_item INTEGER PRIMARY KEY NOT NULL,
		cod_tipo_item INTEGER NOT NULL REFERENCES TIPO_ITEM(cod_tipo_item),
		designacao TEXT NOT NULL,
		custo DECIMAL NOT NULL
	);

-- TABELA Tipo_Item
	CREATE TABLE TIPO_ITEM(
		cod_tipo_item INTEGER PRIMARY KEY NOT NULL,
		designacao TEXT NOT NULL
	);

-- TABELA Items_Alergias
	CREATE TABLE ITEMS_ALERGIAS(
		cod_item INTEGER NOT NULL REFERENCES ITEMS(cod_item),
		cod_alergia INTEGER NOT NULL REFERENCES ALERGIAS(cod_alergia),
		PRIMARY KEY(cod_alergia,cod_item)
	);

-- TABELA Alergias
	CREATE TABLE ALERGIAS(
		cod_alergia INTEGER PRIMARY KEY NOT NULL,
		sintoma TEXT NOT NULL
	);
	