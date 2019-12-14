/* Database 2 Course - Final Project */

-- TABLE Local_Types
	CREATE TABLE Local_Types(
		local_type_cod BIGSERIAL PRIMARY KEY NOT NULL,
		designation TEXT NOT NULL
	);

-- TABLE Locals
	CREATE TABLE Locals(
		local_cod BIGSERIAL PRIMARY KEY NOT NULL,
		local_type_cod BIGSERIAL NOT NULL REFERENCES Local_Types(local_type_cod),
		designation TEXT NOT NULL
	);

-- TABLE Restaurants
	CREATE OR REPLACE TABLE Restaurants(
		restaurant_cod VARCHAR() PRIMARY KEY NOT NULL,
		local_cod BIGSERIAL NOT NULL REFERENCES Locals(local_cod),
		designation TEXT NOT NULL	
	);

-- TABLE zones
	CREATE TABLE zones(
		zone_cod BIGSERIAL PRIMARY KEY NOT NULL,
		restaurant_cod BIGSERIAL NOT NULL REFERENCES Restaurants(restaurant_cod),
		employee_cod BIGSERIAL NOT NULL REFERENCES Employees(employee_cod),
		designation TEXT NOT NULL,
	);

-- TABLE Employees
	CREATE TABLE Employees(
		employee_cod BIGSERIAL PRIMARY KEY NOT NULL,
		first_name TEXT NOT NULL,
		last_name TEXT NOT NULL,
		contact INT NOT NULL
	);

-- TABLE Items_Type
	CREATE TABLE Items_Type(
		item_type_cod BIGSERIAL PRIMARY KEY NOT NULL,
		designation TEXT NOT NULL
	);

-- TABLE Items
	CREATE TABLE Items(
		item_cod BIGSERIAL PRIMARY KEY NOT NULL,
		item_type_cod BIGSERIAL NOT NULL REFERENCES Items_Type(item_type_cod),
		price MONEY NOT NULL
	);

-- TABLE Menus_Type
	CREATE TABLE Menus_Type(
		menu_type_cod BIGSERIAL PRIMARY KEY NOT NULL,
		designation TEXT NOT NULL
	);

-- TABLE Menus
	CREATE TABLE Menus(
		menu_cod BIGSERIAL PRIMARY KEY NOT NULL,
		designation TEXT NOT NULL
	);

-- TABLE Menu_Items
	CREATE TABLE Menu_Items(
		menu_cod BIGSERIAL NOT NULL REFERENCES Menus(menu_cod),
		item_cod BIGSERIAL NOT NULL REFERENCES Items(item_cod)
	);

-- TABLE Zone_Menus
	CREATE TABLE Zone_Menus(
		zone_cod BIGSERIAL NOT NULL REFERENCES zones(zone_cod),
		menu_cod BIGSERIAL NOT NULL REFERENCES Menus(menu_cod)
	);

-- TABLE Eating_Zone_Employees
	CREATE TABLE Zone_Employees(
		zone_cod BIGSERIAL NOT NULL REFERENCES zones(zone_cod),
		employee_cod BIGSERIAL NOT NULL REFERENCES Employees(employee_cod)
	);

-- TABLE Clients
	CREATE TABLE Clients(
		cod_client BIGSERIAL PRIMARY KEY NOT NULL,
		first_name TEXT NOT NULL,
		last_name TEXT NOT NULL,
		nif VARCHAR(50) NOT NULL
	);

-- TABLE Comsumptions
	CREATE TABLE Comsumptions(
		comsumption_cod BIGSERIAL NOT NULL PRIMARY KEY,
		cod_client BIGSERIAL NOT NULL REFERENCES Clients(cod_client),
		comsumption_date TIMESTAMP NOT NULL
	)

-- TABLE zone_Comsumptions
	CREATE TABLE zone_Comsumptions(
		zone_cod BIGSERIAL NOT NULL REFERENCES zones(zone_cod),
		comsumption_cod BIGSERIAL NOT NULL REFERENCES Comsumptions(comsumption_cod)
	)

-- TABLE Allergies
	CREATE TABLE Allergies(
		allergy_cod BIGSERIAL NOT NULL PRIMARY KEY,
		symptom TEXT NOT NULL
	)

-- TABLE Item_Allergies
	CREATE TABLE Item_Allergies(
		allergy_cod BIGSERIAL NOT NULL REFERENCES Allergies(allergy_cod),
		item_cod BIGSERIAL NOT NULL REFERENCES Items(item_cod)
	)