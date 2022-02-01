DROP DATABASE IF EXISTS ex2;
CREATE DATABASE ex2  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
USE ex2;

CREATE TABLE ciudat(
    nom          CHAR(25)    PRIMARY KEY,
    comarca      CHAR(25)    NOT NULL,
    provincia    CHAR(25)    NOT NULL,
    habitants    SMALLINT
);
