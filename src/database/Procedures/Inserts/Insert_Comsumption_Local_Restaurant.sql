CREATE OR REPLACE PROCEDURE Insert_Comsumption_Local_Restaurant(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- Insert into table Comsumption_Local_Restaurants
    INSERT INTO Comsumption_Local_Restaurants SELECT cod_restaurant, cod_comsumption_local FROM json_populate_record(
        NULL::Comsumption_Local_Restaurants,
        $1 
    );

END
$$