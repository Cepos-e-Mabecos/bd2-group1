CREATE OR REPLACE VIEW Select_Menu_Items
AS
SELECT 
    Menus.designation AS Menu, 
    Items.designation AS Item
    FROM Menu_Items
        INNER JOIN Menus
            ON Menus.menu_cod = Menu_Items.menu_cod
        INNER JOIN Items
            ON Items.item_cod = Menu_Items.item_cod