/* Database 2 Course - Final Project */

-- TABLE Local_Types
	CREATE TABLE Local_Types(
		cod_local_type BIGSERIAL PRIMARY KEY NOT NULL,
		designation CHARACTER(50) NOT NULL
	);

-- TABLE Locals
	CREATE TABLE Locals(
		cod_local BIGSERIAL PRIMARY KEY NOT NULL,
		cod_local_type BIGSERIAL NOT NULL REFERENCES Local_Types(cod_local_type),
		designation CHARACTER(50) NOT NULL
	);

-- TABLE Restaurants
	CREATE TABLE Restaurants(
		cod_restaurant BIGSERIAL PRIMARY KEY NOT NULL,
		cod_local BIGSERIAL NOT NULL REFERENCES Locals(cod_local),
		designation CHARACTER(50) NOT NULL
	);

-- TABLE Comsumption_Locals
	CREATE TABLE Comsumption_Locals(
		cod_comsumption_local BIGSERIAL PRIMARY KEY NOT NULL,
		designation CHARACTER(50) NOT NULL,
		cupon VARCHAR(50)
	);

-- TABLE Consumption_Locals_Restaurants
	CREATE TABLE Consumption_Locals_Restaurants(
		cod_restaurant BIGSERIAL NOT NULL REFERENCES Restaurants(cod_restaurant),
		cod_comsumption_local BIGSERIAL NOT NULL REFERENCES Comsumption_Locals(cod_comsumption_local),
		PRIMARY KEY(cod_restaurant,cod_comsumption_local)
	);

-- TABLE Employees
	CREATE TABLE Employees(
		cod_employee BIGSERIAL PRIMARY KEY NOT NULL,
		first_name CHARACTER(25) NOT NULL,
		last_name CHARACTER(50) NOT NULL
	);

-- TABLE Comsumption_Locals_Employees 
	CREATE TABLE Comsumption_Locals_Employees(
		cod_employee BIGSERIAL NOT NULL REFERENCES Employees(cod_employee),
		cod_comsumption_local BIGSERIAL NOT NULL REFERENCES Comsumption_Locals(cod_comsumption_local),
		comsumption_locals_employee_date TIMESTAMP NOT NULL
		PRIMARY KEY(cod_employee,cod_comsumption_local)
	)
	
-- TABLE Comsumptions
	CREATE TABLE Comsumptions(
		cod_comsumption BIGSERIAL PRIMARY KEY NOT NULL,
		cod_client BIGSERIAL NOT NULL REFERENCES Clients(cod_client),
		cod_food_menu  BIGSERIAL NOT NULL REFERENCES Food_Menus(cod_food_menu),
		cod_employee BIGSERIAL NOT NULL REFERENCES Employees(cod_employee),
		comsumption_date TIMESTAMP NOT NULL
	);

-- TABLE Clients
	CREATE TABLE Clients(
		cod_client BIGSERIAL PRIMARY KEY NOT NULL,
		first_name CHARACTER(25) NOT NULL,
		last_name CHARACTER(50) NOT NULL,
		nif VARCHAR(50) NOT NULL
	);

-- TABLE Dates
	CREATE TABLE Dates(
		cod_data BIGSERIAL PRIMARY KEY NOT NULL,
		date_time TIMESTAMP NOT NULL
	);

-- TABLE Food_Menu_Types
	CREATE TABLE Food_Menu_Types(
		cod_food_menu_type BIGSERIAL PRIMARY KEY NOT NULL,
		designation CHARACTER(50) NOT NULL
	);

-- TABLE Food_Menus
	CREATE TABLE Food_Menus(
		cod_food_menu BIGSERIAL PRIMARY KEY NOT NULL,
		cod_food_menu_type BIGSERIAL NOT NULL REFERENCES Food_Menu_Types(cod_food_menu_type),
		cod_restaurant BIGSERIAL NOT NULL REFERENCES Restaurants(cod_restaurant),
		cod_date BIGSERIAL NOT NULL REFERENCES Dates(cod_date)
	);

-- TABLE Food_Menu_Items
	CREATE TABLE Food_Menu_Items(
		cod_item BIGSERIAL NOT NULL REFERENCES ITEMS(cod_item),
		cod_food_menu BIGSERIAL NOT NULL REFERENCES Food_Menus(cod_food_menu),
		PRIMARY KEY(cod_item,cod_food_menu)
	);
	
-- TABLE Item_Types
	CREATE TABLE Item_Types(
		cod_item_type BIGSERIAL PRIMARY KEY NOT NULL,
		designation CHARACTER(50) NOT NULL
	);

-- TABLE Items
	CREATE TABLE Items(
		cod_item BIGSERIAL PRIMARY KEY NOT NULL,
		cod_item_type BIGSERIAL NOT NULL REFERENCES Item_Types(cod_item_type),
		designation CHARACTER(50) NOT NULL,
		cost DECIMAL NOT NULL
	);

-- TABLE Allergy_Items
	CREATE TABLE Allergy_Items(
		cod_item BIGSERIAL NOT NULL REFERENCES Items(cod_item),
		cod_allergy BIGSERIAL NOT NULL REFERENCES Allergy(cod_allergy),
		PRIMARY KEY(cod_allergy,cod_item)
	);

-- TABLE Allergies
	CREATE TABLE Allergies(
		cod_allergy BIGSERIAL PRIMARY KEY NOT NULL,
		symptom TEXT NOT NULL
	);
	