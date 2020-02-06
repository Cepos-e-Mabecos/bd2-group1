CREATE OR REPLACE FUNCTION Select_Item(arg_item_cod BIGINT)
RETURNS JSON
LANGUAGE plpgsql
AS $$
BEGIN
	
	IF(select exists(select 1 From Items where Items.item_cod = arg_item_cod)) THEN
		RETURN (Select json_build_object(
					'Item_Cod', Items.item_cod, 
					'Item_Type_Designation', Item_Types.designation,
                    'Item_Designation', Items.designation,
                    'Item_Price', Items.price)
						FROM Items INNER JOIN Item_Types
							ON Items.item_type_cod = Item_Types.item_type_cod
                            	WHERE Items.item_cod = arg_item_cod);
	ELSE
		RAISE 'There is no Item with the given Cod!';
	END IF;
END
$$

