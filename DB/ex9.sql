-- @blocks
DROP DATABASE IF EXISTS ex9;
CREATE DATABASE ex9  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
USE ex9;
-- @blocks
CREATE TABLE via
(
    codi INT
);
-- @blocks
ALTER TABLE via ADD descripcio CHAR(4);
-- @blocks
ALTER TABLE via MODIFY descripcio CHAR(8);
ALTER TABLE via CHANGE codi ccc SMALLINT;
ALTER TABLE via RENAME via_acces;
ALTER TABLE via_acces DROP descripcio;

-- @blocks

DROP DATABASE IF EXISTS ex9;
CREATE DATABASE ex9  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
USE ex9;
CREATE TABLE materia
(codi_materia INT AUTO_INCREMENT PRIMARY KEY,
materia VARCHAR(20),
departament VARCHAR(20)
);

SHOW INDEX FROM materia;
ALTER TABLE materia MODIFY materia VARCHAR(20) UNIQUE;
SHOW INDEX FROM materia;
CREATE INDEX departament ON materia (departament);
SHOW INDEX FROM materia;
