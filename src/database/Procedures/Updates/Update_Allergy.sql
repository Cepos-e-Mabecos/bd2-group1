CREATE OR REPLACE PROCEDURE Update_Allergy(arg_allergy_cod BIGINT, json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    IF(select exists(select 1 From allergies where allergies.allergy_cod = arg_allergy_cod)) THEN

        -- GET JSON DATA
		WITH source AS (SELECT designation,symptom FROM json_populate_record(
			NULL::allergies,
			$2
		))

        UPDATE allergies SET 
            designation = s.designation,
            symptom = s.symptom
        FROM source as s
        WHERE allergies.allergy_cod = arg_allergy_cod;
    ELSE
        RAISE 'There is no Allergy with the given Cod!';
    END IF;
END
$$