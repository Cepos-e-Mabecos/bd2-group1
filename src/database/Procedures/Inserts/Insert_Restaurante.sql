CREATE OR REPLACE PROCEDURE Insert_Restaurante(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- Insert into table restaurantes
    INSERT INTO restaurantes SELECT cod_local,designacao FROM json_populate_record(
        NULL::restaurantes,
        $1 
    );

END
$$