CREATE OR REPLACE PROCEDURE Update_Allergy(temp_cod_allergy int, json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- GET JSON DATA
    WITH source AS (SELECT symptom FROM json_populate_record(
        NULL::Allergies,
        $2
    ))

    -- UPDATE TABLE Allergies
    UPDATE Allergies SET symptom = s.symptom
    FROM source AS s
    WHERE cod_allergy = temp_cod_allergy;

END
$$