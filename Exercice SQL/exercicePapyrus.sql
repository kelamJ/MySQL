-- - Exercice requête SQL

-- 1.
    SELECT * FROM `entcom` WHERE numfou = 9120;
-- 2.
    SELECT numfou AS "code fournisseur" FROM `entcom` WHERE numcom;
-- 3.
    SELECT COUNT(codart) AS "nombre de commande",
    COUNT(DISTINCT(numfou)) FROM `vente`;
-- 4.
    SELECT codart AS "n° produit", libart AS "libellé produit", stkphy AS "stock actuel", stkale AS "stock d'alerte", qteann AS "quantité anuelle" 
    FROM `produit` WHERE qteann < 1000 AND stkphy <= stkale;
-- 5.
    SELECT posfou, nomfou FROM `fournis`
    WHERE posfou LIKE "75%"
    OR posfou LIKE "78%"
    OR posfou LIKE "92%"
    OR posfou LIKE "77%"
    ORDER BY posfou DESC, nomfou ASC;
-- 6.
    SELECT datcom as "commande passées" FROM `entcom`
    WHERE datcom LIKE '____-03-__%' OR datcom LIKE '____-04-__%';
-- 7.
    SELECT numcom AS "n° de commande", 
    datcom AS "date de commande" FROM `entcom`
    WHERE obscom <> "null";
-- 8.
    SELECT DISTINCT numcom, 
    SUM(qtecde * priuni) AS "total de commande" 
    FROM `ligcom`
    GROUP BY numcom
    ORDER BY SUM(qtecde * priuni) DESC;
-- 9.
    SELECT DISTINCT numcom, 
    SUM(qtecde * priuni) AS "total de commande" 
    FROM `ligcom`
    WHERE qtecde <= 1000  AND SUM(qtecde * priuni) > 10000
    GROUP BY numcom;
-- 10.
    SELECT nomfou AS "nom fournisseur", numcom AS "numéro de commande", datcom AS "date" 
    FROM `fournis` JOIN `entcom` ON entcom.numfou = fournis.numfou;
-- 11.
    SELECT ligcom.numcom AS "n° de commande", 
    nomfou AS " nom de fournisseur",
    libart AS "libellé produit",
    SUM(qtecde * priuni)
    FROM `produit`
    JOIN ligcom ON ligcom.codart = produit.codart
    JOIN entcom ON entcom.numcom = ligcom.numcom
    JOIN fournis ON fournis.numfou = entcom.numfou
    WHERE obscom LIKE "Commande urgente"
    GROUP BY libart;
-- 12.
V.1
    SELECT fournis.nomfou, ligcom.qteliv AS "article livré" FROM `ligcom`
    JOIN entcom ON entcom.numcom = ligcom.numcom
    JOIN fournis ON fournis.numfou = entcom.numfou
    WHERE qteliv > 1;
V.2
    SELECT fournis.nomfou, ligcom.qteliv AS "article livré" FROM `ligcom`
    JOIN produit ON produit.codart = ligcom.codart
    JOIN vente ON vente.codart = produit.codart
    JOIN fournis ON  fournis.numfou = vente.numfou
    WHERE qteliv > 1;
-- 13.
    SELECT numcom, datcom FROM `entcom` WHERE numfou = 120;
-- 14.
    SELECT libart, prix1 FROM `vente`
    JOIN produit ON produit.codart = vente.codart
    WHERE prix1 < 120;
-- 15.
    SELECT libart  AS "produit", nomfou AS "fournisseur" FROM `produit`
    JOIN vente ON vente.codart = produit.codart
    JOIN fournis ON fournis.numfou = vente.numfou
    WHERE stkphy <= (1.5 * stkale);
-- 16.
    SELECT nomfou  AS "fournisseur", libart AS "produit" FROM `produit`
    JOIN vente ON vente.codart = produit.codart
    JOIN fournis ON fournis.numfou = vente.numfou
    JOIN entcom ON entcom.numfou = fournis.numfou
    JOIN ligcom ON ligcom.numcom = entcom.numcom
    WHERE stkphy <= (1.5 * stkale) AND delliv <= 30;
-- 17.
    SELECT stkphy AS "stock totale", nomfou AS "nom fournisseur" 
    FROM `produit` 
    JOIN vente ON vente.codart = produit.codart
    JOIN fournis ON fournis.numfou = vente.numfou
    GROUP BY nomfou
    ORDER BY stkphy DESC;
-- 18.
    SELECT libart AS "liste produit", qteliv AS "quantité commandé", qteann  FROM `ligcom` 
    JOIN produit ON produit.codart = ligcom.codart
    JOIN vente ON vente.codart = produit.codart
    JOIN fournis ON fournis.numfou = vente.numfou
    WHERE qteliv > (qteann * 0.9;
-- 19.
SELECT numfou, ((qtecde * priuni) * 1.2)  FROM entcom, ligcom WHERE entcom.numcom = ligcom.numcom GROUP BY numfou;

-- Mise a jour de données cas papyrus
-- 1.
    UPDATE vente
    SET
    prix1 = prix1 * 1.04,
    prix2 = prix2 *0.02
    WHERE numfou = 9180
-- 2.
    UPDATE vente
    SET
    prix2 = prix1 
    WHERE prix2 = 0
3.
    UPDATE entcom
    JOIN fournis ON  fournis.numfou = entcom.numfou
    SET obscom = '*****'
    WHERE satisf < 5
4.
    DELETE FROM vente where codart 
    in (select codart from produit WHERE (codart LIKE "I110%"));