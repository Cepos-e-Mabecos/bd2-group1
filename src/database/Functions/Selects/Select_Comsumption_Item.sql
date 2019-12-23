CREATE OR REPLACE FUNCTION Select_Comsumption_Item(arg_comsumption_cod BIGINT)
RETURNS JSON
LANGUAGE plpgsql
AS $$
BEGIN
	
	IF(select exists(select 1 From Comsumption_Items 
        where Comsumption_Items.zone_cod = arg_comsumption_cod)) THEN
		RETURN (
            Select json_build_object(
			    'Comsumption_Cod', Comsumptions.comsumption_cod,
                'Comsumption_Items', (
                        select json_object_agg(
                            'Item', Items.designation)
                                FROM Items
                                    INNER JOIN Comsumption_Items
                                        ON Comsumption_Items.item_cod = Items.item_cod
                                            WHERE Comsumption_Items.comsumption_cod = arg_comsumption_cod
                        ))
                    FROM Comsumption_Items 
                        INNER JOIN Comsumptions
                            ON Comsumption_Items.comsumption_cod = Comsumptions.comsumption_cod
                                WHERE Comsumption_Items.comsumption_cod = arg_comsumption_cod);
	ELSE
		RAISE 'There is no Comsumption_Items with the given Comsumption Cod!';
	END IF;
END
$$