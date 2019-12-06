CREATE OR REPLACE PROCEDURE Update_Local(temp_cod_local int, json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- GET JSON DATA
    WITH source AS (SELECT cod_local_type,designation FROM json_populate_record(
        NULL::Locals,
        $2
    ))

    -- UPDATE TABLE Locals
    UPDATE Locals SET 
        cod_local_type = s.cod_local_type,
        designation = s.designation
    FROM source AS s
    WHERE cod_local = temp_cod_local;

END
$$