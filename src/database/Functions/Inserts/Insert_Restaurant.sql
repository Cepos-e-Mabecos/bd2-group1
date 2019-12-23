CREATE OR REPLACE FUNCTION Insert_Restaurant(json_data JSON)
RETURNS INTEGER AS $id$
DECLARE id INTEGER;
BEGIN
        INSERT INTO Restaurants (local_cod, designation) SELECT local_cod,designation FROM json_populate_record(
            NULL::Restaurants,
            $1 
        ) returning restaurant_cod into id;
        RETURN id;
END
$id$ LANGUAGE plpgsql;
