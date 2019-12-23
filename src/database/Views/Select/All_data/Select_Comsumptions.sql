CREATE OR REPLACE VIEW Select_Comsumptions
AS
SELECT 
    Comsumptions.comsumption_cod, 
    Clients.nif,
    Comsumptions.comsumption_date 
    FROM Comsumptions
        INNER JOIN Clients
            ON Comsumptions.nif = Clients.nif;