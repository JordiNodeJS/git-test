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
SELECT nom_planta
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
SELECT COUNT(grau_exit)
FROM reproduccio
WHERE grau_exit = 'Mitjà';

-- @block
SELECT nom_popular, floracio
FROM planta JOIN exemplar_planta
on nom_cientific = nom_planta and floracio = 'Estiu';
-- @block
-- Exercici 44
-- Exercici 44:
-- Mostra el nom científic i el tipus de planta
-- de les que són d’exterior que
-- floreixen a la primavera.
SELECT nom_cientific, tipus_planta FROM
planta, adob, exte
WHERE

-- @block
-- Exercici 45:
-- Mostra el nom científic de les plantes d’exterior
--  que utilitzen adobs de la firma comercial CIRSADOB. Mostra
-- també l’adob que utilitzen.
SELECT DISTINCT p_ex.nom_planta
FROM planta_exterior p_ex,
      dosi_adob dosiadobe,
      adob
WHERE nom_firma = 'CIRSADOB'
      AND dosiadobe.nom_planta = p_ex.nom_planta;
-- @block
-- Exercici 45-1:
-- Mostra el nom científic de les plantes d’interior
--  que utilitzen adobs de la firma comercial CIRSADOB. Mostra
-- també l’adob que utilitzen.
SELECT DISTINCT p_in.nom_planta
FROM planta_interior p_in,
      dosi_adob dosiadobe,
      adob
WHERE nom_firma = 'CIRSADOB'
      AND dosiadobe.nom_planta = p_in.nom_planta;
-- @block
-- Exercici 46:
-- Mostra els mètodes de reproducció de les plantes que
--  tenim exemplars.
SELECT DISTINCT metode_reproduccio
FROM exemplar_planta,
      reproduccio
where reproduccio.nom_planta = exemplar_planta.nom_planta;
-- @block
SELECT DISTINCT metode_reproduccio
FROM reproduccio re,
      exemplar_planta ex
WHERE re.nom_planta = ex.nom_planta;
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
-- Mostra el nom popular i les mètodes de reproducció de
-- les plantes que tenen
-- la floració al hivern
SELECT DISTINCT nom_popular,
      metode_reproduccio
FROM planta p,
      reproduccio
WHERE floracio = 'Hivern';
-- @block
-- Exercici 49:
-- Mostra el nom científic i les cinc primeres lletres del nom popular de les plantes d’exterior que utilitzen el mètode
-- de reproducció esqueix i les plantes d’interior que la seva reproducció té un grau d’èxit baix.
SELECT DISTINCT pl.nom_cientific,
      LEFT(pl.nom_popular, 5)
FROM planta pl,
      reproduccio re,
      planta_exterior ex,
      planta_interior nz
WHERE (
            pl.nom_cientific = ex.nom_planta
            AND ex.nom_planta = re.nom_planta
            AND re.metode_reproduccio = 'Esqueix'
      )
      OR (
            nz.nom_planta = pl.nom_cientific
            AND nz.nom_planta = re.nom_planta
            AND re.grau_exit = 'Baix'
      );








-- @block
-- Exercici 50:
-- Mostra el nom popular i la estació de floració de les
--  plantes que utilitzen més de 40 unitats d’adob.
SELECT DISTINCT pl.nom_popular,
      pl.floracio
FROM planta pl,
      dosi_adob da
WHERE pl.nom_cientific = da.nom_planta
GROUP BY da.nom_planta
HAVING SUM(da.quantitat_adob) > 40;




-- @block
-- profesor
SELECT DISTINCT p.nom_popular, floracio
FROM planta p,
      dosi_adob da
WHERE p.nom_cientific = da.nom_planta
GROUP BY da.nom_planta
HAVING SUM(da.quantitat_adob) > 40;
-- @block
-- con join
SELECT DISTINCT p.nom_popular, floracio
FROM planta p JOIN
      dosi_adob da
ON p.nom_cientific = da.nom_planta
GROUP BY da.nom_planta
HAVING SUM(da.quantitat_adob) > 40;


-- @block
-- Exercici 51:
-- Mostra el nom popular de les plantes d’interior que
-- necessiten llum indirecta i les plantes d’exterior que són de
-- temporada.
SELECT DISTINCT nom_popular
FROM planta,
      planta_interior,
      planta_exterior pe
WHERE ubicacio = 'Llum indirecta'
      AND tipus_planta = 'T'
      OR (nom_cientific=pe.nom_planta and tipus_planta= 'T');







-- @block
SELECT DISTINCT p.nom_popular
FROM planta p,
      planta_exterior e,
      planta_interior i
WHERE (
            p.nom_cientific = e.nom_planta
            AND e.tipus_planta = 'T'
      )
      OR (
            i.nom_planta = p.nom_cientific
            AND i.ubicacio = 'Llum indirecta'
      );







-- @block
-- Exercici 52:
-- Mostra el nom científic i l’estació de floració de les plantes que tenim
--  algun exemplar.
SELECT p.nom_cientific,
      floracio
FROM planta p,
      exemplar_planta e
where p.nom_cientific = e.nom_planta
      and floracio = 'Hivern'
      and num_exemplar > 2;
-- @block
-- profesor
-- por completar
SELECT DISTINCT nom_cientific,
      floracio
FROM planta p,
      exemplar_planta e
where p.nom_cientific = e.nom_planta
      and floracio = 'Hivern'
      and num_exemplar > 2;









-- @block
-- Exercici 53:
-- Mostra l’adob i la firma comercial que el comercialitza de les plantes
--  que reben una quantitat d’adob entre 20 i
-- 40 unitats (inclosos).

SELECT DISTINCT da.nom_adob, nom_firma
from adob ad, dosi_adob da
where ad.nom_adob=da.nom_adob and quantitat_adob >= 20 and quantitat_adob <= 40;




-- @block
-- Exercici 54:
-- Mostra en majúscules el nom popular de les plantes que tenim exemplars
--  que utilitzen adobs d’acció immediata.


SELECT DISTINCT UPPER(nom_popular)
from planta, exemplar_planta ep, dosi_adob da, adob ad
where nom_cientific = ep.nom_planta and nom_cientific= da.nom_planta
adn da.nom_adob=ad.nom_adob and tipus_adob='AI';


-- @block
-- Exercici 55:
-- Mostra el nom popular i la ubicació de les plantes
-- d’interior de les que
--  tenim algun exemplar

SELECT DISTINCT nom_popular, ubicacio
from planta, exemplar_planta ep, planta_interior pi
where nom_cientific=ep.nom_planta and
 nom_cientific=pi.nom_planta;

-- 56
-- @block
select DISTINCT nom_popular, ubicacio
from planta, exemplar_planta ep, planta_interior pi
where ep.nom_planta = nom_cientific
and nom_cientific = pi.nom_planta;

-- @block
select DISTINCT nom_popular, ad.nom_adob, da.quantitat_adob
from planta, dosi_adob da, adob ad
WHERE nom_cientific = da.nom_planta
and da.nom_planta=ad.nom_adob and (ad.nom_firma='PRISADOB' or quantitat_adob <=30);

-- @block
SELECT DISTINCT nom_popular
FROM planta, dosi_adob da, adob ad
WHERE nom_cientific = nom_planta and da.nom_adob=ad.nom_adob and floracio = 'Primavera' and tipus_adob='AI'

-- @block
-- Exercici 57:
-- Mostra el nom popular de les plantes que utilitzen un adob de acció
-- immediata i que floreixen a la primavera..
SELECT DISTINCT nom_cientific, metode_reproduccio
FROM planta, dosi_adob da,  reproduccio re
WHERE nom_cientific = re.nom_planta AND nom_cientific = da.nom_planta
AND nom_adob <> 'Casadob';
-- @block
-- Exercici 59:
-- Mostra les estacions de floració de les quals
-- tenim algun exemplar de planta.
SELECT DISTINCT floracio
FROM planta, exemplar_planta ep
WHERE nom_cientific = ep.nom_planta AND floracio <> 'NULL';

-- @block
SELECT DISTINCT floracio
FROM planta JOIN exemplar_planta ep
ON nom_cientific = ep.nom_planta AND floracio <> 'NULL';

-- @block
SELECT  floracio, nom_planta
FROM planta RIGHT JOIN exemplar_planta ep
ON nom_cientific = ep.nom_planta AND floracio <> 'NULL';









-- @block
-- Exercici 60:
-- Mostra el nom popular, el mètode de reproducció i la
-- primera lletra del grau d’èxit de les plantes que no tenen un
-- grau d’èxit alt.
SELECT DISTINCT nom_popular, metode_reproduccio, LEFT(grau_exit, 1)
FROM planta, reproduccio
WHERE nom_cientific = nom_planta and grau_exit <> 'Alt';
-- @block
SELECT DISTINCT nom_popular, metode_reproduccio, LEFT(grau_exit, 1)
FROM planta INNER JOIN reproduccio
ON nom_cientific = nom_planta and grau_exit <> 'Alt';
-- @block
-- Exercici 61:
-- Mostra el nom de les plantes que se’ls hi ha afegit
-- adob en la mateixa estació
-- que la seva floració.
SELECT nom_popular, nom_planta
FROM planta RIGHT JOIN dosi_adob
ON nom_cientific = nom_planta AND nom_estacio = floracio;
-- @block
-- Exercici 62:
-- Mostra en minúscules el nom científic de les plantes
--  d’exterior que utilitzen adobs de la firma CIRSADOB i les
-- plantes d’interior que utilitzen el mètode
--  de reproducció per capficats.
SELECT DISTINCT LOWER(nom_cientific)
FROM planta, planta_interior pi, planta_exterior pe, adob ad,
 dosi_adob da, reproduccio re
WHERE (nom_cientific = pe.nom_planta and nom_cientific = da.nom_planta
AND da.nom_adob = ad.nom_adob AND nom_firma = 'CIRSADOB' )
OR
(nom_cientific = pi.nom_planta AND  nom_cientific = re.nom_planta AND
metode_reproduccio = 'Capficats');
