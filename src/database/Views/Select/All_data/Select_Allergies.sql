CREATE OR REPLACE VIEW Select_Allergies
AS
SELECT 
    Allergies.allergy_cod, 
    Allergies.designation,
    Allergies.symptom 
    FROM Allergies