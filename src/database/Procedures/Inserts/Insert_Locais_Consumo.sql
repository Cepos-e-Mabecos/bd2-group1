CREATE OR REPLACE PROCEDURE Insert_Local_Consumo(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- Insert into table locais_consumos
    INSERT INTO locais_consumos SELECT designacao,cupao FROM json_populate_record(
        NULL::locais_consumos,
        $1 
    );

END
$$