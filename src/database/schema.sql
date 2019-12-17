/* Database 2 Course - Final Project */

-- TABLE Local_Types
	CREATE TABLE Local_Types(
		local_type_cod BIGSERIAL PRIMARY KEY NOT NULL,
		designation TEXT NOT NULL
	);

-- TABLE Locals
	CREATE TABLE Locals(
		local_cod BIGSERIAL PRIMARY KEY NOT NULL,
		local_type_cod BIGSERIAL NOT NULL REFERENCES Local_Types(local_type_cod)
			ON DELETE CASCADE,
		designation TEXT NOT NULL
	);

-- TABLE Restaurants
	CREATE TABLE Restaurants(
		restaurant_cod BIGSERIAL PRIMARY KEY NOT NULL,
		local_cod BIGSERIAL NOT NULL REFERENCES Locals(local_cod)
			ON DELETE CASCADE,
		designation TEXT NOT NULL	
	);

-- TABLE Employees
	CREATE TABLE Employees(
		employee_cod BIGSERIAL PRIMARY KEY NOT NULL,
		first_name TEXT NOT NULL,
		last_name TEXT NOT NULL
	);

-- TABLE Zones
	CREATE TABLE Zones(
		zone_cod BIGSERIAL PRIMARY KEY NOT NULL,
		restaurant_cod BIGSERIAL NOT NULL REFERENCES Restaurants(restaurant_cod)
			ON DELETE CASCADE,
		employee_cod BIGSERIAL NOT NULL REFERENCES Employees(employee_cod)
			ON DELETE CASCADE,
		designation TEXT NOT NULL
	);

-- TABLE Item_Types
	CREATE TABLE Item_Types(
		item_type_cod BIGSERIAL PRIMARY KEY NOT NULL,
		designation TEXT NOT NULL
	);

-- TABLE Items
	CREATE TABLE Items(
		item_cod BIGSERIAL PRIMARY KEY NOT NULL,
		item_type_cod BIGSERIAL NOT NULL REFERENCES Item_Types(item_type_cod)
			ON DELETE CASCADE,
		designation TEXT NOT NULL,
		price MONEY NOT NULL
	);

-- TABLE Menu_Types
	CREATE TABLE Menu_Types(
		menu_type_cod BIGSERIAL PRIMARY KEY NOT NULL,
		designation TEXT NOT NULL
	);

-- TABLE Menus
	CREATE TABLE Menus(
		menu_cod BIGSERIAL PRIMARY KEY NOT NULL,
		menu_type_cod BIGSERIAL NOT NULL REFERENCES Menu_Types(menu_type_cod)
			ON DELETE CASCADE,
		designation TEXT NOT NULL
	);

-- TABLE Menu_Items
	CREATE TABLE Menu_Items(
		menu_cod BIGSERIAL NOT NULL REFERENCES Menus(menu_cod)
			ON DELETE CASCADE,
		item_cod BIGSERIAL NOT NULL REFERENCES Items(item_cod)
			ON DELETE CASCADE,
		PRIMARY KEY(menu_cod, item_cod)
	);

-- TABLE Eating_Zone_Employees
	CREATE TABLE Zone_Employees(
		zone_cod BIGSERIAL NOT NULL REFERENCES Zones(zone_cod)
			ON DELETE CASCADE,
		employee_cod BIGSERIAL NOT NULL REFERENCES Employees(employee_cod)
			ON DELETE CASCADE
	);

-- TABLE Clients
	CREATE TABLE Clients(
		nif VARCHAR(9) PRIMARY KEY NOT NULL,
		first_name TEXT NOT NULL,
		last_name TEXT NOT NULL
	);

-- TABLE Comsumptions
	CREATE TABLE Comsumptions(
		comsumption_cod BIGSERIAL NOT NULL PRIMARY KEY,
		nif VARCHAR(9) NOT NULL REFERENCES Clients(nif)
			ON DELETE CASCADE,
		comsumption_date TIMESTAMP NOT NULL
	);

-- TABLE zone_Comsumptions
	CREATE TABLE Zone_Comsumptions(
		zone_cod BIGSERIAL NOT NULL REFERENCES Zones(zone_cod)
			ON DELETE CASCADE,
		comsumption_cod BIGSERIAL NOT NULL REFERENCES Comsumptions(comsumption_cod)
			ON DELETE CASCADE
	);

-- TABLE Allergies
	CREATE TABLE Allergies(
		allergy_cod BIGSERIAL NOT NULL PRIMARY KEY,
		designation TEXT NOT NULL,
		symptom TEXT NOT NULL
	);

-- TABLE Item_Allergies
	CREATE TABLE Item_Allergies(
		allergy_cod BIGSERIAL NOT NULL REFERENCES Allergies(allergy_cod)
			ON DELETE CASCADE,
		item_cod BIGSERIAL NOT NULL REFERENCES Items(item_cod)
			ON DELETE CASCADE,
		PRIMARY KEY(allergy_cod, item_cod)
	);