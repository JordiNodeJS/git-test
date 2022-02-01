# Exercici 20:
-- @block
DROP DATABASE IF EXISTS centre_educatiu;
CREATE DATABASE centre_educatiu DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
USE centre_educatiu;
CREATE TABLE familia (
    codi CHAR(3) NOT NULL PRIMARY KEY,
    descripcion CHAR(70) NOT NULL
);
CREATE TABLE cicle_formatiu (
    codi CHAR(4) NOT NULL PRIMARY KEY,
    titol CHAR(70) NOT NULL UNIQUE,
    grau ENUM('grau mitjà', 'grau superior'),
    codi_familia CHAR(3) NOT NULL,
    FOREIGN KEY(codi_familia) REFERENCES familia(codi)
);

CREATE TABLE modul (
    num INT,
    titol CHAR(70),
    codi_cicle_formatiu CHAR(4) NOT NULL,
    PRIMARY KEY (num, codi_cicle_formatiu),
    FOREIGN KEY(codi_cicle_formatiu) REFERENCES cicle_formatiu(codi)
);
CREATE TABLE unitat_formativa (
    num INT not null,
    titol CHAR(70) NOT NULL,
    num_modul INT NOT NULL,
    codi_cicle_formatiu CHAR(4) NOT NULL,
    PRIMARY KEY (num, num_modul, codi_cicle_formatiu),
  FOREIGN KEY(num_modul, codi_cicle_formatiu) REFERENCES modul(num, codi_cicle_formatiu),
  FOREIGN KEY(codi_cicle_formatiu) REFERENCES cicle_formatiu(codi)
) AUTO_INCREMENT=1, ENGINE = InnoDB;

INSERT INTO familia VALUES ('INF' ,'Informàtica i comunicació');
INSERT INTO familia VALUES ('ADM' ,'Administració i gestió');
INSERT INTO familia VALUES ('COM' ,'Comerç i màrqueting');
INSERT INTO familia VALUES ('HOT' ,'Hoteleria i turisme');


INSERT INTO cicle_formatiu VALUES('SMIX', 'Cicle de grau mitjà de Sistemes microinformàtics i xarxes', 'grau mitjà' , 'INF');
INSERT INTO cicle_formatiu VALUES('ASIX', 'Administració de sistemes informàtics en la xarxa', 'grau superior', 'ADM');
INSERT INTO cicle_formatiu VALUES('DAM', 'Desenvolupament d’aplicacions multiplataforma', 'grau superior', 'INF');
INSERT INTO cicle_formatiu VALUES('DAW', 'Desenvolupament d’aplicacions web', 'grau superior', 'INF');


INSERT INTO modul VALUES (1, 'Muntatge i manteniment d’equips', 'SMIX');
INSERT INTO modul VALUES (2, 'Sistemes operatius monolloc', 'SMIX');
INSERT INTO modul VALUES (1, 'Implantació de sistemes operatius', 'ASIX');
INSERT INTO modul VALUES (2, 'Gestió de bases de dades', 'ASIX');
INSERT INTO modul VALUES (3, 'Programació bàsica', 'ASIX');

INSERT INTO unitat_formativa VALUES (1, 'Electricitat a l’ordinador', 1, 'SMIX');
INSERT INTO unitat_formativa VALUES (2, 'Components d’un equip microinformàtic', 1, 'SMIX');
INSERT INTO unitat_formativa VALUES (3, 'Muntatge d’un equip microinformàtic', 1, 'SMIX');
INSERT INTO unitat_formativa VALUES (1, 'Introducció als sistemes operatius', 2, 'SMIX');
INSERT INTO unitat_formativa VALUES (2, 'Sistemes operatius propietaris', 2, 'SMIX');
INSERT INTO unitat_formativa VALUES (1, 'Instal·lació, configuració i explotació del sistema
informàtic', 1, 'ASIX');
INSERT INTO unitat_formativa VALUES (2, 'Gestió de la informació i de recursos en una xarxa', 1, 'ASIX');
INSERT INTO unitat_formativa VALUES (1, 'Introducció a les bases de dades', 2, 'ASIX');
INSERT INTO unitat_formativa VALUES (2, 'Llenguatges SQL: DML i DDL', 2, 'ASIX');
INSERT INTO unitat_formativa VALUES (1, 'Programació estructurada', 3, 'ASIX');
-- @block
