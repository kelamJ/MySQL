-- Exercice requête SQL
-- Lot 1
-- 1.
SELECT hot_nom, hot_ville FROM `hotel`; 
-- 2.
SELECT cli_nom, cli_prenom, cli_adresse FROM `client` WHERE cli_nom = 'White';
-- 3.
SELECT sta_nom, sta_altitude FROM `station` WHERE sta_altitude < 1000; 
-- 4.
SELECT cha_numero, cha_capacite FROM `chambre` WHERE cha_capacite > 1; 
-- 5.
SELECT cli_nom, cli_ville FROM `client` WHERE cli_ville != 'Londres'; 
-- 6.
SELECT hot_nom, hot_ville, hot_categorie FROM `hotel` WHERE hot_ville = 'Bretou' AND hot_categorie > 3; 
-- Lot 2
-- 7.
SELECT sta_nom, hot_nom, hot_categorie, hot_ville FROM `hotel` INNER JOIN `station` ON hot_sta_id = sta_id; 
-- 8.
SELECT hot_nom, hot_categorie, hot_ville, cha_numero FROM `chambre` JOIN `hotel`; 
-- 9.
SELECT hot_nom, hot_categorie, hot_ville, cha_numero, cha_capacite FROM `hotel` INNER JOIN `chambre` ON hot_ville = 'Bretou' AND cha_capacite > 1; 
-- 10.
SELECT cli_nom, hot_nom, res_date FROM `client` JOIN `hotel` ON hotel.hot_id = client.cli_id  JOIN `reservation` ON reservation.res_cli_id = client.cli_id; 
-- 11.
SELECT sta_nom, hot_nom, cha_numero, cha_capacite FROM `chambre` JOIN `hotel` ON hotel.hot_id = chambre.cha_id JOIN `station` ON station.sta_id = chambre.cha_id; 
-- 12.
SELECT cli_nom, hot_nom, DATEDIFF(res_date_fin, res_date_debut), res_date_debut, res_date_fin FROM `client` JOIN `hotel` ON hotel.hot_id = client.cli_id JOIN `reservation` ON reservation.res_id = client.cli_id;
-- Lot 3
-- 13.
