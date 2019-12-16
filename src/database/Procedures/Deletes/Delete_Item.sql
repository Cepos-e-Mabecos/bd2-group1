CREATE OR REPLACE PROCEDURE Delete_Item(temp_cod_item VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
	
	IF(select exists(select 1 From items where items.item_cod = temp_cod_item)) THEN
		DELETE FROM items
			WHERE items.item_cod = temp_cod_item;
	ELSE
		RAISE 'There is no Item with that Cod!';
	END IF;
END
$$