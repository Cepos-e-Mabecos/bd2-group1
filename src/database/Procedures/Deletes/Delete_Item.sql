CREATE OR REPLACE PROCEDURE Delete_Item(arg_item_cod BIGINT)
LANGUAGE plpgsql
AS $$
BEGIN
	
	IF(select exists(select 1 From items where items.item_cod = arg_item_cod)) THEN
		DELETE FROM items
			WHERE items.item_cod = arg_item_cod;
	ELSE
		RAISE 'There is no Item with the given Cod!';
	END IF;
END
$$