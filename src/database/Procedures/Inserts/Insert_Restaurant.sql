CREATE OR REPLACE PROCEDURE Insert_Restaurant(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN
		-- GET JSON DATA
		WITH source AS (SELECT local_cod,designation FROM json_populate_record(
			NULL::Restaurants,
			$1
		))
		INSERT INTO Restaurants (local_cod, designation) SELECT local_cod,designation FROM json_populate_record(
			NULL::Restaurants,
			$1 
		);
END	
$$	