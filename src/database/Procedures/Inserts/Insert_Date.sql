CREATE OR REPLACE PROCEDURE Insert_Date(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- Insert into table Dates
    INSERT INTO Dates SELECT date_time FROM json_populate_record(
        NULL::Dates,
        $1 
    );

END
$$