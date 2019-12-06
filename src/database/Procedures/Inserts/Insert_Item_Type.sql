CREATE OR REPLACE PROCEDURE Insert_Item_Type(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- Insert into table Item_Types
    INSERT INTO Item_Types SELECT designacao FROM json_populate_record(
        NULL: Item_Types,
        $1 
    );

END
$$