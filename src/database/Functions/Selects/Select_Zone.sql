CREATE OR REPLACE FUNCTION Select_Zone(arg_zone_cod BIGINT)
RETURNS JSON
LANGUAGE plpgsql
AS $$
BEGIN
	
	IF(select exists(select 1 From zones where zones.zone_cod = arg_zone_cod)) THEN
		RETURN (Select json_build_object(
					'Zone_Cod',zones.zone_cod, 
					'Zone_Restaurant',restaurants.designation,
					'Zone_Designation', zones.designation) 
						FROM zones 
                            INNER JOIN restaurants
							    ON zones.restaurant_cod = restaurants.restaurant_cod
								WHERE zones.zone_cod = arg_zone_cod);
	ELSE
		RAISE 'There is no Zone with the given Cod!';
	END IF;
END
$$