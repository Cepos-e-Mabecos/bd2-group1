CREATE OR REPLACE PROCEDURE Insert_Allergy_Item(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- Insert into table Allergy_Items
    INSERT INTO Allergy_Items SELECT cod_item,cod_allergy FROM json_populate_record(
        NULL::Allergy_Items,
        $1 
    );

END
$$