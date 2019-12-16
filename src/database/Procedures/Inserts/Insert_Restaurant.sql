CREATE OR REPLACE PROCEDURE Insert_Restaurant(json_data JSON)
LANGUAGE plpgsql
AS $$
DECLARE
	restaurant VARCHAR;
BEGIN
		-- GET JSON DATA
		WITH source AS (SELECT restaurant_cod,local_cod,designation FROM json_populate_record(
			NULL::Restaurants,
			$1
		))
		
		SELECT source.restaurant_cod INTO restaurant FROM source;
		
		IF(select exists(select 1 From Restaurants where Restaurants.restaurant_cod = restaurant)) THEN
			RAISE 'There is already a Restaurant created with that Cod!';
		ELSE
			INSERT INTO Restaurants (restaurant_cod,local_cod, designation) SELECT restaurant_cod,local_cod,designation FROM json_populate_record(
				NULL::Restaurants,
				$1 
			);
		END IF;
END	
$$	