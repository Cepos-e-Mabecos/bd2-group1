CREATE TRIGGER RecordValue
 AFTER INSERT ON Comsumptions
 FOR EACH ROW
 	EXECUTE FUNCTION check_record_comsumptions();
	
CREATE OR REPLACE FUNCTION check_record_comsumptions()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
	UPDATE RECORDS
	SET total_comsumptions = total_comsumptions + 1
	WHERE restaurant_cod = (
		SELECT restaurant_cod FROM Zones 
			INNER JOIN Zone_Comsumptions
				ON zones.zone_cod = zone_comsumptions.zone_cod
					WHERE zone_comsumptions.comsumption_cod = new.comsumption_cod
	);

	RETURN NULL;
END
$$

CREATE TRIGGER RecordRestaurant
 AFTER INSERT ON Restaurants
 FOR EACH ROW
 	EXECUTE FUNCTION create_record_comsumptions();
	
CREATE OR REPLACE FUNCTION create_record_comsumptions()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
	INSERT INTO RECORDS(restaurant_cod, total_comsumptions)
	VALUES (NEW.restaurant_cod, 0);

	RETURN NULL;
END
$$