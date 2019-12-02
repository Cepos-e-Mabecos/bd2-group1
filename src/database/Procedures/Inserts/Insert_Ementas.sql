CREATE OR REPLACE PROCEDURE Insert_Ementa(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- Insert into table ementas
    INSERT INTO ementas SELECT cod_tipo_ementa,cod_restaurante,cod_data FROM json_populate_record(
        NULL::ementas,
        $1 
    );

END
$$