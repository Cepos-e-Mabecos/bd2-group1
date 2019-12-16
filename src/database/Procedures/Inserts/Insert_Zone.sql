CREATE OR REPLACE PROCEDURE Insert_Zone(json_data JSON)
LANGUAGE plpgsql
AS $$
DECLARE
	zone_temp VARCHAR;
BEGIN
		-- GET JSON DATA
		WITH source AS (SELECT zone_cod,restaurant_cod,employee_cod,designation FROM json_populate_record(
			NULL::zones,
			$1
		))
		
		SELECT source.zone_cod INTO zone_temp FROM source;
		
		IF(select exists(select 1 From zones where zones.zone_cod = zone_temp)) THEN
			RAISE 'There is already a zone created with that Cod!';
		ELSE
			INSERT INTO zones (zone_cod,restaurant_cod,employee_cod,designation) SELECT zone_cod,restaurant_cod,employee_cod,designation FROM json_populate_record(
				NULL::zones,
				$1 
			);
		END IF;
END	
$$	