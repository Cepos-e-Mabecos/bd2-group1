/* Database 2 Course - Final Project */

-- TABLE Local_Types
	CREATE TABLE Local_Types(
		local_type_cod BIGSERIAL PRIMARY KEY NOT NULL,
		designation TEXT NOT NULL
	);

-- TABLE Locals
	CREATE TABLE Locals(
		local_cod VARCHAR PRIMARY KEY NOT NULL,
		local_type_cod BIGSERIAL NOT NULL REFERENCES Local_Types(local_type_cod)
			ON DELETE CASCADE,
		designation TEXT NOT NULL
	);

-- TABLE Restaurants
	CREATE TABLE Restaurants(
		restaurant_cod VARCHAR PRIMARY KEY NOT NULL,
		local_cod VARCHAR NOT NULL REFERENCES Locals(local_cod)
			ON DELETE CASCADE,
		designation TEXT NOT NULL	
	);

-- TABLE zones
	CREATE TABLE zones(
		zone_cod VARCHAR() PRIMARY KEY NOT NULL,
		restaurant_cod VARCHAR() NOT NULL REFERENCES Restaurants(restaurant_cod)
			ON DELETE CASCADE,
		employee_cod VARCHAR() NOT NULL REFERENCES Employees(employee_cod)
			ON DELETE CASCADE,
		designation TEXT NOT NULL,
	);

-- TABLE Employees
	CREATE TABLE Employees(
		employee_cod VARCHAR PRIMARY KEY NOT NULL,
		first_name TEXT NOT NULL,
		last_name TEXT NOT NULL
	);

-- TABLE Items_Type
	CREATE TABLE Items_Type(
		item_type_cod BIGSERIAL PRIMARY KEY NOT NULL,
		designation TEXT NOT NULL
	);

-- TABLE Items
	CREATE TABLE Items(
		item_cod VARCHAR() PRIMARY KEY NOT NULL,
		item_type_cod BIGSERIAL NOT NULL REFERENCES Items_Type(item_type_cod)
			ON DELETE CASCADE,
		price MONEY NOT NULL
	);

-- TABLE Menus_Type
	CREATE TABLE Menus_Type(
		menu_type_cod BIGSERIAL PRIMARY KEY NOT NULL,
		designation TEXT NOT NULL
	);

-- TABLE Menus
	CREATE TABLE Menus(
		menu_cod VARCHAR() PRIMARY KEY NOT NULL,
		menu_type_cod BIGSERIAL NOT NULL REFERENCES Menus_Type(menu_type_cod)
			ON DELETE CASCADE,
		designation TEXT NOT NULL
	);

-- TABLE Menu_Items
	CREATE TABLE Menu_Items(
		menu_cod VARCHAR() NOT NULL REFERENCES Menus(menu_cod)
			ON DELETE CASCADE,
		item_cod VARCHAR() NOT NULL REFERENCES Items(item_cod)
			ON DELETE CASCADE
	);

-- TABLE Zone_Menus
	CREATE TABLE Zone_Menus(
		zone_cod VARCHAR() NOT NULL REFERENCES zones(zone_cod)
			ON DELETE CASCADE,
		menu_cod VARCHAR() NOT NULL REFERENCES Menus(menu_cod)
			ON DELETE CASCADE
	);

-- TABLE Eating_Zone_Employees
	CREATE TABLE Zone_Employees(
		zone_cod VARCHAR() NOT NULL REFERENCES zones(zone_cod)
			ON DELETE CASCADE,
		employee_cod VARCHAR() NOT NULL REFERENCES Employees(employee_cod)
			ON DELETE CASCADE
	);

-- TABLE Clients
	CREATE TABLE Clients(
		nif VARCHAR(12) PRIMARY KEY NOT NULL,
		first_name TEXT NOT NULL,
		last_name TEXT NOT NULL,
	);

-- TABLE Comsumptions
	CREATE TABLE Comsumptions(
		comsumption_cod BIGSERIAL NOT NULL PRIMARY KEY,
		nif VARCHAR(12) NOT NULL REFERENCES Clients(nif)
			ON DELETE CASCADE,
		comsumption_date TIMESTAMP NOT NULL
	)

-- TABLE zone_Comsumptions
	CREATE TABLE Zone_Comsumptions(
		zone_cod BIGSERIAL NOT NULL REFERENCES zones(zone_cod)
			ON DELETE CASCADE,
		comsumption_cod BIGSERIAL NOT NULL REFERENCES Comsumptions(comsumption_cod)
			ON DELETE CASCADE
	)

-- TABLE Allergies
	CREATE TABLE Allergies(
		allergy_cod BIGSERIAL NOT NULL PRIMARY KEY,
		designation TEXT NOT NULL,
		symptom TEXT NOT NULL
	)

-- TABLE Item_Allergies
	CREATE TABLE Item_Allergies(
		allergy_cod VARCHAR() NOT NULL REFERENCES Allergies(allergy_cod)
			ON DELETE CASCADE,
		item_cod VARCHAR() NOT NULL REFERENCES Items(item_cod)
			ON DELETE CASCADE
	)