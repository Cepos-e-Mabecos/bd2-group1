CREATE OR REPLACE PROCEDURE Update_Allergy_Item(temp_cod_item int, temp_cod_allergy int, json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- GET JSON DATA
    WITH source AS (SELECT cod_item,cod_allergy FROM json_populate_record(
        NULL::Allergy_Items,
        $2
    ))

    -- UPDATE TABLE Allergy_Items
    UPDATE Allergy_Items SET 
        cod_item = s.cod_item,
        cod_allergy = s.cod_allergy
    FROM source AS s
    WHERE 
        cod_item = temp_cod_item 
    AND
        cod_allergy = temp_cod_allergy;

END
$$