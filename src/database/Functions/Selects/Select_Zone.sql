CREATE OR REPLACE FUNCTION Select_Zone(temp_cod_zone VARCHAR)
RETURNS JSON
LANGUAGE plpgsql
AS $$
BEGIN
	
	IF(select exists(select 1 From zones where zones.zone_cod = temp_cod_zone)) THEN
		RETURN (Select json_build_object(
					'Zone_Cod',zones.zone_cod, 
					'Zone_Restaurant',restaurants.designation, 
					'Zone_Employee',employees.first_name || ' ' || employees.last_name,
                    'Zone_Designation', zones.designation) 
						FROM zones 
                            INNER JOIN restaurants
							    ON zones.restaurant_cod = restaurants.restaurant_cod
                            INNER JOIN employees
                                ON zones.employee_cod = employees.employee_cod
								WHERE zones.zone_cod = temp_cod_zone);
	ELSE
		RAISE 'There is no zone with that Cod!';
	END IF;
END
$$