-- 1.
SELECT CompanyName, ContactName, ContactTitle, Phone 
FROM customers
WHERE country = 'France';
-- 2.
SELECT ProductName, UnitPrice FROM `products`
WHERE SupplierID = 1;
-- 3.
