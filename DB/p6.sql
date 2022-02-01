/*Pr6 ligada a la tabla de pr5*/
/*Ex 23*/
/* SELECT campo, campo
      FROM tabla */
SELECT nom_popular, nom_cientific
      FROM planta
      WHERE floracio='Estiu';
/*Res: Begonia, Begonia Rex; Crisantem, Chrysanthemum.*/
/*Ex 24*/
SELECT DISTINCT nom_planta
      FROM dosi_adob
      WHERE nom_adob='Casadob';
/*Ex 25*/
SELECT nom_adob, tipus_adob
      FROM adob
      WHERE nom_firma='PRISADOB';
      /*Ex 26*/
SELECT nom_planta
      FROM planta_interior
      WHERE temperatura>16;

-- @block
/*Ex27*/
SELECT SUM(quantitat_adob) AS total_adob
      FROM dosi_adob;
      /*REs:950*/
-- @block
/* Ex28*/
SELECT DISTINCT nom_planta
      FROM dosi_adob
      WHERE quantitat_adob BETWEEN 40 AND 50;
SELECT nom_planta
      FROM dosi_adob
      WHERE quantitat_adob>=40 AND quantitat_adob<=50;
-- @block
/*Ex 29*/
SELECT DISTINCT nom_planta
      FROM dosi_adob
      WHERE nom_estacio='Hivern' OR nom_estacio='Tardor';
SELECT DISTINCT nom_planta
      FROM dosi_adob
      WHERE nom_estacio IN ('Hivern', 'Tardor');
 -- @block
/*Ex 30*/
SELECT AVG(quantitat_adob) AS mitjana_adob
      FROM dosi_adob
      WHERE nom_adob='Casadob';
/*Ex 31*/
SELECT nom_cientific, nom_popular
      FROM planta
      WHERE nom_popular LIKE '%i%';
/* Ex32 */
SELECT AVG(temperatura) AS mitjana_temp
      FROM planta_interior;
/*Ex 33 */
SELECT nom_adob, nom_firma
      FROM adob
      WHERE nom_firma='CIRSADOB' OR nom_firma='TIRSADOB';
SELECT nom_adob, nom_firma
      FROM adob
      WHERE nom_firma IN ('CIRSADOB', 'TIRSADOB');
/* Ex 34 */
SELECT COUNT(*) AS quant_exemplars
      FROM exemplar_planta;
/*Ex 35*/
SELECT MIN(quantitat_adob) AS min_max_adob, MAX(quantitat_adob) AS max_adob
            FROM dosi_adob;

/*SELECT MIN(quantitat_adob) AS min_max_adob
      FROM dosi_adob
UNION
      SELECT MAX(quantitat_adob) AS max_adob
            FROM dosi_adob;*/
/*Ex 36 */
SELECT MAX(temperatura) AS temperatura_max_planta
      FROM planta_interior;
/* Ex 37 */
SELECT nom_planta
      FROM dosi_adob
      WHERE nom_adob='Casadob' AND quantitat_adob>40;
/*Ex 38 */
SELECT nom_planta AS nom_cientific
      FROM exemplar_planta
      GROUP BY nom_planta
      HAVING COUNT(num_exemplar)>4;
/* Ex 39 */
SELECT SUM(quantitat_adob) AS quant_euphorbia
      FROM dosi_adob
      WHERE nom_planta='Euphorbia';
/* Ex 40*/
SELECT DISTINCT nom_planta
      FROM dosi_adob
      WHERE nom_estacio='Primavera' OR nom_adob='Sanexplant';
/* Ex 41 */
SELECT nom_planta
      FROM reproduccio
      WHERE metode_reproduccio='Esqueix' AND grau_exit='Alt';
/* Ex 42 */
SELECT COUNT(*) total
      FROM reproduccio
      WHERE grau_exit='Mitjà';
