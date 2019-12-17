CREATE OR REPLACE PROCEDURE Insert_Zone(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN
		-- GET JSON DATA
		WITH source AS (SELECT zone_cod,restaurant_cod,employee_cod,designation FROM json_populate_record(
			NULL::zones,
			$1
		))

		INSERT INTO zones (restaurant_cod,employee_cod,designation) SELECT restaurant_cod,employee_cod,designation FROM json_populate_record(
			NULL::zones,
			$1 
		);
END	
$$	