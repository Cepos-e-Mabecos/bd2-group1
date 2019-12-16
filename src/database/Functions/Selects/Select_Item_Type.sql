CREATE OR REPLACE FUNCTION Select_Item_Type(temp_cod_item_type BIGINT)
RETURNS JSON
LANGUAGE plpgsql
AS $$
BEGIN
	
	IF(select exists(select 1 From item_types where item_types.item_type_cod = temp_cod_item_type)) THEN
		RETURN (Select json_build_object(
					'Item_Type_Cod', item_types.item_type_cod, 
					'Item_Type_Designation', item_types.designation)
						FROM item_types
                            WHERE item_types.item_type_cod = temp_cod_item_type);
	ELSE
		RAISE 'There is no Item_Type with that Cod!';
	END IF;
END
$$