CREATE OR REPLACE PROCEDURE Insert_Tipo_Local(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- Insert into table tipos_locais
    INSERT INTO tipos_locais SELECT designacao FROM json_populate_record(
        NULL::tipos_locais,
        $1 
    );

END
$$