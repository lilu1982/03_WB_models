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


