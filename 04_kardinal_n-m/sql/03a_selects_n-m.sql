-- 3a SELECTS

USE mydb;

-- 1. JOIN 
SELECT
	*
FROM purchases
INNER JOIN servants ON servants.id = purchases.servants_id
INNER JOIN products ON products.id = purchases.products_id
INNER JOIN cats ON cats.id = servants.cats_id
;

-- 2. Wer bekommt den Lachs? 
SELECT
	servant_name Diener,
    product_name Produkt,
    cat_name Herrschaft
FROM purchases
INNER JOIN servants ON servants.id = purchases.servants_id
INNER JOIN products ON products.id = purchases.products_id
INNER JOIN cats ON cats.id = servants.cats_id
WHERE product_name LIKE "%Lachs%"
;

-- 2a. Wer bekommt den Lachs? 
SELECT
	CONCAT(
			servant_name, 
            " ist der Diener von ", 
            cat_name," er kauft ",
            product_name, 
            " somit bekommt ",
            cat_name, " den Lachs."
            ) 
            AS "Wer bekommt den Lachs?"
FROM purchases
INNER JOIN servants ON servants.id = purchases.servants_id
INNER JOIN products ON products.id = purchases.products_id
INNER JOIN cats ON cats.id = servants.cats_id
WHERE product_name LIKE "%Lachs%"
;

-- Variante mit einer VIEW
DROP VIEW IF EXISTS who_purchased_salmon;
CREATE VIEW who_purchased_salmon AS
SELECT
	servant_name AS "DIENER",
	cats_id
FROM purchases
INNER JOIN servants ON servants.id = purchases.servants_id
INNER JOIN products ON products.id = purchases.products_id
WHERE product_name LIKE "%Lachs%";

SELECT * FROM who_purchased_salmon;

SELECT
 concat(cat_name, " bekommt den Lachs.") AS Katze
FROM cats INNER JOIN who_purchased_salmon # VIEW wird als Tabelle behandelt
ON cats.id = who_purchased_salmon.cats_id
;


