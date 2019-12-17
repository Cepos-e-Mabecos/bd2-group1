CREATE OR REPLACE PROCEDURE Update_Zone(temp_cod_zone VARCHAR, json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

	IF(select exists(select 1 From zones where zones.zone_cod = temp_cod_zone)) THEN
		-- GET JSON DATA
		WITH source AS (SELECT zone_cod,restaurant_cod,employee_cod,designation FROM json_populate_record(
			NULL::zones,
			$2
		))
		
		UPDATE zones SET 
			zone_cod = s.zone_cod,
			restaurant_cod = s.restaurant_cod,
            employee_cod = s.employee_cod,
			designation = s.designation
		FROM source as s
		WHERE zones.zone_cod = temp_cod_zone;
	ELSE
		RAISE 'There is no zone with that Cod!';
	END IF;
END
$$