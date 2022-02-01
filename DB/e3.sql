DROP DATABASE IF EXISTS ex3;
CREATE DATABASE ex3  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
USE ex3;

CREATE TABLE client (
    id_client        SMALLINT(4)   AUTO_INCREMENT PRIMARY KEY,
    nom              CHAR(20)    NOT NULL,
    cognoms          CHAR(20)   NOT NULL,
    data_naixament   DATE,
    tipus            CHAR(15)  DEFAULT 'Habitual',
    UNIQUE (nom, cognoms)
);
