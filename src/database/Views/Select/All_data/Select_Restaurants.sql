CREATE OR REPLACE VIEW Select_Restaurants
AS
SELECT 
    Restaurants.restaurant_cod, 
    Locals.designation as Local_Designation, 
    Restaurants.designation 
    FROM Restaurants INNER JOIN Locals
        ON Restaurants.local_cod = Locals.local_cod;