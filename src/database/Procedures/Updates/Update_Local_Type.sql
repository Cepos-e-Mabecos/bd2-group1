CREATE OR REPLACE PROCEDURE Update_Local_Type(temp_cod_local_type int, json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- GET JSON DATA
    WITH source AS (SELECT designation FROM json_populate_record(
        NULL::Local_Types,
        $2
    ))

    -- UPDATE TABLE Local_Types
    UPDATE Local_Types SET 
        designation = s.designation
    FROM source AS s
    WHERE 
        Local_Types.cod_local_type = temp_cod_local_type;

END
$$