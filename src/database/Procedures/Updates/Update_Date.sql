CREATE OR REPLACE PROCEDURE Update_Date(temp_cod_date int, json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- GET JSON DATA
    WITH source AS (SELECT date_time FROM json_populate_record(
        NULL::Dates,
        $2
    ))

    -- UPDATE TABLE Dates
    UPDATE Dates SET 
        date_time = s.date_time
    FROM source AS s
    WHERE cod_data = temp_cod_date;

END
$$