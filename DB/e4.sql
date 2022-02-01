DROP DATABASE IF EXISTS ex4;
CREATE DATABASE ex4  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
USE ex4;

CREATE TABLE departament (
    numero          SMALLINT(2) NOT NULL,
    nom             CHAR(9)    UNIQUE,
    localizació     CHAR(10)   NOT NULL
);
