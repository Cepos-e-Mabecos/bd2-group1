CREATE OR REPLACE PROCEDURE Insert_Local(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- Insert into table Locals
    INSERT INTO Locals SELECT cod_local_type,designation FROM json_populate_record(
        NULL::Locals,
        $1 
    );

END
$$