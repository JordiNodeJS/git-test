-- @block
USE plantas;
-- pag 13 b) Si volem veure només els camps nom_cientific i floracio escriurem:
SELECT nom_cientific,
      floracio
FROM planta;
-- pg 14 b) Mostra el nom científic de les plantes que necessiten llum directa.
-- @block
SELECT nom_planta
FROM plantas.planta_interior
WHERE ubicacio = 'Llum directa';
SELECT nom_adob
WHERE quantitat_adob BETWEEN 40 AND 50;
FROM dosi_adob -- ex 2003
-- @block
SELECT nom_popular,
      nom_cientific
FROM plantas.planta
WHERE floracio = 'estiu';
-- @block
-- @block
-- 24
SELECT DISTINCT nom_planta as 'nombre de la planta'
FROM plantas.dosi_adob
WHERE nom_adob = 'Casadob';
-- 25
-- 25
-- @block
SELECT nom_adob,
      tipus_adob
FROM plantas.adob
WHERE nom_firma = 'PRISADOB';
-- @block
-- xercici 34:
-- Digues quants exemplars de plantes tenim.
SELECT COUNT(*) as 'numero de ejemplares'
FROM exemplar_planta;
-- @block
-- Exercici 35:
-- Mostra la quantitat mínima i màxima
-- d'adob que s'utilitza alguna vegada (en una sola consulta).
SELECT MIN(quantitat_adob) AS 'mínimo',
      MAX(quantitat_adob) AS 'máximo'
FROM dosi_adob;
-- @block
-- c) Mostra el nom popular, el nom de l’adob, l’estació i la quantitat
--  d’adob de les plantes que necessiten una dosi
-- d’adob entre la mitjana menys 10 i la mitjana més 10.
SELECT nom_popular,
      nom_adob,
      nom_estacio as 'estacción',
      quantitat_adob as 'cantidad'
FROM planta,
      dosi_adob
WHERE nom_cientific = nom_planta
      AND quantitat_adob > (
            SELECT AVG(quantitat_adob)
            FROM dosi_adob
      ) -10
      AND quantitat_adob < (
            SELECT AVG(quantitat_adob)
            FROM dosi_adob
      ) + 10;
-- @block
SELECT nom_popular,
      nom_adob,
      nom_estacio as 'estacción',
      quantitat_adob as 'cantidad'
FROM planta JOIN
      dosi_adob
ON nom_cientific = nom_planta
      AND quantitat_adob > (
            SELECT AVG(quantitat_adob)
            FROM dosi_adob
      ) -10
      AND quantitat_adob < (
            SELECT AVG(quantitat_adob)
            FROM dosi_adob
      ) + 10;
-- @block
-- Exercici 36:
-- Mostra la temperatura màxima a la que pot haver una planta d'interior
SELECT nom_planta,
      max(temperatura)
from planta_interior;
-- @block
-- @block
-- Exercici 37:
-- Mostra les plantes que utilitzen adob 'Casadob' i un quantitat superior a 40 unitats.
SELECT DISTINCT nom_planta
FROM dosi_adob
WHERE nom_adob = 'Casadob'
      and quantitat_adob >= 40;
-- @block
-- Exercici 38:
-- Mostra el nom científic de les plantes que tenim més de 4 exemplars.
SELECT nom_planta
FROM exemplar_planta
WHERE num_exemplar > 4;
-- @block
-- Exercici 39:
-- Mostra la quantitat total d'adob que utilitza la planta Euphorbia.
-- muestra las cantidades
SELECT quantitat_adob
FROM dosi_adob
WHERE nom_planta = 'Euphorbia';
-- @block
-- súmalas
SELECT SUM(quantitat_adob)
FROM dosi_adob
WHERE nom_planta = 'Euphorbia';
-- @block
SELECT quantitat_adob
FROM dosi_adob
WHERE nom_planta = 'Codiaeum';
-- @block
SELECT SUM(quantitat_adob)
FROM dosi_adob
WHERE nom_planta = 'Codiaeum';
-- @block
-- Exercici 40:
-- Mostra el nom científic de les plantes que s'han abonat
--  a la primavera o les que han utilitzat adob 'Sanexplant'.
SELECT DISTINCT nom_planta
FROM dosi_adob
WHERE nom_estacio = 'Primavera'
      OR nom_adob = 'Sanexplant';
-- @block
-- Exercici 41:
-- Mostra el nom científic de les plantes que utilitzen
-- com a mètode de reproducció 'Esqueix' amb un grau d'èxit
-- 'Alt'.
SELECT nom_planta
FROM reproduccio
WHERE metode_reproduccio = 'Esqueix'
      AND grau_exit = 'Alt';
-- @block
-- Exercici 42:
-- Mostra la quantitat total de vegades que tenim un grau d'exit 'Mitjà'.
SELECT COUNT(grau_exit) total
FROM reproduccio
WHERE grau_exit = 'Mitjà';
-- @block
SELECT COUNT(*) total
FROM reproduccio
WHERE grau_exit = 'Mitjà';
-- @block
-- Exercici 43:
-- Mostra el nom popular de les plantes que
-- tenim algun exemplar que
--  floreixi a l’estiu.
SELECT nom_popular
FROM planta
WHERE floracio = 'Estiu';
-- @block
SELECT nom_popular, floracio
FROM planta LEFT JOIN exemplar_planta
on nom_cientific = nom_planta and floracio

-- @block
-- Exercici 44:
-- Mostra el nom científic i el tipus de planta de les que són
--  d’exterior que floreixen a la primavera.
SELECT nom_planta, tipus_planta
FROM planta_exterior,
      planta
WHERE floracio = 'Primavera' and nom_planta = nom_cientific;
-- @block
SELECT nom_planta, tipus_planta
FROM planta_exterior JOIN
      planta
ON floracio = 'Primavera' and nom_planta = nom_cientific;
-- @block
-- Exercici 45:
-- Mostra el nom científic de les plantes d’exterior
--  que utilitzen adobs de la firma comercial CIRSADOB. Mostra
-- també l’adob que utilitzen.
SELECT DISTINCT plantaexterior.nom_planta
FROM planta_exterior plantaexterior,
      dosi_adob dosiadobe,
      adob adobe
WHERE nom_firma = 'CIRSADOB'
      AND dosiadobe.nom_planta = plantaexterior.nom_planta;
-- @block
SELECT DISTINCT exterior.nom_planta,
      ad.nom_adob
FROM dosi_adob dosis,
      adob ad,
      planta_exterior exterior
WHERE nom_firma = 'CIRSADOB'
      AND dosis.nom_planta = exterior.nom_planta;
-- @block
 SELECT DISTINCT pe.nom_planta,
      ad.nom_adob
FROM dosi_adob da JOIN
      adob ad JOIN
      planta_exterior pe
ON  pe.nom_planta=da.nom_planta and da.nom_adob=ad.nom_adob and nom_firma='CIRSADOB' ;
-- @block
-- Exercici 46:
-- Mostra els mètodes de reproducció de les plantes que tenim exemplars.
SELECT DISTINCT metode_reproduccio
FROM reproduccio,
      exemplar_planta
WHERE num_exemplar >= 1;
-- @block
SELECT DISTINCT metode_reproduccio
FROM reproduccio,
      exemplar_planta
WHERE reproduccio.nom_planta = exemplar_planta.nom_planta;
-- @block
SELECT DISTINCT metode_reproduccio
FROM reproduccio r,
      exemplar_planta e
WHERE r.nom_planta = e.nom_planta;
-- @block
-- Exercici 47:
-- De les plantes que utilitzen adobs de la firma UOCADOB,
--  mostra el nom popular i entre parèntesi la quantitat
-- d’adob utilitzat (el resultat l'ha de mostrar en un sol camp).
SELECT DISTINCT CONCAT(nom_popular, '(', quantitat_adob, ')')
FROM planta,
      dosi_adob,
      adob
WHERE nom_firma = 'UOCADOB'
      AND nom_planta = nom_cientific;
-- @block
-- Exercici 48:
-- Mostra el nom popular i les mètodes de reproducció de les plantes que
-- tenen la floració al hivern.
SELECT nom_popular,
      nom_metodo
FROM planta,
      metode_reproduccio
WHERE floracio = 'Hivern';
-- @block
SELECT DISTINCT p.nom_popular,
      r.metode_reproduccio
FROM planta p,
      reproduccio r
WHERE p.floracio = 'Hivern';
-- @block
-- Exercici 49:
-- Mostra el nom científic i les cinc primeres lletres del nom popular
--  de les plantes d’exterior que utilitzen el mètode
-- de reproducció esqueix i les plantes d’interior que la seva reproducció
-- té un grau d’èxit baix
SELECT DISTINCT p.nom_cientific,
      LEFT(p.nom_popular, 5)
FROM planta p,
      reproduccio re,
      planta_exterior ex,
      planta_interior nz
WHERE (
            p.nom_cientific = ex.nom_planta
            AND ex.nom_planta = re.nom_planta
            AND re.metode_reproduccio = 'Esqueix'
      )
      OR (
            nz.nom_planta = p.nom_cientific
            AND nz.nom_planta = re.nom_planta
            AND re.grau_exit = 'Baix');
-- @block
SELECT nom_cientific, nom_popular
      FROM planta
      WHERE nom_popular LIKE '%i%';
-- @block
/*Ex 33 */
SELECT nom_adob, nom_firma
      FROM adob
      WHERE nom_firma='CIRSADOB' OR nom_firma='TIRSADOB';
SELECT nom_adob, nom_firma
      FROM adob
      WHERE nom_firma IN ('CIRSADOB', 'TIRSADOB');
