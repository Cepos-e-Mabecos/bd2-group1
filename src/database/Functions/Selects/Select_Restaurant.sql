CREATE OR REPLACE FUNCTION Select_Restaurant(temp_cod_restaurant VARCHAR)
RETURNS json
LANGUAGE plpgsql
AS $$
BEGIN
	
	IF(select exists(select 1 From Restaurants where Restaurants.restaurant_cod = temp_cod_restaurant)) THEN
		RETURN (Select json_build_object(
					'Restaurant_Cod',restaurants.restaurant_cod, 
					'Restaurant_Designation',restaurants.designation, 
					'Restaurant_Local',locals.designation) 
						FROM restaurants INNER JOIN locals
							ON restaurants.local_cod = locals.local_cod
								WHERE restaurants.restaurant_cod = temp_cod_restaurant);
	ELSE
		RAISE 'There is no Restaurant with that Cod!';
	END IF;
END
$$