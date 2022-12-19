-- 1.
SELECT CompanyName, ContactName, ContactTitle, Phone 
FROM customers
WHERE country = 'France';
-- 2.
SELECT ProductName, UnitPrice FROM `products`
WHERE SupplierID = 1;
-- 3.
SELECT CompanyName as "Fournisseur", count(products.SupplierID) as "Produits"  FROM `suppliers` 
join products on products.SupplierID = suppliers.SupplierID
WHERE Country = 'France'
GROUP by products.SupplierID
ORDER by Produits DESC;
-- 4.
SELECT CompanyName as "Client", COUNT(OrderId) as "Nbre commandes" FROM `customers` 
JOIN `orders` ON orders.CustomerID = customers.CustomerID
WHERE Country = 'France' GROUP BY CompanyName HAVING COUNT(OrderId) > 10;
-- 5.
SELECT  CompanyName as "Client", SUM(UnitPrice * Quantity) as "CA", Country as "Pays" FROM `customers` 
INNER JOIN `orders` ON orders.CustomerID = customers.CustomerID
JOIN `order details` ON `order details`.orderID = orders.OrderID 
GROUP BY CompanyName HAVING SUM(UnitPrice * Quantity) > 30000
order by CA DESC;
-- 6.
SELECT ShipCountry FROM `orders`
JOIN `order details` on `order details`.OrderID = orders.OrderID
join products on products.ProductID = `order details`.ProductID
join suppliers on suppliers.SupplierID = products.SupplierID
WHERE suppliers.CompanyName = 'Exotic Liquids'
GROUP by ShipCountry;
-- 7.
SELECT SUM(UnitPrice * Quantity) as "CA" FROM `order details`
JOIN orders on orders.OrderID = `order details`.`OrderID`
WHERE YEAR(OrderDate) = 1997;
-- 8.
SELECT MONTH(OrderDate), SUM(UnitPrice * Quantity) as "CA" FROM `order details`
JOIN orders on orders.OrderID = `order details`.`OrderID`
WHERE YEAR(OrderDate) = 1997
group by MONTH(OrderDate);
-- 9.
SELECT MAX(OrderDate) FROM `orders`
JOIN customers on customers.CustomerID = orders.CustomerID
WHERE CompanyName = "Du monde entier";
-- 10.
