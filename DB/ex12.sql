-- @blocks
DROP DATABASE IF EXISTS ex12_empresa;
CREATE DATABASE ex12_empresa DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
-- @block
USE ex12_empresa;
-- @block
CREATE TABLE personal (
    codi INT(4) PRIMARY KEY AUTO_INCREMENT,
    nom VARCHAR(20) NOT NULL,
    cognoms VARCHAR(40) NOT NULL,
    data_naixement DATE,
    salari NUMERIC(6, 2),
    CONSTRAINT unic_nom_cog UNIQUE(nom, cognoms),
    CONSTRAINT sal_pos CHECK(salari >= 0)
) ENGINE = InnoDB;
-- @blocks
INSERT INTO personal
VALUES (null, 'Josep', 'Font', null, 1867.56);
-- @blocks
INSERT INTO personal
VALUES (null, 'Jordi', 'Vila', '1970/2/20', 1243.06);
-- @blocks
INSERT INTO personal
VALUES (null, 'Anna', 'Torner', null, 1243.06);
-- @blocks
INSERT INTO personal
VALUES (null, 'Miquel', 'Ferrando', null, null);
-- @blocks
INSERT INTO personal
VALUES (null, 'Gerard', 'Codina', '1974/5/27', 1402.89);
-- @blocks
INSERT INTO personal
VALUES (6, 'Mercè', 'Vila', '1978/6/27', 1765.00);
-- @blocks
INSERT INTO personal
VALUES (15, 'Marta', 'Casas', null, null);
-- @blocks
INSERT INTO personal
VALUES (null, 'Joel', 'Codina', '1981/2/14', 1402.89);
-- @blocks
INSERT INTO personal
VALUES (20, 'Marta', 'Pérez', '1992/2/20', 0.02);
-- @blocks
INSERT INTO personal
VALUES (null, 'Marta', 'Codina', '1992/2/20', 0.02);
-- @blocks
INSERT INTO personal
VALUES (null, 'Juana', 'Codina', '1992/2/20', 0);
-- @blocks
INSERT INTO personal
VALUES (null, 'Juana', 'Codina', '1992/2/20', 0);
-- @blocks
DELETE FROM personal
WHERE cognoms = 'Codina'
LIMIT 2;
UPDATE personal
SET salari = salari *(1.20);
-- @blocks
ALTER TABLE personal
ADD sexe ENUM('H', 'D');
-- @blocks
UPDATE personal
SET sexe = 'H';
-- @blocks
UPDATE personal
SET sexe = 'D'
WHERE codi IN (3, 6, 15, 20, 25);
-- @blocks
-- Solució de l'exemple c) page 13
ALTER TABLE personal
ADD carrec VARCHAR(20) DEFAULT 'Programador';
-- @blocks
ALTER TABLE personal DROP carrec;
-- @blocks
UPDATE personal
SET carrec = 'Programador';
-- @blocks
UPDATE personal
SET carrec = 'Cap de projecte'
WHERE codi IN (1, 4);
-- @blocks
UPDATE personal
SET salari = 3000
WHERE codi IN (20);
-- @blocks
CREATE TABLE projecte (
    codi SMALLINT AUTO_INCREMENT PRIMARY KEY,
    descripcio VARCHAR(30) NOT NULL,
    cap INT(4),
    CONSTRAINT fk_cap FOREIGN KEY (cap) REFERENCES personal(codi)
) ENGINE = InnoDB;
-- @blocks
-- DROP TABLE IF EXISTS projecte;
-- @block
CREATE TABLE assignat (
    codi_empleat INT NOT NULL,
    codi_projecte SMALLINT NOT NULL,
    data_inici DATE NOT NULL,
    data_final DATE,
    PRIMARY KEY (codi_empleat, codi_projecte),
    CONSTRAINT fk_empleat FOREIGN KEY (codi_empleat) REFERENCES personal(codi),
    CONSTRAINT fk_projecte FOREIGN KEY (codi_projecte) REFERENCES projecte(codi)
) ENGINE = InnoDB;
-- @blocks
-- DROP TABLE IF EXISTS assignat;
-- @blocks
-- @blocks
ALTER TABLE projecte
MODIFY descripcio VARCHAR(40) NOT NULL;
-- @blocks
INSERT INTO projecte
VALUES (null, 'Disseny de BD agència de viatges', 1);
INSERT INTO projecte
VALUES (null, 'Disseny programa gestió hotel', 4);
INSERT INTO projecte
VALUES (null, 'Programa gestió botiga informàtica', 1);
-- @blocks
INSERT INTO assignat
VALUES (1, 3, '2003/3/12', '2004/12/23');
-- @blocks
INSERT INTO assignat
VALUES (4, 4, '2003/3/12', '2004/7/17');
-- @blocks
-- hasta aquí he llegado
INSERT INTO assignat
VALUES (6, 5, '2004/7/18', '2004/12/23');
-- @blocks
INSERT INTO assignat
VALUES (6, 2, '2004/1/7', '2004/9/13');
-- @blocks
INSERT INTO assignat
VALUES (15, 2, '2004/1/7', null);
-- @blocks
INSERT INTO assignat
VALUES (16, 2, '2004/1/7', '2004/9/13');
-- @blocks
INSERT INTO assignat
VALUES (3, 2, '2004/1/7', null);
-- @blocks
INSERT INTO assignat
VALUES (2, 3, '2005/1/7', null);
-- @blocks
INSERT INTO assignat
VALUES (4, 3, '2005/1/7', null);
-- @blocks
INSERT INTO assignat
VALUES (6, 3, '2004/9/14', null);
-- @blocks
INSERT INTO assignat
VALUES (16, 3, '2004/9/14', null);
-- @blocks
