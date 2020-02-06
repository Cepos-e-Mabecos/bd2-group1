CREATE OR REPLACE VIEW Select_Clients
AS
SELECT 
    Clients.nif,
    clients.first_name,
    clients.last_name
    FROM Clients