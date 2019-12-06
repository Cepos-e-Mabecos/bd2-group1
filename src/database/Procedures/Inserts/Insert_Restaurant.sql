CREATE OR REPLACE PROCEDURE Insert_Restaurant(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- Insert into table Restaurants
    INSERT INTO Restaurants SELECT cod_local,designation FROM json_populate_record(
        NULL::Restaurants,
        $1 
    );

END
$$