CREATE OR REPLACE PROCEDURE Update_Restaurant(temp_cod_restaurant VARCHAR, json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

	IF(select exists(select 1 From Restaurants where Restaurants.restaurant_cod = temp_cod_restaurant)) THEN
		-- GET JSON DATA
		WITH source AS (SELECT local_cod,designation FROM json_populate_record(
			NULL::Restaurants,
			$2
		))
		
		UPDATE Restaurants SET 
			local_cod = s.local_cod,
			designation = s.designation
		FROM source as s
		WHERE restaurant_cod = temp_cod_restaurant;
	ELSE
		RAISE 'There is no Restaurant with that Cod!';
	END IF;
END
$$