-- Forma de relacionar nuestras tablas 
-- 1 a muchos

-- Un usuario puede poseer multiples comentarios
-- Comentario le pertene a un usuario

-- Comments

CREATE TABLE comments(
    id INT AUTO_INCREMENT PRIMARY KEY, -- UNICO
    title VARCHAR(50),
    user_id INT, -- llave foranea
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id)
);
 
-- VAMOS CON LOS EJERCICIOS
-- Un usuario puede poseer múltiples comentarios y un comentario le pertenece a un usuario
 
-- Obtener todos los usuarios con por lo menos un comentario.
-- INNER JOIN , Intersecciona las tablas
SELECT * FROM users INNER JOIN comments ON users.id = comments.user_id;

-- Obtener todos los usuarios activos con por lo menos un comentario.
SELECT users.username, users.email FROM users INNER JOIN comments 
ON users.id = comments.user_id WHERE users.status = 'active';

---------------------------------

-- variables
-- datos a almacenar
-- con esto remplezas con el arroba el nombre
set @username = 'user1';

-- conocer el valor de una variable 
SELECT @username -- nombre de la VARIABLES

-- renombrar una columna
SELECT @username AS 'valor';

-- uso de variables en consultas
SELECT * FROM users WHERE username = @username;

-- otro ejemplo 
set @username = 'user3';

-- puedes uarlo para comparaciones de consultas
select * from users where username = @username;


-- mas ejemplos muestra solo un resultado
SELECT id FROM users WHERE status = 'active' ORDER BY created_at DESC LIMIT 1;

-- reemplaza la consulta en una sola variable
SET @id = (SELECT id FROM users WHERE status = 'active' ORDER BY created_at DESC LIMIT 1);

-- y luego se realiza la consulta con el ejemplo anterior
SELECT @id; -- aqui ya esta guardado toda la consulta anterior