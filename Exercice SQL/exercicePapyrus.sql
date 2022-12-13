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
    SELECT datcom as "commande passées" FROM `entcom` WHERE datcom;
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
    