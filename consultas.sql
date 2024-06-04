-- Añadir 1 kg de Zanahoria que caduca el 15/06/2024
CALL AddFoodToFridge('Zanahoria', 1000.0, '2024-06-15');

-- Añadir 2 litros de Zumo de Naranja que caduca el 20/06/2024
CALL AddFoodToFridge('Zumo de Naranja', 2000.0, '2024-06-20');

-- Añadir 500 ml de Aceite de oliva que caduca el 30/12/2024
CALL AddFoodToFridge('Aceite de oliva', 500.0, '2024-12-30');

-- Añadir 500 g de Sal que caduca el 30/12/2025
CALL AddFoodToFridge('Sal', 500.0, '2025-12-30');

-- Eliminar el alimento con id 5 de la nevera
CALL RemoveFoodFromFridge(5);

SELECT * FROM FridgeFood;

CALL RecommendRecipes();

-- Añadir recetas:
CALL AddRecipe(
    'Ensalada de Tomate y Lechuga',
    10, -- Duración en minutos
    2, -- Número de personas
    '1. Lavar y cortar la lechuga.\n2. Cortar los tomates en rodajas.\n3. Mezclar la lechuga y los tomates en un bol.\n4. Añadir aceite de oliva y sal al gusto.\n5. Servir inmediatamente.',
    '[{"name": "Lechuga", "quantity": 1.0}, {"name": "Tomates", "quantity": 200.0}, {"name": "Aceite de oliva", "quantity": 20.0}, {"name": "Sal", "quantity": 5.0}]'
);

CALL AddRecipe(
    'Tortilla de patatas',
    30, -- Duración en minutos
    4, -- Número de personas
    '1. Pelar y cortar las patatas en rodajas finas.\n2. Freír las patatas en aceite hasta que estén blandas.\n3. Batir los huevos en un bol grande.\n4. Añadir las patatas fritas a los huevos batidos y mezclar.\n5. Verter la mezcla en una sartén caliente con un poco de aceite.\n6. Cocinar a fuego medio hasta que esté dorada por ambos lados.\n7. Servir caliente o fría.',
    '[{"name": "Patatas", "quantity": 3.0}, {"name": "Huevo", "quantity": 6.0}, {"name": "Aceite de oliva", "quantity": 50.0}, {"name": "Sal", "quantity": 10.0}]'
);

SELECT * FROM Recipe;
