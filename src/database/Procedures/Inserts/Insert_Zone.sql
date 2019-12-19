CREATE OR REPLACE PROCEDURE Insert_Zone(arg_json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

		INSERT INTO zones (restaurant_cod,designation) 
			SELECT restaurant_cod,designation FROM json_populate_record(
				NULL::zones,
				$1 
			);
END	
$$	