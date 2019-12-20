CREATE OR REPLACE PROCEDURE Delete_Comsumption_Item(arg_comsumption_cod BIGINT, arg_item_cod BIGINT)
LANGUAGE plpgsql
AS $$
BEGIN
	IF(select exists(
            select 1 From Comsumption_Items 
                where 
                    Comsumption_Items.comsumption_cod = arg_comsumption_cod
                AND
                    Comsumption_Items.item_cod = arg_item_cod)) THEN
		DELETE FROM Comsumption_Items
			WHERE 
                Comsumption_Items.item_cod = arg_item_cod
            AND
                Comsumption_Items.comsumption_cod = arg_comsumption_cod;
	ELSE
		RAISE 'There is no Comsumption_Item with the given Comsumption and Item Cod!';
	END IF;
END
$$