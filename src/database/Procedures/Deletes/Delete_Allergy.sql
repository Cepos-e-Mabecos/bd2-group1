CREATE OR REPLACE PROCEDURE Delete_Allergy(arg_allergy_cod VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
	
	IF(select exists(select 1 From allergies where allergies.allergy_cod = arg_allergy_cod)) THEN
		DELETE FROM allergies
			WHERE allergies.allergy_cod = arg_allergy_cod;
	ELSE
		RAISE 'There is no Allergy with the given Cod!';
	END IF;
END
$$