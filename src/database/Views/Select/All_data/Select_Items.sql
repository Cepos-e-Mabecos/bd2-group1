CREATE OR REPLACE VIEW Select_Items
AS
SELECT 
    Items.item_cod, 
    Items.designation, 
    Item_Types.designation as Item_Type_Designation, 
    Items.price 
    FROM Items
        INNER JOIN Item_Types
            ON Items.item_type_cod = Item_Types.item_type_cod;