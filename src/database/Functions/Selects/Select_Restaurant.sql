CREATE OR REPLACE FUNCTION Select_Restaurant(arg_restaurant_cod BIGINT)
RETURNS json
LANGUAGE plpgsql
AS $$
BEGIN
	
	IF(select exists(select 1 From Restaurants where Restaurants.restaurant_cod = arg_restaurant_cod)) THEN
		RETURN (Select json_build_object(
					'Restaurant_Cod',restaurants.restaurant_cod, 
					'Restaurant_Designation',restaurants.designation, 
					'Restaurant_Local',locals.designation) 
						FROM restaurants INNER JOIN locals
							ON restaurants.local_cod = locals.local_cod
								WHERE restaurants.restaurant_cod = arg_restaurant_cod);
	ELSE
		RAISE 'There is no Restaurant with that Cod!';
	END IF;
END
$$