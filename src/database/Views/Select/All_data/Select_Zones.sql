CREATE OR REPLACE VIEW Select_Zones
AS
SELECT 
    Zones.zone_cod,
    Restaurants.designation AS Restaurants,
    Zones.designation AS Designation
        FROM Zones
            INNER JOIN Restaurants
                ON Zones.restaurant_cod = Restaurants.restaurant_cod;