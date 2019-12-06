CREATE OR REPLACE PROCEDURE Insert_Food_Menu_Type(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- Insert into table Food_Menu_Types
    INSERT INTO Food_Menu_Types SELECT designation FROM json_populate_record(
        NULL::Food_Menu_Types,
        $1 
    );

END
$$