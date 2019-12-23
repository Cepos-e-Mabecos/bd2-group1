CREATE OR REPLACE PROCEDURE Delete_Item_Allergy(arg_allergy_cod BIGINT, arg_item_cod BIGINT)
LANGUAGE plpgsql
AS $$
BEGIN
	IF(select exists(
            select 1 From Item_Allergies 
                where 
                    Item_Allergies.allergy_cod = arg_allergy_cod
                AND
                    Item_Allergies.item_cod = arg_item_cod)) THEN
		DELETE FROM Item_Allergies
			WHERE 
                Item_Allergies.item_cod = arg_item_cod
            AND
                Item_Allergies.allergy_cod = arg_allergy_cod;
	ELSE
		RAISE 'There is no Item_Allergy with the given Allergy and Item Cod!';
	END IF;
END
$$