CREATE OR REPLACE VIEW Select_Item_Allergies
AS
SELECT 
    Items.designation AS Items, 
    Allergies.designation AS Allergy
    FROM Item_Allergies
        INNER JOIN Items
            ON Items.item_cod = Item_Allergies.item_cod
        INNER JOIN Allergies
            ON Allergies.allergy_cod = Item_Allergies.allergy_cod