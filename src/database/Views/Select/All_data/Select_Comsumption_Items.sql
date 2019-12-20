CREATE OR REPLACE VIEW Select_Comsumption_Items
AS
SELECT 
    Comsumptions.comsumption_cod AS Comsumption, 
    Items.designation AS Item
    FROM Comsumption_Items
        INNER JOIN Comsumptions
            ON Comsumptions.comsumption_cod = Comsumption_Items.comsumption_cod
        INNER JOIN Items
            ON Items.item_cod = Comsumption_Items.item_cod