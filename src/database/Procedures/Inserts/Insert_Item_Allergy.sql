CREATE OR REPLACE PROCEDURE Insert_Item_Allergy(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN
		INSERT INTO Item_Allergies (allergy_cod,item_cod) 
			SELECT allergy_cod,item_cod FROM json_populate_record(
				NULL::Item_Allergies,
				$1 
		);
END	
$$	