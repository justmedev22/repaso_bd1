-- Crear base de datos

CREATE DATABASE <db>;

-- Crear tabla
-- CONSTRAINT SON ESAS PALABRAS QUE LE DAN COHERENCIA
-- primary key , auto increment , default
CREATE TABLE users(
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) UNIQUE NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    age INT UNSIGNED NOT NULL,
    status ENUM('active','inactive') DEFAULT 'inactive',
    bio TEXT ,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP 
);

-- EJERCICIOS

-- OBTENER EL USUARIO CON ID 2
SELECT * FROM users WHERE id = 2;

-- OBTENER EL CORREO ELECTRONICO
SELECT * FROM users where email = 'user8@test.com';

-- Obtener todos los usuarios con una edad mayor 25.
SELECT * FROM users WHERE age > 25;

-- Obtener todos los usuarios con una edad menor 50.
SELECT * FROM users WHERE age < 58;

-- Obtener todos los usuarios que posea una biografia.
SELECT * FROM users WHERE bio IS NULL;

-- Obtener todos los usuarios que NO posea una biografia.
SELECT * FROM users WHERE bio IS NOT NULL;


-- Obtener todos los usuarios que NO posea una biografia.
SELECT * FROM users WHERE bio IS NULL;

-- Obtener todos los usuarios cuya fecha de creacion sea hoy
SELECT * FROM users WHERE created_at > '2021-07-22 00:00:01';

-- OTRA FORMA
SELECT * FROM users WHERE DATE(created_at) = '2021-07-22';


-- Obtener el username de todos los usuarios cuyos id se encuentren en el siguiente listado
-- [1, 2, 3, 4] 
SELECT * FROM users WHERE id IN (1, 2, 3, 4);

-- Obtener las edades de todos los usuarios mayores de edad.
SELECT * FROM users WHERE age >= 18;

-- Obtener el username y correo electronio del usuario con mayor edad. (Done)
SELECT username , email FROM users ORDER BY age DESC LIMIT 1;

-- Obtener el username y correo electronio del usuario con menor edad. (Done)
SELECT username , email FROM users ORDER BY age ASC LIMIT 1;

-- Obtener el username, correo electronio y edad de todos los usuarios 
-- con rangos de edad entre 20 - 55...
SELECT username, email, age FROM users WHERE age > 20 AND age < 55;


-- ***********************
-- PREFIJOS Y SUFIJOS
-- uso de LIKE y el %

SELECT * FROM users WHERE email LIKE '%.com';  -- Obtiene usuarios que TERMINEN en .com
SELECT * FROM users WHERE email LIKE 'users%'; -- Obtiene los usuaios que INICIEN
SELECT * FROM users WHERE email LIKE '%@%';  -- Obtiene los usuarios que tengan lo que esta en medio del %%

-- ***********************
-- ACTUALIZAR LOS DATOS DE LA TABLA -- me quede en esta parte
-- Para actualizar una parte de la tabla
UPDATE users SET bio='Desarrollador de Software' WHERE id = 1;

-- se pueden actualizar 2 columnas a la vez
UPDATE users SET bio='Desarrollador de Software', username = 'eduardo_gpr' WHERE id = 1;

-- Para eliminar las tablas se debe realizar un delete
DELETE FROM users WHERE id = !;


-- Delete .> Eliminar registros --> Triggers
-- Truncate -> Eliminar registros y restablecer la informacion de la tabla
-- truncate users;
-- reinicia desde 1 el id

