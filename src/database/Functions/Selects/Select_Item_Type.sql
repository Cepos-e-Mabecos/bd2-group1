CREATE OR REPLACE FUNCTION Select_Item_Type(arg_item_type_cod BIGINT)
RETURNS JSON
LANGUAGE plpgsql
AS $$
BEGIN
	
	IF(select exists(select 1 From item_types where item_types.item_type_cod = arg_item_type_cod)) THEN
		RETURN (Select json_build_object(
					'Item_Type_Cod', item_types.item_type_cod, 
					'Item_Type_Designation', item_types.designation)
						FROM item_types
                            WHERE item_types.item_type_cod = arg_item_type_cod);
	ELSE
		RAISE 'There is no Item_Type with the given Cod!';
	END IF;
END
$$