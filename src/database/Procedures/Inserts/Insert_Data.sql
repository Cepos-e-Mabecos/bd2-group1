CREATE OR REPLACE PROCEDURE Insert_Data(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- Insert into table datas
    INSERT INTO datas SELECT dia,hora FROM json_populate_record(
        NULL::datas,
        $1 
    );

END
$$