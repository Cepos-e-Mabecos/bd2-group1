CREATE OR REPLACE PROCEDURE Update_Zone(arg_zone_cod BIGINT, arg_json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

	IF(select exists(select 1 From zones where zones.zone_cod = arg_zone_cod)) THEN
		
		-- GET JSON DATA
		WITH source AS (SELECT restaurant_cod,designation FROM json_populate_record(
			NULL::zones,
			$2
		))

		UPDATE zones SET 
			restaurant_cod = json_data.restaurant_cod,
			designation = json_data.designation
		FROM source as json_data
		WHERE zones.zone_cod = arg_zone_cod;
	ELSE
		RAISE 'There is no Zone with the given Cod!';
	END IF;
END
$$