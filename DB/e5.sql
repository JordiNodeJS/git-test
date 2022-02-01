DROP DATABASE IF EXISTS ex5;
CREATE DATABASE ex5  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
USE ex5;

CREATE TABLE departament (
    numero          NUMERIC(2) PRIMARY KEY,
    nom             CHAR(9)    UNIQUE,
    localizació     CHAR(10)   NOT NULL
);
