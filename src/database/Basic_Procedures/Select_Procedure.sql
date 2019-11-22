CREATE OR REPLACE PROCEDURE Select_Procedure(table_to_use text, arguments json)
LANGUAGE plpgsql
AS $$
BEGIN
    CASE $1 
            WHEN 'restaurantes' THEN
                IF ($2 != '') THEN
                    
                ELSE
                    SELECT * FROM restaurantes;
                END IF
            WHEN 'alergias' THEN
                IF ($2 != '') THEN
                    
                ELSE
                    SELECT * FROM alergias
                END IF
            WHEN 'clientes' THEN
                IF ($2 != '') THEN
                    
                ELSE
                    SELECT * FROM clientes
                END IF
            WHEN 'consumo' THEN
                IF ($2 != '') THEN
                    
                ELSE
                    SELECT * FROM consumo
                END IF
            WHEN 'datas' THEN
                IF ($2 != '') THEN
                    
                ELSE
                    SELECT * FROM datas
                END IF
            WHEN 'ementas' THEN
                IF ($2 != '') THEN
                    
                ELSE
                    SELECT * FROM ementas
                END IF
            WHEN 'funcionarios' THEN
                IF ($2 != '') THEN
                    
                ELSE
                    SELECT * FROM funcionarios
                END IF
            WHEN 'items' THEN
                IF ($2 != '') THEN
                    
                ELSE
                    SELECT * FROM items
                END IF
            WHEN 'items_ementas' THEN
                IF ($2 != '') THEN
                    
                ELSE
                    SELECT * FROM items_ementas
                END IF
            WHEN 'locais' THEN
                IF ($2 != '') THEN
                    
                ELSE
                    SELECT * FROM locais
                END IF
            WHEN 'locais_consumo' THEN
                IF ($2 != '') THEN
                    
                ELSE
                    SELECT * FROM locais_consumo
                END IF
            WHEN 'tipo_ementa' THEN
                IF ($2 != '') THEN
                    
                ELSE
                    SELECT * FROM tipo_ementa
                END IF
            WHEN 'tipo_item' THEN
                IF ($2 != '') THEN
                    
                ELSE
                    SELECT * FROM tipo_item
                END IF
            WHEN 'tipo_local' THEN
                IF ($2 != '') THEN
                    
                ELSE
                    SELECT * FROM tipo_local
                END IF
            WHEN 'items_alergias' THEN
                IF ($2 != '') THEN
                    
                ELSE
                    SELECT * FROM items_alergias
                END IF
END
$$;
