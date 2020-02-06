CREATE OR REPLACE VIEW Select_Items
AS
SELECT 
    Items.item_cod, 
    Items.item_type_cod,
    Items.designation, 
    Items.price 
    FROM Items;