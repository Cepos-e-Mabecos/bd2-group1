CREATE OR REPLACE FUNCTION Select_Allergy(arg_allergy_cod VARCHAR)
RETURNS JSON
LANGUAGE plpgsql
AS $$
BEGIN
	
	IF(select exists(select 1 From allergies where allergies.allergy_Cod = arg_allergy_cod)) THEN
		RETURN (Select json_build_object(
					'Allergy_Cod', allergies.allergy_cod,
                    'Allergy_Designation', allergies.designation,
                    'Allergy_Symptom', allergies.symptom)
						FROM allergies 
                            WHERE allergies.nif = arg_allergy_cod);
	ELSE
		RAISE 'There is no Allergy with the given Cod!';
	END IF;
END
$$