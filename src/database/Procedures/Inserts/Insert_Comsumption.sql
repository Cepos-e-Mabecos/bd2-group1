CREATE OR REPLACE PROCEDURE Insert_Comsumption(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- Insert into table Comsumptions
    INSERT INTO Comsumptions SELECT cod_client,cod_food_menu,cod_employee,comsumption_date FROM json_populate_record(
        NULL::Comsumptions,
        $1 
    );

END
$$