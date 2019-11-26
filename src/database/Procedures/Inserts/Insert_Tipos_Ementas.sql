CREATE OR REPLACE PROCEDURE Insert_Tipo_Ementa(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- Insert into table tipo_ementas
    INSERT INTO tipo_ementas SELECT designacao FROM json_populate_record(
        NULL::tipo_ementas,
        $1 
    );

END
$$