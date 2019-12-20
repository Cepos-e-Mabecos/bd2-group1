CREATE OR REPLACE FUNCTION Select_Item_Allergy(arg_item_cod BIGINT)
RETURNS JSON
LANGUAGE plpgsql
AS $$
BEGIN
	
	IF(select exists(select 1 From Item_Allergies 
        where Item_Allergies.item_cod = arg_item_cod)) THEN
		RETURN (
            Select json_build_object(
			    'Item_Designation', Items.designation,
                'Item_Allergies', (
                        select json_object_agg(
                            'Allergy', Allergies.designation)
                                FROM Allergies
                                    INNER JOIN Item_Allergies
                                        ON Item_Allergies.allergy_cod = Allergies.allergy_cod
                                            WHERE Item_Allergies.item_cod = arg_item_cod
                        ))
                    FROM Item_Allergies 
                        INNER JOIN Allergies
                            ON Item_Allergies.item_cod = Allergies.item_cod
                                WHERE Item_Allergies.item_cod = arg_item_cod);
	ELSE
		RAISE 'There is no Item_Allergies with the given Item and Allergy Cod!';
	END IF;
END
$$