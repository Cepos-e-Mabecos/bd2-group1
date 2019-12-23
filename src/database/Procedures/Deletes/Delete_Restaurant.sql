CREATE OR REPLACE PROCEDURE Delete_Restaurant(arg_restaurant_cod BIGINT)
LANGUAGE plpgsql
AS $$
BEGIN
	
	IF(select exists(select 1 From Restaurants where Restaurants.restaurant_cod = arg_restaurant_cod)) THEN
		DELETE FROM restaurants
			WHERE restaurants.restaurant_cod = arg_restaurant_cod;
	ELSE
		RAISE 'There is no Restaurant with the given Cod!';
	END IF;
END
$$