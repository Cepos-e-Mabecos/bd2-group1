CREATE OR REPLACE PROCEDURE Insert_Allergy(json_data JSON)
LANGUAGE plpgsql
AS $$
BEGIN

    -- Insert into table Allergies
    INSERT INTO Allergies SELECT symptom FROM json_populate_record(
        NULL::Allergies,
        $1 
    );

END
$$