DROP DATABASE IF EXISTS ex6;
CREATE DATABASE ex6  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
USE ex6;

CREATE TABLE fabricante (
    cd_fab          INT         PRIMARY KEY,
    nom_fab         CHAR(20)       NOT NULL,
    web_fab         CHAR(20),
    Telf            CHAR(15)       NOT NULL
);

CREATE TABLE producto (
    cd_prod         INT               PRIMARY KEY,
    nom_prod        CHAR(9)           UNIQUE,
    description     CHAR(10)          NOT NULL,
    categoria       CHAR(20)          NOT NULL,
    precio          DECIMAL(5,2)      NOT NULL,
    cd_fab          INT NOT NULL,
    FOREIGN KEY(cd_fab) REFERENCES fabricante(cd_fab)
);
