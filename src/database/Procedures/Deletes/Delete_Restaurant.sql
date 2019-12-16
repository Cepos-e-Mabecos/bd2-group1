CREATE OR REPLACE PROCEDURE Delete_Restaurant(temp_cod_restaurant VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
	
	IF(select exists(select 1 From Restaurants where Restaurants.restaurant_cod = temp_cod_restaurant)) THEN
		DELETE FROM restaurants
			WHERE restaurants.restaurant_cod = temp_cod_restaurant;
	ELSE
		RAISE 'There is no Restaurant with that Cod!';
	END IF;
END
$$