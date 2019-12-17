CREATE OR REPLACE VIEW Select_Menu_Items
AS
SELECT 
    Menus.designation AS Menu_Designation,
    Items.designation AS Item_Designation 
    FROM Menu_Items
        INNER JOIN Items
            ON Menu_Items.item_cod = Items.item_cod
        INNER JOIN Menus
            ON Menu_Items.menu_cod = Menus.menu_cod;