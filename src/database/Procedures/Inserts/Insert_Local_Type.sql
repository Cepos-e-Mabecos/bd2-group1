CREATE OR REPLACE PROCEDURE Insert_Local_Type(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- Insert into table Local_Types
    INSERT INTO Local_Types SELECT designation FROM json_populate_record(
        NULL::Local_Types,
        $1 
    );

END
$$