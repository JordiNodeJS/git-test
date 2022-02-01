DROP DATABASE IF EXISTS ex10;
CREATE DATABASE ex10  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
USE ex10;

CREATE TABLE alumno(
    cod int AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(20) NOT NULL,
    apellidos VARCHAR(20) NOT NULL,
    fecha DATE
);

-- @blocks
INSERT INTO alumno VALUES (3,'Josep', 'Pla', '1953/12/07');
INSERT INTO alumno VALUES (4,'Maria', 'Pla', '1988/12/07');
-- INSERT INTO alumno (nombre, apellidos) VALUES ('Miquel','Garcia')
INSERT INTO alumno (apellidos, nombre ) VALUES ('Garcia','Miquel')
-- @blocks
INSERT INTO alumno (nombre, apellidos, fecha) VALUES ('Miquelito','Lopez', NULL);

ALTER TABLE alumno MODIFY fecha DATE NOT NULL;
-- UPDATE alumno SET fecha='1999-11-29' WHERE cod in (5);
-- @blocks
INSERT INTO alumno (apellidos, nombre, fecha ) VALUES ('Lopez','Tomás', NULL)
