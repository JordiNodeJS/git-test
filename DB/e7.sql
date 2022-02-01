DROP DATABASE IF EXISTS ex7;
CREATE DATABASE ex7  DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
USE ex7;

CREATE TABLE asignatura (
	cd_asign CHAR(3) PRIMARY KEY,
    nom_asign CHAR(20) NOT NULL
);

CREATE TABLE profesor(
    cd_prof SMALLINT(2) PRIMARY KEY,
    nom_pfof VARCHAR(20) NOT NULL
);

CREATE TABLE alumno(
    cd_alumno SMALLINT(3) PRIMARY KEY,
    nom_alumno VARCHAR(20) NOT NULL
);


CREATE TABLE impartir(
    cd_prof SMALLINT(2),
    cd_asign VARCHAR(3),
    PRIMARY KEY (cd_prof, cd_asign),
    FOREIGN KEY(cd_prof) REFERENCES profesor(cd_prof),
    FOREIGN KEY(cd_asign) REFERENCES asignatura(cd_asign)
);

CREATE TABLE estudia(
    cd_alumno SMALLINT(3),
    cd_asign VARCHAR(3),
    PRIMARY KEY (cd_alumno, cd_asign),
    FOREIGN KEY(cd_asign) REFERENCES asignatura(cd_asign),
    FOREIGN KEY(cd_alumno) REFERENCES alumno(cd_alumno)

);
