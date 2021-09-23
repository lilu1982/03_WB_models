-- 03. SELECTS / Servants, Products
#USE mydb;

-- Einzeltabellen
SELECT * FROM mydb.servants;
SELECT * FROM mydb.products;
SELECT * FROM mydb.purchases;

-- Inner Join 1 / Kombi (servants / products / purchases)
SELECT
	*
FROM mydb.purchases
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
;

-- Welche Artikel hat Holger gekauft?
SELECT
	#servant_name AS Diener,
    #product_name AS "Von Holger gekaufte Produkte"
    concat(servant_name, " kauft ", product_name,".") AS Kaufhandlung
FROM mydb.purchases
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
WHERE servant_name = "Holger"
;

-- Wieviel Produkte hat Holger gekauft?
-- Wieviel Geld hat Holger ausgegeben?
SELECT
    concat(
    servant_name, 
    " kauft ", 
    count(product_name),
    " Produkte."
    ) AS Kaufhandlung
FROM mydb.purchases
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
WHERE servant_name = "Holger"
;

SELECT
   servant_name AS Diener,
   count(servant_name) AS Artikelanzahl,
   sum(product_price) AS Gesamtkosten
FROM mydb.purchases
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
GROUP BY servant_name
#HAVING servant_name = "Holger"
;

-- Wer hat das Produkt X gekauft?  
-- Irgendwas mit Lachs / Irgendwas mit Sauce LIKE
-- Spalten --> Diener / Produkt
-- WHERE / LIKE
SELECT
	servant_name AS Diener,
    product_name AS "Produkte mit Soße oder Lachs"
FROM mydb.purchases
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
WHERE product_name LIKE "%Lachs%" OR product_name LIKE "%Sauce%"
;

-- Wie oft wurde das Produkt X gekauft?
SELECT
	product_name AS Produkte, -- nicht aggr.
    count(product_name) AS Anzahl -- aggr.
FROM mydb.purchases
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
GROUP BY product_name
ORDER BY count(product_name) DESC
;

-- Welche Umsätze hatte das Produkt X?
SELECT
	product_name AS Produkte, -- nicht aggr.
    count(product_name) AS Anzahl, -- aggr.
    sum(product_price) AS Umsätze -- aggr.  // count() * price
FROM mydb.purchases
INNER JOIN mydb.servants ON mydb.servants.id = mydb.purchases.servants_id
INNER JOIN mydb.products ON mydb.products.id = mydb.purchases.products_id
GROUP BY product_name
ORDER BY sum(product_price) DESC
;
