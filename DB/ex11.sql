# Práctica 03
-- @blocks
DROP DATABASE IF EXISTS ex11;
CREATE DATABASE ex11  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
USE ex11;

/*
Exercici 9:
Crea una taula anomenada EMPLEAT amb les següents característiques: • codi: enter numèric de 4 dígits
• nom: de tipus caràcter amb longitud 15
• cognoms: de tipus caràcter amb longitud 30 • treball: de tipus caràcter amb longitud 10
• codi_carrec: enter numèric de 4 dígits
• data_contracte: data
• salari: nombre enter de 7 dígits
• comissio: nombre enter de 7 dígits
• departament: enter numèric de 2 dígits
A més el codi d’empleat serà una clau primària.

*/
-- @block
CREATE TABLE empleat(
    codi INT(4),
    nom CHAR(20) NOT NULL,
    cognoms CHAR(30) NOT NULL,
    codi_contracte DATE,
    salari SMALLINT(7) NOT NULL,
    comissio SMALLINT(7) NOT NULL,
    departament SMALLINT(2) NOT NULL,
    PRIMARY KEY (codi)
);
-- @block
# Exercici 10
ALTER TABLE empleat MODIFY salari DECIMAL(7,2) NOT NULL;

-- @block
# Exercici 11

CREATE TABLE departament(
    numero_dep int(2) NOT NULL,
    nom_dep CHAR(9) NOT NULL,
    localitzacio CHAR(10),
    UNIQUE (numero_dep)
);

/*
Exercici 12:
Crea una taula anomenada DEPARTAMENT2 amb els mateixos
 camps que la taula DEPARTAMENT, però afegint que la clau principal
  sigui el camp numero_dep.
*/
-- @blocks
DROP TABLE IF EXISTS departament2;
CREATE TABLE departament2(
    numero_dep int(2) NOT NULL,
    nom_dep CHAR(9) NOT NULL,
    localitzacio CHAR(10),
    PRIMARY KEY (numero_dep)
);
/*
Exercici 13:
Crea la taula EMPLEAT2 amb els mateixos camps que la taula EMPLEAT,
 de manera que la columna departament tingui com clau externa la
  clau primària departament de la columna departament de la taula
  DEPARTAMENT2.
*/
-- @block
DROP TABLE IF EXISTS empleat2;
CREATE TABLE empleat2(
    codi INT(4),
    nom CHAR(20) NOT NULL,
    cognoms CHAR(30) NOT NULL,
    codi_contracte DATE,
    salari SMALLINT(7) NOT NULL,
    comissio SMALLINT(7) NOT NULL,
    PRIMARY KEY (codi),

    departament INT(2) NOT NULL,
    FOREIGN KEY(departament) REFERENCES departament2(numero_dep)
);

/*
Exercici 14:
Afegir a la taula EMPLEAT2 la clau única composada
per les dues columnes salari i comissió,
anomenant aquesta clau mitjançant unic_sal_comm.
*/
-- @block
ALTER TABLE empleat2 ADD CONSTRAINT unic_sal_comm UNIQUE(salari, comissio);

/*
Exercici 15:
A la mateixa taula situeu un índex simple de nom index1 sobre la columna codi mitjançant
l’ordre ADD. */

-- @block
CREATE INDEX index1 ON empleat2 (codi);

/*
Exercici 16:
Esborreu el índex de nom índex1 de la taula EMPLEAT2 utilitzant DROP INDEX.
*/
-- @block
DROP INDEX index1 ON empleat2;


/*
Exercici 17:
Esborreu també el índex de nom unic_sal_comm de la mateixa taula utilitzant ALTER.
*/
-- @block
ALTER TABLE empleat2 DROP INDEX unic_sal_comm;

/*
Exercici 18:
Esborreu la clau primària de la taula DEPARTAMENT.
*/
-- @block
ALTER TABLE departament DROP

-- @block
ALTER TABLE departament MODIFY numero_dep VARCHAR(9) PRIMARY KEY;
-- @block
ALTER TABLE departament DROP PRIMARY KEY;
-- @block

ALTER TABLE departament DROP INDEX numero_dep;

-- @block
ALTER TABLE departament ADD UNIQUE (nom_dep);
