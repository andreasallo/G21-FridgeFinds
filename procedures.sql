-- Eliminar procedimientos existentes si existen
DROP PROCEDURE IF EXISTS AddFoodToFridge;
DROP PROCEDURE IF EXISTS RemoveFoodFromFridge;
DROP PROCEDURE IF EXISTS RecommendRecipes;
DROP PROCEDURE IF EXISTS AddRecipe;

-- Crear procedimiento AddFoodToFridge para añadir alimentos a la nevera digital
DELIMITER //

CREATE PROCEDURE AddFoodToFridge(
    IN p_ingredient_name VARCHAR(255),
    IN p_quantity FLOAT,
    IN p_expire_date DATE
)
BEGIN
    DECLARE v_ingredient_id INT;

    INSERT INTO Ingredient (name) VALUES (p_ingredient_name)
    ON DUPLICATE KEY UPDATE id=LAST_INSERT_ID(id);

    SET v_ingredient_id = LAST_INSERT_ID();

    INSERT INTO FridgeFood (ingredient_id, quantity, expire_date)
    VALUES (v_ingredient_id, p_quantity, p_expire_date);
END //

DELIMITER ;

-- Crear procedimiento RemoveFoodFromFridge para eliminar un alimento de la nevera
DELIMITER //

CREATE PROCEDURE RemoveFoodFromFridge(
    IN p_food_id INT
)
BEGIN
    DELETE FROM FridgeFood WHERE id = p_food_id;
END //

DELIMITER ;

-- Crear procedimiento RecommendRecipes para recomendar recetas segun los alimentos disponibles en la nevera
DELIMITER //

CREATE PROCEDURE RecommendRecipes()
BEGIN
    SELECT 
        r.id, r.name, r.duration, r.num_people, r.steps
    FROM 
        Recipe r
    JOIN 
        Recipe_Ingredients ri ON r.id = ri.recipe_id
    JOIN 
        FridgeFood ff ON ri.ingredient_id = ff.ingredient_id
    GROUP BY 
        r.id, r.name, r.duration, r.num_people, r.steps
    HAVING 
        COUNT(ri.ingredient_id) = (
            SELECT COUNT(DISTINCT ri2.ingredient_id)
            FROM Recipe_Ingredients ri2
            WHERE ri2.recipe_id = r.id
        )
    AND
        MIN(ff.quantity) >= MIN(ri.quantity);
END //

DELIMITER ;

-- Crear procedimiento AddRecipe para añadir recetas
DELIMITER //

CREATE PROCEDURE AddRecipe(
    IN p_recipe_name VARCHAR(255),
    IN p_duration INT,
    IN p_num_people INT,
    IN p_steps TEXT,
    IN p_ingredients JSON
)
BEGIN
    DECLARE v_recipe_id INT;
    DECLARE v_ingredient_id INT;
    DECLARE v_ingredient_name VARCHAR(255);
    DECLARE v_quantity FLOAT;
    DECLARE v_index INT DEFAULT 0;

    INSERT INTO Recipe (name, duration, num_people, steps)
    VALUES (p_recipe_name, p_duration, p_num_people, p_steps);

    SET v_recipe_id = LAST_INSERT_ID();

    WHILE v_index < JSON_LENGTH(p_ingredients) DO
        SET v_ingredient_name = JSON_UNQUOTE(JSON_EXTRACT(p_ingredients, CONCAT('$[', v_index, '].name')));
        SET v_quantity = JSON_EXTRACT(p_ingredients, CONCAT('$[', v_index, '].quantity'));

        -- Inserta el ingrediente en la tabla Ingredient si no existe
        INSERT INTO Ingredient (name) VALUES (v_ingredient_name)
        ON DUPLICATE KEY UPDATE id=LAST_INSERT_ID(id);

        SET v_ingredient_id = LAST_INSERT_ID();

        INSERT INTO Recipe_Ingredients (recipe_id, ingredient_id, quantity)
        VALUES (v_recipe_id, v_ingredient_id, v_quantity);

        SET v_index = v_index + 1;
    END WHILE;
END //

DELIMITER ;