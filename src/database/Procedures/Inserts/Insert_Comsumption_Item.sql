CREATE OR REPLACE PROCEDURE Insert_Comsumption_Item(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN
		INSERT INTO Comsumption_Items (comsumption_cod,item_cod) 
			SELECT comsumption_cod,item_cod FROM json_populate_record(
				NULL::Comsumption_Items,
				$1 
		);
END	
$$	