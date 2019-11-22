CREATE OR REPLACE PROCEDURE Delete_Procedure(table_to_use text,cod INT)
LANGUAGE plpgsql
AS $$
BEGIN
    CASE $1 
            WHEN 'restaurantes' THEN
                DELETE FROM restaurantes 
                        WHERE restaurantes.cod_restaurante == $2
            WHEN 'alergias' THEN
                DELETE FROM alergias
                        WHERE alergias.cod_alergia == $2
            WHEN 'clientes' THEN
                DELETE FROM clientes 
                    WHERE clientes.cod_cliente == $2
            WHEN 'consumo' THEN
                DELETE FROM consumo 
                    WHERE consumo.cod_consumo == $2
            WHEN 'datas' THEN
                DELETE FROM datas 
                    WHERE datas.cod_data == $2
            WHEN 'ementas' THEN
                DELETE FROM ementas 
                    WHERE ementas.cod_ementa == $2
            WHEN 'funcionarios' THEN
                DELETE FROM funcionarios
                    WHERE funcionarios.cod_funcionario == $2
            WHEN 'items' THEN
                DELETE FROM items
                    WHERE items.cod_item == $2
            WHEN 'items_ementas' THEN
                DELETE FROM items_ementas
            WHEN 'locais' THEN
                DELETE FROM locais
            WHEN 'locais_consumo' THEN
                DELETE FROM locais_consumo
            WHEN 'tipo_ementa' THEN
                DELETE FROM tipo_ementa
            WHEN 'tipo_item' THEN
                DELETE FROM tipo_item
            WHEN 'tipo_local' THEN
                DELETE FROM tipo_local
            WHEN 'items_alergias' THEN
                DELETE FROM items_alergias
END
$$;
