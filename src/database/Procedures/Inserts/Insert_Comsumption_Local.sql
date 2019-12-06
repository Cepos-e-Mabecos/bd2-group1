CREATE OR REPLACE PROCEDURE Insert_Comsumption_Local(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- Insert into table Comsumption_Locals
    INSERT INTO Comsumption_Locals SELECT designation,cupon FROM json_populate_record(
        NULL::Comsumption_Locals,
        $1 
    );

END
$$