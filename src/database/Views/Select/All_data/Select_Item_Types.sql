CREATE OR REPLACE VIEW Select_Item_Types
AS
SELECT 
    Item_Types.item_type_cod, 
    Item_Types.designation
        FROM Item_Types