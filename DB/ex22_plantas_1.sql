-- @blocks
DROP DATABASE IF EXISTS plantas;
CREATE DATABASE plantas DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_unicode_ci;
USE plantas;

create table firma_comercial (nom_firma varchar(20) primary key) ENGINE = InnoDB;
create table estacio(nom_estacio varchar(20) primary key) ENGINE = InnoDB;

create table metode_reproduccio(nom_metodo varchar(20) primary key) ENGINE = InnoDB;

create table planta(
  nom_cientific varchar(20) primary key,
  nom_popular varchar(20),
  floracio VARCHAR(20),
  FOREIGN KEY(floracio) REFERENCES estacio(nom_estacio)
) ENGINE = InnoDB;
CREATE TABLE adob(
  nom_adob varchar(20) primary key,
  nom_firma VARCHAR(20),
  tipus_adob ENUM('LLD', 'AI'),
  FOREIGN KEY(nom_firma) REFERENCES firma_comercial(nom_firma)
) ENGINE = InnoDB;
create table planta_interior(
  nom_planta varchar(20) primary key,
  ubicacio VARCHAR(20),
  temperatura SMALLINT(2),
  FOREIGN KEY(nom_planta) REFERENCES planta(nom_cientific)
) ENGINE = InnoDB;
create table planta_exterior(
  nom_planta varchar(20) primary key,
  tipus_planta ENUM('T', 'P') DEFAULT 'P',
  FOREIGN KEY(nom_planta) REFERENCES planta(nom_cientific)
) ENGINE = InnoDB;
create table exemplar_planta(
  nom_planta varchar(20),
  num_exemplar int,
  PRIMARY KEY(nom_planta, num_exemplar),
  FOREIGN KEY(nom_planta) REFERENCES planta(nom_cientific)
) ENGINE = InnoDB;
CREATE TABLE dosi_adob(
  nom_planta varchar(20),
  nom_estacio varchar(20),
  nom_adob varchar(20),
  quantitat_adob SMALLINT(3) NOT NULL CHECK (quantitat_adob >= 20 AND quantitat_adob <= 100),
  PRIMARY KEY(nom_planta, nom_estacio, nom_adob),
  FOREIGN KEY(nom_planta) REFERENCES planta(nom_cientific),
  FOREIGN KEY(nom_estacio) REFERENCES estacio(nom_estacio),
  FOREIGN KEY(nom_adob) REFERENCES adob(nom_adob)
) ENGINE = InnoDB;

CREATE TABLE reproduccio (
    metode_reproduccio varchar(20) NOT NULL,
    nom_planta varchar(20) NOT NULL,
    grau_exit ENUM('Alt','Mitjà', 'Baix'),
    PRIMARY KEY(metode_reproduccio, nom_planta),
    FOREIGN KEY(nom_planta) REFERENCES planta(nom_cientific),
    FOREIGN KEY(metode_reproduccio) REFERENCES metode_reproduccio(nom_metodo)
) ENGINE = InnoDB;

INSERT INTO firma_comercial VALUES ('UOCADOB');
INSERT INTO firma_comercial VALUES ('TIRSADOB');
INSERT INTO firma_comercial VALUES ('PRISADOB');
INSERT INTO firma_comercial VALUES ('CIRSADOB');

INSERT INTO estacio VALUES ('Primavera');
INSERT INTO estacio VALUES ('Estiu');
INSERT INTO estacio VALUES ('Hivern');
INSERT INTO estacio VALUES ('tardor');


INSERT INTO metode_reproduccio VALUES ('Esqueix');
INSERT INTO metode_reproduccio VALUES ('Capficats');
INSERT INTO metode_reproduccio VALUES ('Estaques');
INSERT INTO metode_reproduccio VALUES ('Bulbs');
INSERT INTO metode_reproduccio VALUES ('Estolons');
INSERT INTO metode_reproduccio VALUES ('Llavors');


INSERT INTO planta VALUES ('Geranium', 'Gerani', 'Primavera');
INSERT INTO planta VALUES ('Begonia rex', 'Begònia', 'Estiu');
INSERT INTO planta VALUES ('Camellia', 'Camèlia', 'Primavera');
INSERT INTO planta VALUES ('Cyclamen', 'Ciclamen', 'Hivern');
INSERT INTO planta VALUES ('Rosa', 'Roser', 'Primavera');
INSERT INTO planta VALUES ('Polystichum', 'Falguera', NULL);
INSERT INTO planta VALUES ('Tulipa', 'Tulipa', 'Primavera');
INSERT INTO planta VALUES ('Chrysanthemum', 'Crisantem', 'Estiu');
INSERT INTO planta VALUES ('Philodendron', 'Potus', NULL);
INSERT INTO planta VALUES ('Chlorophytum', 'Cintes', NULL);
INSERT INTO planta VALUES ('Euphorbia', 'Poinsetia', 'Hivern');
INSERT INTO planta VALUES ('Hedera', 'Heura', NULL);
INSERT INTO planta VALUES ('Ficus', 'Ficus Benjamina', NULL);
INSERT INTO planta VALUES ('Codiaeum', 'Croton', NULL);


INSERT INTO adob VALUES ('Plantavit', 'UOCADOB', 'LLD');
INSERT INTO adob VALUES ('Vitaplant', 'TIRSADOB', 'AI');
INSERT INTO adob VALUES ('Nutreplant', 'CIRSADOB', 'LLD');
INSERT INTO adob VALUES ('Creixplant', 'PRISADOB', 'AI');
INSERT INTO adob VALUES ('Casadob', 'TIRSADOB', 'AI');
INSERT INTO adob VALUES ('Superplant', 'PRISADOB', 'LLD');
INSERT INTO adob VALUES ('Plantadob', 'CIRSADOB', 'AI');
INSERT INTO adob VALUES ('Sanexplant', 'UOCADOB', 'LLD');

INSERT INTO planta_interior VALUES ('Philodendron', 'Llum directa', 15);
INSERT INTO planta_interior VALUES ('Euphorbia', 'Llum indirecta', 18);
INSERT INTO planta_interior VALUES ('Ficus', 'Llum indirecta', 19);
INSERT INTO planta_interior VALUES ('Codiaeum', 'No corrents', 17);


INSERT INTO planta_exterior VALUES ('Geranium', 'P');
INSERT INTO planta_exterior VALUES ('Begonia rex', 'P');
INSERT INTO planta_exterior VALUES ('Camellia', 'P');
INSERT INTO planta_exterior VALUES ('Cyclamen', 'P');
INSERT INTO planta_exterior VALUES ('Rosa', 'P');
INSERT INTO planta_exterior VALUES ('Polystichum', 'P');
INSERT INTO planta_exterior VALUES ('Tulipa', 'T');
INSERT INTO planta_exterior VALUES ('Chrysanthemum', 'T');
INSERT INTO planta_exterior VALUES ('Chlorophytum', 'T');
INSERT INTO planta_exterior VALUES ('Hedera', 'T');



INSERT INTO exemplar_planta VALUES ('Geranium', 1);
INSERT INTO exemplar_planta VALUES ('Geranium', 2);
INSERT INTO exemplar_planta VALUES ('Geranium', 3);
INSERT INTO exemplar_planta VALUES ('Geranium', 4);
INSERT INTO exemplar_planta VALUES ('Geranium', 5);
INSERT INTO exemplar_planta VALUES ('Geranium', 6);
INSERT INTO exemplar_planta VALUES ('Begonia rex', 1);
INSERT INTO exemplar_planta VALUES ('Begonia rex', 2);
INSERT INTO exemplar_planta VALUES ('Begonia rex', 3);
INSERT INTO exemplar_planta VALUES ('Begonia rex', 4);
INSERT INTO exemplar_planta VALUES ('Rosa', 1);
INSERT INTO exemplar_planta VALUES ('Rosa', 2);
INSERT INTO exemplar_planta VALUES ('Rosa', 3);
INSERT INTO exemplar_planta VALUES ('Hedera', 1);
INSERT INTO exemplar_planta VALUES ('Hedera', 2);
INSERT INTO exemplar_planta VALUES ('Hedera', 3);
INSERT INTO exemplar_planta VALUES ('Hedera', 4);
INSERT INTO exemplar_planta VALUES ('Ficus', 1);
INSERT INTO exemplar_planta VALUES ('Ficus', 2);
INSERT INTO exemplar_planta VALUES ('Euphorbia', 1);
INSERT INTO exemplar_planta VALUES ('Euphorbia', 2);
INSERT INTO exemplar_planta VALUES ('Euphorbia', 3);
INSERT INTO exemplar_planta VALUES ('Codiaeum', 1);
INSERT INTO exemplar_planta VALUES ('Codiaeum', 2);
INSERT INTO exemplar_planta VALUES ('Cyclamen', 1);
INSERT INTO exemplar_planta VALUES ('Cyclamen', 2);



INSERT INTO dosi_adob VALUES('Geranium', 'Primavera', 'Casadob', 30);
INSERT INTO dosi_adob VALUES('Geranium', 'Hivern', 'Vitaplant', 20);
INSERT INTO dosi_adob VALUES('Begonia rex', 'Estiu', 'Casadob', 25);
INSERT INTO dosi_adob VALUES('Camellia', 'Hivern', 'Plantavit', 50);
INSERT INTO dosi_adob VALUES('Camellia', 'Primavera', 'Casadob', 75);
INSERT INTO dosi_adob VALUES('Cyclamen', 'Tardor', 'Casadob', 30);
INSERT INTO dosi_adob VALUES('Chrysanthemum', 'Primavera', 'Casadob', 45);
INSERT INTO dosi_adob VALUES('Begonia rex', 'Primavera', 'Nutreplant', 50);
INSERT INTO dosi_adob VALUES('Rosa', 'Primavera', 'Casadob', 30);
INSERT INTO dosi_adob VALUES('Rosa', 'Primavera', 'Creixplant', 50);
INSERT INTO dosi_adob VALUES('Polystichum', 'Primavera', 'Casadob', 40);
INSERT INTO dosi_adob VALUES('Polystichum', 'Tardor', 'Plantadob', 20);
INSERT INTO dosi_adob VALUES('Tulipa', 'Hivern', 'Casadob', 40);
INSERT INTO dosi_adob VALUES('Philodendron', 'Primavera', 'Casadob', 40);
INSERT INTO dosi_adob VALUES('Chlorophytum', 'Tardor', 'Casadob', 30);
INSERT INTO dosi_adob VALUES('Chlorophytum', 'Hivern', 'Superplant', 40);
INSERT INTO dosi_adob VALUES('Euphorbia', 'Hivern', 'Casadob', 50);
INSERT INTO dosi_adob VALUES('Euphorbia', 'Hivern', 'Sanexplant', 40);
INSERT INTO dosi_adob VALUES('Hedera', 'Primavera', 'Casadob', 45);
INSERT INTO dosi_adob VALUES('Codiaeum', 'Primavera', 'Casadob', 60);
INSERT INTO dosi_adob VALUES('Codiaeum', 'Estiu', 'Casadob', 50);
INSERT INTO dosi_adob VALUES('Geranium', 'Estiu', 'Sanexplant', 40);
INSERT INTO dosi_adob VALUES('Ficus', 'Primavera', 'Casadob', 50);

INSERT INTO reproduccio VALUES('Esqueix', 'Geranium', 'Alt');
INSERT INTO reproduccio VALUES('Esqueix', 'Begonia rex', 'Alt');
INSERT INTO reproduccio VALUES('Capficats', 'Begonia rex', 'Alt');
INSERT INTO reproduccio VALUES('Llavors', 'Begonia rex', 'Baix');
INSERT INTO reproduccio VALUES('Estaques', 'Rosa', 'Mitjà');
INSERT INTO reproduccio VALUES('Bulbs', 'Rosa', 'Alt');
INSERT INTO reproduccio VALUES('Estolons', 'Chlorophytum', 'Alt');
INSERT INTO reproduccio VALUES('Esqueix', 'Cyclamen', 'Alt');
INSERT INTO reproduccio VALUES('Capficats', 'Cyclamen', 'Mitjà');
INSERT INTO reproduccio VALUES('Capficats', 'Philodendron', 'Alt');
INSERT INTO reproduccio VALUES('Esqueix', 'Philodendron', 'Alt');
