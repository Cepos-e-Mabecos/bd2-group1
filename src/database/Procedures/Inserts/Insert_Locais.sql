CREATE OR REPLACE PROCEDURE Insert_Local(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- Insert into table locais
    INSERT INTO locais SELECT cod_tipo_local,designacao FROM json_populate_record(
        NULL::locais,
        $1 
    );

END
$$