CREATE DATABASE IF NOT EXISTS FridgeFinds;
USE FridgeFinds;

-- Eliminar tablas en el orden correcto para manejar las restricciones de claves foráneas
DROP TABLE IF EXISTS `Recipe_Ingredients`;
DROP TABLE IF EXISTS `FridgeFood`;
DROP TABLE IF EXISTS `Ingredient`;
DROP TABLE IF EXISTS `Recipe`;

-- Crear la tabla para las recetas
CREATE TABLE `Recipe` (
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL,
    `duration` INT, -- Duración en minutos
    `num_people` INT, -- Número de personas
    `steps` TEXT
);

-- Crear la tabla para los ingredientes
CREATE TABLE `Ingredient` (
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(255) NOT NULL
);

-- Crear la tabla para los alimentos disponibles en la nevera digital
CREATE TABLE `FridgeFood` (
    `id` INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `ingredient_id` INT,
    `quantity` FLOAT NOT NULL,
    `expire_date` DATE,
    FOREIGN KEY (ingredient_id) REFERENCES Ingredient(id) ON DELETE CASCADE
);

-- Crear la tabla intermedia para los ingredientes de las recetas
CREATE TABLE `Recipe_Ingredients` (
    `recipe_id` INT,
    `ingredient_id` INT,
    `quantity` FLOAT NOT NULL,
    FOREIGN KEY (recipe_id) REFERENCES Recipe(id),
    FOREIGN KEY (ingredient_id) REFERENCES Ingredient(id)
);


-- Insertar los datos en la tabla Recipe
INSERT INTO Recipe (id, name, duration, num_people, steps) VALUES
(1, 'Ensalada Cesar', 10, 2, 'Cortar la lechuga, mezclar con pollo y aderezo'),
(2, 'Pasta Carbonara', 20, 4, 'Cocinar la pasta, preparar la salsa con huevo y panceta'),
(3, 'Sopa de Tomate', 15, 3, 'Cocinar los tomates, agregar agua y especias'),
(4, 'Pollo al Horno', 60, 4, 'Marinar el pollo, hornear por 1 hora'),
(5, 'Arroz con Leche', 40, 6, 'Cocinar el arroz, añadir leche y azúcar'),
(6, 'Panqueques', 25, 4, 'Mezclar ingredientes, cocinar en sartén'),
(7, 'Pizza Margarita', 30, 4, 'Preparar la masa, añadir salsa y queso'),
(8, 'Tarta de Manzana', 50, 8, 'Preparar la masa, añadir manzanas y hornear'),
(9, 'Gazpacho', 20, 4, 'Mezclar tomates, pepinos y pimientos'),
(10, 'Lentejas', 90, 6, 'Cocinar lentejas con chorizo y vegetales'),
(11, 'Tacos de Pescado', 25, 4, 'Preparar pescado, montar tacos con salsa'),
(12, 'Paella', 90, 6, 'Cocinar arroz con mariscos y azafrán'),
(13, 'Brownies', 45, 8, 'Mezclar ingredientes, hornear'),
(14, 'Hamburguesa', 20, 2, 'Preparar carne, montar hamburguesa con pan y vegetales'),
(15, 'Guacamole', 15, 4, 'Mezclar aguacate, tomate y cebolla'),
(16, 'Omelette', 10, 1, 'Batir huevos, cocinar con vegetales'),
(17, 'Smoothie de Frutas', 10, 2, 'Mezclar frutas y yogur en licuadora'),
(18, 'Puré de Papas', 30, 4, 'Cocinar papas, triturar con mantequilla y leche'),
(19, 'Sushi', 60, 4, 'Preparar arroz, montar sushi con pescado y algas'),
(20, 'Curry de Pollo', 45, 4, 'Cocinar pollo con curry y leche de coco'),
(21, 'Enchiladas', 30, 4, 'Rellenar tortillas, hornear con salsa'),
(22, 'Lasagna', 60, 6, 'Montar capas de pasta, carne y queso'),
(23, 'Chili con Carne', 90, 6, 'Cocinar carne con frijoles y especias'),
(24, 'Ratatouille', 40, 4, 'Cocinar vegetales en capas'),
(25, 'Papas Fritas', 15, 4, 'Freír papas en aceite'),
(26, 'Crema de Calabaza', 30, 4, 'Cocinar calabaza, triturar con crema'),
(27, 'Pollo a la Naranja', 50, 4, 'Cocinar pollo con salsa de naranja'),
(28, 'Flan', 60, 8, 'Preparar flan, hornear en baño maría'),
(29, 'Mousaka', 90, 6, 'Montar capas de berenjena, carne y bechamel'),
(30, 'Fajitas de Pollo', 25, 4, 'Cocinar pollo con pimientos, montar fajitas'),
(31, 'Croquetas', 45, 8, 'Preparar bechamel con jamón, empanar y freír'),
(32, 'Empanada Gallega', 90, 6, 'Preparar masa, rellenar con atún y pimientos'),
(33, 'Quiche Lorraine', 50, 6, 'Preparar masa, rellenar con huevo y panceta'),
(34, 'Sopa de Cebolla', 45, 6, 'Cocinar cebolla, añadir caldo y gratinar con queso'),
(35, 'Guiso de Ternera', 120, 6, 'Cocinar ternera con vegetales y vino'),
(36, 'Pollo a la Cazadora', 60, 4, 'Cocinar pollo con tomate, setas y vino'),
(37, 'Tortellini', 30, 4, 'Cocinar pasta rellena, añadir salsa'),
(38, 'Calamares a la Romana', 25, 4, 'Rebozar calamares, freír'),
(39, 'Bizcocho', 50, 8, 'Mezclar ingredientes, hornear'),
(40, 'Ensalada Griega', 15, 4, 'Mezclar tomate, pepino, cebolla y queso feta'),
(41, 'Fondue de Queso', 20, 4, 'Derretir queso, mojar pan'),
(42, 'Espaguetis a la Boloñesa', 45, 4, 'Cocinar pasta, preparar salsa de carne'),
(43, 'Tarta de Queso', 90, 8, 'Preparar base, mezclar queso, hornear'),
(44, 'Caldo de Pollo', 120, 6, 'Cocinar pollo con vegetales y especias'),
(45, 'Pimientos Rellenos', 60, 4, 'Rellenar pimientos con carne, hornear'),
(46, 'Salmorejo', 20, 4, 'Mezclar tomate, pan, ajo y jamón'),
(47, 'Macarrones con Chorizo', 30, 4, 'Cocinar pasta, añadir chorizo y tomate'),
(48, 'Sopa Minestrone', 40, 6, 'Cocinar pasta con vegetales y alubias'),
(49, 'Risotto de Champiñones', 40, 4, 'Cocinar arroz con champiñones y caldo'),
(50, 'Calamares en su Tinta', 60, 4, 'Cocinar calamares con su tinta');

-- Insertar los datos en la tabla Ingredient
INSERT INTO Ingredient (id, name) VALUES
(1, 'Lechuga'),
(2, 'Pollo'),
(3, 'Huevo'),
(4, 'Queso parmesano'),
(5, 'Tomate'),
(6, 'Cebolla'),
(7, 'Pimiento rojo'),
(8, 'Diente de ajo'),
(9, 'Limón'),
(10, 'Arroz'),
(11, 'Pasta'),
(12, 'Leche'),
(13, 'Harina'),
(14, 'Manzana'),
(15, 'Aguacate'),
(16, 'Yogur'),
(17, 'Patata'),
(18, 'Calabaza'),
(19, 'Naranja'),
(20, 'Carne picada'),
(21, 'Tortilla de maíz'),
(22, 'Carne molida'),
(23, 'Garbanzos'),
(24, 'Lenteja'),
(25, 'Champiñón'),
(26, 'Pimiento verde'),
(27, 'Espinaca'),
(28, 'Aceituna'),
(29, 'Aceite de oliva'),
(30, 'Sal'),
(31, 'Pimienta'),
(32, 'Azúcar'),
(33, 'Harina de trigo'),
(34, 'Levadura'),
(35, 'Mantequilla'),
(36, 'Crema de leche'),
(37, 'Queso mozzarella'),
(38, 'Salsa de tomate'),
(39, 'Atún'),
(40, 'Pimiento morrón'),
(41, 'Jamón'),
(42, 'Chorizo'),
(43, 'Alubia blanca'),
(44, 'Caldo de pollo'),
(45, 'Vino tinto'),
(46, 'Pimentón'),
(47, 'Laurel'),
(48, 'Romero'),
(49, 'Tomillo'),
(50, 'Perejil'),
(51, 'Albahaca'),
(52, 'Orégano'),
(53, 'Canela'),
(54, 'Jengibre'),
(55, 'Clavo de olor'),
(56, 'Nuez moscada');

-- Insertar los datos en la tabla FridgeFood
INSERT INTO FridgeFood (id, ingredient_id, quantity, expire_date) VALUES
(1, 3, 1.0, '2024-06-08'), # Huevo (1 unidad, caduca el 08/06/2024)
(2, 7, 2.0, '2024-06-11'), -- Pimiento rojo (2 unidades, caduca el 11/06/2024)
(3, 12, 1.0, '2024-07-31'), -- Leche (1 botella, caduca el 31/07/2024)
(4, 18, 1.0, '2024-06-08'), -- Calabaza (1 unidad, caduca el 08/06/2024)
(5, 5, 500.0, '2024-06-20'), -- Tomates (500 g, caduca el 20/06/2024)
(6, 15, 1.0, '2024-06-06'), -- Aguacate (1 unidad, caduca el 06/06/2024)
(7, 21, 12.0, '2024-06-19'), -- Tortillas de maíz (12 unidades, caduca el 19/06/2024)
(8, 17, 2.0, '2024-06-10'), -- Patatas (2 unidades, caduca el 10/06/2024)
(9, 8, 1.0, '2024-06-09'), -- Diente de ajo (1 unidad, caduca el 09/06/2024)
(10, 6, 1.0, '2024-06-07'), -- Cebolla (1 unidad, caduca el 07/06/2024)
(11, 4, 200.0, '2024-06-12'), -- Queso parmesano (200 g, caduca el 12/06/2024)
(12, 20, 500.0, '2024-06-25'), -- Carne picada (500 g, caduca el 25/06/2024)
(13, 19, 2.0, '2024-06-15'), -- Naranjas (2 unidades, caduca el 15/06/2024)
(14, 13, 250.0, '2024-06-18'), -- Harina (250 g, caduca el 18/06/2024)
(15, 14, 3.0, '2024-06-22'), -- Manzanas (3 unidades, caduca el 22/06/2024)
(16, 10, 250.0, '2024-06-16'), -- Arroz (250 g, caduca el 16/06/2024)
(17, 9, 1.0, '2024-06-14'), -- Limón (1 unidad, caduca el 14/06/2024)
(18, 1, 2.0, '2024-06-10'), -- Lechuga (2 unidades, caduca el 10/06/2024)
(19, 2, 300.0, '2024-06-15'), -- Pollo (300 g, caduca el 15/06/2024)
(20, 16, 250.0, '2024-06-17'), -- Yogur (250 g, caduca el 17/06/2024)
(21, 11, 150.0, '2024-06-13'); -- Pasta (150 g, caduca el 13/06/2024)

-- Insertar los datos en la tabla Recipe_Ingredients
INSERT INTO Recipe_Ingredients (recipe_id, ingredient_id, quantity) VALUES
-- Ensalada Cesar
(1, 1, 1.0), -- Lechuga
(1, 2, 100.0), -- Pollo (100 g)
(1, 3, 1.0), -- Huevo
(1, 4, 50.0), -- Queso parmesano (50 g)
(1, 5, 2.0), -- Tomate (2 unidades)
(1, 6, 0.5), -- Cebolla (0.5 unidad)
(1, 9, 0.5), -- Limón (0.5 unidad)

-- Pasta Carbonara
(2, 3, 2.0), -- Huevo (2 unidades)
(2, 11, 200.0), -- Pasta (200 g)
(2, 4, 50.0), -- Queso parmesano (50 g)
(2, 6, 0.5), -- Cebolla (0.5 unidad)

-- Sopa de Tomate
(3, 5, 400.0), -- Tomate (400 g)
(3, 8, 2.0), -- Diente de ajo (2 unidades)
(3, 6, 1.0), -- Cebolla (1 unidad)
(3, 29, 10.0), -- Aceite de oliva (10 ml)
(3, 30, 1.0), -- Sal (1 pizca)
(3, 31, 1.0), -- Pimienta (1 pizca)

-- Pollo al Horno
(4, 2, 500.0), -- Pollo (500 g)
(4, 29, 20.0), -- Aceite de oliva (20 ml)
(4, 30, 1.0), -- Sal (1 pizca)
(4, 31, 1.0), -- Pimienta (1 pizca)
(4, 46, 1.0), -- Pimentón (1 cucharadita)

-- Arroz con Leche
(5, 10, 200.0), -- Arroz (200 g)
(5, 12, 500.0), -- Leche (500 ml)
(5, 32, 100.0), -- Azúcar (100 g)
(5, 53, 1.0); -- Canela (1 rama)