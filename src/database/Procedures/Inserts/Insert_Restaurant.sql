CREATE OR REPLACE PROCEDURE Insert_Restaurant(arg_json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

		INSERT INTO Restaurants (local_cod, designation) 
			SELECT local_cod,designation FROM json_populate_record(
				NULL::Restaurants,
				$1 
			);
END	
$$	