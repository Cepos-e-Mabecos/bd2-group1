CREATE OR REPLACE PROCEDURE Update_Comsumption_Local(temp_cod_comsumption_local int, json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- GET JSON DATA
    WITH source AS (SELECT designation,cupon FROM json_populate_record(
        NULL::Comsumption_Locals,
        $2
    ))

    -- UPDATE TABLE Comsumption_LocalsS
    UPDATE Comsumption_Locals SET 
        designation = s.designation,
        cupon = s.cupon
    FROM source AS s
    WHERE 
        cod_comsumption_local = temp_cod_comsumption_local;

END
$$