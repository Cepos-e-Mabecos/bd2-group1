CREATE OR REPLACE PROCEDURE Insert_Alergia(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- Insert into table alergias
    INSERT INTO alergias SELECT sintoma FROM json_populate_record(
        NULL::alergias,
        $1 
    );

END
$$